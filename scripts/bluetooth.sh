#!/bin/bash

sudo hciconfig hci0 down
sudo bluemoon -A
sudo hciconfig hci0 up
sudo systemctl restart bluetooth.service
