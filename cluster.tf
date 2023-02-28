module "gke" {
  source             = "./cluster"
  project            = var.project-id
  project-id         = var.project-id
  rest-subnet        = module.vpc.restricted-subnet
  vpc                = module.vpc.vpc
  control-plane-cidr = var.control-plane
  services-cidr      = var.svc-range
  sa = module.sa.gke-sa
}
