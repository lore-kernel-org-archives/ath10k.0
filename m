Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5789A606A336
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IikWvDDC;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=zcou6bBc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=08dAqwjFraSeFcB1P1Hmj/Co5aFihYuNoiPOZEEnkkc=; b=IikWvDDChqU9Gn
	+AXPMziNSZ9qQkmjskl74mxXS9C5lDcz4Y0tmorNoIh7hf8WmKWifKEDvK7H93G0N6itMjaz/oN3l
	dkDSBwbskzf8MjDg2ggz1HuxRt9e7kfiSzfASn9H8aQJe5qwYyFyxzdA1eBQgTn9LW8MinG1GBTqI
	YG9ikLoFgTeia2hJn/qkehaYXa03Zklw7Ayi57oZpT5z601jL2eqQVXlX11n41knqslh1xzuv9UVX
	D78fm0RblJ7g1hbNcFDRkux4QCjGBT9+2cv5IhQ6ihd0eJHA5VW+Dc8DGCqdT+CjkS+IvUsFtcNDa
	DZBCrSGNv3FZ6aQfmKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kj-0000000Fcnv-1s0c;
	Sat, 14 Nov 2026 09:08:53 +0000
Received: from mxd-1-a3b.seznam.cz ([2a02:598:128:8a00::1000:a3b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS9kE-0000000Fcli-2x8W
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 09:08:52 +0000
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 5da1f9f7a3554b5d5d2f77ef;
	Sat, 14 Nov 2026 10:08:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647289; bh=08dAqwjFraSeFcB1P1Hmj/Co5aFihYuNoiPOZEEnkkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=zcou6bBczVHObU2qvRSvf+XiLYt9iMIBSytC5iWCeejqlPsa8LU+L/v6MCPiyzKBJ
	 VKPP4iHvWatblFfv+Mgi2C4NlyXt+qx3oO5wgJa/H4alqHbsJBi1Cv2f53bRBsgHxh
	 1huqCPks3pbvdm1EyxTfWQfZtNWg2LnuRJfBI33DVE343P8cFMKQ+VhfqZFr502t7B
	 spIf/Ac9nnPzEFZHLINi3I+GptnjTvy7ukbo0j1rn3dFtvXIyOpeVx+XwAN9OAfpDE
	 hAchqV8GjPoOAUAFD1CqsqvrnnyMcLiQ/1p8XLgvG/0ujaqX3izA7Mvn++eCJu1r2j
	 gteyIkmBqUegQ==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id d129b7ef-0abc-4681-95c1-101067508816;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 6/6] wifi: ath10k: usb: remove the experimental status
Date: Sat, 14 Nov 2026 10:07:37 +0100
Message-ID: <20261114090737.64348-7-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_010823_460911_B1D17262 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB support is functional now. A QCA9377 USB device can be probed,
started, stopped, unloaded and connected to a protected network, so
remove the warning that tells the user not to expect anything to work
and the experimental status from the Kconfig entry.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/Kconfig | 5 ++---
 drivers/net/wireless/ath/ath10k/usb.c   | 3 ---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
index efb9f022d8c6..a727cd73ec09 100644
--- a/drivers/net/wireless/ath/ath10k/Kconfig
+++ b/drivers/net/wireless/ath/ath10k/Kconfig
@@ -34,11 +34,10 @@ config ATH10K_SDIO
 	  This module adds support for SDIO/MMC bus.
 
 config ATH10K_USB
-	tristate "Atheros ath10k USB support (EXPERIMENTAL)"
+	tristate "Atheros ath10k USB support"
 	depends on ATH10K && USB
 	help
-	  This module adds experimental support for USB bus. Currently
-	  work in progress and will not fully work.
+	  This module adds support for USB bus.
 
 config ATH10K_SNOC
 	tristate "Qualcomm ath10k SNOC support"
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index 9804ea0ffacb..e23d87c84069 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1081,9 +1081,6 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 		goto err_usb_destroy;
 	}
 
-	/* TODO: remove this once USB support is fully implemented */
-	ath10k_warn(ar, "Warning: ath10k USB support is incomplete, don't expect anything to work!\n");
-
 	return 0;
 
 err_usb_destroy:
-- 
2.43.0


