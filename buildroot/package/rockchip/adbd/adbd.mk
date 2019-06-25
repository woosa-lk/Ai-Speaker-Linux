# Rockchip's adbd porting for Linux
# Author : Cody Xie <cody.xie@rock-chips.com>

define ADBD_INSTALL_TARGET_CMDS
$(INSTALL) -D package/rockchip/adbd/adbd \
		$(TARGET_DIR)/usr/bin/adbd
endef

$(eval $(generic-package))
