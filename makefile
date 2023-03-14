IMAGE ?= whisper-tutorial

UID ?= root
GID ?= root
DOCKER_ARGS ?=

DCMD ?= docker run $(DOCKER_ARGS) --rm -v $$(pwd):/home/ubuntu/$(REPO_NAME) -w /home/ubuntu/$(REPO_NAME) -u $(UID):$(GID) $(IMAGE)

.PHONY: docker jupyter interact

JUPYTER_PASSWORD ?= jupyter
JUPYTER_PORT ?= 8888
.PHONY: jupyter
jupyter: DOCKER_ARGS=-u $(UID):$(GID) --rm -it -p $(JUPYTER_PORT):$(JUPYTER_PORT) -e NB_USER=$$USER -e NB_UID=$(UID) -e NB_GID=$(GID)
jupyter:
	$(DCMD) jupyter lab \
		--allow-root \
		--port $(JUPYTER_PORT) \
		--ip 0.0.0.0 
docker:
	docker build $(DOCKER_ARGS) -t $(IMAGE) .

interact: DOCKER_ARGS=-it
interact:
	$(DCMD) bash