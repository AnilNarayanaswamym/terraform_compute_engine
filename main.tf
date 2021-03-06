resource "google_compute_instance" "default" {
  name         = "terraform-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    metadata_startup_script = "sudo yum install -y tree && sudo yum install -y ansible"

    tags = ["http-server", "https-server"]
    
   service_account {
    email = "<ADD YOUR SERVICE ACCOUNT>"
    scopes = [
       "https://www.googleapis.com/auth/compute",
       "https://www.googleapis.com/auth/logging.write",
       "https://www.googleapis.com/auth/monitoring.write",
       "https://www.googleapis.com/auth/devstorage.read_only",
       "https://www.googleapis.com/auth/service.management.readonly",
       "https://www.googleapis.com/auth/servicecontrol",
]
  }
 }
// adding firewalls
// resource "google_compute_firewall" "http-server" {
 // name    = "default-allow-http-terraform"
 // network = "default"

  //allow {
    //protocol = "tcp"
    //ports    = ["80"]
  //}
output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}
