variable "Ec2-full-Access_name" {
  type = string #required
  description = "Ec2-full-Access policy name"
  default = "sham_policy1"
}


variable "force_detach_policies" {
  type = bool
  default = true
}
