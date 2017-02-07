NAME      := golang-onbuild
REGISTRY  := whiteplus/$(NAME)
VERSION   := 1.7.5-jessie

.PHONY: build tag push

build:
	docker build -t $(NAME):$(VERSION) .

tag: build
	docker tag $(NAME):$(VERSION) $(REGISTRY):$(VERSION)

push: tag
	docker push $(REGISTRY):$(VERSION)

