Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EB1C433F5
	for <ath10k@archiver.kernel.org>; Tue, 15 Mar 2022 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PXh2DwhwmDkr0Hct+IONFp3UIUmLj4cvVC4l33TcncY=; b=zNZ6/ojJ/afkbd
	pLJe96TcyLy0byQ0zlfw+U9b70PrwyAh746D03bPx2EY6Kevxa8Jq1Ba22doJAaC9h0zB8oTGXYy7
	d7h12P54W/Qga+8L6tnXyAjitNtBPxZimn75RfLaDwBAWz1kFinoLsq+uwDRQIWpoSV9jPvYxgrV2
	bt8lkUI1Hw5R3+0hy9IYdN49TGe9h5xMevOcgj6yzMOFKRCQUnkxHjwNNA4I5Ce9IHKjGPUcL+VgP
	mha9m1OInTCT0Uxbj9xUriBt+DEkiEgP4M3QmLuSQHM79L9EmUD1A01jd0kdyuNlW15F0YI3aLNa/
	RrOC+Zc94Rh2vMqoAUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU9Vs-009nyE-2H; Tue, 15 Mar 2022 15:55:08 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU9Vp-009nwW-BC
 for ath10k@lists.infradead.org; Tue, 15 Mar 2022 15:55:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4C0C8CE1B70
 for <ath10k@lists.infradead.org>; Tue, 15 Mar 2022 15:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C2BC340E8;
 Tue, 15 Mar 2022 15:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647359698;
 bh=H3Iw5/Cg0bzJmoFidn/e7FTnqwyY28fUPOy9FOkimFQ=;
 h=From:To:Cc:Subject:Date:From;
 b=LK+RgA5mbDMic1HtoNJvgug5sX3qdo+inR9ceVfyYjence1kZvB0R/DV1Ku5YTKRt
 aCUno2qSuAL3kLL8LRKGWZX6rCKYNrK6tq7qLNaWTBXQcPZl3ycCqZK80FMSNtYQH5
 Ee5A5b/g2XH1Qxq8Km0Rd0QWmT93kpRASc3/433uy810h5JthFjkFa++VLEzqFsAet
 uAPxWVaDknZpanff+xAs0+L+Ic3NL2I2ArJYPVse1IQRo808+nAgEfbb6IAnhXWKl8
 VGQnVMmsmQ55ykRP8F+zac5379+iQLKtkY4keLNCoB8oeZ7T++54e7Dzlf2gh4vl5R
 TbGk7yl4hBlTw==
From: Kalle Valo <kvalo@kernel.org>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] Revert "ath10k: drop beacon and probe response which leak
 from other channel"
Date: Tue, 15 Mar 2022 17:54:55 +0200
Message-Id: <20220315155455.20446-1-kvalo@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_085505_609523_80A00B5D 
X-CRM114-Status: GOOD (  10.77  )
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

From: Kalle Valo <quic_kvalo@quicinc.com>

This reverts commit 3bf2537ec2e33310b431b53fd84be8833736c256.

I was reported privately that this commit breaks AP and mesh mode on QCA9984
(firmware 10.4-3.9.0.2-00156). So revert the commit to fix the regression.

There was a conflict due to cfg80211 API changes but that was easy to fix.

Fixes: 3bf2537ec2e3 ("ath10k: drop beacon and probe response which leak from other channel")
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 33 +--------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 62c453a21e49..7c1c2658cb5f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2611,36 +2611,9 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 		ath10k_mac_handle_beacon(ar, skb);
 
 	if (ieee80211_is_beacon(hdr->frame_control) ||
-	    ieee80211_is_probe_resp(hdr->frame_control)) {
-		struct ieee80211_mgmt *mgmt = (void *)skb->data;
-		enum cfg80211_bss_frame_type ftype;
-		u8 *ies;
-		int ies_ch;
-
+	    ieee80211_is_probe_resp(hdr->frame_control))
 		status->boottime_ns = ktime_get_boottime_ns();
 
-		if (!ar->scan_channel)
-			goto drop;
-
-		ies = mgmt->u.beacon.variable;
-
-		if (ieee80211_is_beacon(mgmt->frame_control))
-			ftype = CFG80211_BSS_FTYPE_BEACON;
-		else
-			ftype = CFG80211_BSS_FTYPE_PRESP;
-
-		ies_ch = cfg80211_get_ies_channel_number(mgmt->u.beacon.variable,
-							 skb_tail_pointer(skb) - ies,
-							 sband->band, ftype);
-
-		if (ies_ch > 0 && ies_ch != channel) {
-			ath10k_dbg(ar, ATH10K_DBG_MGMT,
-				   "channel mismatched ds channel %d scan channel %d\n",
-				   ies_ch, channel);
-			goto drop;
-		}
-	}
-
 	ath10k_dbg(ar, ATH10K_DBG_MGMT,
 		   "event mgmt rx skb %pK len %d ftype %02x stype %02x\n",
 		   skb, skb->len,
@@ -2654,10 +2627,6 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 	ieee80211_rx_ni(ar->hw, skb);
 
 	return 0;
-
-drop:
-	dev_kfree_skb(skb);
-	return 0;
 }
 
 static int freq_to_idx(struct ath10k *ar, int freq)

base-commit: e6e91ec966db5af4f059cfbac1af06560404b317
-- 
2.30.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
