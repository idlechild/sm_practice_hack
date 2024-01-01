#!/bin/bash

docker build --tag sm_arcade_hack --build-arg now="$(date +%s)" --output build .

