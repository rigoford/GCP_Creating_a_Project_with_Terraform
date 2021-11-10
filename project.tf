resource "random_id" "uuid" {
  byte_length = 6
}

locals {
  project_id = "playground-project-${lower(random_id.uuid.id)}"
}

# Create project
resource "google_project" "project" {
  name                = local.project_id
  project_id          = local.project_id
  org_id              = var.organisation_id
  billing_account     = var.billing_account_id
  auto_create_network = false
}

# Enable services
resource "google_project_service" "compute" {
  project                    = google_project.project.project_id
  service                    = "compute.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "logging" {
  project                    = google_project.project.project_id
  service                    = "logging.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "oslogin" {
  project                    = google_project.project.project_id
  service                    = "oslogin.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "stackdriver" {
  project                    = google_project.project.project_id
  service                    = "stackdriver.googleapis.com"
  disable_dependent_services = true
}

# Enable OS Login
resource "google_compute_project_metadata_item" "enable_oslogin" {
  project = google_project.project.project_id
  key     = "enable-oslogin"
  value   = true
}

output "project_id" {
  value = google_project.project.project_id
}
