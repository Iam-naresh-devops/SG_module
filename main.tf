resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = merge(var.common_tags,
  {
    Name = "${var.project}-${var.environment}-${var.sg_name}"
   # Create_date_time = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
  } )

  egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    }

}

resource "aws_security_group_rule" "dynamic_rules" {
  
   for_each = var.ingress_rules

  type        = "ingress"
  description = lookup(each.value, "description", null)
  from_port   = each.value.from_port
  to_port     =  each.value.to_port
  protocol    = "tcp"
  security_group_id = aws_security_group.sg.id
  source_security_group_id = lookup(each.value, "source_security_group_id", null)
  cidr_blocks = lookup(each.value, "cidr_blocks", null)
}