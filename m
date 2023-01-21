Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62901C27C76
	for <ath10k@archiver.kernel.org>; Sat, 21 Jan 2023 10:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/nERe01ifS68GVvWdwvBieYz7PJfKn2PsbVmbjwLnro=; b=nwGu8O2xbBiES0
	/SvYs+/taDHhKfzNxuGTC/u4mNWcw1lrAg1OikmRrhTIjki3rl+7Yxpg1QCIJ8jKH0C+If/AhnAUn
	B6xjvwrBQvslRj2v5GBkoKbjvrplwC7xcLf6QTeuY4panf767P4Rd6fwq4YYI2xoxJFuHCzEoSZat
	G959sLwMqt/IxvBhZk/Q8UX/1tETu9lBptXYkU2CvH348KbIsYtNjPZCPyHMW1kAvZEAGFY637Wdm
	DxPFgS3nCHGunqDXM/F3cIuo3JgtbkWb1iqmj5gzXwNQMjSnSYXM1NUwkjW7+Rgc3Vfb+8O4ceXcu
	cof/FsUlusl24R7UiOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJAjt-00DgFd-Cy; Sat, 21 Jan 2023 10:04:45 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJAjq-00DgF7-6v
	for ath10k@lists.infradead.org; Sat, 21 Jan 2023 10:04:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qx13so19533769ejb.13
        for <ath10k@lists.infradead.org>; Sat, 21 Jan 2023 02:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFsFRg5RfveDHrVd5rP7zwnXWjQK+oYVFSSoe+tPeXw=;
        b=Jj7Dy3+LLiPdBvAlYJp3+zJIodOkOFiksEI2pP/I6babOKOr+gv4y5L7N3VJqmBEoi
         vQoeZvtPojAtqhRc2JTn1Iz6wHkDzUmGlW97AA9D69aCDJC0cei67YUL9wOm3abggcmS
         zipZFdO6v3962PvVf01trernDsiGneXNgOYOfW19I04BCEZVE+GJeDRIq8U9S0DH5UyW
         acjUBGuooGgvTfp26uPTLf699XJfVTat8x9AvCODtjgezfU9wazkWXX9zKQbOrGf0lIe
         BYzOQsXbS1yyOFz5zx3pxqTg86tKdF0K4ff/KtDYaCZdKP8zL6aii8wI9mGvjEwYKvks
         OwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFsFRg5RfveDHrVd5rP7zwnXWjQK+oYVFSSoe+tPeXw=;
        b=oXuv9/afL5p9uaYXoND0T2oqPojJHJ8SPNX2mFtGuDb7XKw8XFU/7jfK4WznfROpIi
         +k/MZFAcc6RuJ19rEoON6jWVee94/Ho6WvOzrT1B6hZjNp8srpAoBt0idf8uj0AO9LDZ
         skNaiySxRFdsFKBBScEqUPl2ox0ce/FKuixuNL1Vc6rqPxcq1cr0idwHZRHN/MoaDanO
         mWe2r+9WhBM/t+uJZGTlJ2I/g0Mhc9JT++6TWjUkOPtdR+DhMkjfcCq8NtVxY+LAt3DM
         wDJvvPMkjvRvYzTCm/gMHh5IuKa9tsmmZNMmcUjkL4NsVJy5Qk73F+7il26S+cMSvW71
         Sc2g==
X-Gm-Message-State: AFqh2kofdmllNrCmZSuWpK0U3ks9vqpOe1lKFkQMTc4AgPOdfYNsNB/a
	T14FLBLQQu76an8HCC6FXvizQToPM0Q=
X-Google-Smtp-Source: AMrXdXsBi+GE/siU9cL+3WOKY7qtamXDMRh7RT8xax/vg8C7zX2vxKrmKrcKgL4RFLvccYLYvHKi9w==
X-Received: by 2002:a17:906:ddb:b0:7b2:757a:1411 with SMTP id p27-20020a1709060ddb00b007b2757a1411mr28388788eji.9.1674295478807;
        Sat, 21 Jan 2023 02:04:38 -0800 (PST)
Received: from [0.0.0.0] (tor-exit-46.for-privacy.net. [2a0b:f4c2:2::46])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090676d200b00857c2c29553sm14854715ejn.197.2023.01.21.02.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 02:04:38 -0800 (PST)
From: persmule@gmail.com
X-Google-Original-From: equu@openmail.cc
To: lpieralisi@kernel.org,
	toke@toke.dk,
	kvalo@kernel.org
Cc: linux-pci@vger.kernel.org,
	robh@kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	equu@openmail.cc
Subject: [PATCH 2/3] wifi: ath9k: stop loading incompatible DT cal data
Date: Sat, 21 Jan 2023 18:00:43 +0800
Message-Id: <20230121100043.1497633-1-equu@openmail.cc>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
References: <ea4e2fed-383d-829d-8a2a-9239768ccd94@openmail.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_020442_314725_B84BD6E2 
X-CRM114-Status: GOOD (  17.80  )
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
