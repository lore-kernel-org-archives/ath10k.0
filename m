Return-Path: <SRS0=2rbV=NP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69942C4338F
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 14:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3099F61220
	for <ath10k@archiver.kernel.org>; Tue, 24 Aug 2021 14:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3099F61220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PnGeL1XY7sJef19FceTstN2/xvM5He6iTD5Ypmv9LT0=; b=YOeFvFJ7Z+gdff
	DBn2jVq/R6vgSNjiJoQFrJaKWVX7ogqTjP1p0ZvxndEEuYMuA16HL95XluT0Vw3KXTBx+u5IxX7KI
	aYG5rLzxQ1+I3nHS4xlyDtwcyAR38UYB7nZXfH29qxhOWrYDJ1pQBd2wGd+ICWECmJgH8bchpJ95k
	fiW9zvkkbtYJPj1UmIkR22b2/pBM7Q/YCATRBdFz/ZZHRuPNwpetWH56g96B5bMm23e/F09DM4s/k
	sfXfmAsSrzSY9TaTksfmukew4pWQ8jpXpCvkmUEyMndqtbuwqvKrkeLXN4uv4ITFsmjQuDFnP7dbG
	jHwaX1Sg5/SVGBw0GlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIXfD-003Zo2-DD; Tue, 24 Aug 2021 14:44:31 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIXev-003ZhP-Et
 for ath10k@lists.infradead.org; Tue, 24 Aug 2021 14:44:20 +0000
Received: from localhost.localdomain (unknown
 [IPv6:2804:14c:485:504a:4cbe:6a59:9f33:374b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BDDE38020E;
 Tue, 24 Aug 2021 16:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1629816238;
 bh=1k67/hZ/m3v4Vrx+dVgJeJKIDgujFmuuGBL8bL7tIm0=;
 h=From:To:Cc:Subject:Date:From;
 b=eq7bEq0F3hBf7FqYmOxA5OYwIumfXuBCs1YSG+N/JiJdImhdO80WomZ1+BJ4WgNOu
 s6x9x/jL1x7UUQTn0DcgVXTBizHuUlCk/eUiYoDCJqUS560IzJfx9PVm03zr/tp2QU
 jqijbC+a2XSJVnNx3x1Fh2Tc6VWzb+i/h4iheRvhTQjgNfdzUTrxPZLH2d2kMqrpps
 oZqO9+4u7ZITkjlb+b9afrVufiOBZ1Q4dIzs/d8ev8kQGZZ2t/lgidCcof2EuMmkR1
 ACIeby9HJfeb7gb7k81jWQ3WNYXGLVtCM0OjHf3EVN7c0QKe+XVufzPXlfNqzUKAko
 cDW7Aziuh9lww==
From: Fabio Estevam <festevam@denx.de>
To: kvalo@codeaurora.org
Cc: kuba@kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, paulmck@kernel.org, marex@denx.de,
 wgong@codeaurora.org, alagusankar@silex-india.com,
 erik.stromdahl@gmail.com, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ath10k: sdio: Add missing BH locking around napi_schdule()
Date: Tue, 24 Aug 2021 11:43:39 -0300
Message-Id: <20210824144339.2796122-1-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_074413_691277_64E9606B 
X-CRM114-Status: GOOD (  11.00  )
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

On a i.MX-based board with a QCA9377 Wifi chip, the following errors
are seen after launching the 'hostapd' application:

hostapd /etc/wifi.conf
Configuration file: /etc/wifi.conf
wlan0: interface state UNINITIALIZED->COUNTRY_UPDATE
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
Using interface wlan0 with hwaddr 00:1f:7b:31:04:a0 and ssid "thessid"
IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
wlan0: interface state COUNTRY_UPDATE->ENABLED
wlan0: AP-ENABLED
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
...

Fix this problem by adding the BH locking around napi-schedule(),
in the same way it was done in commit e63052a5dd3c ("mlx5e: add
add missing BH locking around napi_schdule()").

Its commit log provides the following explanation:

"It's not correct to call napi_schedule() in pure process
context. Because we use __raise_softirq_irqoff() we require
callers to be in a context which will eventually lead to
softirq handling (hardirq, bh disabled, etc.).
    
With code as is users will see:
    
NOHZ tick-stop error: Non-RCU local softirq work is pending, handler #08!!!
"

Fixes: cfee8793a74d ("ath10k: enable napi on RX path for sdio")
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index b746052737e0..eb705214f3f0 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1363,8 +1363,11 @@ static void ath10k_rx_indication_async_work(struct work_struct *work)
 		ep->ep_ops.ep_rx_complete(ar, skb);
 	}
 
-	if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
+	if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags)) {
+		local_bh_disable();
 		napi_schedule(&ar->napi);
+		local_bh_enable();
+	}
 }
 
 static int ath10k_sdio_read_rtc_state(struct ath10k_sdio *ar_sdio, unsigned char *state)
-- 
2.25.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
