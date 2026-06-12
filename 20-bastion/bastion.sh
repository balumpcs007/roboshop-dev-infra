#!/bin/bash

sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf makecache
sudo dnf install -y terraform