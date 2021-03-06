
#
# Copyright (C) 2009 Brice DUBOST
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#
# !!!! This is a generated file !!!! 
#

DVB_MENU:=DVB support

#
# General section
#

define KernelPackage/dvb-core
  SUBMENU:=$(DVB_MENU)
  TITLE:=DVB core support
  DEPENDS:=@LINUX_2_6 +kmod-i2c-core
  KCONFIG:= \
	CONFIG_MEDIA_SUPPORT \
	CONFIG_DVB_CORE \
	CONFIG_DVB_CAPTURE_DRIVERS=y \
	CONFIG_MEDIA_TUNER_CUSTOMIZE=y \
	CONFIG_DVB_FE_CUSTOMISE=y \
	CONFIG_DVB_DYNAMIC_MINORS=n \
	CONFIG_CRC32 
  FILES:=$(LINUX_DIR)/drivers/media/dvb/dvb-core/dvb-core.$(LINUX_KMOD_SUFFIX)
  AUTOLOAD:=$(call AutoLoad,50,dvb-core)
endef

define KernelPackage/dvb-core/description
 Kernel module for DVB support
endef

$(eval $(call KernelPackage,dvb-core))

define KernelPackage/dvb-usb
  SUBMENU:=$(DVB_MENU)
  TITLE:=DVB USB Support
  DEPENDS:=@USB_SUPPORT +kmod-dvb-core +kmod-usb-core
  KCONFIG:= \
	CONFIG_DVB_USB \
	CONFIG_INPUT=y
  FILES:=$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb.$(LINUX_KMOD_SUFFIX)
#  AUTOLOAD:=$(call AutoLoad,55,dvb-usb)
endef

define KernelPackage/dvb-usb/description
 Kernel module for DVB USB devices. Note you have to select at least a device.
endef

$(eval $(call KernelPackage,dvb-usb))

#
# Devices section
#


define KernelPackage/dvb-usb-a800
  SUBMENU:=$(DVB_MENU)
  TITLE:=AVerMedia AverTV DVB-T USB 2.0 
  KCONFIG:= CONFIG_DVB_USB_A800 \
	CONFIG_DVB_DIB3000MC \
	CONFIG_DVB_PLL \
	CONFIG_MEDIA_TUNER_MT2060
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-a800.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-a800/description
 Say Y here to support the AVerMedia AverTV DVB-T USB 2.0 .
The following modules will be compiled for this device :  dvb-usb-dibusb-common dvb-usb-a800 dib3000mc dibx000_common dvb-pll mt2060
You have to put the firmware files in the download dir : dvb-usb-avertv-a800-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_A800_FW_0:=dvb-usb-avertv-a800-02.fw

define KernelPackage/dvb-usb-a800/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_A800_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-a800))

define KernelPackage/dvb-usb-dibusb-mb
  SUBMENU:=$(DVB_MENU)
  TITLE:=DiBcom USB DVB-T devices  
  KCONFIG:= CONFIG_DVB_USB_DIBUSB_MB \
	CONFIG_DVB_PLL \
	CONFIG_DVB_DIB3000MB \
	CONFIG_MEDIA_TUNER_MT2060
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-mb.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mb.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dibusb-mb/description
 Say Y here to support the DiBcom USB DVB-T devices  .
The following modules will be compiled for this device :  dvb-usb-dibusb-common dvb-usb-dibusb-mb dvb-pll dib3000mb mt2060
You have to put the firmware files in the download dir : dvb-usb-dibusb-5.0.0.11.fw dvb-usb-dibusb-an2235-01.fw dvb-usb-adstech-usb2-02.fw dvb-usb-dibusb-6.0.0.8.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DIBUSB_MB_FW_0:=dvb-usb-dibusb-5.0.0.11.fw
DVB_USB_DIBUSB_MB_FW_1:=dvb-usb-dibusb-an2235-01.fw
DVB_USB_DIBUSB_MB_FW_2:=dvb-usb-adstech-usb2-02.fw
DVB_USB_DIBUSB_MB_FW_3:=dvb-usb-dibusb-6.0.0.8.fw

define KernelPackage/dvb-usb-dibusb-mb/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIBUSB_MB_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIBUSB_MB_FW_1) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIBUSB_MB_FW_2) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIBUSB_MB_FW_3) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-mb))

