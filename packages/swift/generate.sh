#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTO_DIR="$SCRIPT_DIR/../../protobufs"
OUT_DIR="$SCRIPT_DIR/dist"

mkdir -p "$OUT_DIR"
protoc --swift_out="$OUT_DIR" -I="$PROTO_DIR" "$PROTO_DIR"/livekit_*.proto