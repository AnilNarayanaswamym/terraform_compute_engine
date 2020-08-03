provider "google" {
  credentials = file("compute_engine_sa_keys.json")
  project     = "<ADD_PROJECT_ID>"
  region      = "us-central1"
}