define KernelPackage/dvb-usb-dibusb-mc
  SUBMENU:=$(DVB_MENU)
  TITLE:=DiBcom USB DVB-T devices  
  KCONFIG:= CONFIG_DVB_USB_DIBUSB_MC \
	CONFIG_DVB_DIB3000MC \
	CONFIG_MEDIA_TUNER_MT2060
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dibusb-mc/description
 Say Y here to support the DiBcom USB DVB-T devices  .
The following modules will be compiled for this device :  dvb-usb-dibusb-common dvb-usb-dibusb-mc dib3000mc dibx000_common mt2060
You have to put the firmware files in the download dir : dvb-usb-dibusb-6.0.0.8.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DIBUSB_MC_FW_0:=dvb-usb-dibusb-6.0.0.8.fw

define KernelPackage/dvb-usb-dibusb-mc/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIBUSB_MC_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-mc))

define KernelPackage/dvb-usb-dib0700
  SUBMENU:=$(DVB_MENU)
  TITLE:=DiBcom DiB0700 USB DVB devices 
  KCONFIG:= CONFIG_DVB_USB_DIB0700 \
	CONFIG_DVB_DIB7000P \
	CONFIG_DVB_DIB7000M \
	CONFIG_DVB_DIB3000MC \
	CONFIG_DVB_S5H1411 \
	CONFIG_DVB_LGDT3305 \
	CONFIG_DVB_TUNER_DIB0070 \
	CONFIG_MEDIA_TUNER_MT2060 \
	CONFIG_MEDIA_TUNER_MT2266 \
	CONFIG_MEDIA_TUNER_XC2028 \
	CONFIG_MEDIA_TUNER_XC5000 \
	CONFIG_MEDIA_TUNER_MXL5007T
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dib0700.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib7000p.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib7000m.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/s5h1411.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/lgdt3305.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib0070.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2266.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tuner-xc2028.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/xc5000.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5007t.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dib0700/description
 Say Y here to support the DiBcom DiB0700 USB DVB devices .
The following modules will be compiled for this device :  dvb-usb-dib0700 dib7000p dibx000_common dib7000m dibx000_common dib3000mc dibx000_common s5h1411 lgdt3305 dib0070 mt2060 mt2266 tuner-xc2028 xc5000 mxl5007t
You have to put the firmware files in the download dir : dvb-usb-dib0700-1.20.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DIB0700_FW_0:=dvb-usb-dib0700-1.20.fw

define KernelPackage/dvb-usb-dib0700/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIB0700_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-dib0700))

define KernelPackage/dvb-usb-umt-010
  SUBMENU:=$(DVB_MENU)
  TITLE:=HanfTek UMT-010 DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_UMT_010 \
	CONFIG_DVB_PLL \
	CONFIG_DVB_DIB3000MC \
	CONFIG_MEDIA_TUNER_MT2060 \
	CONFIG_DVB_MT352
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-umt-010.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/mt352.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-umt-010/description
 Say Y here to support the HanfTek UMT-010 DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-dibusb-common dvb-usb-umt-010 dvb-pll dib3000mc dibx000_common mt2060 mt352
You have to put the firmware files in the download dir : dvb-usb-umt-010-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_UMT_010_FW_0:=dvb-usb-umt-010-02.fw

define KernelPackage/dvb-usb-umt-010/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_UMT_010_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-umt-010))

define KernelPackage/dvb-usb-cxusb
  SUBMENU:=$(DVB_MENU)
  TITLE:=Conexant USB2.0 hybrid reference design 
  KCONFIG:= CONFIG_DVB_USB_CXUSB \
	CONFIG_DVB_PLL \
	CONFIG_DVB_CX22702 \
	CONFIG_DVB_LGDT330X \
	CONFIG_DVB_MT352 \
	CONFIG_DVB_ZL10353 \
	CONFIG_DVB_DIB7000P \
	CONFIG_DVB_LGS8GL5 \
	CONFIG_DVB_TUNER_DIB0070 \
	CONFIG_MEDIA_TUNER_SIMPLE \
	CONFIG_MEDIA_TUNER_XC2028 \
	CONFIG_MEDIA_TUNER_MXL5005S
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-cxusb.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/cx22702.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/lgdt330x.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/mt352.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib7000p.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/lgs8gl5.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib0070.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tuner-simple.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tuner-types.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tuner-xc2028.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5005s.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-cxusb/description
 Say Y here to support the Conexant USB2.0 hybrid reference design .
