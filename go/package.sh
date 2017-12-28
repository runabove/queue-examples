#!/bin/bash

OS="darwin linux windows"
ARCH="amd64"

for GOOS in $OS; do
  for GOARCH in $ARCH; do
    OS="${GOOS^}"
    architecture="${OS}-${GOARCH}"
    echo "Building ${architecture}"
    export GOOS=$GOOS
    export GOARCH=$GOARCH

    go get
    go build -o bin/kafka-client-${architecture}
  done
done
