variable "sg_name" {
  
}
variable "sg_description" {
    }
variable "vpc_id" {
  default = true
}
variable "common_tags" {
     type = map
     default = {
        cost_center = "F00057AWS"
        Admin_email = "admin@corporate.com"
        Owner = "Naresh" 
     }
}
variable "environment" {
  
}
variable "project" {
  
}

variable "ingress_rules" { 
    type = object({
        description   = ""
        from_port        = ""
        to_port          = ""
        protocol         = ""
        security_group_id    = list(string)
        source_security_group_id    = list(string)
        cidr_blocks      = ["0.0.0.0/0"]

    })
  
}

variable "from_port" {
  type = number
}
variable "to_port" {
  type = number
}
variable "protocol" {
   type = string
}
variable "cidr_blocks" {
  type = list(string)
}