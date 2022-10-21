<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h1 align="center">AntiFirewalls PoC</h1>
</p>

PoC de Reto Telefónica

### Realizado con

* [Flask-REST](https://flask-restful.readthedocs.io/en/latest/)
* [Docker](https://www.docker.com/)

<!-- GETTING STARTED -->
## Empezando

### Prerequisitos

* docker
  ```sh
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
   echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io
  ```

### Instalación

1. Clonar el repositorio
   ```sh
   git clone https://github.com/0xArchy/hackforgood.git
   ```
   ```
3. Revisar el fichero real_hosts, básicamente añadir  `172.17.0.2     my-uclm.es  www.my-uclm.es.local` en tu /etc/hosts
4. Compilar el proyecto
   ```sh
   sudo make
   ```
5. Inicializar los contenedores
   ```sh
   sudo make remove containers
   ```

## Contacto

AntiFirewalls



