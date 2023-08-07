module  "instances" {
  for_each = "components"
  source  = "git::https://github.com/Rajesh-2406/terraform-module-application.git"
  name  = each.key

}