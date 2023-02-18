module "vpc" {
  source           = "./infra"
  project-id       = var.project-id
  region           = var.region
  manged-range     = var.mangement-subnet-range
  restricted-range = var.restricted-subnet-range
  pods-cidr        = var.pods-subnet-range

}