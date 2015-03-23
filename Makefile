#
# Makefile for RTL8723BS
#

CONFIG_MP_INCLUDED = y
CONFIG_POWER_SAVING = y
CONFIG_HW_PWRP_DETECTION = n
CONFIG_WIFI_TEST = n
CONFIG_BT_COEXIST = y
CONFIG_WAPI_SUPPORT = n
CONFIG_EXT_CLK = n
CONFIG_TRAFFIC_PROTECT = y
CONFIG_LOAD_PHY_PARA_FROM_FILE = n
CONFIG_CALIBRATE_TX_POWER_BY_REGULATORY = n
CONFIG_CALIBRATE_TX_POWER_TO_MAX = n
CONFIG_ODM_ADAPTIVITY = n
CONFIG_SKIP_SIGNAL_SCALE_MAPPING = n
CONFIG_WOWLAN = n
CONFIG_GPIO_WAKEUP = n
CONFIG_PNO_SUPPORT = n
CONFIG_PNO_SET_DEBUG = n
CONFIG_AP_WOWLAN = n
CONFIG_RTW_SDIO_PM_KEEP_POWER = y

ccflags-y += -Wno-unused-variable
ccflags-y += -Wno-unused-value
ccflags-y += -Wno-unused-label
ccflags-y += -Wno-unused-parameter
ccflags-y += -Wno-unused-function
ccflags-y += -Wno-unused
ccflags-y += -I$(src)/include
ccflags-y += -I$(src)/hal
ccflags-y += -DCONFIG_RTL8723B
ccflags-y += -DCONFIG_LITTLE_ENDIAN
ccflags-y += -DCONFIG_IOCTL_CFG80211
ccflags-y += -DRTW_USE_CFG80211_STA_EVENT
ccflags-$(CONFIG_MP_INCLUDED) += -DCONFIG_MP_INCLUDED
ccflags-$(CONFIG_POWER_SAVING) += -DCONFIG_POWER_SAVING
ccflags-$(CONFIG_HW_PWRP_DETECTION) += -DCONFIG_HW_PWRP_DETECTION
ccflags-$(CONFIG_WIFI_TEST) += -DCONFIG_WIFI_TEST
ccflags-$(CONFIG_BT_COEXIST) += -DCONFIG_BT_COEXIST
ccflags-$(CONFIG_WAPI_SUPPORT) += -DCONFIG_WAPI_SUPPORT
ccflags-$(CONFIG_EXT_CLK) += -DCONFIG_EXT_CLK
ccflags-$(CONFIG_TRAFFIC_PROTECT) += -DCONFIG_TRAFFIC_PROTECT
ccflags-$(CONFIG_LOAD_PHY_PARA_FROM_FILE) += -DCONFIG_LOAD_PHY_PARA_FROM_FILE
ccflags-$(CONFIG_CALIBRATE_TX_POWER_BY_REGULATORY) += -DCONFIG_CALIBRATE_TX_POWER_BY_REGULATORY
ccflags-$(CONFIG_CALIBRATE_TX_POWER_TO_MAX) += -DCONFIG_CALIBRATE_TX_POWER_TO_MAX
ccflags-$(CONFIG_ODM_ADAPTIVITY) += -DCONFIG_ODM_ADAPTIVITY
ccflags-$(CONFIG_SKIP_SIGNAL_SCALE_MAPPING) += -DCONFIG_SKIP_SIGNAL_SCALE_MAPPING
ccflags-$(CONFIG_WOWLAN) += -DCONFIG_WOWLAN -DCONFIG_RTW_SDIO_PM_KEEP_POWER
ccflags-$(CONFIG_AP_WOWLAN) += -DCONFIG_AP_WOWLAN -DCONFIG_RTW_SDIO_PM_KEEP_POWER
ccflags-$(CONFIG_PNO_SUPPORT) += -DCONFIG_PNO_SUPPORT
ccflags-$(CONFIG_PNO_SET_DEBUG) += -DCONFIG_PNO_SET_DEBUG
ccflags-$(CONFIG_GPIO_WAKEUP) += -DCONFIG_GPIO_WAKEUP
ccflags-$(CONFIG_RTW_SDIO_PM_KEEP_POWER) += -DCONFIG_RTW_SDIO_PM_KEEP_POWER

ifneq ($(KERNELRELEASE),)

obj-m += r8723bs.o

