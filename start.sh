#!/bin/sh
touch /var/log/vsftpd/vsftpd.log
if [ "$1" = 'sftp' ]; then
 echo "Launching vsftp on ftp protocol"
 if [ -n "$PASV_ADDRESS" ]; then
  echo "Activating passv on $PASV_ADDRESS"
  echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftp/vsftp.conf
 fi
 exec /usr/sbin/sshd -D -e 
 echo "Start sftp process"
 
fi

if [ "$1" = 'ftp' ]; then
 echo "Launching vsftp on ftp protocol"
 if [ -n "$PASV_ADDRESS" ]; then
  echo "Activating passv on $PASV_ADDRESS"
  echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftp/vsftp.conf
 fi
  /usr/sbin/vsftpd /etc/vsftp/vsftp.conf  
fi

if [ "$1" = 'ftps' ]; then
 echo "Launching vsftp on ftps protocol"
 if [ -n "$PASV_ADDRESS" ]; then
  echo "Activating passv on $PASV_ADDRESS"
  echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftp/vsftp_ftps.conf
 fi
  /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps.conf  
fi

if [ "$1" = 'ftps_implicit' ]; then
 echo "Launching vsftp on ftps protocol in implicit mode"
 if [ -n "$PASV_ADDRESS" ]; then
  echo "Activating passv on $PASV_ADDRESS"
  echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftp/vsftp_ftps_implicit.conf
 fi
 /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps_implicit.conf
fi

if [ "$1" = 'ftps_tls' ]; then
 echo "Launching vsftp on ftps with TLS only protocol"
 if [ -n "$PASV_ADDRESS" ]; then
  echo "Activating passv on $PASV_ADDRESS"
  echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftp/vsftp_ftps_tls.conf
 fi
 /usr/sbin/vsftpd /etc/vsftp/vsftp_ftps_tls.conf
fi
exec tail -f /var/log/vsftpd/vsftpd.log
