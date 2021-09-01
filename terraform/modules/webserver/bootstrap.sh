#!/bin/bash

sleep 30

snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd

sleep 30
sudo printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | sudo tee /etc/apt/sources.list.d/nginx-plus.list
sudo wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx
sudo mkdir -p /etc/ssl/nginx
sudo mkdir /home/ubuntu/dockerfiles
sudo mkdir /var/log/nginx
sudo touch /var/log/nginx/error.log
sudo touch /var/log/nginx/access.log
sudo echo '-----BEGIN CERTIFICATE-----
MIIDXDCCAkSgAwIBAgIDAYRlMA0GCSqGSIb3DQEBBQUAMD4xEjAQBgNVBAoMCU5H
SU5YIEluYzEoMCYGA1UEAwwfbmdpbnggY2xpZW50IGF1dGhlbnRpY2F0aW9uIENB
MjAeFw0yMDA1MTgxMjIxMDBaFw0yMDExMTcxMjIxMDBaMEcxEjAQBgNVBAoMCU5H
SU5YIEluYzEcMBoGA1UECwwTQ2xpZW50IGNlcnRpZmljYXRlczETMBEGA1UEAwwK
STAwMDA5NjEwNzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANmQBH0q
FyfSrVP+VeGGBiyazU1hEzwtFkYclG7dZoZ/wXwQuYutmcqh9x7Qhw3jZXSgimkP
Wr4UMfCG94/JiYKSH8lKiCRIjaC9Pq1/UVKyyTYOOwdhdBLTWekvNq+1zehZkDJR
zqKcAsVhYUnAOfX5glzqTwGN1wXh+kkG2yz5ue0yMYiL7malnVycl0O8Ufj78LcR
3xK9f5Yhj38L5/EfPphaqBWXStUrJGBfrqViDBZ9flwTe7f5UeCa8TQIjl1+7gvb
U46q15sMJva+ShtGVL9ZFY4mRiFqOrUHAwI80I2jLCqeUusj3ENE9pcShUpFO4Bl
ryRHet2s2eo6kzMCAwEAAaNaMFgwIAYJYIZIAYb4QgENBBMWEVBhaWQgc3Vic2Ny
aXB0aW9uMA4GA1UdDwEB/wQEAwIDiDAMBgNVHRMBAf8EAjAAMBYGA1UdJQEB/wQM
MAoGCCsGAQUFBwMCMA0GCSqGSIb3DQEBBQUAA4IBAQA4UQbLnFrew0mm7w/XyQNG
ig1gVUUaMAXZBn+P0lnPn04woh0i7duiUbhRKmf96+tCpxhvaFhnoThbKORHLBER
x+3W6fW729X9jA3LstZIu45pVe42DNKd4Tv079WfQ/eCZGuXradlHkO8GdoPKXQR
9QaAB4hmx6IoqwivYz/VugWmVvxQHr2oWUnQKBlLf35ZOhoJOs34zffOuwksK0aA
Ozv71/8NA5AMqxVPpSvUxeG3gIjcZVAmYNBv7H2oZlWhv2Hcm4i1FHYqxuVCoVZo
Lg7SAhjrulBGw2jW+iXDyIsB7jI7OS++D64LDrXVj+xHQU3VNS+b/Al1+fjVJPPD
-----END CERTIFICATE-----' > /home/ubuntu/dockerfiles/nginx-repo.crt

sudo echo '-----BEGIN PRIVATE KEY-----
MIIEwAIBADANBgkqhkiG9w0BAQEFAASCBKowggSmAgEAAoIBAQDZkAR9Khcn0q1T
/lXhhgYsms1NYRM8LRZGHJRu3WaGf8F8ELmLrZnKofce0IcN42V0oIppD1q+FDHw
hvePyYmCkh/JSogkSI2gvT6tf1FSssk2DjsHYXQS01npLzavtc3oWZAyUc6inALF
YWFJwDn1+YJc6k8BjdcF4fpJBtss+bntMjGIi+5mpZ1cnJdDvFH4+/C3Ed8SvX+W
IY9/C+fxHz6YWqgVl0rVKyRgX66lYgwWfX5cE3u3+VHgmvE0CI5dfu4L21OOqteb
DCb2vkobRlS/WRWOJkYhajq1BwMCPNCNoywqnlLrI9xDRPaXEoVKRTuAZa8kR3rd
rNnqOpMzAgMBAAECggEBANeuKGUU9wOpnd8owmbjAPfzNxhA5lq/r9ctuhD2OA+a
U2v1AJxyK4ZwbpYDz/96sTefd9eTOzg4uRFkG8RV3Zat2gkpdDHUI2N4eMxy7WH4
j/SgwvAcMn//OqErByHGMCzprUPVSe52j2Cxm0sL3+nzwsLuHgjCXqocTo1a2KmJ
y+4agI4hdYRVpiezfeae/pFHQRJhTfrbKwpY5E/xSkl1+0j3dWl7IcARKBNUpddo
qqp9LyfhLB44P/YcthTQDYP4T8/1Klk0kAmRsmPvdBftwDk4WrF6LRvXxc3pQktM
Cki0s/EaSSvweFbQwyDgz57VDcPONVrDIZvt79o/45ECgYEA9gedV18lNvV5vQSj
p59WsjalntxuQt/v4qQEU1BhkCfnn273aZMHW4YZ+NSQX1luFKYEtEwdiKnerIQ5
2S3n9nkSs6aG7XCcqOtZD5pGFaSWZJMeY35r5PcBn/P40U7T851j0joiRGWRWY3V
Jidbl7qPaaXE9dleExpRNpJ2hN8CgYEA4mETdWwKCOFu6hIg3lQA/BAkhWb5gcAr
A410wQWHyyuS0Ah9xMZ5ipEiVVm/6BGqlyJkTyMd+Y0TAEcHNx1XyZhKExovR76I
EvA4AUP8OlRGAdBCyAZ1Azaq04TgE4gm4339wEDjmSvkl+kGxkGQ9RzDAGauZl6a
dNc1/FBJyC0CgYEAkrN7qGt9X0YELycjBoJGScG4A//gZ1PsUDIIuj0Fz9VbkX+z
W2pmSratqeflplVHBFzyFSgFvEW+FxRJAi0TUa5j7mdvsQkjAL5Evr7451LasmHf
DuiFIWP/vgbV6MieLXc93E75u9rsTn/6BuQVA2YkuZQ023ufUriwkF/I9/UCgYEA
pb5rj8pFYpEjMu+I7x7UBbkP9Dgbr9rx40z7UaNp89/4QqYk5yBltoVifNkUP6ZH
nxYIGUTd2mtmoQpgBwNN1gTRH0FJop6mZC9K4epTzqULCKLhcjAAFhU9Z1Ze9Q33
YxJI6izYNrpDSNHNKvSwXDXts+p5/+t97NPw68Yg7xUCgYEAq1xNUD35Ab8uBH4z
EPYB4QX68JVJZ22z8+sQVyo4z4QAOFqICx/QdBMRJ7itEutOZxtS2Xc1dCuZXlcx
onJ+fZIVzoUad3SP9RMhTDEpBTfD0E9vjP2u1vNp4/pGv39nni9hlJTMNFSY0AbU
IOjotYsTsNMV5M/5YPfhKNxO58E=
-----END PRIVATE KEY-----' > /home/ubuntu/dockerfiles/nginx-repo.key
sudo chmod 644 /home/ubuntu/dockerfiles/nginx-repo.crt
sudo chmod 644 /home/ubuntu/dockerfiles/nginx-repo.key
sudo echo '# For Ubuntu 18.04:
FROM ubuntu:bionic

