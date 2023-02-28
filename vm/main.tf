####################### VM instance ##########################

resource "google_compute_instance" "instance" {
  name = "private-vm"
  machine_type = "f1-micro"
  zone         = "asia-east1-a"

  tags = [ "vm-cluster" ]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }
  service_account {
    email = var.email
    scopes = [ var.url ]
  }
    network_interface {
      subnetwork = var.manged-subnet
    }

  metadata_startup_script = var.script 

}

