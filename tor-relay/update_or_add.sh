#!/bin/sh

# $1 key
# $2 default
# $3 value
TORRC=/etc/tor/torrc.custom
KEY="$1"
if [ -z "$3" ]; then
  VALUE="$2" # default
else
  VALUE="$3"
fi

# Avoid if no value, useful to set values only if provided
if [ ! -z "$VALUE" ]; then
  FINDINFILE=$(grep -e "^$KEY.*$" $TORRC)

  echo "Adding $KEY $VALUE to Torrc"

  # Append if missing.
  # Update if exist.
  if [ -z "$FINDINFILE" ]; then
    echo "$KEY $VALUE" >> $TORRC
  else
    sed -i "s/^$KEY.*/$KEY $VALUE/g" $TORRC
  fi
fi