The following modules will be compiled for this device :  dvb-usb-cxusb dvb-pll cx22702 lgdt330x mt352 zl10353 dib7000p dibx000_common lgs8gl5 dib0070 tuner-simple tuner-types tuner-xc2028 mxl5005s
You have to put the firmware files in the download dir : dvb-usb-bluebird-01.fw dvb-usb-bluebird-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_CXUSB_FW_0:=dvb-usb-bluebird-01.fw
DVB_USB_CXUSB_FW_1:=dvb-usb-bluebird-02.fw

define KernelPackage/dvb-usb-cxusb/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_CXUSB_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_CXUSB_FW_1) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-cxusb))

define KernelPackage/dvb-usb-m920x
  SUBMENU:=$(DVB_MENU)
  TITLE:=Uli m920x DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_M920X \
	CONFIG_DVB_MT352 \
	CONFIG_DVB_TDA1004X \
	CONFIG_MEDIA_TUNER_QT1010 \
	CONFIG_MEDIA_TUNER_TDA827X
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-m920x.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/mt352.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/tda1004x.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tda827x.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-m920x/description
 Say Y here to support the Uli m920x DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-m920x mt352 tda1004x qt1010 tda827x
You have to put the firmware files in the download dir : dvb-usb-megasky-02.fw dvb-usb-digivox-02.fw dvb-usb-tvwalkert.fw dvb-usb-dposh-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_M920X_FW_0:=dvb-usb-megasky-02.fw
DVB_USB_M920X_FW_1:=dvb-usb-digivox-02.fw
DVB_USB_M920X_FW_2:=dvb-usb-tvwalkert.fw
DVB_USB_M920X_FW_3:=dvb-usb-dposh-01.fw

define KernelPackage/dvb-usb-m920x/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_M920X_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_M920X_FW_1) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_M920X_FW_2) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_M920X_FW_3) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-m920x))

define KernelPackage/dvb-usb-gl861
  SUBMENU:=$(DVB_MENU)
  TITLE:=Genesys Logic GL861 USB2.0 
  KCONFIG:= CONFIG_DVB_USB_GL861 \
	CONFIG_DVB_ZL10353 \
	CONFIG_MEDIA_TUNER_QT1010
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-gl861.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-gl861/description
 Say Y here to support the Genesys Logic GL861 USB2.0 .
The following modules will be compiled for this device :  dvb-usb-gl861 zl10353 qt1010

endef



$(eval $(call KernelPackage,dvb-usb-gl861))

define KernelPackage/dvb-usb-au6610
  SUBMENU:=$(DVB_MENU)
  TITLE:=Alcor Micro AU6610 USB2.0 
  KCONFIG:= CONFIG_DVB_USB_AU6610 \
	CONFIG_DVB_ZL10353 \
	CONFIG_MEDIA_TUNER_QT1010
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-au6610.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-au6610/description
 Say Y here to support the Alcor Micro AU6610 USB2.0 .
The following modules will be compiled for this device :  dvb-usb-au6610 zl10353 qt1010

endef



$(eval $(call KernelPackage,dvb-usb-au6610))

define KernelPackage/dvb-usb-digitv
  SUBMENU:=$(DVB_MENU)
  TITLE:=Nebula Electronics uDigiTV DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_DIGITV \
	CONFIG_DVB_PLL \
	CONFIG_DVB_NXT6000 \
	CONFIG_DVB_MT352
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-digitv.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/nxt6000.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/mt352.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-digitv/description
 Say Y here to support the Nebula Electronics uDigiTV DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-digitv dvb-pll nxt6000 mt352
You have to put the firmware files in the download dir : dvb-usb-digitv-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DIGITV_FW_0:=dvb-usb-digitv-02.fw

define KernelPackage/dvb-usb-digitv/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DIGITV_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-digitv))

define KernelPackage/dvb-usb-vp7045
  SUBMENU:=$(DVB_MENU)
  TITLE:=TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle
  KCONFIG:= CONFIG_DVB_USB_VP7045
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-vp7045.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-vp7045/description
 Say Y here to support the TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle.
