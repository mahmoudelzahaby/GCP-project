output "sa" {
    value = google_service_account.instance-sa.email
  
}

output "gke-sa" {
    value = google_service_account.custom_gke_sa.email
  
}

