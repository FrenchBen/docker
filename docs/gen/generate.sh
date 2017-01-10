#!/bin/bash
#
# Generate man pages for docker/docker
#

set -eux

mkdir -p ./man/man1  docs/dist ./yaml/yaml1

# Generate man pages from cobra commands
go build -o /tmp/gen-manpages ./docs/gen/generate.go ./docs/gen/yaml.go
# /tmp/gen-manpages --root . --man ./man/man1 --cli docs/dist --yaml ./yaml/yaml1
/tmp/gen-manpages --root . --yaml ./yaml/yaml1

# Generate legacy pages from markdown
./man/md2man-all.sh -q
