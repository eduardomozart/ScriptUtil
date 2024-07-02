<?php
// Realiza a leitura dos parâmetros de configuração do arquivo 'oauth.ini'
define('OAUTH_CONF', './../../oauth.ini'); // keep outh.ini out of the web root!

// Habilita a exibição de mensagens de erro do PHP.
// Note que elas são ativadas apenas após chamar as funções nativas do Qualitor devido ao Qualitor não suportar a 
// sua execução quando essas variáveis estão definidas.
// Você também precisa habilitar a opção "Detailed errors" em 'IIS Manager > Default Web Site > Error Pages' para que
// as mensagens de erro do PHP sejam exibidas.
define('OAUTH_DEBUG', false);

if (!OAUTH_DEBUG) {
	/**
	* Tela de login do Qualitor.
	**/
	require_once 'configLingua.php';
		
	// Identificar forma de acesso
	require_once __PATH_SISTEMA__ . '/framework/login/MobileDetect.php';
	$detect = new Mobile_Detect;
	$deviceType = ($detect->isMobile() ? ($detect->isTablet() ? 'tablet' : 'phone') : 'computer');
}

if(OAUTH_DEBUG) {
	error_reporting(-1);  
	ini_set("display_errors", "on");
	ini_set("track_errors", "on");
	ini_set("html_errors", "on");
	ini_set("fastcgi.logging", "on");
}

if(!function_exists('boolval')) {
  function boolval($var){
    return !! $var;
  }
}

if(!file_exists(OAUTH_CONF)) {
	echo "File '".OAUTH_CONF."' does not exist.";
	exit();
}

$settings = parse_ini_file(OAUTH_CONF, TRUE);

// Adiciona o código da empresa a URI de retorno da autenticação oAuth caso ele tenha sido especificada
// como parâmetro da URI de oAuth (por exemplo, oauth.php?cdempresa=3) e nenhum código de empresa
// tenha sido especificado como parte da URI de retorno da autenticação oAuth no arquivo de configuração.
if (array_key_exists('cdempresa', $_REQUEST) && !strstr($settings['default']['redirectUri'], 'cdempresa')) {
	$settings['default']['redirectUri'] = $settings['default']['redirectUri']."?cdempresa=".$_REQUEST('cdempresa');
}

// Armazena nome do Identity Provider (IdP): "microsoft" para Microsoft Entra (Azure) ou "google" para Google.
if(isset($_REQUEST['state'])) {
	$idp = $_REQUEST['state'];
} else {
	// Se nenhum IdP foi especificado, usa o primeiro habilitado.
	foreach ($settings as $namespace => $properties) {
		if (isset($settings[$namespace]["enabled"]) && boolval($settings[$namespace]["enabled"])) {
			$idp = $namespace;
			break;
		}
	}
}

// Verifica se o IdP especificado existe e está habilitado no arquivo de configuração.
if(array_key_exists($idp, $settings) && boolval($settings[$idp]["enabled"])) {
	$idpUri = $settings[$idp]['endpointAuthorize'].'?state='.$idp.'&client_id='.$settings[$idp]['clientId'].'&response_type=code&scope='.$settings[$idp]['scope'].'&redirect_uri='.$settings['default']['redirectUri'];
	if($idp == "microsoft") {
		if (isset($_SERVER['HTTP_REFERER']) && strstr($_SERVER['HTTP_REFERER'], 'logout.php') && !strstr($_SERVER['HTTP_REFERER'], '?')) {
			// Adiciona '&prompt=login' ao final da URI do endpointAuthorize para forçar o login do usuário após ele realizar logoff no Qualitor, 
			// caso contrário, ele entrará em loop e re-autenticará o usuário através de oAuth do Microsoft Entra (Azure) automaticamente já que,
			// ao realizar logoff, o Qualitor redireciona o usuário para a tela de login, que é interceptada para esse script.
			$idpUri = $idpUri."&prompt=login";
		} else {
			// Substitua por '&prompt=login' para forçar a reautenticação do usuário oAuth ou '&prompt=none' para não exibir a tela de login (promptless).
			$idpUri = $idpUri."&prompt=select_account";
		}
	}
} else {
	echo "Provider '".$idp."' not enabled.";
	exit();
}

