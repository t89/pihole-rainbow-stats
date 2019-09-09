#!/bin/bash

$SYSTEMDPATH="/etc/systemd/system"
SERVICE="pihole_rainbow_stats"
PYTHONPATH=$(which python3)

echo "Installation directory will be $PWD"

echo "Copying service file into $SYSTEMDPATH ..."
sudo cp $PWD/$SERVICE.service  $SYSTEMDPATH/$SERVICE.service

echo "Editing service file ..."
# Replacing the placeholders {directory} & {python3} with the
# path of the current working directory / the python3 path
sed -i "s|{directory}|$PWD|g" $SYSTEMDPATH/$SERVICE.service
sed -i "s|{python3}|$PYTHONPATH|g" $SYSTEMDPATH/$SERVICE.service

echo "Restarting Systemd daemon..."
sudo systemctl daemon-reload

echo "Script has successfully created a systemd service."
