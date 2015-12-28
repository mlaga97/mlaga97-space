all: build/index.html build/projects.html build/social.html

deploy: all
	cp build/index.html /var/www/html/index.html
	cp build/projects.html /var/www/html/projects.html
	cp build/social.html /var/www/html/social.html

deploy-test: all
	cp build/index.html /var/www/html/testing/index.html
	cp build/projects.html /var/www/html/testing/projects.html
	cp build/social.html /var/www/html/testing/social.html

build/index.html: src/index.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' index.lua > ../build/index.html

build/projects.html: src/projects.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' projects.lua > ../build/projects.html

build/social.html: src/social.lua src/site.lua src/navbar.lua src/header.lua framework/parseTagTree.lua
	cd src; lua -e 'parseTagTree = dofile "../framework/parseTagTree.lua"' social.lua > ../build/social.html

clean:
	rm build/index.html
	rm build/projects.html
	rm build/social.html
