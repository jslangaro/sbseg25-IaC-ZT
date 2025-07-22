
# ----- Ansible Controller -----
resource "docker_image" "ansible" {
  name = "alpinelinux/ansible"
}

resource "docker_container" "ansible" {
  name  = "${var.project_name}-ansible"
  image = docker_image.ansible.name

  command = ["sleep", "infinity"]

  volumes {
  host_path      = abspath("${path.module}/../etapa3-ansible")
  container_path = "/ansible"
}

  restart = "unless-stopped"
  networks_advanced {
    name = docker_network.minicurso-net.name
  }
}
