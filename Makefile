DOCKER_NAME ?= rcore-docker

.PHONY: docker build_docker

docker:
	docker run --network host --rm -it \
		-v ${PWD}:/mnt \
		-v ~/.ssh/id_rsa:/root/.ssh/id_rsa \
		-v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub \
		-w /mnt \
		${DOCKER_NAME} bash -c "\
			mkdir -p /root/.ssh && \
			chmod 700 /root/.ssh && \
			chmod 600 /root/.ssh/id_rsa && \
			chmod 644 /root/.ssh/id_rsa.pub && \
			exec bash"

build_docker: 
	docker build -t ${DOCKER_NAME} .

fmt:
	cd os ; cargo fmt; cd ..
