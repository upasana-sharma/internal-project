resource "google_compute_instance" "cb_test_vm" {
  name         = "cb_test_vm"
  machine_type = "e2-medium"
  zone         = "asia-south1-b"
  project = "searce-playground"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "jay-test-vpc"
  }
}
