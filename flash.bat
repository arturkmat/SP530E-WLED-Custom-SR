@echo off
set PORT=%1
if "%PORT%"=="" set PORT=COM3
set BAUD=%2
if "%BAUD%"=="" set BAUD=460800

esptool.py --chip esp32c3 --port %PORT% --baud %BAUD% write_flash --encrypt ^
  0x0     bootloader.bin ^
  0x8000  partitions.bin ^
  0x10000 custom_build.bin
