#!/usr/bin/env bash
vagrant destroy --force
rm -rf .vagrant
rm -rf tmp/*
touch tmp/.gitignore
