#!/bin/sh

sudo -u postgres dropuser filmaffinity
sudo -u postgres dropdb filmaffinity
sudo -u postgres psql -c "create user filmaffinity password 'filmaffinity' superuser;"
sudo -u postgres createdb -O filmaffinity filmaffinity
