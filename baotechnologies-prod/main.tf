module "vpc" {
  source      = "./modules/vpc"
  project     = var.project
  project_id  = var.project_id
  vpc_cidr    = var.vpc_cidr
  vpc_name    = var.vpc_name
  subnet_cidr = var.subnet_cidr
  region      = var.region
}

module "iam" {
  source = "./modules/iam"
  project = var.project
}

module "compute_prod" {
  source = "./modules/compute"
  project               = var.project
  zone                  = var.zone
  machine_type          = var.instance_type
  network_self_link     = module.vpc.network_self_link
  subnet_self_link      = module.vpc.public_subnet_self_link
  service_account_email = module.iam.app_service_account_email
}

module "dns" {
  source         = "./modules/dns"
  prod_domain    = var.prod_domain
  staging_domain = var.staging_domain
  project        = var.project

  prod_ip_address = module.compute_prod.external_ip
}