r8723bs-y += \
	core/rtw_cmd.o \
	core/rtw_security.o \
	core/rtw_debug.o \
	core/rtw_io.o \
	core/rtw_ioctl_query.o \
	core/rtw_ioctl_set.o \
	core/rtw_ieee80211.o \
	core/rtw_mlme.o \
	core/rtw_mlme_ext.o \
	core/rtw_wlan_util.o \
	core/rtw_vht.o \
	core/rtw_pwrctrl.o \
	core/rtw_rf.o \
	core/rtw_recv.o \
	core/rtw_sta_mgt.o \
	core/rtw_ap.o \
	core/rtw_xmit.o	\
	core/rtw_p2p.o \
	core/rtw_tdls.o \
	core/rtw_br_ext.o \
	core/rtw_iol.o \
	core/rtw_sreset.o \
	core/rtw_btcoex.o \
	core/rtw_beamforming.o \
	core/rtw_odm.o \
	core/rtw_efuse.o
r8723bs-$(CONFIG_WAPI_SUPPORT) += \
	core/rtw_wapi.o	\
	core/rtw_wapi_sms4.o
r8723bs-$(CONFIG_MP_INCLUDED) += \
	core/rtw_bt_mp.o \
	core/rtw_mp.o \
	core/rtw_mp_ioctl.o

r8723bs-y += \
	os_dep/osdep_service.o \
	os_dep/os_intfs.o \
	os_dep/sdio_intf.o \
	os_dep/sdio_ops_linux.o \
	os_dep/ioctl_linux.o \
	os_dep/xmit_linux.o \
	os_dep/mlme_linux.o \
	os_dep/recv_linux.o \
	os_dep/ioctl_cfg80211.o \
	os_dep/wifi_regd.o \
	os_dep/rtw_proc.o \
	os_dep/custom_gpio_linux.o \
	os_dep/sdio_ops_linux.o

r8723bs-y +=	\
	hal/hal_intf.o \
	hal/hal_com.o \
	hal/hal_com_phycfg.o \
	hal/hal_phy.o \
	hal/hal_btcoex.o \
	hal/hal_sdio.o \
	hal/hal_sdio_led.o \
	hal/HalPwrSeqCmd.o \
	hal/Hal8723BPwrSeq.o\
	hal/rtl8723b_sreset.o \
	hal/rtl8723b_hal_init.o \
	hal/rtl8723b_phycfg.o \
	hal/rtl8723b_rf6052.o \
	hal/rtl8723b_dm.o \
	hal/rtl8723b_rxdesc.o \
	hal/rtl8723b_cmd.o \
	hal/sdio_halinit.o \
	hal/rtl8723bs_led.o \
	hal/rtl8723bs_xmit.o \
	hal/rtl8723bs_recv.o \
	hal/sdio_ops.o
r8723bs-$(CONFIG_MP_INCLUDED) += \
	hal/rtl8723b_mp.o

r8723bs-y += \
	hal/odm_debug.o	\
	hal/odm_AntDiv.o\
	hal/odm_interface.o\
	hal/odm_HWConfig.o\
	hal/odm.o\
	hal/HalPhyRf.o\
	hal/odm_EdcaTurboCheck.o\
	hal/odm_DIG.o\
	hal/odm_PathDiv.o\
	hal/odm_DynamicBBPowerSaving.o\
	hal/odm_DynamicTxPower.o\
	hal/odm_CfoTracking.o\
	hal/odm_NoiseMonitor.o \
	hal/HalHWImg8723B_BB.o\
	hal/HalHWImg8723B_MAC.o\
	hal/HalHWImg8723B_RF.o\
	hal/HalHWImg8723B_FW.o\
	hal/HalHWImg8723B_MP.o\
	hal/odm_RegConfig8723B.o\
	hal/HalPhyRf_8723B.o\
	hal/odm_RTL8723B.o
r8723bs-$(CONFIG_BT_COEXIST) += \
	hal/HalBtc8723b1Ant.o \
	hal/HalBtc8723b2Ant.o

else

KDIR ?= /lib/modules/$(uname -r)/build

modules:
	$(MAKE) -C $(KDIR) M=$$PWD modules

clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

modules_install:
	$(MAKE) -C $(KDIR) M=$$PWD INSTALL_MOD_PATH=$(INSTALL_MOD_PATH) modules_install

install: modules_install

endif

