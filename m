Return-Path: <SRS0=MUiD=OF=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A60C433EF
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 16:05:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2ACC861186
	for <ath10k@archiver.kernel.org>; Wed, 15 Sep 2021 16:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2ACC861186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UekKUcq+Gu/LUm9I4Naub5M3r4tB//E8wboP/RDguvI=; b=DtDoJQQ/jhGs+q
	HKWIGGuu3nmEVu6YN4HIPzCtmcmy0S0fM9jt3X8LPDgiLSl7Qh6oeWFSKVQavYyHaFiAhjDfuPTib
	w7wn91kK302mSPqQ6kcudQWI69i5RvKPtSfwomsYr3HrE6q3ifnmjtTmjhl0f26nfEp2tjErSpDHm
	smlErjE8Iy8cipoKfnVAF8nTcsQ4nF6HRsJMw8gcld/8zuPkd4ag76Weg6nrYQmO5GNzqksYH2sAy
	/KEnYf/W/aPJUOlq9CMeDMnDABR9P3heptR1gfb03vXa5wK52BO7UqEUy9HzMQS/U5sKVhX3ocs3j
	4YpeNCwtQRuax0EuuVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQXP1-009V9m-Uo; Wed, 15 Sep 2021 16:04:51 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQXOy-009V90-Pb
 for ath10k@lists.infradead.org; Wed, 15 Sep 2021 16:04:50 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:ce76:c689:f286:5053])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E89D682DB1;
 Wed, 15 Sep 2021 18:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631721885;
 bh=5QcfJriUR7tBHXbkjChxykSToEa3TVi/rMd15wjjipU=;
 h=From:To:Cc:Subject:Date:From;
 b=kHG1Ga9KwbqbQ4suu3bYuA/3MdMhC995bMWbJ0KTBa9T8rBxbRCWLYDXC5DdNAn4X
 AIsvPuvp3Or3tPR4d+0CimoT4Wo8kY5c/bo4XlTGbsv1FuNZk6BUemGIxZfv/4kXB3
 si+OR6UDnSSUG3VBsHVBKt6pA6D5mjRmZ8RDsIQAaqCLWhIxadIr3Y2iNGuK0HRj2V
 /aBqOuzkEwCl+0TkPGGtqv6yibl/dlIs/2GJlHDe09MpC0BvwJOMfayYU+Ei8yEC/n
 bsGhIAg86VvyoSK2IkshXSoJTEWuHityUpOzP4ih5pbowMlp3JpXSWIxaJZqhucuFo
 XXIsYAq7Itv9g==
From: Fabio Estevam <festevam@denx.de>
To: kvalo@codeaurora.org
Cc: wgong@codeaurora.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, erik.stromdahl@gmail.com,
 alagusankar@silex-india.com, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ath10k: Clean the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE flag
Date: Wed, 15 Sep 2021 13:04:22 -0300
Message-Id: <20210915160422.2839595-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_090449_071725_83A6D804 
X-CRM114-Status: GOOD (  14.34  )
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

On an imx6dl-pico-pi board with a QCA9377 SDIO chip, the following
errors are observed when the board works in STA mode:

Simply running "ssh user@192.168.0.1" causes:

[   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
[   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
[   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
[   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12

and it is not possible to connect via ssh to the other machine.

One user inspected the size of frames on Wireshark and reported
the followig:

"I was able to narrow the issue down to the mtu. If I set the mtu for
the wlan0 device to 1486 instead of 1500, the issue does not happen.

The size of frames that I see on Wireshark is exactly 1500 after
setting it to 1486."

Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
the ssh command works successfully after that.

Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.

Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..728a18b3b462 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -730,11 +730,7 @@ static int ath10k_init_sdio(struct ath10k *ar, enum ath10k_firmware_mode mode)
 		return ret;
 
 	param |= HI_ACS_FLAGS_SDIO_REDUCE_TX_COMPL_SET;
-
-	if (mode == ATH10K_FIRMWARE_MODE_NORMAL)
-		param |= HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
-	else
-		param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
+	param &= ~HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE;
 
 	if (mode == ATH10K_FIRMWARE_MODE_UTF)
 		param &= ~HI_ACS_FLAGS_SDIO_SWAP_MAILBOX_SET;
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
