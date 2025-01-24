output "instance_ip_addr_wkr01" {
  value = aws_instance.wrk01.public_ip
}
output "instance_ip_addr_wkr02" {
  value = aws_instance.wrk02.public_ip
}
