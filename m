Return-Path: <SRS0=rCyH=KR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE30C2B9F2
	for <ath10k@archiver.kernel.org>; Sat, 22 May 2021 17:19:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5D0601FD
	for <ath10k@archiver.kernel.org>; Sat, 22 May 2021 17:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5D0601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=connolly.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:From:To:Date:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5B0VfAGfbXnyJ+5UfXsKTDFLHPCBpV5pgt4qFOtpvbY=; b=FufBHgigEykLlL2V9y/w6E3F+n
	UpD3265Bd7rtE8I2s84NhbOcnfEDlUY5mrM9vybdT21HLO3p8DkKrK9pRmjxRk1Al0yYAHRK5Sbyn
	M09bzjMJ1dZujqRzU6/hDcgLJxnA/d2UFKZJeadrcCrIQ5kW/Zm3Fx9IeXDQUCVHndX05hoqRJqVl
	DyiQGgeu/vXmQ7NTF/fMNWkFT1iHyWpgvqXmNMiZYZzgG3SlkANQyO9tYZMudttal9GBAebbQKBFJ
	oE6LHtlA4Kn6Gy6WHfFj4tXWgHveeAGS+QwZe4ZdxWhaT1djxLtzVi/pw3KMHYqlrLdIVuJgxSHU8
	kJ+3aB3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkVH4-002rBR-R0; Sat, 22 May 2021 17:18:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkVH3-002rBJ-PI
 for ath10k@desiato.infradead.org; Sat, 22 May 2021 17:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:Reply-To:Cc:From:To:Date:Sender:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WlHj8+hYLpUTFjiTZdr99nZUavHMI2QsMlfTHObc/l8=; b=Jds2Trxmpbt5yLDuKAuU4giTeP
 3ojoh7iV0M3qH0sTj8AoiNM3cxNPwJ+OzxVHmHmXqGkipmV8e9zSBKxigPUj5sSTxBdoOi3EKXedC
 6/7XRxa9LsdM3gPi1UeuGFkXr5KjlQRhPWvl1JoyVXOCgS+DrOXzzc56TgqOqm9Lt8fRFUhaENa83
 GC62jEpcZbp4DXiwtpEMRqIdGsGdG8shsvGerlVui6ETurQ5/21teyj8fZe4dO1d1B0k1moruyEi4
 T+/drKXrkeGsuOTKTK6tzv1UZUbpybcfXb+kXo5fQxHWHwJPGXj9eQM4nU32RcsibitBeuli3ZlpX
 DhvFpCfA==;
Received: from mail-40136.protonmail.ch ([185.70.40.136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkVH0-0009rq-Ph
 for ath10k@lists.infradead.org; Sat, 22 May 2021 17:18:52 +0000
Date: Sat, 22 May 2021 17:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1621703914;
 bh=WlHj8+hYLpUTFjiTZdr99nZUavHMI2QsMlfTHObc/l8=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=MfV4u3OEmc0gkMCptyVJapnyaue9CQJfU2dxSaC2tvGYMRqb5nuBcP4ndMS8zW93R
 1XsJIBHZuMxb2Xuql43GlaAxniDDP0g2+Bj1eVoGIi8L+5YTKc+oW7sYbej2Sm7vAu
 UoNjEUqM9c7J6CL/86SeZY54baUvCHlJIoTMg+iA=
To: caleb@connolly.tech, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
From: Caleb Connolly <caleb@connolly.tech>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath10k: demote chan info without scan request warning
Message-ID: <20210522171609.299611-1-caleb@connolly.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_101851_040635_8688D265 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Some devices/firmwares cause this to be printed every 5-15 seconds,
though it has no impact on functionality. Demote this to a debug
message.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index d48b922215eb..6c69f7ef0546 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2795,7 +2795,7 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
 	switch (ar->scan.state) {
 	case ATH10K_SCAN_IDLE:
 	case ATH10K_SCAN_STARTING:
-		ath10k_warn(ar, "received chan info event without a scan request, ignoring\n");
+		ath10k_dbg(ar, ATH10K_DBG_WMI, "received chan info event without a scan request, ignoring\n");
 		goto exit;
 	case ATH10K_SCAN_RUNNING:
 	case ATH10K_SCAN_ABORTING:
--
2.31.1



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
