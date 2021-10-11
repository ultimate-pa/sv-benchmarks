#!/usr/bin/python3

# This file is part of the SV-Benchmarks collection of verification tasks:
# https://github.com/sosy-lab/sv-benchmarks
#
# SPDX-FileCopyrightText: 2021 The SV-Benchmarks Community
#
# SPDX-License-Identifier: Apache-2.0

import glob
import os
import subprocess
import sys
import yaml

CMDLINE = ["javac", "-source", "1.8", "-Werror"]

if len(sys.argv) > 2:
    sys.exit("Unexpected command-line arguments! Only optional directory expected.")

if len(sys.argv) > 1:
    base_dir = sys.argv[1]
    if not os.path.isdir(base_dir):
        sys.exit(f"Parameter '{base_dir}' is not a directory.")
else:
    base_dir = "."

ERRORS = 0

for task_file in glob.iglob(os.path.join(base_dir, "**/*.yml"), recursive=True):

    with open(task_file) as f:
        task_def = yaml.safe_load(f)

    task_dir = glob.escape(os.path.dirname(task_file))
    java_files = [
        java_file
        for input_path in task_def["input_files"]
        for java_file in glob.glob(
            os.path.join(task_dir, glob.escape(input_path), "**/*.java"), recursive=True
        )
    ]

    print("Compiling", len(java_files), "Java files from", task_file)
    javac = subprocess.run(CMDLINE + java_files)
    if javac.returncode:
        ERRORS += 1
        print("==> ERROR! Compilation failed!\n")

print()

if ERRORS:
    sys.exit(f"{ERRORS} compilation error(s), check output above!")
else:
    print("Everything compiles!")
