terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.52.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

### MySQL ###

resource "google_sql_database_instance" "main" {
  name             = "my-database-instance"
  region           = "us-central1"
  database_version = "MYSQL_8_0"
  settings {
    tier = var.database_tier
    ip_configuration {
      authorized_networks {
        value = "0.0.0.0/0"
      }
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.main.name
}

resource "google_sql_user" "users" {
  name     = "dbadmin"
  instance = google_sql_database_instance.main.name
  password = "changeme"
}

### 