// Se o usuário está executando o Qualitor através do computador, é necessário liberar os pop-ups do navegador.
// O Qualitor faz essa verificação nativamente, porém, com a autenticação oAuth, realizamos bypass da tela de login
// então precisamos nos certificar de que o usuário liberou os pop-ups antes de realizar a autenticação oAuth e permitir o acesso ao Qualitor.
if(!isset($_GET["code"])) {
	if (OAUTH_DEBUG) {
		echo '<script>window.location.replace("'.$idpUri.'");</script>';
	} elseif ($deviceType == 'computer') {
?>
<link rel="stylesheet" href="<?php echo __PATH_WEB__ ?>/framework/skin/seven/css/style.css" />
<script>
	var popup = window.open("about:blank", "new_window_123", "height=1,width=1");
			
	// Detect pop blocker
	setTimeout( function() {
		if(!popup || popup.outerHeight === 0) {
			//First Checking Condition Works For IE & Firefox
			//Second Checking Condition Works For Chrome
			document.getElementsByTagName('body')[0].innerHTML = '<center><table width="800" style="margin-top: 30px;"><tr><td><img src="<?php echo __PATH_WEB__ ?>/framework/images/default/general/popup.png" /></td><td class="DIVCOLORLABEL" style="font-size: 12px; line-height: 20px;padding-left: 30px;"><?php echo $QLabel[0][2101] ?></td></tr></table></center>';
	    } else {
	        // Popup Blocker Is Disabled
	       popup.close();
		   // Estágio 1: Redireciona o usuário a tela de login do Microsoft Entra (Azure) pra oAuth.
		   window.location.replace("<?php echo $idpUri ?>");
	    } 
	}, 500);
</script>
<?php
	}
}

