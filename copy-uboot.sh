#!/bin/sh

SD_DEVICE=$1
dd if=u-boot_crc.bin.crc of=${SD_DEVICE} bs=512 seek=2 conv=notrunc 
dd if=u-boot_crc.bin of=${SD_DEVICE} bs=512 seek=3 conv=notrunc