The following modules will be compiled for this device :  dvb-usb-vp7045
You have to put the firmware files in the download dir : dvb-usb-vp7045-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_VP7045_FW_0:=dvb-usb-vp7045-01.fw

define KernelPackage/dvb-usb-vp7045/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_VP7045_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-vp7045))

define KernelPackage/dvb-usb-vp702x
  SUBMENU:=$(DVB_MENU)
  TITLE:=TwinhanDTV StarBox and clones DVB-S USB2.0 
  KCONFIG:= CONFIG_DVB_USB_VP702X
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-vp702x.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-vp702x/description
 Say Y here to support the TwinhanDTV StarBox and clones DVB-S USB2.0 .
The following modules will be compiled for this device :  dvb-usb-vp702x
You have to put the firmware files in the download dir : dvb-usb-vp702x-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_VP702X_FW_0:=dvb-usb-vp702x-02.fw

define KernelPackage/dvb-usb-vp702x/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_VP702X_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-vp702x))

define KernelPackage/dvb-usb-gp8psk
  SUBMENU:=$(DVB_MENU)
  TITLE:=GENPIX 8PSK->USB module 
  KCONFIG:= CONFIG_DVB_USB_GP8PSK
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-gp8psk.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-gp8psk/description
 Say Y here to support the GENPIX 8PSK->USB module .
The following modules will be compiled for this device :  dvb-usb-gp8psk
You have to put the firmware files in the download dir : dvb-usb-gp8psk-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_GP8PSK_FW_0:=dvb-usb-gp8psk-01.fw

define KernelPackage/dvb-usb-gp8psk/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_GP8PSK_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-gp8psk))

define KernelPackage/dvb-usb-nova-t-usb2
  SUBMENU:=$(DVB_MENU)
  TITLE:=Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_NOVA_T_USB2 \
	CONFIG_DVB_DIB3000MC \
	CONFIG_DVB_PLL \
	CONFIG_MEDIA_TUNER_MT2060
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dibusb-common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-nova-t-usb2.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dib3000mc.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dibx000_common.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-nova-t-usb2/description
 Say Y here to support the Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-dibusb-common dvb-usb-nova-t-usb2 dib3000mc dibx000_common dvb-pll mt2060
You have to put the firmware files in the download dir : dvb-usb-nova-t-usb2-02.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_NOVA_T_USB2_FW_0:=dvb-usb-nova-t-usb2-02.fw

define KernelPackage/dvb-usb-nova-t-usb2/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_NOVA_T_USB2_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-nova-t-usb2))

define KernelPackage/dvb-usb-ttusb2
  SUBMENU:=$(DVB_MENU)
  TITLE:=Pinnacle 400e DVB-S USB2.0 
  KCONFIG:= CONFIG_DVB_USB_TTUSB2 \
	CONFIG_DVB_TDA10086 \
	CONFIG_DVB_LNBP21 \
	CONFIG_DVB_TDA826X
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-ttusb2.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/tda10086.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/lnbp21.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/tda826x.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-ttusb2/description
 Say Y here to support the Pinnacle 400e DVB-S USB2.0 .
The following modules will be compiled for this device :  dvb-usb-ttusb2 tda10086 lnbp21 tda826x
You have to put the firmware files in the download dir : dvb-usb-pctv-400e-01.fw dvb-usb-tt-s2400-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_TTUSB2_FW_0:=dvb-usb-pctv-400e-01.fw
DVB_USB_TTUSB2_FW_1:=dvb-usb-tt-s2400-01.fw

define KernelPackage/dvb-usb-ttusb2/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_TTUSB2_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_TTUSB2_FW_1) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-ttusb2))

define KernelPackage/dvb-usb-dtt200u
  SUBMENU:=$(DVB_MENU)
  TITLE:=WideView WT-200U and WT-220U  DVB-T USB2.0  
  KCONFIG:= CONFIG_DVB_USB_DTT200U
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dtt200u.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dtt200u/description
 Say Y here to support the WideView WT-200U and WT-220U  DVB-T USB2.0  .
