dependencies:
	ansible-galaxy install -i requirements.txt

container: clean-container
	docker build -t andrewvaughan/ansible-role-server-harden .

test: container
	docker run --name ansible-role-server-harden-test andrewvaughan/ansible-role-server-harden

attach: container
	docker run -it --name ansible-role-server-harden-test andrewvaughan/ansible-role-server-harden /bin/bash

changelog:
	$(eval TAG2 := $(shell git describe --tags --abbrev=0 2>/dev/null || echo "HEAD"))
	$(eval TAG1 := $(shell (git describe --tags --abbrev=0 $(TAG2)~1 2>/dev/null | xargs -I % echo %..) || echo ""))

	$(info Changelog for $(TAG1)$(TAG2):)
	$(info )
	@git log $(TAG1)$(TAG2) --no-merges --reverse --pretty=format:'- [view](https://github.com/andrewvaughan/ansible-role-server-harden/commit/%H) &bull; %s'

clean: clean-container
	-rm -rf .coverage htmlcov
	-find . -name '*.pyc' -exec rm -f {} +
	-find . -name '*.pyo' -exec rm -f {} +
	-find . -name '*~' -exec rm -f  {} +
	-find . -name '*.retry' -exec rm -f {} +
	-docker rmi andrewvaughan/ansible-role-server-harden

clean-container:
	-docker stop ansible-role-server-harden-test
	-docker rm ansible-role-server-harden-test

.PHONY : dependencies container test attach changelog clean clean-containers
