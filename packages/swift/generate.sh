#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROTO_DIR="$SCRIPT_DIR/../../protobufs"
OUT_DIR="$SCRIPT_DIR/dist"

mkdir -p "$OUT_DIR"

protoc --swift_out="$OUT_DIR" --swift_opt=Visibility=Public -I="$PROTO_DIR" "$PROTO_DIR/livekit_temptalk.proto"

for file in "$PROTO_DIR"/livekit_*.proto; do
  if [[ "$file" != "$PROTO_DIR/livekit_temptalk.proto" ]]; then
    protoc --swift_out="$OUT_DIR" -I="$PROTO_DIR" "$file"
  fi
done