changelog:
	$(eval TAG2 := $(shell git describe --tags --abbrev=0 2>/dev/null || echo "HEAD"))
	$(eval TAG1 := $(shell (git describe --tags --abbrev=0 $(TAG2)~1 2>/dev/null | xargs -I % echo %..) || echo ""))

	$(info Changelog for $(TAG1)$(TAG2):)
	$(info )
	@git log $(TAG1)$(TAG2) --no-merges --reverse --pretty=format:'- [view](https://github.com/andrewvaughan/ansible-role-server-harden/commit/%H) &bull; %s'

clean:
	rm -rf .coverage htmlcov
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	fine . -name '*.retry' -exec rm -f {} +


.PHONY : changelog clean
