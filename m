Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE1DC71153
	for <ath10k@archiver.kernel.org>; Thu, 24 Aug 2023 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikUxg+ydblgVtVGwHviaHveEYciiPd0dkeLxDniMET8=; b=bzqJZydLSCDr7g
	tRExRawHMTKdJjf3Qo70HPUMgTkwtuGD0gkVhhKehiCD1ydPDnSzcHflIcMRYskLa9oad4/rxUefO
	VPEtOer0uCb+af6JalJPB8m2/WwkeSX8sAyW3DpDdLNEa7tz+INO2nK3snt3SPV1t5itVP7DX3kxc
	x7h0hVFto8OpfG1/HAV/xtrnYtu9NQecaQmkMzc+3OuJfgw2cfekJ/eKY6gGWF2kYhWHBmnkseeSp
	Y26RGOgkR9tyJdWk4eLb+dgBhvrruUu91dWxqv+eHlz6f+9vZfMnadQwr3sLhs9FlNg0lPaP3vQKh
	K/CJ2OnlUD1v3lIiwCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IX-002Gxk-0Z;
	Thu, 24 Aug 2023 05:54:25 +0000
Received: from forward100c.mail.yandex.net ([178.154.239.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ3IP-002Gus-2H
	for ath10k@lists.infradead.org;
	Thu, 24 Aug 2023 05:54:21 +0000
Received: from mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:287:0:640:7dd6:0])
	by forward100c.mail.yandex.net (Yandex) with ESMTP id 46AE0600C2;
	Thu, 24 Aug 2023 08:54:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 3sDNeg0WnqM0-akqvJSOX;
	Thu, 24 Aug 2023 08:54:04 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1692856444;
	bh=ViNyuKby6APPsFdcPz/t0WI7uk0vYoOjhkTYc2bDucE=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=ePc5tJz+bKJY1GRLGp7Yz35q3j+ea/ffvEN75K9PYBfEm4BjbhIUmMhjlXXoPDFzF
	 rqyckpUrE7XWL5fmpRWZx4mL2GcUyY7xEUwkC/RihcELzuVJGvy9203KR4R+VYG5nK
	 S4gZ4Q/vuo+BBNW+unj6LhPv/s67bczTOr5KOVNg=
Authentication-Results: mail-nwsmtp-smtp-production-main-42.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	lvc-project@linuxtesting.org,
	ath10k@lists.infradead.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH 1/6] [v3] wifi: ath10k: cleanup CE ring initialization
Date: Thu, 24 Aug 2023 08:51:06 +0300
Message-ID: <20230824055117.42309-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_225418_222149_D46689A6 
X-CRM114-Status: GOOD (  10.94  )
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

Commit 25d0dbcbd5c7 ("ath10k: split ce initialization and allocation")
changes 'ath10k_ce_init_src_ring()' and 'ath10k_ce_init_dest_ring()'
so these functions can't return -ENOMEM but always returns 0. This way
both of them may be converted to 'void', and 'ath10k_ce_init_pipe()'
may be simplified accordingly.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: split to smaller units per Jeff's suggestion
v2: change 'ath10k_ce_alloc_rri()' to return -ENOMEM in case
of 'dma_alloc_coherent()' failure and fix error handling in
'ath10k_snoc_hif_power_up()'
---
 drivers/net/wireless/ath/ath10k/ce.c | 38 ++++++++--------------------
 1 file changed, 10 insertions(+), 28 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index c27b8204718a..ace92c636733 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1352,9 +1352,9 @@ void ath10k_ce_enable_interrupts(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_ce_enable_interrupts);
 
-static int ath10k_ce_init_src_ring(struct ath10k *ar,
-				   unsigned int ce_id,
-				   const struct ce_attr *attr)
+static void ath10k_ce_init_src_ring(struct ath10k *ar,
+				    unsigned int ce_id,
+				    const struct ce_attr *attr)
 {
 	struct ath10k_ce *ce = ath10k_ce_priv(ar);
 	struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
@@ -1389,13 +1389,11 @@ static int ath10k_ce_init_src_ring(struct ath10k *ar,
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot init ce src ring id %d entries %d base_addr %pK\n",
 		   ce_id, nentries, src_ring->base_addr_owner_space);
-
-	return 0;
 }
 
-static int ath10k_ce_init_dest_ring(struct ath10k *ar,
-				    unsigned int ce_id,
-				    const struct ce_attr *attr)
+static void ath10k_ce_init_dest_ring(struct ath10k *ar,
+				     unsigned int ce_id,
+				     const struct ce_attr *attr)
 {
 	struct ath10k_ce *ce = ath10k_ce_priv(ar);
 	struct ath10k_ce_pipe *ce_state = &ce->ce_states[ce_id];
@@ -1427,8 +1425,6 @@ static int ath10k_ce_init_dest_ring(struct ath10k *ar,
 	ath10k_dbg(ar, ATH10K_DBG_BOOT,
 		   "boot ce dest ring id %d entries %d base_addr %pK\n",
 		   ce_id, nentries, dest_ring->base_addr_owner_space);
-
-	return 0;
 }
 
 static int ath10k_ce_alloc_shadow_base(struct ath10k *ar,
@@ -1662,25 +1658,11 @@ ath10k_ce_alloc_dest_ring_64(struct ath10k *ar, unsigned int ce_id,
 int ath10k_ce_init_pipe(struct ath10k *ar, unsigned int ce_id,
 			const struct ce_attr *attr)
 {
-	int ret;
-
-	if (attr->src_nentries) {
-		ret = ath10k_ce_init_src_ring(ar, ce_id, attr);
-		if (ret) {
-			ath10k_err(ar, "Failed to initialize CE src ring for ID: %d (%d)\n",
-				   ce_id, ret);
-			return ret;
-		}
-	}
+	if (attr->src_nentries)
+		ath10k_ce_init_src_ring(ar, ce_id, attr);
 
-	if (attr->dest_nentries) {
-		ret = ath10k_ce_init_dest_ring(ar, ce_id, attr);
-		if (ret) {
-			ath10k_err(ar, "Failed to initialize CE dest ring for ID: %d (%d)\n",
-				   ce_id, ret);
-			return ret;
-		}
-	}
+	if (attr->dest_nentries)
+		ath10k_ce_init_dest_ring(ar, ce_id, attr);
 
 	return 0;
 }
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
