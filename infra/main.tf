
resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}
resource "google_project_service" "container" {
  service = "container.googleapis.com"
}
#Create custom vpc

resource "google_compute_network" "vpc" {
  project = var.project-id
  name = "main-vpc"
  auto_create_subnetworks = false
  depends_on = [
    google_project_service.compute,
    google_project_service.container
  ]
}

############### Create subnets ##############


#1-Manged subnet

resource "google_compute_subnetwork" "manged-subnet" {
  name = "manged-subnet"
  region = var.region
  ip_cidr_range = var.manged-range
  network = google_compute_network.vpc.self_link
  depends_on = [
    google_compute_network.vpc
  ]
}


#2-Restricted subnet with secondry range for pods

resource "google_compute_subnetwork" "restricted-subnet" {
  name = "restricted-subnet"
  region = var.region
  ip_cidr_range = var.restricted-range
  network = google_compute_network.vpc.self_link
  private_ip_google_access = true
    depends_on = [
    google_compute_network.vpc
  ]

  secondary_ip_range {
    ip_cidr_range = var.pods-cidr
    range_name = "pods"
  } 

}


###############   Firewall rules  ####################

#fire wall to block all internet egress except google api to communicate
resource "google_compute_firewall" "http" {
  name    = "http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80","443"]
  }
  source_ranges = ["0.0.0.0/0"]
}





 ############### Natgateway ####################

 resource "google_compute_router" "router" {
   name = "nat-router"
   network = google_compute_network.vpc.self_link
   region = google_compute_subnetwork.manged-subnet.region
 }  

 resource "google_compute_router_nat" "name" {
   name = "natgateway-route"
   router = google_compute_router.router.name
   region = google_compute_router.router.region
   nat_ip_allocate_option = "AUTO_ONLY"
   source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
 }