// Estágio 2: Se o usuário realizou a autenticação oAuth com sucesso, ele é redirecionado de volta 
// para essa página (oauth.php) com o código retornado como atributo GET.
if(isset($_GET['code']) && isset($_GET['state']) && !isset($_GET['error']))
{
	// Fase 1: Obter token de autorização (Bearer token) com base no código retornado.
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $settings[$idp]['endpointToken']);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_POST, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_POSTFIELDS, ['client_id' => $settings[$idp]['clientId'], 'client_secret' => $settings[$idp]['clientSecret'], 'redirect_uri' => $settings['default']['redirectUri'], 'code' => $_GET['code'], 'grant_type' => 'authorization_code', 'scope' => $settings[$idp]['scope']]);
	$authdata = json_decode(curl_exec($ch), true);
	if(curl_errno($ch) || !$authdata || !isset($authdata['access_token']))
	{
		echo "Error received during Bearer token fetch.";
		if (OAUTH_DEBUG) print curl_error($ch);
		exit();
	}
	curl_close($ch); 

	// Fase 2: Com posse do token de autorização (Beareer token), podemos consultar informações do usuário autenticado (nome, endereço de e-mail etc.)
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $settings[$idp]['endpointScope']);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
	curl_setopt($ch, CURLOPT_SSLVERSION, 6);
	curl_setopt($ch, CURLOPT_HTTPHEADER, array('Authorization: Bearer '.$authdata['access_token']));
	$userdata = json_decode(curl_exec($ch), true);
	if(curl_errno($ch) || !$userdata || !isset($userdata[$settings[$idp]['emailIdentifier']]))
	{
		echo "Error received during user data fetch.";
		if (OAUTH_DEBUG) print curl_error($ch);
		exit();
	}
	curl_close($ch); 

	// Específico do Google: se o usuário não possui endereço de e-mail verificado, abortar autenticação.
	if(isset($userdata['verified_email']) && !$userdata['verified_email'])
	{
		exit();
	}

	// Obtém token de uso único do usuário (válido por 60 segundos após a emissão)
	// com base no endereço de e-mail do usuário.
	// O nome de usuário se refere ao valor do campo "Usuário de rede" do Usuário no Qualitor.
	$nmusuario = $userdata[$settings[$idp]['emailIdentifier']];
	// Obtém código da empresa do usuário a ser autenticado através da URL de retorno oAuth (oauth.php?cdempresa=X).
	if (array_key_exists('cdempresa', $_REQUEST)) {
		$cdempresa = $_REQUEST('cdempresa');
		// O Usuário que se autenticará através do Qualitor WebServices 
		// também deve pertencer/ter acesso a empresa do Usuário a ser 
		// autenticado via token de autenticação.
		$settings['default']['wsCdEmpresa'] = $_REQUEST('cdempresa');
	}

	// Desabilita a depuração do PHP antes de chamar o WebServices do Qualitor devido a mensagem de erro "Internal Server Error" (HTTP/500)
	// retornada ao executar o Qualitor com a depuração PHP ativada, porém, o "trace", "exceptions" e o dump do cliente SOAP serão exibidos.
	if (OAUTH_DEBUG) {
		error_reporting(0);  
		ini_set("display_errors", "off");
		ini_set("track_errors", "off");
		ini_set("html_errors", "off");
		ini_set("fastcgi.logging", "off");
	}
	
	// Inicia o cliente SOAP.
	$client = new SoapClient($settings['default']['wsUri']."/WSGeneral.wsdl", array("trace" => (OAUTH_DEBUG) ? true : false, "encoding" => "UTF-8", "exceptions" => true));
	$client->__setLocation($settings['default']['wsUri']."/WSGeneral.php");
	try {
		$auth = $client->login($settings['default']['wsLogin'], $settings['default']['wsPasswd'], (string)$settings['default']['wsCdEmpresa']);
	} catch (SoapFault $exception) {
		echo "Error received when authenticating through Qualitor WebServices.<br/>";
		if (OAUTH_DEBUG) {
			echo "<strong>Request</strong>: \n".htmlspecialchars($client->__getLastRequest())."<br/>";
			echo "<strong>Response</strong>: \n".$client->__getLastResponse()."<br/>";
			echo "<strong>SOAP Client Dump</strong>: \n<br/>";
			var_dump($client);
			echo "<br/><strong>Qualitor Version</strong>: \n".$client->getVersion(); // Retornar a versão do Qualitor não requer autenticação: útil para testar o funcionamento do Web Services.
		}
	}

	// Retorna todos os códigos de empresa que o Usuário
	// autenticado através da função SOAP 'auth()' pertence
	$retorno = $client->getCompany();

	$companyXml = simplexml_load_string($retorno);
	// var_dump($companyXml);
	
	$cdempresaArray = array();
	foreach($companyXml->response_data->dataitem as $company)
	{
		array_push($cdempresaArray, (string)$company->cdempresa);
		// echo (string)$company->cdempresa . "<br />";
	}
		
	// Ordena o Array() em ordem ascendente (1, 2, 3...).
	sort($cdempresaArray);
	// Adiciona Empresa do Usuário autenticado no Qualitor WebServices
	// como padrão.
	$cdempresaArray = array_diff($cdempresaArray, [(string)$settings['default']['wsCdEmpresa']]);
	array_unshift($cdempresaArray, (string)$settings['default']['wsCdEmpresa']);
	
	if (isset($cdempresa)) {
		if (!in_array($cdempresa, $cdempresaArray)) {
			echo "O Usuário do Qualitor WebServices não pertence à mesma Empresa que o Usuário a ser autenticado via token de autenticação.";
			exit();
		}
		
		// Se um código de empresa foi definido (oauth.php?cdempresa=X), 
		// após o login bem-sucedido ao Qualitor WebServices, 
		// usar apenas o código de empresa definido para gerar o
		// token de autenticação do Usuário.
		$cdempresaArray = array((string)$cdempresa);
	}
	
	// Caso não tenha sido especificado um código de empresa para autenticação do Usuário, 
	// será retornado o token de autenticação do primeiro ID de empresa 
	// que o Usuário pertencer em ordem ascendente (1, 2, 3...), exceto
	// que ele pertença a mesma Empresa do Usuário autenticado no Qualitor WebServices.
	foreach($cdempresaArray as $cdempresaItem) {
		try {
			// Não é necessário reautenticar caso o código da empresa atual corresponda a empresa que estamos autenticados.
			if ($cdempresaItem !== (string)$settings['default']['wsCdEmpresa']) {
				// O Usuário do Qualitor WebServices deve pertencer a mesma
				// empresa do Usuário a ser autenticado via 'getAuthToken()'
				// para que o token de autenticação seja gerado.
				$auth = $client->login($settings['default']['wsLogin'], $settings['default']['wsPasswd'], $cdempresaItem);
			}
			
			// Realiza tentativa de obtenção do token de autenticação. 
			$authTokenXml = '<?xml version="1.0" encoding="ISO-8859-1"?><wsqualitor><contents><data><nmusuario>'.$nmusuario.'</nmusuario><cdempresa>'.$cdempresaItem.'</cdempresa></data></contents></wsqualitor>';
			$retorno = $client->getAuthToken($auth, $authTokenXml);
		} catch (SoapFault $exception) {
			continue;
		}
			
		/* $userDataXml = '<?xml version="1.0" encoding="ISO-8859-1"?><wsqualitor><contents><data><nmusuariorede>'.$nmusuario.'</nmusuariorede></data></contents></wsqualitor>'; */
		// $retorno = $client->geUserData($auth, $userDataXml);
		
		$xml = simplexml_load_string($retorno);
		$wsToken = $xml->xpath("//response_data/dataitem/token")[0];
		
		// Redireciona o usuário para a URI de login automático do Web Services:
		if(!empty($wsToken)) {
			echo('<a href="'.$settings['default']['uri'].'?authws='.$wsToken.'">Redirecionamento automático, caso contrário, clique</a>');
			header('Location: '.$settings['default']['uri'].'?authws='.$wsToken);
			break;
		}
	}
		
	if(empty($wsToken)) {
		echo "Error received when generating user authentication token through Qualitor WebServices.<br/>";
		if (OAUTH_DEBUG) {
			echo "<strong>Request</strong>: \n".htmlspecialchars($client->__getLastRequest())."<br/>";
			echo "<strong>Response</strong>: \n".$client->__getLastResponse()."<br/>";
			echo "<strong>SOAP Client Dump</strong>: \n<br/>";
			var_dump($client);
			echo "<br/><strong>Qualitor Version</strong>: \n".$client->getVersion(); // Retornar a versão do Qualitor não requer autenticação: útil para testar o funcionamento do Web Services.
		}
	}

	/* session_start();
	$_SESSION['ssoEmail'] = $data[$settings[$idp]['emailIdentifier']];
	header('Location: '.$settings['default']['uri']);
	session_write_close(); */
}
elseif (isset($_GET["error"])) {
	echo "Error received at the beginning of second stage.";
}
/* else
{
	// echo 'Login with:
	// <a id="login-button" href="'.$settings['google']['endpointAuthorize'].'?state=google&redirect_uri='.$settings['default']['redirectUri'].'&client_id='.$settings['google']['clientId'].'&scope='.$settings['google']['scope'].'&response_type=code&access_type=online">Google</a> or
	// <a id="login-button" href="'.$settings['microsoft']['endpointAuthorize'].'?state=microsoft&client_id='.$settings['microsoft']['clientId'].'&response_type=code&scope='.$settings['microsoft']['scope'].'&redirect_uri='.$settings['default']['redirectUri'].'">Microsoft</a><br/>';
	// header('Location: '.$settings['microsoft']['endpointAuthorize'].'?state=microsoft&client_id='.$settings['microsoft']['clientId'].'&response_type=code&scope='.$settings['microsoft']['scope'].'&redirect_uri='.$settings['default']['redirectUri']);
} */
