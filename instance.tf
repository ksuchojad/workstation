resource "aws_instance" "wrk01" {
  ami                         = "ami-0592c673f0b1e7665"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.wrk_sg.id]
  subnet_id                   = aws_subnet.wrk_subnet.id
  key_name                    = "workstation"
  associate_public_ip_address = true
  user_data_replace_on_change = true

  user_data = file("userdata.sh")

  tags = {
    Name = "Workstation 01"
  }
}

output "aws_instance_wrk_ip_address" {
  value = ""
}