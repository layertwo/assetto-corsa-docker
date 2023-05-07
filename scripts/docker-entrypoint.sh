#!/bin/sh

export INSTALL_PATH="/steamapps/${AC_FOLDER}"

install-all.sh

cd $INSTALL_PATH
./acServer
