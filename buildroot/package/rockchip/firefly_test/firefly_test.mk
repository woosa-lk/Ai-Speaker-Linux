# Firefly Test
# Author : Firefly <service@t-firefly.com>

define FIREFLY_TEST_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 package/rockchip/firefly_test/rsacheck \
		$(TARGET_DIR)/usr/bin/rsacheck
$(INSTALL) -D -m 0755 package/rockchip/firefly_test/rsacheck_init \
		$(TARGET_DIR)/usr/bin/rsacheck_init
$(INSTALL) -D package/rockchip/firefly_test/rsa_public_key.pem \
        $(TARGET_DIR)/usr/lib/rsa_public_key.pem
$(INSTALL) -D package/rockchip/firefly_test/S97_firefly_test.sh \
        $(TARGET_DIR)/etc/init.d/S97_firefly_test.sh
endef

$(eval $(generic-package))
