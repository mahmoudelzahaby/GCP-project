####################### VM instance ##########################

resource "google_compute_instance" "instance" {
  name = "private-vm"
  machine_type = "f1-micro"
  zone         = "asia-east1-a"


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  tags = ["ssh"]
  service_account {
    email = var.email
    scopes = [ var.url ]
  }
    network_interface {
      subnetwork = var.manged-subnet
    }

  metadata_startup_script = var.script 

}


########################## VM firewall ##############################


resource "google_compute_firewall" "ssh" {
  project = var.project
  name = "ssh"
  network = var.vpc
  priority = 100
  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports = ["22","80"]
  }


  target_tags = ["ssh"]
  source_ranges = ["35.235.240.0/20","102.42.90.3"]

}