#!/bin/bash

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
