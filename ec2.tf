resource "aws_instance" "web" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  key_name = "EC2-KP"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "AWS-3Teit-DB"
  }

  provisioner "file" {
    source = "./EC2-KP.pem"
    destination = "/home/ec2-user/EC2-KP.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("./EC2-KP.pem")}"
    }  
  }
}

resource "aws_instance" "db" {
  ami           = "ami-0ad21ae1d0696ad58"
  instance_type = "t2.micro"
  key_name = "EC2-KP"
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
      Name = "AWS-3Teit-DB"
  }
}