Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCdfQ-0004GS-Pp
 for ath10k@lists.infradead.org; Thu, 22 Aug 2013 22:47:50 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so2428608pbb.19
 for <ath10k@lists.infradead.org>; Thu, 22 Aug 2013 15:47:24 -0700 (PDT)
From: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>
Subject: [PATCH] ath10k: enable Atheros 802.11ac driver
Date: Thu, 22 Aug 2013 15:47:15 -0700
Message-Id: <1377211635-29100-1-git-send-email-mcgrof@qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: openwrt-devel@lists.openwrt.org
Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>, Mathieu Olivari <mathieu@qca.qualcomm.com>, Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, Jerome Proffit <jproffit@qca.qualcomm.com>, "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, Sujith Manoharan <c_manoha@qca.qualcomm.com>, Kathy Giori <kgiori@qca.qualcomm.com>

From: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>

This enables usage of the ath10k driver on OpenWrt. Only 2.0 PCI hardware
is supported. The ath10k firmware is currently only available
through github so use that as its source for now.

This goes build tested, not run time tested.

Cc: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Kathy Giori <kgiori@qca.qualcomm.com>
Cc: Mathieu Olivari <mathieu@qca.qualcomm.com>
Cc: Jerome Proffit <jproffit@qca.qualcomm.com>
Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>
Cc: Matthew McClintock <mmcclint@qca.qualcomm.com>
Signed-off-by: Luis R. Rodriguez <mcgrof@qca.qualcomm.com>
---
 package/kernel/mac80211/Makefile |   52 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 51 insertions(+), 1 deletion(-)

diff --git a/package/kernel/mac80211/Makefile b/package/kernel/mac80211/Makefile
index 5bef361..65c7eb3 100644
--- a/package/kernel/mac80211/Makefile
+++ b/package/kernel/mac80211/Makefile
@@ -27,7 +27,7 @@ PKG_DRIVERS = \
 	rt2x00-lib rt2x00-pci rt2x00-usb rt2x00-soc rt2800-lib rt2400-pci \
 	rt2500-pci rt2500-usb rt61-pci rt73-usb rt2800-pci rt2800-usb \
 	rtl8180 rtl8187 zd1211rw mac80211-hwsim carl9170 b43 b43legacy \
-	ath9k-common ath9k ath9k-htc ath net-libipw net-ipw2100 net-ipw2200 \
+	ath9k-common ath9k ath9k-htc ath10k ath net-libipw net-ipw2100 net-ipw2200 \
 	mwl8k net-hermes net-hermes-pci net-hermes-plx net-hermes-pcmcia \
 	iwl-legacy iwl3945 iwl4965 iwlagn wl12xx lib80211 \
 	rtlwifi rtlwifi-pci rtlwifi-usb rtl8192c-common rtl8192ce rtl8192se \
@@ -125,6 +125,24 @@ define Download/linux-firmware
 endef
 $(eval $(call Download,linux-firmware))
 
+PKG_ATH10K_LINUX_FIRMWARE_NAME:=ath10k-firmware
+PKG_ATH10K_LINUX_FIRMWARE_VERSION:=9374d42c01bd84487855af9f9bffc622c50e7331
+PKG_ATH10K_LINUX_FIRMWARE_SOURCE:=$(PKG_ATH10K_LINUX_FIRMWARE_NAME)-$(PKG_ATH10K_LINUX_FIRMWARE_VERSION).tar.bz2
+PKG_ATH10K_LINUX_FIRMWARE_PROTO:=git
+PKG_ATH10K_LINUX_FIRMWARE_SOURCE_URL:=https://github.com/kvalo/ath10k-firmware.git
+PKG_ATH10K_LINUX_FIRMWARE_SUBDIR:=$(PKG_ATH10K_LINUX_FIRMWARE_NAME)-$(PKG_ATH10K_LINUX_FIRMWARE_VERSION)
+#PKG_ATH10K_LINUX_FIRMWARE_MIRROR_MD5SUM:=?
+
+define Download/ath10k-firmware
+  FILE:=$(PKG_ATH10K_LINUX_FIRMWARE_SOURCE)
+  URL:=$(PKG_ATH10K_LINUX_FIRMWARE_SOURCE_URL)
+  PROTO:=$(PKG_ATH10K_LINUX_FIRMWARE_PROTO)
+  VERSION:=$(PKG_ATH10K_LINUX_FIRMWARE_VERSION)
+  SUBDIR:=$(PKG_ATH10K_LINUX_FIRMWARE_SUBDIR)
+  #MIRROR_MD5SUM:=$(PKG_ATH10K_LINUX_FIRMWARE_MIRROR_MD5SUM)
+endef
+$(eval $(call Download,ath10k-firmware))
+
 # Prism54 drivers
 P54PCIFW:=2.13.12.0.arm
 P54USBFW:=2.13.24.0.lm87.arm
