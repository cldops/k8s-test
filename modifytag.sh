#!/bin/bash
sed "s/tagstring/$1/g" blue-temp.yml > deploy.yml
#sed "s/tagstring/$1/g" green-temp.yml > deploy.yml
