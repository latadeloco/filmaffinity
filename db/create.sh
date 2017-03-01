#!/bin/sh

SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
psql -U filmaffinity filmaffinity < $DIR/filmaffinity.sql
