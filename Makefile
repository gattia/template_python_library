requirements:
	python -m pip install -r requirements.txt

requirements-mamba:
	mamba install --file requirements.txt

requirements-conda:
	conda install --file requirements.txt

build:
	pip install -e .

install:
	python setup.py install

# below is specifically for building / forcing building of cython code. 
# build-cython:
# 	python setup.py build_ext -i --force

dev:
	pip install pytest black isort wheel pdoc3 coverage

dev-mamba:
	mamba install pytest black isort wheel pdoc3 coverage

dev-conda:
	conda install pytest black isort wheel pdoc3 coverage

docs:
	pdoc --output-dir docs/ --html --force template_python_library
	mv docs/template_python_library/* docs/
	rm -rf docs/template_python_library

test:
	set -e
	pytest

lint:
	set -e
	isort -c .
	black --check --config pyproject.toml .

autoformat:
	set -e
	isort .
	black --config pyproject.toml .

clean:
	rm -rf build dist {my_package}.egg-info 

coverage: 
	coverage run -m pytest
	# Make the html version of the coverage results. 
	coverage html 