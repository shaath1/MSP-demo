# Security group for port 80 traffic
output "web_server_sg" {
  description = "Security group for web-server with HTTP ports"
  value       = module.web_server_sg.this_security_group_id
}
output "juiceshop_sg" {
  description = "Security group for juiceshop with  port 3000"
  value       = module.juiceshop_sg.this_security_group_id
}
# Security group for port 443 traffic
output "web_server_secure_sg" {
  description = "Security group for web-server with HTTPS ports"
  value       = module.web_server_secure_sg.this_security_group_id
}

# Security group for port 8443 traffic
output "bigip_mgmt_secure_sg" {
  description = "Security group for BIG-IP MGMT Interface"
  value       = module.bigip_mgmt_secure_sg.this_security_group_id

}

# Security group for SSH traffic
output "ssh_secure_sg" {
  description = "Security group for SSH ports open within VPC"
  value       = module.ssh_secure_sg.this_security_group_id

}


# Security group for Elasticsearch
output "elasticsearch_sg" {
  description = "Security group for Elasticsearch"
  value       = module.elasticsearch_sg.this_security_group_id

}

# Security group for Kibana dashboard
output "kibana_sg" {
  description = "Security group for Kibana"
  value       = module.kibana_sg.this_security_group_id

}
