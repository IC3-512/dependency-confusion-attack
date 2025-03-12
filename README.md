```
   WARNING: FOR EDUCATIONAL AND SECURITY RESEARCH PURPOSES ONLY!      

   This project demonstrates Dependency Confusion attacks and is      
   intended strictly for ethical hacking, penetration testing, and    
   cybersecurity research within controlled environments.             

   Unauthorized use against real-world systems without explicit       
   permission is ILLEGAL and may violate company policies,            
   cybersecurity laws, and ethical guidelines.                        

   The author is NOT responsible for any misuse of this tool.         
   Use responsibly and only in legal environments!
```

[![Hits](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https%3A%2F%2Fgithub.com%2FIC3-512%2Fdependency-confusion-attack&count_bg=%2379C83D&title_bg=%23555555&icon=&icon_color=%23E7E7E7&title=hits&edge_flat=false)](https://hits.seeyoufarm.com)

# Dependency Confusion Attack
This is an example environment to demonstrate a Dependency Confusion Attack.

The goal is to publish a package to PyPI with a higher version number than an internal private repository (here the pypiserver) used by a company.
Since package managers prioritize the latest available version(1.0.1), the malicious package will be preferred over the outdated(0.0.1) internal one.

This allows the attacker to introduce malicious code into the project, executing arbitrary commands when the package is installed.

Prerequisites

  - Known package name (used internally by the target)
  - Pypi account with 2FA enabled
  - A user installing the package without explicitly specifying the version ("~" is attackable if you also know the version)
  - The requirments.txt contains `--extra-index-url` and not `--index-url`


## Get pypi Account
Go to pypi and create an account.
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
