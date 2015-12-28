all: build/index.html build/projects.html build/social.html

deploy: all
	cp build/index.html deploy/index.html
	cp build/projects.html deploy/projects.html
	cp build/social.html deploy/social.html

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