The following modules will be compiled for this device :  dvb-usb-dtt200u
You have to put the firmware files in the download dir : dvb-usb-dtt200u-01.fw dvb-usb-wt220u-02.fw dvb-usb-wt220u-fc03.fw dvb-usb-wt220u-zl0353-01.fw dvb-usb-wt220u-miglia-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DTT200U_FW_0:=dvb-usb-dtt200u-01.fw
DVB_USB_DTT200U_FW_1:=dvb-usb-wt220u-02.fw
DVB_USB_DTT200U_FW_2:=dvb-usb-wt220u-fc03.fw
DVB_USB_DTT200U_FW_3:=dvb-usb-wt220u-zl0353-01.fw
DVB_USB_DTT200U_FW_4:=dvb-usb-wt220u-miglia-01.fw

define KernelPackage/dvb-usb-dtt200u/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DTT200U_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DTT200U_FW_1) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DTT200U_FW_2) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DTT200U_FW_3) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DTT200U_FW_4) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-dtt200u))

define KernelPackage/dvb-usb-opera1
  SUBMENU:=$(DVB_MENU)
  TITLE:=Opera1 DVB-S USB2.0 receiver
  KCONFIG:= CONFIG_DVB_USB_OPERA1 \
	CONFIG_DVB_STV0299 \
	CONFIG_DVB_PLL
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-opera.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/stv0299.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-opera1/description
 Say Y here to support the Opera1 DVB-S USB2.0 receiver.
The following modules will be compiled for this device :  dvb-usb-opera stv0299 dvb-pll
You have to put the firmware files in the download dir : dvb-usb-opera-01.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_OPERA1_FW_0:=dvb-usb-opera-01.fw

define KernelPackage/dvb-usb-opera1/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_OPERA1_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-opera1))

define KernelPackage/dvb-usb-af9005
  SUBMENU:=$(DVB_MENU)
  TITLE:=Afatech AF9005 DVB-T USB1.1 
  KCONFIG:= CONFIG_DVB_USB_AF9005 \
	CONFIG_MEDIA_TUNER_MT2060 \
	CONFIG_MEDIA_TUNER_QT1010
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-af9005.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-af9005-remote.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-af9005/description
 Say Y here to support the Afatech AF9005 DVB-T USB1.1 .
The following modules will be compiled for this device :  dvb-usb-af9005 dvb-usb-af9005-remote mt2060 qt1010
You have to put the firmware files in the download dir : af9005.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_AF9005_FW_0:=af9005.fw

define KernelPackage/dvb-usb-af9005/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_AF9005_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-af9005))

define KernelPackage/dvb-usb-af9005-remote
  SUBMENU:=$(DVB_MENU)
  TITLE:=Afatech AF9005 default remote control 
  KCONFIG:= CONFIG_DVB_USB_AF9005_REMOTE
  DEPENDS:=+kmod-dvb-usb-af9005
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-af9005-remote.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-af9005-remote/description
 Say Y here to support the Afatech AF9005 default remote control .
The following modules will be compiled for this device :  dvb-usb-af9005-remote

endef



$(eval $(call KernelPackage,dvb-usb-af9005-remote))

define KernelPackage/dvb-usb-dw2102
  SUBMENU:=$(DVB_MENU)
  TITLE:=DvbWorld DVB-S/S2 USB2.0 
  KCONFIG:= CONFIG_DVB_USB_DW2102 \
	CONFIG_DVB_PLL \
	CONFIG_DVB_STV0299 \
	CONFIG_DVB_STV0288 \
	CONFIG_DVB_STB6000 \
	CONFIG_DVB_CX24116 \
	CONFIG_DVB_SI21XX \
	CONFIG_DVB_TDA10021
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dw2102.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/stv0299.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/stv0288.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/stb6000.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/cx24116.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/si21xx.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/tda10021.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dw2102/description
 Say Y here to support the DvbWorld DVB-S/S2 USB2.0 .
The following modules will be compiled for this device :  dvb-usb-dw2102 dvb-pll stv0299 stv0288 stb6000 cx24116 si21xx tda10021
You have to put the firmware files in the download dir : dvb-usb-dw2102.fw dvb-usb-dw2104.fw dvb-usb-dw3101.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_DW2102_FW_0:=dvb-usb-dw2102.fw
DVB_USB_DW2102_FW_1:=dvb-usb-dw2104.fw
DVB_USB_DW2102_FW_2:=dvb-usb-dw3101.fw

define KernelPackage/dvb-usb-dw2102/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DW2102_FW_0) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DW2102_FW_1) $(1)/lib/firmware/
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_DW2102_FW_2) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-dw2102))

