resource "google_service_account" "instance-sa" {
  account_id = "instance-sa"
  display_name = "instance-sa"
}
resource "google_service_account" "custom_gke_sa" {
  account_id   = "custom-gke-sa"
  display_name = "Custom GKE Service Account"
}

resource "google_project_iam_member" "instance" {
  project = var.project
  role = "roles/container.admin"
  member = "serviceAccount:${google_service_account.instance-sa.email}"
}
resource "google_project_iam_member" "gke_sa" {
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.custom_gke_sa.email}"
  project = var.project
}