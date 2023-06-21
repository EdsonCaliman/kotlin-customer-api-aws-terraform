resource "aws_security_group" "customer_sg" {
  name        = "customerapi_sg"
  description = "customer api security group"
  vpc_id      = aws_vpc.customer_vpc.id
}

resource "aws_security_group_rule" "sgr_pub_out" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.customer_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "sgr_ssh_in" {
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.customer_sg.id
  to_port           = 22
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "public_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.customer_sg.id
}

resource "aws_key_pair" "customer_key" {
  key_name   = "kotlin-spring"
  public_key = file("/home/edsonjunior/.ssh/kotlin-spring.pub")
}

