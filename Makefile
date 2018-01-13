dev-dependencies:
	pip install -q -U -r requirements-dev.txt

lint: dev-dependencies lint-docstring
	pycodestyle --show-pep8 --show-source ./

lint-docstring: dev-dependencies
	pydocstyle --explain --source ./

test: clean dev-dependencies lint

clean:
	rm -rf .coverage htmlcov
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	find . -name '*.retry' -exec rm -f {} +


.PHONY : dev-dependencies lint lint-docstring test clean
