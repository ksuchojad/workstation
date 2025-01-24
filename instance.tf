resource "aws_instance" "wrk01" {
  ami                         = "ami-02bd3db6ec68f9370"
  instance_type               = "t3.small"
  vpc_security_group_ids      = [aws_security_group.wrk_sg.id]
  subnet_id                   = aws_subnet.wrk_subnet.id
  key_name                    = "workstation"
  associate_public_ip_address = true
  user_data_replace_on_change = true

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "ubuntu:ubuntu" | chpasswd
    sudo passwd -u ubuntu
  EOF

  tags = {
    Name = "Workstation 01"
    Type = "Ubuntu"
  }
}

resource "aws_instance" "wrk02" {
  ami                         = "ami-0e23a322025f616d5"
  instance_type               = "t3.small"
  vpc_security_group_ids      = [aws_security_group.wrk_sg.id]
  subnet_id                   = aws_subnet.wrk_subnet.id
  key_name                    = "workstation"
  associate_public_ip_address = true
  user_data_replace_on_change = true

  user_data = <<-EOF
    <powershell>
    # Set admin password
    $password = "Administrator1!"
    $user = [ADSI]"WinNT://./Administrator,User"
    $user.SetPassword($password)

    # Wymuszenie zmiany hasła przy pierwszym logowaniu (opcjonalnie)
    $user.Put("PasswordExpired", 0)
    $user.SetInfo()
    </powershell>
  EOF

  tags = {
    Name = "Workstation 02"
    Type = " Windows Server 2022"
  }
}
