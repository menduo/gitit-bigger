#! /usr/bin/env python
#coding=utf-8

import os

path_current_file = os.path.abspath(__file__)
path_current_dir = os.path.split(path_current_file)[0]
path_parent_dir = os.path.split(path_current_dir)[0]

s = "* * * * * %s/run/auto-data.sh > %s/logs-auto-data.log  2>&1 &" % (path_parent_dir, path_parent_dir)

print(s)