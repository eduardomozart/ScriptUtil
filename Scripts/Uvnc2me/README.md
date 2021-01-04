# Uvnc2me

Versão customizada do Uvnc2me para Win7+ com suporte a 7z SFX.

**Nota**: Eu recomendo que você utilize o [AeroAdmin](https://www.aeroadmin.com/pt/) ao invés do Uvnc2me. O AeroAdmin é gratuito para Uso Comercial e é compatível com Windows XP/Server 2003 [1]]]]]]. Se você não precisa solicitar permissão para acessar remotamente o computador do usuário (por exemplo, você presta suporte a usuários internos da sua companhia), considere o uso do [MeshCentral](https://www.meshcommander.com/meshcentral2).

## Propósito

The goal of Uvnc2me was to create a free LogMeIn alternative. A single exe that can serve as viewer or server. Something simple without the need to configure anything...

The same executable is used as server and viewer, it just depend on who pressed the connect button.

O Online compiler extrai o arquivo para uma pasta aleatória, sempre acusando mensagem no Firewall do Windows.

The password change each connection, the access code is fix for a server. [7]

## Porquê não usar o UltraVNC SC?

O UltraVNC SC possui uma interface gráfica datada e um suporte limitado ao UAC (User Account Control). [2][9] Por exemplo, não é possível solicitar elevação UAC do UltraVNC SC e, caso o usuário pressione "Não" no popup do UAC (ou seja, o usuário não possui permissões administrativas), o UltraVNC SC não é executado. Uma solução de contorno seria desenvolver um script VBScript ou Batch ([exemplo](https://forum.ultravnc.net/viewtopic.php?f=54&p=91542)) que verificasse se o usuário possui permissões administrativas e, caso o usuário não possua permissões administrativas, o script solicita elevação UAC. Caso a elevação UAC falhe, o script continua a execução do UltraVNC SC no mesmo contexto do usuário (consequentemente, sem poder interagir com popups do UAC), mas caso a elevação UAC seja bem sucedida (o usuário aceitou o prompt do UAC), o script alteraria //on-the-fly// o arquivo INI do UltraVNC SC de forma a incluir o parâmetro ``[DIS_AUC]`` no arquivo de configuração e executaria o UltraVNC SC com permissões administrativas (permitindo a interação com popups do UAC).

Além disso, o UltraVNC SC utiliza criptografia RC4, enquanto o Uvnc2me usa criptografia AES 256. While it is remarkable for its simplicity and speed in software, multiple vulnerabilities have been discovered in RC4, rendering it insecure.

Apesar das limitações do UltraVNC SC, ele possui algumas vantagens:

1. Ele possui compatibilidade com [Win9x](https://forum.ultravnc.net/viewtopic.php?f=15&t=4536) (com as atualizações do MS Update instaladas)/WinNT4/W2k/XP/Server 2003.
2. Tanto o PcHelpware quanto o Uvnc2me dependem de Access Servers, enquanto no UltraVNC SC configura-se Port Forwarding redirecionando o acesso a porta 5500 (porta de escuta do UltraVNC Viewer).
     - Diferentemente do UltraVNC SC, o Uvnc2me depende de Access Servers, mesmo que a conexão seja realizada localmente ("Loop test" [localhost] ou LAN). The [Access Server](https://www.uvnc.eu/download/pchw2/access_server.exe) needs to run on direct connected server (not behind a NAT) to replace our 62.212.66.133/216.55.178.47 access servers via ``uvnc2me.ini``. [6] 

The access server is needed to initiate the connection.  It just tell that the server exist on ip A and is using port B and the same for the viewer.  After the initial data exchange, the viewer and server use a rendezvous to make a direct connection.  The access server does not serve to transmit data between server and viewer, all data goes in an encrypted server/viewer tunnel. Using this information, the server and viewer establish a direct connection. Data goes direct from server to viewer, no data bouncing like with the repeater. [11] server and Viewer are 100% local, data never get transmitted over the net, if password are wrong decryption fail and connection quit [8].

-----------------------------
Let's explain how uvnc2me makes a connection [10]

server (local ip 10.10.10.1) <->nat router (offical ip 125.125.124.32)<->internet ( access server)
viewer (local ip 10.10.10.1) <->nat router (offical ip 125.125.100.32)<->internet ( access server)

The access server sees a connection from 125.125.124.32 on port X
The access server sees a connection from 125.125.100.32 on port Y

Now, the access server tell the server that the viewer has ip 125.125.100.32 on port Y
and the viewer that the server is on 125.125.124.32 on port X

After this, the server and viewer create an encrypted tunnel between them
----------------------

	 conecta-se a porta TCP 5901 dos Access Servers definidos no arquivo INI de configuração.

2. O UltraVNC SC podem usar Repeaters para conexão Nat2Nat.
     - The repeater acts like a proxy, sitting in the middle between the server and viewer. All data for the session is passed through the repeater meaning that the viewer and server can both be behind a NAT firewall, without having to worry about forwarding ports or anything else (providing the repeater is visible to both viewer and server). [5]
	 - Por padrão, o Uvnc2me usa [UDP hole punishing](http://en.wikipedia.org/wiki/UDP_hole_punching) através das portas UDP 5351 e 5352 [4] para conexões Nat2Nat, usando Repeaters apenas se a conexão falhar.
	 - Dual Nat, server or viewer behind 2 Nat routers is not supported. If you’re local network is behind a Nat router and you are testing with VMware you need to use the network bridge mode. Using Nat mode you get a dual NAT. [11]

O PcHelpware e o Uvnc2me requerem acesso a um Access Server através da porta 5901. 

## Referências 

1. [Features](https://www.aeroadmin.com/en/features.html). AeroAdmin.
2. [[DIS_UAC] and/or "request UAC on start"?](https://forum.ultravnc.net/viewtopic.php?f=15&t=35218). UltraVNC Forums.
3. [UltraVNC as Help Desk tool](https://forum.ultravnc.net/viewtopic.php?f=70&t=31502). UltraVNC Forums.
4. [Access Server behind NAT](https://forum.ultravnc.net/viewtopic.php?f=69&t=31862). UltraVNC Forums.
5. [Repeater](https://www.uvnc.com/products/uvnc-repeater.html). UltraVNC.
6. [pchelpware RC3 Access servers...](https://forum.ultravnc.net/viewtopic.php?f=65&t=29563). UltraVNC Forums.
7. [What is Recent release date for the pchelpware](https://forum.ultravnc.net/viewtopic.php?f=31&t=31640). UltraVNC Forums.
8. [Beta 1002](https://forum.ultravnc.net/viewtopic.php?f=65&t=29146&start=0). UltraVNC Forums.
9. [UltraVNC Reverse/ Screen Locked](https://forum.ultravnc.net/viewtopic.php?f=3&t=33532). UltraVNC Forums.
10. [UVNC2ME error log](https://forum.ultravnc.net/viewtopic.php?f=69&t=33218). UltraVNC Forums.
11. [Tech data](https://www.uvnc2me.com/tech-data). Uvnc2me.
