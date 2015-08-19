#!/bin/bash

GITIT_CONFIG_FILE=/data/gitit/my-gitit.conf
SUPERVISORD_CONFG_FILE=/data/gitit/supervisord.conf

if [ ! -f "$SUPERVISORD_CONFG_FILE" ]; then
    cp /data/gitit/sample.supervisord.conf $SUPERVISORD_CONFG_FILE
fi

if [ ! -f "$GITIT_CONFIG_FILE" ]; then
    cp /data/gitit/sample.gitit.conf $GITIT_CONFIG_FILE
fi

supervisord -c /data/gitit/supervisord.conf