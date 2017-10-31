# ftp
ftp docker file and config
This is a docker container to launch vsftpd.
It comes with 4 pre-defined configuration :

ftp : FPT

ftps : FTPS explicit

ftps_implicit : FTPS implicit

ftps_tls : FTPS explicit with high cypher (ssl_ciphers=HIGH)

* To use it : docker run -p <host_port>:21 loicmathieu/vsftpd <configuration_name>

docker build -t hsiang .

docker run -p 21:21 hsiang ftp

text

ftp localhost 21

============================
ID: user
password: hsiang


