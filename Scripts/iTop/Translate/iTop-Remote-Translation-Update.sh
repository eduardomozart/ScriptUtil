host="ftp.example.com"
localfolder="/Users/mac/Documents/GitHub/iTop"
remotefolder="itop"
user="example@example.com"
password="1234"

cd $localfolder
putcmdlines="$(find * -name \pt_br.* -exec printf 'put %s\n' '{}' +)"
echo "open $host
user $user $password
binary
lcd $localfolder
cd $remotefolder
$putcmdlines
quit" > /tmp/ftp.$$
ftp -ivn < /tmp/ftp.$$
rm /tmp/ftp.$$
