# Dependency Confusion Attack
This is an example environment to demonstrate a Dependency Confusion Attack.

The goal is to publish a package to PyPI with a higher version number than an internal private repository used by a company.
Since package managers prioritize the latest available version, the malicious package will be preferred over the outdated internal one.

This allows the attacker to introduce malicious code into the project, executing arbitrary commands when the package is installed.

Prerequisites

  - Known package name (used internally by the target)
  - PyPI account with 2FA enabled
  - A user installing the package without explicitly specifying the version
  - The requirments.txt contains `--extra-index-url` and not `--index-url`


## Get PyPi Account
Go to PyPI and create an account.
Enable Two-Factor Authentication (2FA) for security.

## Create API Token
https://pypi.org/help/#apitoken


## Cretea Malicous package
Modify the functions in the package to call your functions to execute code

## Setup the project
```shell
sudo docker compose up --build
```

## Build package 
Go into your evil package and build it
```shell
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade build
python3 -m build
```

## Publish package
You can puplish the package with twine
```shell
pip install twine
python -m twine upload dist/*
```
Enter your API token
