#Basic Docker build command
BUILDER := sudo docker build

#Name of image to be created
IMAGE := ubuntu:baseOS

#Basic Docker run command
RUNNER := sudo docker run --rm

#Binds the PWD to one referenced in Docker image
DIRBIND := $(PWD):/build

#Output location
OUTLOC := bin

#Source for OS files
SRC := src

#---------------------------------------------------------------
.PHONY : run image build buildISO clean 

buildAndRun: build run

run:
	qemu-system-i386 -cdrom myos.iso

image:
	$(BUILDER) -t $(IMAGE) .

build:
	mkdir -p bin
	$(RUNNER) -v $(DIRBIND) -it $(IMAGE) /bin/sh -c \
	' \
	./build.sh ;\
	./headers.sh ;\
	./iso.sh \
	'
clean:
	#This is probably bad practice. Need to find why they can't be removed without "sudo"
	sudo rm -rf ./bin
	sudo rm -rf ./isodir