@@ -566,6 +584,23 @@ This module adds support for wireless adapters based on
 Atheros USB AR9271 and AR7010 family of chipsets.
 endef
 
+define KernelPackage/ath10k
+  $(call KernelPackage/mac80211/Default)
+  TITLE:=Atheros 802.11ac wireless cards support
+  URL:=http://wireless.kernel.org/en/users/Drivers/ath10k
+  DEPENDS+= @PCI_SUPPORT +kmod-ath
+  FILES:= \
+	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath10k/ath10k_core.ko \
+	$(PKG_BUILD_DIR)/drivers/net/wireless/ath/ath10k/ath10k_pci.ko
+  AUTOLOAD:=$(call AutoLoad,55,ath10k)
+endef
+
+define KernelPackage/ath10k/description
+This module adds support for wireless adapters based on
+Atheros IEEE 802.11ac family of chipsets. For now only
+PCI is supported.
+endef
+
 define KernelPackage/carl9170
   $(call KernelPackage/mac80211/Default)
   TITLE:=Driver for Atheros AR9170 USB sticks
@@ -1314,6 +1349,7 @@ config-$(CONFIG_PCI) += ATH9K_PCI
 config-$(CONFIG_ATH_USER_REGD) += ATH_USER_REGD
 
 config-$(call config_package,ath9k-htc) += ATH9K_HTC
+config-$(call config_package,ath10k) += ATH10K ATH10K_PCI ATH10K_DEBUG ATH10K_DEBUGFS
 
 config-$(call config_package,ath5k) += ATH5K
 ifdef CONFIG_TARGET_atheros
@@ -1437,6 +1473,7 @@ define Build/Prepare
 	$(TAR) -C $(PKG_BUILD_DIR) -xzf $(DL_DIR)/$(IPW2200_NAME)-$(IPW2200_VERSION).tgz
 	$(TAR) -C $(PKG_BUILD_DIR) -xjf $(DL_DIR)/$(ZD1211FW_NAME)-$(ZD1211FW_VERSION).tar.bz2
 	$(TAR) -C $(PKG_BUILD_DIR) -xjf $(DL_DIR)/$(PKG_LINUX_FIRMWARE_SOURCE)
+	$(TAR) -C $(PKG_BUILD_DIR) -xjf $(DL_DIR)/$(PKG_ATH10K_LINUX_FIRMWARE_SOURCE)
 	rm -rf \
 		$(PKG_BUILD_DIR)/include/linux/ssb \
 		$(PKG_BUILD_DIR)/include/linux/bcma \
@@ -1576,6 +1613,18 @@ define KernelPackage/ath9k-htc/install
 		$(1)/lib/firmware/
 endef
 
+define KernelPackage/ath10k/install
+	$(INSTALL_DIR) $(1)/lib/firmware
+	$(INSTALL_DIR) $(1)/lib/firmware/ath10k
+	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA988X
+	$(INSTALL_DIR) $(1)/lib/firmware/ath10k/QCA988X/hw2.0
+	$(INSTALL_DATA) \
+		$(PKG_BUILD_DIR)/$(PKG_ATH10K_LINUX_FIRMWARE_SUBDIR)/ath10k/QCA988X/hw2.0/board.bin \
+		$(PKG_BUILD_DIR)/$(PKG_ATH10K_LINUX_FIRMWARE_SUBDIR)/ath10k/QCA988X/hw2.0/firmware.bin \
+		$(PKG_BUILD_DIR)/$(PKG_ATH10K_LINUX_FIRMWARE_SUBDIR)/ath10k/QCA988X/hw2.0/otp.bin \
+		$(1)/lib/firmware/ath10k/QCA988X/hw2.0/
+endef
+
 define KernelPackage/mwl8k/install
 	$(INSTALL_DIR) $(1)/lib/firmware/mwl8k
 	$(INSTALL_DATA) \
@@ -1736,6 +1785,7 @@ $(eval $(call KernelPackage,mac80211-hwsim))
 $(eval $(call KernelPackage,ath9k-common))
 $(eval $(call KernelPackage,ath9k))
 $(eval $(call KernelPackage,ath9k-htc))
+$(eval $(call KernelPackage,ath10k))
 $(eval $(call KernelPackage,ath))
 $(eval $(call KernelPackage,carl9170))
 $(eval $(call KernelPackage,b43))
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
