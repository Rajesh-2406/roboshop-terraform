module "vpc" {
  source     = "git::https://github.com/Rajesh-2406/tf-module-vpc.git"
  for_each   = var.env
  cidr_block = each.value["cidr_block"]
}
