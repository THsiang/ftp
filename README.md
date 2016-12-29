# ftp
ftp docker file and config
This is a docker container to launch vsftpd.
It comes with 4 pre-defined configuration :

ftp : FPT

ftps : FTPS explicit

ftps_implicit : FTPS implicit

ftps_tls : FTPS explicit with high cypher (ssl_ciphers=HIGH)

To use it : docker run -p <host_port>:21 loicmathieu/vsftpd <configuration_name>

docker pull kk1983/ftp
docker run -p 21:21 kk1983/ftp ftp
It comes with a pre-defined user : public with password public.

PASV is enabled, to use it you need to specify the PASV_ADDRESS env variable pointing to the IP address of the host when launching the container and mapping the ports range 21100-21110:

docker pull  kk1983/ftp
docker run -p 21:21 -p21100-21110:21100-21110 --env PASV_ADDRESS=x.x.x.x kk1983/ftp ftp
