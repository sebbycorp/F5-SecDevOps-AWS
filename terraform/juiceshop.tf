resource "aws_instance" "juiceshop" {
  count                  = 1
  instance_type          = "t2.micro"
  ami                    = "ami-087c17d1fe0178315"
  vpc_security_group_ids = aws_security_group.juiceshop.id
  subnet_id              =  aws_subnet.mgmt.id
  key_name               = "demokeyforaws"
  user_data              = file("juice.sh")

  root_block_device {
    volume_size = "10"
  }
  tags = {
    Name = "juiceshop"
  }
}


resource "aws_security_group" "juiceshop_sg" {
  name        = "juiceshop"
  description = "Allow http and https inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "HTTPS"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}