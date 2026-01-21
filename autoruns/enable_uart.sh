#!/bin/sh
echo "Enabling UART"

nvram set uart_en=1
nvram set boot_wait=on
