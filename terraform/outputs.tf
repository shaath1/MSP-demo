# Big-IP Data
output "bigip_data" {
  value = <<EOF
  
      mgmt_priv_ips   : ${join(",", flatten(module.bigip.mgmt_addresses))}
      mgmt_pub_ips    : ${join(",", module.bigip.mgmt_public_ips)}
      mgmt_public_dns : ${join(",", module.bigip.mgmt_public_dns)}
      mgmt_url        : https://${element(module.bigip.mgmt_public_dns, 0)}:8443
      aws_secret_name : ${aws_secretsmanager_secret.bigip.name}
    EOF
}
# juiceshop
output "juiceshop" {
  value = <<EOF

      private_ips : ${join(", ", module.juiceshop.juiceshop_private_ips)}
      public_ips  : ${join(", ", module.juiceshop.juiceshop_public_ips)}
      public_dns  : ${join(", ", module.juiceshop.juiceshop_public_dns)}:3000
      UNPROTECTED_juiceshop_url  : http://${join(", ", module.juiceshop.juiceshop_public_dns)}:3000
      PROTECTED_juiceshop_url  : https://${element(module.bigip.mgmt_public_dns, 0)}

    EOF
}
# WebServers
output "webservers" {
  value = <<EOF

      private_ips : ${join(", ", module.webserver.webserver_private_ips)}
      public_ips  : ${join(", ", module.webserver.webserver_public_ips)}
      public_dns  : ${join(", ", module.webserver.webserver_public_dns)}
    EOF
}

# ELK
output "elk" {
  value = <<EOF

      private_ips       : ${module.elk.elk_private_ip}
      public_ips        : ${module.elk.elk_public_ip}
      public_dns        : ${module.elk.elk_public_dns}
      elasticsearch_url : http://${module.elk.elk_public_dns}:9200
      kibana_url        : http://${module.elk.elk_public_dns}:5601
    EOF
}
