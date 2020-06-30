terraform {
  required_version = ">= 0.12"
}

provider "github" {
  token = var.GITHUB_TOKEN
  owner = var.GITHUB_OWNER
}

provider "google" {
  credentials = file("gcp-cred.json")
}

terraform {
  backend "gcs" {
    bucket  = "blpabhishek-backend-state"
    prefix  = "terraform"
  }
}

###########################################################

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# resource "docker_container" "nginx_container" {
#   image = docker_image.nginx.latest
#   name  = "my-docker-image"
#   ports {
#     internal = 80
#     external = 8000
#   }
# }

# resource "github_repository" "terraform-repo" {
#   name        = "terraform-repo"
#   description = "awesome codebase"

#   visibility = "private"

# }