# Makefile include to compile the Rumble project
# Copyright (c) 2015 "Allan Granados, allangj1618@gmail.com"

# Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in
#all copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#THE SOFTWARE.

# Internal of Rumble PI structure
ROOT_DIR		= $(shell pwd)
YOCTO_DIR		= yocto
BUILD_DIR		= $(YOCTO_DIR)/build
DOWNLOAD_DIR		= $(ROOT_DIR)/downloads
OUT_DIR			= images
META_RASP_DIR		= $(YOCTO_DIR)/meta-raspberry
META_OE_DIR		= $(YOCTO_DIR)/meta-openembedded
META_OE_OE_DIR		= $(META_OE_DIR)/meta-oe
META_OE_MULTIMEDIA	= $(META_OE_DIR)/meta-multimedia

# Meta layers URLS and branches/tags
# meta-raspberry depends on yocto master branch accordig summary
YOCTO_GIT 		= "git://git.yoctoproject.org/poky"
YOCTO_BRANCH		= "fido"

META_RASP_PI_GIT	= "git://git.yoctoproject.org/meta-raspberrypi"
META_RASP_PI_BRANCH	= "fido"

# meta-raspberry depends on openembedded master branch, layer meta-oe and meta-multimedia, accordig summary
META_OE_GIT		= "git://git.openembedded.org/meta-openembedded"
META_OE_BRANCH		= "fido"
