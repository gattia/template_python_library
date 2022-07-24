![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)<br>
![Build Status](https://github.com/gattia/template_python_library/actions/workflows/build-test.yml/badge.svg?branch=main)<br>
|[Documentation](http://anthonygattiphd.com/template_python_library/)|



# Introduction

{update_here}

This package is an example/template for building repositories. The choices made
in this repository are based on a combination of experience, convenience, and current
convention. These factors will change over time, and as such so will/should the 
recommendations made in this document. 

This package works like a normal package, it can be installed, tests can be run,
it can be linted, coverage will be calculated, it should even push to pypi on push
to master (merge accepted). 

In the following, we briefly provide information about the format of this repository, 
this is followed by the boilerplate `README.md` sections that describe how to install,
how to run examples, how to run tests, how to get coverage, how to lint, etc. 

Throughout this file, and the other files in this template, replace `{my_pacakge}`
with the name of the new repository that you are creating. Also, replace 
`{template_python_library}`, `{REPLACE}`, and `{update_here}` as appropriate. 

## Things already setup in this repository: 
- github action (GHA) for running tests: https://github.com/gattia/template_python_library/blob/main/.github/workflows/build-test.yml
- GHA for running tests, building, and deploying to pypi: https://github.com/gattia/template_python_library/blob/main/.github/workflows/building-pypi-linux.yml
    - Structure is there for building wheels, but commented out because this package
    only has native python code. 
    - cibuildwheel is setup / used for deploying wheels to pypi, and includes building 
    for multiple difference OSes. 
- GHA for building docs: https://github.com/gattia/template_python_library/blob/main/.github/workflows/building-pypi-linux.yml
    - Uses [pdoc3](https://pdoc3.github.io/pdoc/)
    - could build a branch of this repository for building sphinx / readthedocs? But why not use GitHub Pages? even if sphinx?
- General structure/code (make file), dependicies for creating docs automatically from docstrings. 
    - Use numpy docstrings to enable this: https://numpydoc.readthedocs.io/en/latest/format.html
    - The example code already has numpy formatting to start. 
- pyproject.toml to describe metadata & build info 
    - This uses latest PEP621 recommendations for packaging - supersedes `setup.py` and `setup.cfg`
- linting using `isort` and `black`. Settings in `pyproject.toml`
- Template information/outline for contributing (borrowed from DOSMA)
- License (MIT by default - change as appropriate)
- .gitignore for the current repo / common python uses. 
- testing structure, example, dependency (pytest), and commands to run (make test). 
- code structure, example, including docstrings
- make file to easily run commands like building, installing, linting, etc. 

## To do:
- [] give coverage badge on `README.md`

## Structure 
Here is the general structure of this setup. Below this structure are quick instructions of 
things to change for your new repository. 

Instructions on `Packaging` from python are provided here: 
- https://packaging.python.org/en/latest/tutorials/packaging-projects/

```
template_python_library/                      
    template_python_library/ 
        __init__.py
        files.py
        modules/
            __init__.py
            more_files.py
    
    .github/
        ISSUE_TEMPLATE/
            bug_report.md # template for filing bugs
            feature_request.md # template for feature requests
        workflows/
            build-test.yml 
                # github actions workflow to:
                #   - test linting/formating
                #   - build & test the package
                # To work, this requires a number of the Make commands to 
                # be setup, including: dev, requirements, lint, test
    
    docs/
        # folder where the docs will be built
    
    examples/ 
        # folder where example scripts should be placed. 
        # e.g., https://github.com/gattia/cycpd/tree/main/examples
    
    .gitignore
        # pre-filled gitignore file for common python packages & specific to this repo. 
    
    Makefile
        # makefile with convenienience commands designed to make 
        # developing/installing easier. 
    
    pyproject.toml
        # file to specify metadata of the project, requirements, etc. 
        # this replaces `setup(...)` in a normal `setup.py` file. 
        # also includes description of configurations for other build tools
        # such as linting, (isort, black). 
        # information for setting up `pyproject.toml`: https://peps.python.org/pep-0621/
        # other helpful resources: 
        #    https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html
        #    https://scikit-hep.org/developer/pep621


    README.md 
        # current background info, install info, and how to contribute

    setup.py 
        # file to call to build library `python setup.py install`
        # setup.py is no longer encouraged. We provide the most basic one here
        # because it is still needed to install in editable mode.This is only 
        # needed for editable mode because `pyproject.toml` does not fully support 
        # editable mode, yet:
        #   https://setuptools.pypa.io/en/latest/userguide/quickstart.html#development-mode
        #
        # also, the setup.py might be needed for installing cython dependencies
        # Example here: https://github.com/gattia/cycpd/blob/e235da5276652eea12875aef3c8280a9b673122e/setup.py#L12-L20
        # and here: https://github.com/gattia/cycpd/blob/e235da5276652eea12875aef3c8280a9b673122e/setup.py#L48
    
    requirements.txt
        # packages that this repository requires/ that should be installed first 
        # this is necessary to let conda install dependencies (as well as pip). 
        # These requirements could be placed inside of the pyproject.toml
        #     - But can conda read the pyproject.toml?

    CONTRIBUTING.md 
        # information about how to contribte to the library
        # this format overall was bored from DOSMA
    
    LICENSE
        # Package license / license type. 
```

Steps to update this package for new repository: 
1. `find` all instances of `{my_project}`, `{REPLACE}`, `template_python_library`, and `{update_here}` and
    replace with package name or other information as appropriate. 
2. (1) should include renaming this current directory, and the source directory (`template_python_library`)
3. fill in the `"description"` in the `pyproject.toml`
4. update `requirements.txt` and `dependencies` in `pyproject.toml`
     - To do - can dependencies read/update from requirements.txt?
5. ADD INSTRUCTIONS TO STOP TRACKING THIS GITHUB REPOSITORY.
    - Initiate new github repo
    - Start committing to it
    - Push to new github repository. 
6. After pushing to new repository on github, make sure to allow github pages so properly so that the docs
    will automatically build. Go to the `Settings` tab on your github repo, under `Pages` on the left, 
    turn GitHub Pages on, and select the home dir for the docs to be `/docs` on the `main` branch. There is a 
    screen shot at the end of this README pointing to the relevant fields. 
7. If there is a problem finding the package structure when building (finds tests and can't disambiguate), 
    then you can specify package information in `pyproject.toml` `[tool.setuptools]`. This is flagged with 
    `{REPLACE}`. See here for more info: 
    https://setuptools.pypa.io/en/latest/userguide/pyproject_config.html#dynamic-metadata
    This describes a system similar to defining `packages=['pymskt', 'pymskt.image', etc.]` in `setup()`

# Installation

You should be able to install this by cloning, navigating to this root directory, and installing with pip:

```
git clone https://github.com/gattia/template_python_library
cd template_python_library

conda create -n template_python_library python=3.8

pip install . 

# OR
make install
```

### Install for development
This method of install will install in editable mode. This means that the code wont be packaged and saved
in your python's `site-packages`, instead `site-packages` will point to this directory. So, if the code 
changes in here, so will the version of this package used on your local build. 
```
git clone https://github.com/gattia/template_python_library
cd template_python_library

conda create -n template_python_library python=3.8

make dev
make install-dev
```

# Examples

Describe how to use the examples. E.g., {update_here}

Navigate to the examples directory and run the scripts: 
```bash
cd examples
python examples/example_1.py
```

# Development / Contributing

## Tests
The test can be run by: 

```bash
pytest
```

or 
```bash
make test
```

Inidividual tests can be run by running 

```
python -m pytests path_to_test
```

## Coverage
- Coverage results/info requires `coverage` (`conda install coverage` or `pip install coverage`).
- These should be installed automatically with one of the  `make dev` commands.
- You can get coverage statistics by running: 
    - `coverage run -m pytest`
    or if using make: 
    - `make coverage`
        - This will save an html of the coverage results. 

### note about coverage:
    - Coverage runs by seeing how much of the code-base is covered when you run the command after coverage. 
    In this case, it is looking to see how much of the code-base is covered when we run the tests. 

## Contributing
If you want to contribute, please read over the documentaiton in `CONTRIBUTING.md`

## Docs
To build the docs, run `make docs`. If you want the docs published on gihutb, you need to activate github page.
Go to the `Settings` tab on your github repo, under `Pages` on the left, turn GitHub Pages on, and select the
home dir for the docs to be `/docs` on the `main` branch. Example here:  

![Setup Docs on Github Pages](media/setting_up_docs_automatically.png)


# License
MIT License