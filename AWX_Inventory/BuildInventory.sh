#!/bin/bash
####################################################################
#
# This script is for building Anisble Inventory from AWX Inventory
# so that AD-HOC commands can be run via CLI.
#
# Created by: J.Lickey
#
####################################################################
/usr/bin/tower-cli host list --all-pages | grep -v "\="| awk '{print $2}' | sed '/^name/d' > /usr/local/ansible/inventory && sleep 30
