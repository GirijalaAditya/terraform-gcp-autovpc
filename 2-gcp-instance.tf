data "google_compute_image" "gce_image" {
  project = "ubuntu-os-cloud"
  family  = "ubuntu-2204-lts"
}

resource "google_compute_instance" "vm_instance" {
  name         = "gce-instance-1"
  zone         = "us-central1-a"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = data.google_compute_image.gce_image.self_link
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
