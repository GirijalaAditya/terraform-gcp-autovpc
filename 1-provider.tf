terraform {
  required_version = "~> 1.5.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.72.1"
    }
  }

  backend "gcs" {
    bucket      = "adityagcpterraformstate"
    prefix      = "terraformstatefiles"
    credentials = "service-account.json"
  }
}

provider "google" {
  # Configuration options
  credentials = file("${path.module}/service-account.json")
  region      = var.region
  project     = var.project_id

}