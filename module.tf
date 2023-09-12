module "IAM" {
    source = "./custom-modules/IAM"

    users = var.user
  
}