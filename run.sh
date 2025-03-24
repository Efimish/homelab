#!/bin/bash

sudo apt install -y podman podman-compose

if [ ! -f ".env" ]; then
  echo "Please configure .env file first"
  exit 1
fi

if [ ! -d "conf" ]; then
  mkdir conf
fi

if [ ! -d "work" ]; then
  mkdir work
fi

if [ ! -d "wg-easy" ]; then
  mkdir wg-easy
fi

podman-compose down
podman-compose up -d
