# \ var
MODULE  = $(notdir $(CURDIR))
OS      = $(shell uname -s)
MACHINE = $(shell uname -m)
NOW     = $(shell date +%d%m%y)
REL     = $(shell git rev-parse --short=4 HEAD)
CORES   = $(shell grep processor /proc/cpuinfo| wc -l)
# / var

# \ dir
CWD     = $(CURDIR)
BIN     = $(CWD)/bin
DOC     = $(CWD)/doc
TMP     = $(CWD)/tmp
LIB     = $(CWD)/lib
SRC     = $(CWD)/src
TEST    = $(CWD)/test
GZ      = $(HOME)/gz
# / dir

# \ tool
CURL    = curl -L -o
# / tool

# \ src
# / src

# \ all
.PHONY: repl
repl:

.PHONY: test
test:

.PHONY: format
format: tmp/format
tmp/format:
# / all

# \ doc
# / doc

# \ install
.PHONY: install update
install: $(OS)_install
	$(MAKE) update
update: $(OS)_update

.PHONY: Linux_install Linux_update
Linux_install Linux_update:
	sudo apt update
	sudo apt install -u `cat apt.txt`
# \ js
# / js
# / install
# \ merge
MERGE  = README.md Makefile .gitignore apt.txt apt.dev .vscode $(S)
MERGE += bin doc lib include src test tmp

.PHONY: zip
zip:
	git archive \
		--format zip \
		--output $(TMP)/$(MODULE)_$(NOW)_$(REL).src.zip \
	HEAD

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout ponymuck -- $(MERGE)

.PHONY: ponymuck
ponymuck:
	git push -v
	git checkout $@
	git pull -v
# / merge
