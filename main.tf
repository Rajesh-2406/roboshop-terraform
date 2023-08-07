module  "instances" {
  for_each = var.components
  source  = "git::https://github.com/Rajesh-2406/terraform-module-application.git"
  component  = each.key
  env = var.env
}