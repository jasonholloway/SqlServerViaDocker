#!/bin/bash

rm -rf reveal*

wget -qO- https://github.com/hakimel/reveal.js/archive/3.8.0.tar.gz \
	| tar xvfz - 

wget -O reveal.js-3.8.0/css/theme/sunblind.css https://revealjs-themes.dzello.com/css/theme/sunblind.css

ln -s ./reveal.js-3.8.0 ./reveal.js

npm i -g live-server

