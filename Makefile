# Initial Makefile to compile the Rumble project
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

include Makefile.inc

# This top-level Makefile can *not* be executed in parallel
.NOTPARALLEL:

.PHONY: all build config clean distclean help

all:


build:


config:
	@echo "Cloning repositories"
	@git clone -b $(YOCTO_BRANCH) $(YOCTO_GIT) $(YOCTO_DIR)
	@git clone -b $(META_RASP_PI_BRANCH) $(META_RASP_PI_GIT) $(META_RASP_DIR)
	@git clone -b $(META_OE_BRANCH) $(META_OE_GIT) $(META_OE_DIR)
	@echo "Create output download and build directories"
	@mkdir -p $(OUT_DIR) $(BUILD_DIR) $(DOWNLOAD_DIR)
	@echo "Download directory link"
	@ln -s $(DOWNLOAD_DIR) $(BUILD_DIR)/downloads


clean:


distclean:
	@ echo "Removing directories."
	@rm -rf $(YOCTO_DIR) $(OUT_DIR) $(BUILD_DIR) $(DOWNLOAD_DIR)


help:
