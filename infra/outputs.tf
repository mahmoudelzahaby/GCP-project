output "vpc" {
  value = google_compute_network.vpc.name
}

output "mangement-subnet" {
  value = google_compute_subnetwork.manged-subnet.self_link
}

output "restricted-subnet" {
  value = google_compute_subnetwork.restricted-subnet.self_link
}