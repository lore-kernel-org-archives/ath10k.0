Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0930BC64EC3
	for <ath10k@archiver.kernel.org>; Thu,  2 Feb 2023 04:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nERe01ifS68GVvWdwvBieYz7PJfKn2PsbVmbjwLnro=; b=OLUVzNE8sN3W1Z
	i2LodcxuVuBDiYy351/FRPTPJfTVPU46u11Mn22BoOexzD2dJzJQLdFmnYwIS+NkYFXuN1Dx226rr
	LAoNV8o8xeA5A0k1q5NYkOU8/U3gAo999zaFoT7OI/Ksc/YTh65+IUJVvyf1c9Mj+olgiAAlzkzE+
	IWplkdH1bnkX4f8i84zYZOp24smu4xkk6QlgX3F6wmaEwofZrTQ7Z8JDgggA2w1eCV/ihtBiD+6WX
	gGG9mnJsAnUstZMMwCqyS2oK1WvU3aU4ZxycsFQXb4Zun+iC362q5Fz9+unXQv+AfQOuucwIwSByo
	/ATD6abjB0FROS8WO/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNR3r-00EKAn-AT; Thu, 02 Feb 2023 04:18:59 +0000
Received: from smtp161.vfemail.net ([146.59.185.161])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNR3o-00EK9k-17
	for ath10k@lists.infradead.org; Thu, 02 Feb 2023 04:18:57 +0000
Received: (qmail 25602 invoked from network); 2 Feb 2023 04:18:54 +0000
Received: from localhost (HELO nl101-3.vfemail.net) ()
  by smtpout.vfemail.net with ESMTPS (ECDHE-RSA-AES256-GCM-SHA384 encrypted); 2 Feb 2023 04:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=openmail.cc; h=from:to:cc
	:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding; s=2018; bh=5++uKMkLCve5jTVZX8gVWMl0e
	hGz1zxkv3KHxYhVhMA=; b=R4oydFL61bj9/ha9QGLwz6xcvYnnTdJejG4ekZEBH
	JUL0hd1lpNGmubVDVMNt6PXXo2Rs647OCYtwR24BBwdObhEJBSWC7crH0Zpvf4xg
	dzzeBsyzy/lUkm9P1v6vkC48BauN7nUM/fyK0dZaHWaebWAS2oRCi3c/Z+K82Xy5
	xE=
Received: (qmail 74987 invoked from network); 2 Feb 2023 04:18:53 -0000
Received: by simscan 1.4.0 ppid: 74492, pid: 74978, t: 1.2109s
         scanners:none
Received: from unknown (HELO bmwxMDEudmZlbWFpbC5uZXQ=) (ZXF1dUBvcGVubWFpbC5jYw==@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 2 Feb 2023 04:18:52 -0000
From: equu@openmail.cc
To: lpieralisi@kernel.org,
	toke@toke.dk,
	kvalo@kernel.org
Cc: linux-pci@vger.kernel.org,
	robh@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	equu@openmail.cc
Subject: [PATCH v2 2/3] wifi: ath9k: stop loading incompatible DT cal data
Date: Thu,  2 Feb 2023 12:18:22 +0800
Message-Id: <20230202041823.2879262-3-equu@openmail.cc>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230202041823.2879262-1-equu@openmail.cc>
References: <ab8ff515-19ec-fe3f-0237-c30275e9744d@openmail.cc>
 <20230202041823.2879262-1-equu@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_201856_402257_1F6010EA 
X-CRM114-Status: GOOD (  16.24  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Edward Chow <equu@openmail.cc>

As reported in https://github.com/openwrt/openwrt/pull/11345 , ath9k
would load calibration data from a device tree node declared
incompatible.

Now, ath9k will first check whether the device tree node is compatible
with it, using the functionality introduced with the first patch of
this series, ("PCI: of: Match pci devices or drivers against OF DT
nodes") and only proceed loading calibration data from compatible node.

Signed-off-by: Edward Chow <equu@openmail.cc>
---
 drivers/net/wireless/ath/ath9k/ath9k.h |  1 +
 drivers/net/wireless/ath/ath9k/init.c  | 26 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath9k/pci.c   |  2 +-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath9k/ath9k.h b/drivers/net/wireless/ath/ath9k/ath9k.h
index 2cc23605c9fc..4f6f0383a5f8 100644
--- a/drivers/net/wireless/ath/ath9k/ath9k.h
+++ b/drivers/net/wireless/ath/ath9k/ath9k.h
@@ -35,6 +35,7 @@ struct ath_node;
 struct ath_vif;
 
 extern struct ieee80211_ops ath9k_ops;
+extern struct pci_driver ath_pci_driver;
 extern int ath9k_modparam_nohwcrypt;
 extern int ath9k_led_blink;
 extern bool is_ath9k_unloaded;
diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
index 4f00400c7ffb..f88a48e8456b 100644
--- a/drivers/net/wireless/ath/ath9k/init.c
+++ b/drivers/net/wireless/ath/ath9k/init.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
+#include <linux/pci.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/relay.h>
 #include <linux/dmi.h>
@@ -577,6 +578,31 @@ static int ath9k_nvmem_request_eeprom(struct ath_softc *sc)
 	size_t len;
 	int err;
 
+	/* devm_nvmem_cell_get() will get a cell first from the OF
+	 * DT node representing the given device with nvmem-cell-name
+	 * "calibration", and from the global lookup table as a fallback,
+	 * and an ath9k device could be either a pci one or a platform one.
+	 *
+	 * If the OF DT node is not compatible with the real device, the
+	 * calibration data got from the node should not be applied.
+	 *
+	 * dev_is_pci(sc->dev) && ( no OF node || caldata not from node
+	 * || not compatible ) -> do not use caldata .
+	 *
+	 * !dev_is_pci(sc->dev) -> always use caldata .
+	 */
+	if (dev_is_pci(sc->dev) &&
+	    (!sc->dev->of_node ||
+	     !of_property_match_string(sc->dev->of_node,
+				       "nvmem-cell-names",
+				       "calibration") ||
+	     !of_pci_node_match_driver(sc->dev->of_node,
+				       &ath_pci_driver)))
+		/* follow the "just return 0;" convention as
+		 * noted below.
+		 */
+		return 0;
+
 	cell = devm_nvmem_cell_get(sc->dev, "calibration");
 	if (IS_ERR(cell)) {
 		err = PTR_ERR(cell);
diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
index a074e23013c5..fcb19761e60d 100644
--- a/drivers/net/wireless/ath/ath9k/pci.c
+++ b/drivers/net/wireless/ath/ath9k/pci.c
@@ -1074,7 +1074,7 @@ static SIMPLE_DEV_PM_OPS(ath9k_pm_ops, ath_pci_suspend, ath_pci_resume);
 
 MODULE_DEVICE_TABLE(pci, ath_pci_id_table);
 
-static struct pci_driver ath_pci_driver = {
+struct pci_driver ath_pci_driver = {
 	.name       = "ath9k",
 	.id_table   = ath_pci_id_table,
 	.probe      = ath_pci_probe,
-- 
2.39.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
