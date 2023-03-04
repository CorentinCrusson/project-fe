#output "private_ip" {
#  description = "List of ipv4 addresses of the created servers"
#  value       = [for instance in flexibleengine_compute_instance_v2 : instance.access_ip_v4]
#}

output "public_ip" {
  description = "List of public floating ip addresses of the created servers"
  value       = [for publicip in flexibleengine_vpc_eip_v1.new_eip.*.publicip : lookup(element(publicip, 0), "ip_address")]
}