#!/bin/bash
# Script to perform the yocto source of the env
# and perform different task depending on the input
# You can run the script by:
# build_script <yocto_dir> <build_dir> <target> <recipe>
# The inputs must be in the specified order:
# yocto_dir: Yocto directory
# build_dir: Build directory
# target: build | clean | devshell
# recipe: any recipe you want, if not specified, default image is created

# Put inputs in array

input_check()
{
   args=("$@")
   # Check number of parameter
   if [ 4 != $# ]; then
      echo "Wrong number of arguments"
      exit 1
   fi
   # Check yocto_dir exist and as the source file
   if [ ! -f "${args[0]}/oe-init-build-env" ]; then
      echo "Source file doesn't exits"
      exit 1
   fi
   # Check build_dir exist
   if [ ! -d ${args[1]} ]; then
      echo "Build dir doesn't exits"
      exit 1
   fi
   # Check posible targets
   if [ "build" != ${args[2]} ] && [ "clean" != ${args[2]} ] && [ "devshell" != ${args[2]} ]; then
      echo "Wrong target"
      exit 1
   fi
   # Recipe is not eval here
}

inputs=("$@")
input_check "$@"
# Source env script
source "${inputs[0]}/oe-init-build-env" ${inputs[1]}
if [ "build" == ${inputs[2]} ]; then
   bitbake ${inputs[3]}
elif [ "clean" == ${inputs[2]} ]; then
   bitbake -c clean ${inputs[3]}
elif [ "devshell" == ${inputs[2]} ]; then
   bitbake -c devshell ${inputs[3]}
fi

