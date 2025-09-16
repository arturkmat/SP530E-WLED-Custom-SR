#!/bin/bash
set -e
PORT=${1:-/dev/ttyUSB0}
BAUD=${2:-460800}

esptool.py --chip esp32c3 --port "$PORT" --baud "$BAUD" write_flash --encrypt \
  0x0     bootloader.bin \
  0x8000  partitions.bin \
  0x10000 custom_build.bin
