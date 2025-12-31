resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  tags = merge(var.common_tags,
  {
    Name = "${var.project}-${var.environment}-${var.sg_name}"
   # Create_date_time = formatdate("YYYY-MM-DD hh:mm:ss ZZZ", timestamp())
  } )

ingress {
     #for_each = var.ingress_rules
   # content {
       
        from_port        = var.from_port
        to_port          = var.to_port
        protocol         = var.protocol
        security_groups          = var.security_group_id
        
        self                     = false
        #cidr_blocks      = var.cidr_blocks
   #}
      
      }

egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        #ipv6_cidr_blocks = ["::/0"]
    } 
    
}