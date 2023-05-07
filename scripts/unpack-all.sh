#!/bin/sh

if [ -f /opt/steamcmd/steamcmd.tar.gz ]; then
  echo ">>> Installing steamcmd"
  cd /opt/steamcmd
  tar xzf steamcmd.tar.gz
  rm steamcmd.tar.gz
fi
