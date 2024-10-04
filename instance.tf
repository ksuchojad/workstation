resource "aws_instance" "wrk01" {
  ami             = "ami-0592c673f0b1e7665"
  instance_type   = "t2.micro"
  vpc_security_group_ids = [aws_security_group.wrk_sg.id]
  subnet_id = aws_subnet.wrk_subnet.id
  key_name        = "workstation"

  tags = {
    Name = "Workstation 01"
  }
}