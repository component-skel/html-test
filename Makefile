
node_modules: package.json
	@npm install

# open browser correctly in mac or linux
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
		open := google-chrome
endif
ifeq ($(UNAME_S),Darwin)
		open := open
endif

test: build
	@${open} test/index.html

testci: build node_modules
	@./node_modules/.bin/testem test/testem.json

example: build
	@${open} test/example.html

.PHONY: test example
