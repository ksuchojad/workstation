resource "aws_instance" "wrk01" {
  ami           = "ami-0592c673f0b1e7665" 
  instance_type = "t2.micro"
  security_groups = [aws_security_group.wrk_sg.id]
  key_name = "workstation"

  tags = {
    Name = "Workstation 01"
  }
}