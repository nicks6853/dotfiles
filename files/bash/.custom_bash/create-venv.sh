#!/bin/bash

if ! [ -d "$(pwd)/venv" ]; then
	echo "Creating virtual environment..."
	python3 -m virtualenv venv
	echo -e "Created!\nType '. venv/bin/activate' to activate your virtual environment."
else
	echo "There's already a virtual environment in this directory!"
	exit 1
fi
