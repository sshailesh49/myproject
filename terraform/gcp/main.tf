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
        image = "docker.io/${var.docker_username}/myproject-backend:latest"
        env {
          name = "PORT"
          value = "8000"
        }
        env {
          name = "DB_PASSWORD"
          value_from {
            secret_key_ref {
              name = google_secret_manager_secret.db_password.secret_id
              key  = "latest"
            }
          }
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
        image = "docker.io/${var.docker_username}/myproject-frontend:latest"
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

# Secret Manager
resource "google_secret_manager_secret" "db_password" {
  secret_id = "db-password"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret = google_secret_manager_secret.db_password.id
  secret_data = "fake-db-password-change-me"
}

# Enable Secret Access for Cloud Run
resource "google_project_service_identity" "run_agent" {
  provider = google-beta
  service  = "run.googleapis.com"
}

resource "google_secret_manager_secret_iam_member" "secret_access" {
  secret_id = google_secret_manager_secret.db_password.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${google_project_service_identity.run_agent.email}"
}
