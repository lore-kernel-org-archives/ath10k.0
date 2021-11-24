Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD5CC433EF
	for <ath10k@archiver.kernel.org>; Wed, 24 Nov 2021 13:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SFsm6OxbvlolSPq+Tsc+d0tGoB7B7iEyHv9qlPvT+44=; b=dW+cszjEAziYZi
	N6G3C5dsMoPFeyjMpp31xyY0r84C0CRx49adziKmv7ezuF7sdLdru9dbglrrOF4sP1iyfh/bSacyq
	iG3CQq9rA54IE7pBWMG9XNCcQSypYByufkRMHmt/MtaSyNpSETDm4NrYuz/2MS2OLYFBPmq61X9xI
	CJtmEabgZMheL7NHsYwaNj4tgApuw+spueIew6CbxMos13yv7l0Ft5b+Mc/v0wDVQHUoaRjDmV+2r
	Y+FmCaMwr+wQKBREnpyn7HuDjlGwbvzpefRcmrl1vsrT1MikyJ5q4yZnqFQKoOPyJqJBAkaZP/D0c
	Pdq99eDdCFy6JhhJAvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mps3e-004pXA-NN; Wed, 24 Nov 2021 13:11:30 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mps3Z-004pVq-Qa
 for ath10k@lists.infradead.org; Wed, 24 Nov 2021 13:11:29 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:e573:ff9b:725:6f6b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2E835812A2;
 Wed, 24 Nov 2021 14:11:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637759483;
 bh=pvE9ogzQNqGhHkwS6ssMiCv7c3mA6R8LTIYSlH47Uig=;
 h=From:To:Cc:Subject:Date:From;
 b=u992Zdo84qzBKJH5ru0QbcvuGOZ2k0LmMKk3//QH7Qr+r4i9adOQJioiZhEFqOoip
 /cx4bcbq9QOEE6HE0wuvDNHJeZFsLo8WNjhUC3BIW7J9F4v2uXdajIiim4H+c3lGNY
 PEpRgF+6QEJRNq48mrMI9B4KdNyqxwoYX+bgWT1IrOnUbWTMSoBhwr9TZrgnddD8U6
 i6iYV/6y3XCSoxI6MVNrvkxYB3PcaxM2odAaK7z4Qv+lvjzqD5b21r/iwZ2mud5rS4
 DJX4t91PoCESvw9dsVzRtaZAk6MulPLuRbysX5WbXq4Cm/i//q9us7AIWirTgpOJPa
 W9CWDyrThUeLg==
From: Fabio Estevam <festevam@denx.de>
To: kvalo@codeaurora.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] ath10k: Fix the MTU size on QCA9377 SDIO
Date: Wed, 24 Nov 2021 10:10:47 -0300
Message-Id: <20211124131047.713756-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_051126_636357_3C8D7485 
X-CRM114-Status: GOOD (  20.17  )
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

On an imx6dl-pico-pi board with a QCA9377 SDIO chip, simply trying to
connect via ssh to another machine causes:

[   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
[   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12

, leading to an ssh connection failure.

One user inspected the size of frames on Wireshark and reported
the followig:

"I was able to narrow the issue down to the mtu. If I set the mtu for
the wlan0 device to 1486 instead of 1500, the issue does not happen.

The size of frames that I see on Wireshark is exactly 1500 after
setting it to 1486."

Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
the ssh command works successfully after that.

Introduce a 'credit_size_workaround' field to ath10k_hw_params for
the QCA9377 SDIO, so that the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE
is not set in this case.

Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.

Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Set the credit_size_workaround field as true for QCA9377 SDIO.

 drivers/net/wireless/ath/ath10k/core.c | 4 +++-
 drivers/net/wireless/ath/ath10k/hw.h   | 3 +++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 72a366aa9f60..8a325ae97b0e 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -571,6 +571,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.ast_skid_limit = 0x10,
 		.num_wds_entries = 0x20,
 		.uart_pin_workaround = true,
+		.credit_size_workaround = true,
 		.dynamic_sar_support = false,
 	},
 	{
@@ -715,6 +716,7 @@ static void ath10k_send_suspend_complete(struct ath10k *ar)
 
 static int ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
 {
+	bool mtu_workaround = ar->hw_params.credit_size_workaround;
 	int ret;
 	u32 param = 0;
 
@@ -732,7 +734,7 @@ static int ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
 
 	param |= HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
 
-	if (mode == ATH10K_FIRMWARE_MODE_NORMAL)
+	if (mode == ATH10K_FIRMWARE_MODE_NORMAL && !mtu_workaround)
 		param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
 	else
 		param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 6b03c7787e36..591ef7416b61 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -618,6 +618,9 @@ struct ath10k_hw_params {
 	 */
 	bool uart_pin_workaround;
 
+	/* Workaround for the credit size calculation */
+	bool credit_size_workaround;
+
 	/* tx stats support over pktlog */
 	bool tx_stats_over_pktlog;
 
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