define KernelPackage/dvb-usb-cinergy-t2
  SUBMENU:=$(DVB_MENU)
  TITLE:=Terratec CinergyT2/qanu USB 2.0 DVB-T receiver
  KCONFIG:= CONFIG_DVB_USB_CINERGY_T2
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-cinergyT2.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-cinergy-t2/description
 Say Y here to support the Terratec CinergyT2/qanu USB 2.0 DVB-T receiver.
The following modules will be compiled for this device :  dvb-usb-cinergyT2

endef



$(eval $(call KernelPackage,dvb-usb-cinergy-t2))

define KernelPackage/dvb-usb-anysee
  SUBMENU:=$(DVB_MENU)
  TITLE:=Anysee DVB-T/C USB2.0 
  KCONFIG:= CONFIG_DVB_USB_ANYSEE \
	CONFIG_DVB_PLL \
	CONFIG_DVB_MT352 \
	CONFIG_DVB_ZL10353 \
	CONFIG_DVB_TDA10023
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-anysee.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/mt352.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/tda10023.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-anysee/description
 Say Y here to support the Anysee DVB-T/C USB2.0 .
The following modules will be compiled for this device :  dvb-usb-anysee dvb-pll mt352 zl10353 tda10023

endef



$(eval $(call KernelPackage,dvb-usb-anysee))

define KernelPackage/dvb-usb-dtv5100
  SUBMENU:=$(DVB_MENU)
  TITLE:=AME DTV-5100 USB2.0 DVB-T 
  KCONFIG:= CONFIG_DVB_USB_DTV5100 \
	CONFIG_DVB_ZL10353 \
	CONFIG_MEDIA_TUNER_QT1010
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-dtv5100.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-dtv5100/description
 Say Y here to support the AME DTV-5100 USB2.0 DVB-T .
The following modules will be compiled for this device :  dvb-usb-dtv5100 zl10353 qt1010

endef



$(eval $(call KernelPackage,dvb-usb-dtv5100))

define KernelPackage/dvb-usb-af9015
  SUBMENU:=$(DVB_MENU)
  TITLE:=Afatech AF9015 DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_AF9015 \
	CONFIG_DVB_AF9013 \
	CONFIG_DVB_PLL \
	CONFIG_MEDIA_TUNER_MT2060 \
	CONFIG_MEDIA_TUNER_QT1010 \
	CONFIG_MEDIA_TUNER_TDA18271 \
	CONFIG_MEDIA_TUNER_MXL5005S \
	CONFIG_MEDIA_TUNER_MC44S803
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-af9015.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/af9013.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/dvb-pll.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mt2060.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/qt1010.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/tda18271.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5005s.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mc44s803.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-af9015/description
 Say Y here to support the Afatech AF9015 DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-af9015 af9013 dvb-pll mt2060 qt1010 tda18271 mxl5005s mc44s803
You have to put the firmware files in the download dir : dvb-usb-af9015.fw
They can be found in the package http://packages.ubuntu.com/jaunty/linux-firmware .
endef

DVB_USB_AF9015_FW_0:=dvb-usb-af9015.fw

define KernelPackage/dvb-usb-af9015/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(DL_DIR)/$(DVB_USB_AF9015_FW_0) $(1)/lib/firmware/
endef

$(eval $(call KernelPackage,dvb-usb-af9015))

define KernelPackage/dvb-usb-ce6230
  SUBMENU:=$(DVB_MENU)
  TITLE:=Intel CE6230 DVB-T USB2.0 
  KCONFIG:= CONFIG_DVB_USB_CE6230 \
	CONFIG_DVB_ZL10353 \
	CONFIG_MEDIA_TUNER_MXL5005S
  DEPENDS:=+kmod-dvb-usb
  FILES:= $(LINUX_DIR)/drivers/media/dvb/dvb-usb/dvb-usb-ce6230.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/dvb/frontends/zl10353.$(LINUX_KMOD_SUFFIX) \
	$(LINUX_DIR)/drivers/media/common/tuners/mxl5005s.$(LINUX_KMOD_SUFFIX)
endef

define KernelPackage/dvb-usb-ce6230/description
 Say Y here to support the Intel CE6230 DVB-T USB2.0 .
The following modules will be compiled for this device :  dvb-usb-ce6230 zl10353 mxl5005s

endef



$(eval $(call KernelPackage,dvb-usb-ce6230))
