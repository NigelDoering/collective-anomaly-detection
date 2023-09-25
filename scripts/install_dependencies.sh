#!/bin/sh

# This script installs the application dependencies
pip install GDAL==$(gdal-config --version | awk -F'[.]' '{print $1"."$2}')
pip install -r requirements.txt
