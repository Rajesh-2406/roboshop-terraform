module "vpc" {
  source     = "git::https://github.com/Rajesh-2406/tf-module-vpc.git"
  cidr_block = each.value["cidr_block"]
  for_each = var.env
}
