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

.PHONY: all build config devshell clean distclean help

all: build


build:
	@$(ECHO) $(CC_GREEN) "Construct $(BB_RECIPE)" $(CC_NORMAL)
	@$(SCRIPTS_DIR)/build_script.sh $(YOCTO_DIR) $(BUILD_DIR) build $(BB_RECIPE)

config:
	@$(ECHO) $(CC_GREEN) "Cloning repositories" $(CC_NORMAL)
	@git clone -b $(YOCTO_BRANCH) $(YOCTO_GIT) $(YOCTO_DIR)
	@git clone -b $(META_RASP_PI_BRANCH) $(META_RASP_PI_GIT) $(META_RASP_DIR)
	@git clone -b $(META_OE_BRANCH) $(META_OE_GIT) $(META_OE_DIR)
	@$(ECHO) $(CC_GREEN) "Create output download and build directories" $(CC_NORMAL)
	@mkdir -p $(OUT_DIR) $(BUILD_DIR) $(DOWNLOAD_DIR)
	@$(ECHO) $(CC_GREEN) "Source the yocto env" $(CC_NORMAL)
	@cd $(YOCTO_DIR); $(SHELL) $(YOCTO_ENV_SCRIPT) build
	@$(ECHO) $(CC_GREEN) "Download directory link" $(CC_NORMAL)
	@ln -s $(DOWNLOAD_DIR) $(BUILD_DIR)/downloads
	@$(ECHO) $(CC_GREEN) "Copy configuration files" $(CC_NORMAL)
	@cp $(CONFIG_FILES_DIR)/bblayers.conf $(BUILD_DIR)/conf/bblayers.conf
	@cp $(CONFIG_FILES_DIR)/local.conf $(BUILD_DIR)/conf/local.conf
	@sed -i s\|YOCTO_DIR\|$(ROOT_DIR)/$(YOCTO_DIR)\|g $(BUILD_DIR)/conf/bblayers.conf
	@sed -i s\|RUMBLEPI_DIR\|$(ROOT_DIR)\|g $(BUILD_DIR)/conf/bblayers.conf

devshell:
	@$(ECHO) $(CC_GREEN) "DevShell $(BB_RECIPE)" $(CC_NORMAL)
	@$(SCRIPTS_DIR)/build_script.sh $(YOCTO_DIR) $(BUILD_DIR) devshell $(BB_RECIPE)


clean:
	@$(ECHO) $(CC_GREEN) "Clean $(BB_RECIPE)" $(CC_NORMAL)
	@$(SCRIPTS_DIR)/build_script.sh $(YOCTO_DIR) $(BUILD_DIR) clean $(BB_RECIPE)

distclean:
	@$(ECHO) $(CC_GREEN) "Removing directories." $(CC_NORMAL)
	@rm -rf $(YOCTO_DIR) $(OUT_DIR) $(BUILD_DIR) $(DOWNLOAD_DIR)

help:
	@$(ECHO) $(CC_BLUE) "Rumble PI Project" $(CC_NORMAL)
	@$(ECHO) "Call one of the following targets to perform an action"
	@$(ECHO) $(CC_YELLOW) "config: " $(CC_NORMAL) "Configure the project, use the DOWNLOAD_DIR variable if you wish to specify a download dir"
	@$(ECHO) $(CC_YELLOW) "devshell: " $(CC_NORMAL) "Execute the devshell, use the BB_RECIPE variable to specify the wanted recipe"
	@$(ECHO) $(CC_YELLOW) "clean: " $(CC_NORMAL) "Clean the project"
	@$(ECHO) $(CC_YELLOW) "distclean: " $(CC_NORMAL) "Distclean the project"
	@$(ECHO) $(CC_YELLOW) "help: " $(CC_NORMAL) "Show this help"

