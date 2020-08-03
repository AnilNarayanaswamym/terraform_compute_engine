provider "google" {
  credentials = file("compute_engine_sa_keys.json")
  project     = "anil-t948144-273620"
  region      = "us-central1"
}

