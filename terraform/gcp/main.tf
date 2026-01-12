provider "google" {
  project = var.project_id
  region  = "us-central1"
}

resource "google_cloud_run_service" "backend" {
  name     = "backend-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/backend:latest"
        env {
          name = "PORT"
          value = "8000"
        }
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "frontend" {
  name     = "frontend-service"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/frontend:latest"
      }
    }
  }

  traffic {
    percent = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "public_backend" {
  service  = google_cloud_run_service.backend.name
  location = google_cloud_run_service.backend.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}

resource "google_cloud_run_service_iam_member" "public_frontend" {
  service  = google_cloud_run_service.frontend.name
  location = google_cloud_run_service.frontend.location
  role     = "roles/run.invoker"
  member   = "allUsers"
}
