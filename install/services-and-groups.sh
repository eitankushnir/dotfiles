#!/usr/bin/env bash

user="$1"

usermod -aG docker "$user"
systemctl enable docker.service

systemctl enable ly@tty2.service
systemctl disable getty@tty2.service
