resource "google_compute_firewall" "gcp_firewall" {
  name    = "gcp-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "all"
  }

  source_ranges = [ "0.0.0.0/0" ]

}