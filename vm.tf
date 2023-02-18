###################### Service account ###################
module "sa" {
  source  = "./sa"
  project = var.project-id
}



##################### Private VM #######################
module "vm" {
  source        = "./vm"
  project       = var.project-id
  email         = module.sa.sa
  manged-subnet = module.vpc.mangement-subnet
  vpc           = module.vpc.vpc
  url           = "https://www.googleapis.com/auth/cloud-platform"
  script = file("script.sh")
}