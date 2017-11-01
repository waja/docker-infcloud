IMAGE_NAME := waja/infcloud

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo docker run --rm -it $(IMAGE_NAME) 
	
shell:
	docker run --rm -it --entrypoint sh $(IMAGE_NAME) -l
