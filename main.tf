module  "instance" {
  for_each = var.components
  source  = "git::https://github.com/Rajesh-2406/terraform-module-application.git"
  components  = each.key
  env = var.env
}