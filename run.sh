#!/bin/bash

if command -v "podman compose" 2>&1 > /dev/null; then
  CMD="podman compose"
elif command -v "podman-compose" 2>&1 > /dev/null; then
  CMD="podman-compose"
else
  echo "Podman Compose is not installed. Please install Podman Compose first."
  exit 1
fi

if [ ! -f ".env" ]; then
  echo "Please configure .env file first"
  echo "Check .env.example for reference"
  exit 1
fi

if [ ! -f "torrc" ]; then
  echo "Please configure torrc file first"
  echo "Check torrc.example for reference"
  exit 1
fi

mkdir -p data/{adguard-config,adguard-data,wg-easy,filebrowser}

$CMD down
$CMD build
$CMD up -d
