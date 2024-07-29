# Autenticação oAuth para o Qualitor 8

Script PHP para integração oAuth através do WebService do Qualitor 8. Testado no Qualitor 8.10.08 com autenticação Microsoft Entra/Azure AD. Note que versões mais recentes do Qualitor possuem suporte nativo a SAML, que é preferível ao invés do uso desse script.

Instruções de uso e configuração do script podem ser encontradas aqui: [https://eduardomozartdeoliveira.wordpress.com/?p=11771](https://eduardomozartdeoliveira.wordpress.com/?p=11771)

## ToDo

1. Usar "Revoke" para revogar apenas o token de acesso do Qualitor ao invés de "Logout" que causa o logoff da conta oAuth em todos os aplicativos.

## Referências 

1. [AndrewRose/oauth.php](https://github.com/AndrewRose/oauth.php). 
1. [PHP Web authenticate on Microsoft with OAuth 2.0 using GET and POST](https://www.youtube.com/watch?v=GLV8XtUWVjk).
1. [Simple Entra ID Oauth2 example with PHP](https://www.sipponen.com/archives/4024).
1. [Operação getAuthToken e getAuthTokenContact](https://www.qualitor.com.br/docs/8.10.04.20161007/integracao/mi_operacao_getauthtoken-getauthtokencontact.html). Qualitor WebServices.
1. [Autenticação de Usuário](https://www.qualitor.com.br/docs/8.10.04.20170127/integracao/mi_autenticacao_usuario.html). Qualitor WebServices.
1. [Autenticação Legada para Web Atendente](https://www.qualitor.com.br/docs/8.10.04.20170127/integracao/index.html?mi_autenticacao_usuario.html). Qualitor WebServices.
1. [Configurar uma conta de usuário](https://www.qualitor.com.br/docs/8.10.04.20170127/integracao/index.html?mi_autenticacao_usuario.html). Qualitor WebServices.
