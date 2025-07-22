
# ----- Backup Server -----
resource "docker_image" "backup" {
  name = "alpine:3.20"
}

resource "docker_container" "backup" {
  name  = "${var.project_name}-backup"
  image = docker_image.backup.name
  command = ["sleep", "infinity"]
  restart = "unless-stopped"
  networks_advanced {
    name = docker_network.minicurso-net.name
  }

}
