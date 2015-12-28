all: build/index.html build/projects.html build/social.html build/assets/*

deploy: all
	mkdir -p /var/www/html/
	cp -r build/* /var/www/html/

deploy-test: all
	mkdir -p /var/www/html/testing/
	cp -r build/* /var/www/html/testing/

pull-deploy:
	git pull
	make deploy

pull-deploy-test:
	git pull
	make deploy-test

build/index.html: src/index.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' index.lua > ../build/index.html

build/projects.html: src/projects.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' projects.lua > ../build/projects.html

build/social.html: src/social.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' social.lua > ../build/social.html

build/assets/*: assets/*
	rsync -rupE --delete assets build/

clean:
	rm -r build
