#!/bin/sh

source ~/.bashrc


# Resize if EBS volume is adjusted
source resize2fs /dev/${RESIZE_DEV}
