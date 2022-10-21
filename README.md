<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h1 align="center">AntiFirewalls PoC</h1>
</p>

PoC correspondiente al reto POC CIBERSEGURIDAD: EJECUCIÓN DE CÓDIGO REMOTO EN KERNEL DE LINUX A TRAVÉS DE WIFI de la HackForGood de Telefónica 2022.

En esta Prueba de Concepto se ha montado una infraestructura real de red mediante contenedores dockers donde uno de los nodos (El punto de acceso) es vulnerable a CVE-2022-42719.

El objetivo de esta prueba de concepto es demostrar el impacto que tendría en la sociedad el hecho de tener un nodo vulnerable en la infraestructura de red en la que se controla en todo momento el tráfico proveniente del exterior, restringiendo dos zonas: dmz y internal.

En el segmento de red **dmz** encontramos nodos que son visibles al exterior en nuestra infraestructura un servidor web, en cambio en el segmento de red **internal** encontramos los nodos privados con documentos confidenciales para la empresa como la base de datos de usuarios y documentos de empleados por ejemplo.

El objetivo del firewall de esta red que se encuentra en el router es controlar el tráfico y solo permitir que entre a la red tráfico cuyo destino es el servidor web, es decir en ningún momento se debe permitir acceder a los servidores de autenticación y de ficheros directamente. Aunque el servidor web pueda comunicarse con la red interna de la empresa, en ningún momento un usuario fuera de la red debería visualizar estos nodos.

El impacto consiste en que cuando se logra ejecución de comandos remota en el nodo **router** el atacante tiene acceso a la red interna de la empresa, ya que el router esta conectado a ambos segmentos de red (dmz y internal), lo cual podría visualizar las direcciones de todos los nodos pertenecientes a ambos segmentos de red y estudiar servicios y versiones para intentar explotar algún fallo de seguridad con el objetivo de violar la integridad e integridad de los activos de la empresa.

En nuestra prueba de concepto, ya que se ha realizado en 24 horas, los nodos de autenticación y de datos no tienen ningún fallo, simplemente un usuario cuyas credenciales son débiles. El atacante podría realizar un ataque por fuerza bruta con herramientas como **crackmapexec** o **hydra** y obtener las credenciales del usuario **dev** para el servicio ssh.

El esquema de nuestra infraestructura red es el siguiente:

![image](https://user-images.githubusercontent.com/52278758/197303467-936c185a-d6bf-4a81-b727-031dec79fd83.png)


### Realizado con

* [Flask-REST](https://flask-restful.readthedocs.io/en/latest/)
* [Docker](https://www.docker.com/)
* [Iptables](https://linux.die.net/man/8/iptables)

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

1. Clonar el repositorio.
   ```sh
   git clone https://github.com/0xArchy/CR005_AntiFirewalls.git
   ```
3. Revisar el fichero real_hosts, básicamente añadir  `172.17.0.2     my-uclm.es  www.my-uclm.es.local` en tu /etc/hosts, aunque directamente trabajaremos con direcciones IP.
4. Compilar el proyecto.
   ```sh
   sudo make
   ```
5. Inicializar los contenedores.
   ```sh
   sudo make containers
   ```
6. Acceder a los recursos del servidor web
  * Version: ``` http://172.17.0.2/version ```
  
  ![image](https://user-images.githubusercontent.com/52278758/197303691-e9b241b0-f693-4488-8973-00c1a1aa809a.png)
  
  * Login: ``` http://172.17.0.2/login?email=<tu_email>&password=<tu_contraseña> ```
  
  ![image](https://user-images.githubusercontent.com/52278758/197303729-db727bb0-5124-4ff2-a7ab-6ea17bda8d41.png)

  ![image](https://user-images.githubusercontent.com/52278758/197303741-0dbfcda9-7104-48a0-98d9-1971d059a1fc.png)
  
  * Sistema de Archivos ``` http://172.17.0.2/<nombre_fichero> ```
  
  ![image](https://user-images.githubusercontent.com/52278758/197303775-b7a1e4f8-3ae5-49e0-9dc6-166ae65f5703.png)

  ![image](https://user-images.githubusercontent.com/52278758/197303791-bacb7e56-bc3c-4105-9fac-da940e1dc363.png)
  
  7. Por otro lado el usuario puede comprobar como no existe acceso directamente a los recursos internos, además que tenemos acceso a esos segmentos de red ya que nuestro equipo hace de router de los distintos contenedores por defecto.
  
  ![image](https://user-images.githubusercontent.com/52278758/197303886-7bead531-125d-4fd7-991c-72bc9a00bba2.png)
  
  ![image](https://user-images.githubusercontent.com/52278758/197304035-60201965-31c2-4d30-bf0d-f40d34c79888.png)

  ![image](https://user-images.githubusercontent.com/52278758/197304076-382da7ac-0a64-40b6-ae30-4097c44d0d9b.png)

## Contacto

AntiFirewalls



