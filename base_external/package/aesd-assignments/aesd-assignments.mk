
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = '79f7e88213b7dd1463ca8012ce61347cef9f756d'
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = 'git@github.com:chchbuff/AESD_Final_Project.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/temp_sensor all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/spi_test all
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/pulse_sensor all
endef

# TODO add your temperature and heart rate sensor utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/temp_sensor/temp_app $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/spi_test/spidev_test $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/pulse_sensor/pulse_app $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
