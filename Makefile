SHELL = /bin/bash

benchmark:
	hugo benchmark --quiet

deploy:
	hugo --quiet --cleanDestinationDir --destination public-deployed/
	rm -v public-deployed/index.html
	mv public-deployed/en/sitemap.xml public-deployed

local:
	hugo server --baseURL "http://127.0.0.1:1313" --watch --quiet --ignoreCache --cleanDestinationDir

setup:
	git submodule init
	sudo eopkg install hugo
	mkdir -p themes/solus/static/{css,js}
	mkdir -p themes/solus/static/imgs/help-center

sync:
	git submodule update --remote --rebase
	mkdir -p themes/solus/static/{css,js}
	mkdir -p themes/solus/static/imgs/help-center
	find help-center-docs/* -maxdepth 0 ! -name "imgs" -type d -exec cp -Ru {} content/articles/ \;
	cp -R help-center-docs/imgs/* themes/solus/static/imgs/help-center/
	rm themes/solus/static/css/website*.css
	rm themes/solus/static/js/*
	cp -R solus-styling/build/*.css themes/solus/static/css/
	cp -R solbit/build/fonts/*.{eot,svg,ttf,woff} themes/solus/static/css/fonts/
	cp solbit/build/solbit*.min.js themes/solus/static/js/
	cp solus-webplatform-js/build/site*.min.js themes/solus/static/js/

help:
	@echo "deploy    - Create the deployed form of site. Not particularly useful for those not able to deploy the site."
	@echo "local     - Run the Solus Site locally."
	@echo "setup     - Install necessary tooling for minification."
	@echo "sync      - Update git submodules and update assets."