# Rockchip's alexa c++ sdk
# Author : Nyx Zheng <zyh@rock-chips.com>

ifeq ($(BR2_PACKAGE_ALEXACLIENTSDK),y)
ALEXACLIENTSDK_SITE = $(TOPDIR)/../external/alexaClientSDK
ALEXACLIENTSDK_SITE_METHOD = local
ALEXACLIENTSDK_INSTALL_STAGING = YES
ALEXACLIENTSDK_SUPPORTS_IN_SOURCE_BUILD = NO

ALEXACLIENTSDK_DEPENDENCIES = libcurl libnghttp2  gst1-plugins-base gst1-plugins-ugly gst1-plugins-good gst1-plugins-bad gst1-libav portaudio wpa_supplicant
ALEXACLIENTSDK_BIN_DIR = $(TARGET_DIR)/usr/bin/

ALEXACLIENTSDK_CONF_OPTS +=\
						   ../avs-device-sdk \
						   -DCMAKE_CXX_FLAGS:STRING="-D_GLIBCXX_USE_CXX11_ABI=0" \
						   -DCMAKE_BUILD_TYPE=DEBUG \
						   -DGSTREAMER_MEDIA_PLAYER=ON \
						   -DEXECUTABLE_OUTPUT_PATH=$(ALEXACLIENTSDK_BIN_DIR) 

ALEXACLIENTSDK_CONF_OPTS +=\
						   -DKITTAI_KEY_WORD_DETECTOR=ON \
						   -DKITTAI_KEY_WORD_DETECTOR_LIB_PATH=$(ALEXACLIENTSDK_SRCDIR)snowboy/lib/libsnowboy-detect.a \
						   -DKITTAI_KEY_WORD_DETECTOR_INCLUDE_DIR=$(ALEXACLIENTSDK_SRCDIR)snowboy/include/ 

ALEXACLIENTSDK_CONF_OPTS +=\
						   -DPORTAUDIO=ON \
						   -DPORTAUDIO_LIB_PATH=$(TARGET_DIR)/usr/lib/libportaudio.so \
						   -DPORTAUDIO_INCLUDE_DIR=$(HOST_DIR)/usr/aarch64-rockchip-linux-gnu/sysroot/usr/include/ 

$(eval $(cmake-package))
endif
