# juiceshop Public IP Addresses
output "juiceshop_public_ips" {
  description = "List of juiceshop public IP addresses"
  value       = aws_instance.juiceshop[*].public_ip
}

# juiceshop Private IP Addresses
output "juiceshop_private_ips" {
  description = "List of juiceshop private IP addresses"
  value       = aws_instance.juiceshop[*].private_ip
}

# juiceshop Public DNS Names
output "juiceshop_public_dns" {
  description = "List of juiceshop public DNS Names"
  value       = aws_instance.juiceshop[*].public_dns
}
