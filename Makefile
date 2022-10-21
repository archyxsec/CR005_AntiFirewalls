build:
	docker build --rm -f Dockerfile --tag mycompany .
	docker build --rm -f web-uclm/Dockerfile --tag mycompany-web web-uclm
	docker build --rm -f router/Dockerfile --tag mycompany-router router
	docker build --rm -f uclm-auth/Dockerfile --tag mycompany-auth uclm-auth
	docker build --rm -f uclm-files/Dockerfile --tag mycompany-files uclm-files

network:
	-docker network create -d bridge --subnet 10.0.1.0/24 dmz
	-docker network create -d bridge --subnet 10.0.2.0/24 internal

containers: build network
	docker run --privileged --rm -ti --cap-add=NET_ADMIN -d --name router --hostname router mycompany-router
	docker network connect dmz router
	docker network connect internal router

	docker run --rm -ti --cap-add=NET_ADMIN -d --name web-uclm --hostname web-uclm --ip 10.0.1.4 \
		--network dmz mycompany-web

	docker run --rm -ti --cap-add=NET_ADMIN -d --name uclm-auth --hostname uclm-auth --ip 10.0.2.3 \
		--network internal mycompany-auth

	docker run --rm -ti --cap-add=NET_ADMIN -d --name uclm-files --hostname uclm-files --ip 10.0.2.4 \
		--network internal mycompany-files


remove:
	-docker stop router work web-uclm uclm-auth uclm-files
	-docker network prune -f
