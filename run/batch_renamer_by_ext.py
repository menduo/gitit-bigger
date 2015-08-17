#! /usr/bin/env python
# coding=utf-8

"""
    Bath file ext renamer for https://github.com/shajiquan/gitit

    usage:
        ./batch_renamer_by_ext.py --d ./wikidata --f md --t page


    show help messages:
        ./batch_renamer_by_ext.py -h

    this script will execut git add & git commit & git push by default, if you do not need that, add the text value not eq 'True' to these args, for example:

        --add False --push False --commit False

    Full example:
        ./batch_renamer_by_ext.py --d ./wikidata --f md --t page --add False --push False --commit False

"""

import sys
import os
import argparse

files_count = 0

current_dir_path = os.path.split(os.path.abspath(__file__))[0]


def rename_file(file_path):
    file_path_new = "%s.%s" % (os.path.splitext(file_path)[0], target_ext)
    global files_count
    files_count += 1
    os.rename(file_path, file_path_new)

    if gitadd == "True":
        os.popen('git add %s' % file_path_new)

    return True


def rename_files_from_root_dir(dir_path):
    for root, dirs, files in os.walk(dir_path):
        files_paths = [os.path.join(root, i) for i in files if i.endswith('.%s' % source_ext) and "/.git/" not in i]
        if len(files_paths) > 0:
            map(rename_file, files_paths)

    if files_count > 0 and gitcommit == "True":
        commt_message = "auto message for rename file ext from '.%s' to '.%s'" % (source_ext, target_ext)
        cmd_commit = 'git commit -am "%s" ' % commt_message
        os.popen(cmd_commit)
        print("\n")
        print("Executed command %s " % cmd_commit)
        print("\n")
    return True


def parsed_args():
    current_dir_path = os.path.split(os.path.abspath(__file__))[0]

    parser = argparse.ArgumentParser(description='Rename files exts for https://github.com/shajiquan/gitit')
    parser.add_argument("--d", type=str, default=current_dir_path, help="Root dir path, abs path")
    parser.add_argument("--f", type=str, default="page", help="From ext, like txt")
    parser.add_argument("--t", type=str, default="md", help="To ext, like md")
    parser.add_argument("--add", type=str, default="True", help="Execute git add after files are renamed.")
    parser.add_argument("--commit", type=str, default="True", help="Execute git commit after files are renamed.")
    parser.add_argument("--push", type=str, default="True", help="Execute git push after files are renamed.")
    args = parser.parse_args()
    return args


if __name__ == '__main__':
    args = parsed_args()
    global source_ext
    source_ext = args.f
    global target_ext
    target_ext = args.t

    global gitadd
    gitadd = args.add

    global gitcommit
    gitcommit = args.commit

    global gitpush
    gitpush = args.push

    folder = args.d

    if folder:
        if not os.path.isabs(folder):
            folder = os.path.abspath(folder)

        joind_path = os.path.join(current_dir_path, folder)

        if not os.path.isdir(folder) or not os.path.isdir(joind_path):
            raise ValueError("No such file or directory: '%s' " % folder)

        current_dir_path = folder

    os.chdir(current_dir_path)

    rename_files_from_root_dir(current_dir_path)

    if gitpush == "True" and files_count > 0:
        os.popen("git push -f origin master")

    print("\n")
    print("Done. %s files endswith '.%s' has been renmaed to '.%s' ." % (files_count, source_ext, target_ext))
    print("The work dir for this script is: %s" % current_dir_path)
    print("\n")

    sys.exit(0)
