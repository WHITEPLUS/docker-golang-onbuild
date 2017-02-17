NAME      := golang-onbuild
REGISTRY  := whiteplus/$(NAME)
VERSION   := 1.8-jessie

.PHONY: build tag push

build:
	docker build -t $(NAME):$(VERSION) .

tag: build
	docker tag $(NAME):$(VERSION) $(REGISTRY):$(VERSION)

push: tag
	docker push $(REGISTRY):$(VERSION)