# Download certificate and key from the customer portal (https://cs.nginx.com)
# and copy to the build context:
COPY nginx-repo.crt nginx-repo.key /etc/ssl/nginx/

# Add user
RUN adduser --system --no-create-home --shell /bin/false --group --disabled-login nginx

# Install prerequisite packages:
RUN apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates wget gnupg2

# Download and add the NGINX signing key:
RUN wget https://cs.nginx.com/static/keys/nginx_signing.key && apt-key add nginx_signing.key

# Add NGINX Plus repository:
RUN printf "deb https://plus-pkgs.nginx.com/ubuntu `lsb_release -cs` nginx-plus\n" | tee /etc/apt/sources.list.d/nginx-plus.list

# Download the apt configuration to `/etc/apt/apt.conf.d`:
RUN wget -P /etc/apt/apt.conf.d https://cs.nginx.com/static/files/90nginx

# Update the repository and install the most recent version of the NGINX Plus App Protect package (which includes NGINX Plus):
RUN apt-get update && apt-get install -y app-protect

# Remove nginx repository key/cert from docker
RUN rm -rf /etc/ssl/nginx

# Forward request logs to Docker log collector:
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

# Copy configuration files:
COPY nginx.conf custom_log_format.json /etc/nginx/
COPY entrypoint.sh  /root/

CMD ["sh", "/root/entrypoint.sh"]' > /home/ubuntu/Dockerfile

sudo echo 'user nginx;

worker_processes auto;
load_module modules/ngx_http_app_protect_module.so;

error_log /var/log/nginx/error.log debug;

events {
    worker_connections 10240;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 65;

    upstream app_backend_com {
        server 192.168.0.1:8000;
        server 192.168.0.1:8001;
    }
    server {
        listen 80;
        server_name app.example.com;
        proxy_http_version 1.1;

        app_protect_enable on;
        app_protect_security_log_enable on;
        app_protect_security_log "/etc/nginx/custom_log_format.json" syslog:server=127.0.0.1:515;

        location / {
            client_max_body_size 0;
            default_type text/html;
            # set your backend here
            proxy_pass http://app_backend_com;
            proxy_set_header Host $host;
        }
    }
}' > /home/ubuntu/dockerfiles/nginx.conf

sudo echo '{
   "filter":{
      "request_type":"all"
   }, 
   "content":{
      "format":"default",
      "max_request_size":"any",
      "max_message_size":"5k"
   }    
}' >  /home/ubuntu/dockerfiles/custom_log_format.json

sudo echo '#!/usr/bin/env bash' > /home/ubuntu/dockerfiles/entrypoint.sh

sudo echo "/bin/su -s /bin/bash -c '/opt/app_protect/bin/bd_agent &' nginx " >> /home/ubuntu/dockerfiles/entrypoint.sh

sudo echo "/bin/su -s /bin/bash -c \"/usr/share/ts/bin/bd-socket-plugin tmm_count 4 proc_cpuinfo_cpu_mhz 2000000 total_xml_memory 307200000 total_umu_max_size 3129344 sys_max_account_id 1024 no_static_config 2>&1 > /var/log/app_protect/bd-socket-plugin.log &\" nginx" >> /home/ubuntu/dockerfiles/entrypoint.sh

sudo echo "/usr/sbin/nginx -g 'daemon off;'" >> /home/ubuntu/dockerfiles/entrypoint.sh

sudo chmod +x /home/ubuntu/dockerfiles/entrypoint.sh
sudo cp /home/ubuntu/Dockerfile /home/ubuntu/dockerfiles
cd /home/ubuntu/dockerfiles;sudo docker build --no-cache -t app-protect -f /home/ubuntu/dockerfiles/Dockerfile .
docker run --name my-app-protect -p 80:80 -d app-protect
