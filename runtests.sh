#!/bin/sh

MODULES=${1:-last_seen}

coverage run --branch ./manage.py test $MODULES || exit 2
coverage report --include="./last_seen/*" --omit="./*/migrations/*"
coverage html --include="./last_seen/*" --omit="./*/migrations/*"
