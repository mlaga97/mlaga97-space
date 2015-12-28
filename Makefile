all: build/index.html build/projects.html build/social.html build/assets/css/*.css build/assets/bootstrap/* build/assets/image/*

deploy: all
	mkdir -p /var/www/html/
	cp -r build/* /var/www/html/

deploy-test: all
	mkdir -p /var/www/html/testing/
	cp -r build/* /var/www/html/testing/

build/index.html: src/index.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' index.lua > ../build/index.html

build/projects.html: src/projects.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' projects.lua > ../build/projects.html

build/social.html: src/social.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	mkdir -p build/
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' social.lua > ../build/social.html

build/assets/css/*.css: assets/css/*.css
	mkdir -p build/assets/css/
	cp assets/css/*.css build/assets/css/

build/assets/bootstrap/*: assets/bootstrap/*
	mkdir -p build/assets/bootstrap/
	cp assets/bootstrap/*.css build/assets/bootstrap/

build/assets/image/*: assets/image/*
	mkdir -p build/assets/image/
	cp -r assets/image/* build/assets/image/

clean:
	rm -r build
