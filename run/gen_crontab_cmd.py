#! /usr/bin/env python
#coding=utf-8

import os
import argparse

path_current_file = os.path.abspath(__file__)
path_current_dir = os.path.split(path_current_file)[0]
path_parent_dir = os.path.split(path_current_dir)[0]

def gen_cmds(minutes):
    s = "*/%s * * * * %s/run/auto-data.sh >> %s/logs-auto-data.log  2>&1 &" % (minutes, path_parent_dir, path_parent_dir)
    return s


def parser_args():
    parser = argparse.ArgumentParser("Run backup command every X minutes. \
        \n\nThis script will generate a crontab command for you, just run and append the result to your crontab list.\n")
    parser.add_argument("minutes", type=int, default=15, help="Every X minutes, default: 15")
    args = parser.parse_args()
    return args

if __name__ == '__main__':
    minutes = parser_args().minutes
    valid = [minutes >= 1, minutes <= 59]

    if not all(valid):
        raise ValueError("Minutes must be >=1 and <=59")

    crontab_command = gen_cmds(minutes)
    print('\nCopy and paste the command below to your crontab editor:\n')
    print(crontab_command)
    print('\n')
