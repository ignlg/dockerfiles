docker run -d -v /etc/localtime:/etc/localtime \
  --restart always \
  -p 9001:9001 \
  -e 'PORT=9001' \
  -e 'NICKNAME=exr' \
  -e "CONTACT_INFO='eXr c1d1242b@opayq.com'" \
  -e "ACCOUNTING_START='month 1 00:01'" \
  -e "ACCOUNTING_MAX='100 GBytes'" \
  -e "BANDWIDTH_RATE='1 MBytes'" \
  -e "BANDWIDTH_BURST='2 MBytes'" \
  -e "ADVERTISED_BANDWIDTH='512 KBytes'" \
  --name tor-relay \
  ignlg/tor-relay -f /etc/tor/torrc.custom
