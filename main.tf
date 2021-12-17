provider "google" {
  project = "searce-playground"
  
}

resource "google_compute_instance" "cb_test_vm" {
  name         = "cb-test-vm"
  machine_type = "e2-medium"
  zone         = "asia-south1-b"
  project = "searce-playground"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "anilgs-psc-vpc"
    subnetwork = "abhivaidya-psc-vpc-asia-south1-app-engine-subnet"
  }
}
