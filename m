Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69555CCA462
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 00:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAPu+yu/dfHRNUMKDLu5fxKdIvrQtDklep2aML7SnyY=; b=K0wlLX9LC+l/DkSOp1LlKCQn4/
	T+KdROInBQHyBdkbTnHAkl94VaiqsGTPCE69U9yiD2vF8vjsHNTd8fjTR9FC67ntTK5l+hfZH+NhI
	4AspXM6+SEZek6pTgS2FHVG2Q/VdxiQRbPp5oGUFhELNbCTkippd0NqhrjmcW2m7fVf01snZBBVXT
	Lrqv710OHZQOKaitJ5nGpdPv+KAH+RsOlIybDpYNI2tagOump5lIW4fp10ioyvyuJiMQtf4uRtie4
	6t167Zwy5doffQ2hWE6LnLQddUCQbToka8PVDV/HkHCah4CEEW4pMqeyuI9QlZz3wHp4bnO9pXdsD
	AsdoraPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVe2-00000001bYt-2H8q;
	Fri, 16 Oct 2026 00:17:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHVe1-00000001bYT-0Y2u
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 00:17:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6094960A87;
	Fri, 16 Oct 2026 00:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1A31C2BCFB;
	Fri, 16 Oct 2026 00:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792109876;
	bh=IaRju4QGWaDtWdNKVrgyMg1AdkB/7Sdcz65/Ve/rQFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u5lzC1xSC2uq+xLcumE15b5JmPCgl6B5cKOiy1m1zFn9ld1DMx2pS29D6nXoNaumz
	 wc2RhO54ChaT0ZljM07Zshi9JRwM6+C+REr1VL6VADIQTrmhCebZbRIF1Q5Zk1Az6q
	 37hUFIuHXBewLTjMQTLa5SJjMWh0NdGsbWEh9F9IGWuD7Ddkjy4vwaVMM/ww/a7udZ
	 zNdPqFzOjynUXUG5XRNXTMPDZ0DMyje/IMtaVHHdr2ed00VtykCgQGbTRSa5fJIrKP
	 ri5g2Rooc63Js6IsUDj1+JFTWF5C7AbM9Q32i3Wany64l5Tnm7cbL9MmLZJ0GRrX9V
	 fBHOkVZk/T+sA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEDECC6B38;
	Fri, 16 Oct 2026 00:17:55 +0000 (UTC)
From: Shunsuke Nagashima via B4 Relay <devnull+shunsuke.nagashi.ma@kernel.org>
Date: Fri, 16 Oct 2026 09:17:55 +0900
Subject: [PATCH ath-next 2/3] wifi: ath10k: skip disassociation down for a
 station vdev that is not up
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-ath10k-series-v1-send-v1-2-c847697b3558@nagashi.ma>
References: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
In-Reply-To: <20261016-ath10k-series-v1-send-v1-0-c847697b3558@nagashi.ma>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Fabricio Akio <fabricioakio@gmail.com>, 
 Shunsuke Nagashima <shunsuke@nagashi.ma>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792109874; l=3999;
 i=shunsuke@nagashi.ma; s=20260927; h=from:subject:message-id;
 bh=ra7k5rd4VUKMhfqQc4mjOGmnxng1/f4qBCPX4xMwqYo=;
 b=YW+OxFwiRaNd9UMrW1vE5OMRwYNjFyGCUH52bFRLilDhgnpovc2tkLmzRTEObZmmkPqnWuPi8
 FOpb0Wx3eX4BRyc0bl3ASSU25nKh/nwJ4EvHZWF5kxCfZ83zZz/GcHQ
X-Developer-Key: i=shunsuke@nagashi.ma; a=ed25519;
 pk=5WP8Bzifiy3DFoCeQ1lLy2osPmlNAkq71Un7ly9lbpk=
X-Endpoint-Received: by B4 Relay for shunsuke@nagashi.ma/20260927 with
 auth_id=1069
X-Original-From: Shunsuke Nagashima <shunsuke@nagashi.ma>
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
Reply-To: shunsuke@nagashi.ma
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Shunsuke Nagashima <shunsuke@nagashi.ma>

ath10k_bss_disassoc() sends WMI_VDEV_DOWN whether or not the vdev was
brought up. When mac80211 replays the station state during
reconfiguration, it can call it for a station whose connection attempt
is still pending: the vdev is started but not up, and the AP peer
exists. On WCN3990 firmware WLAN.HL.2.0.c10-00459, a VDEV_DOWN while
the peer still exists makes the firmware assert.

Send VDEV_DOWN from ath10k_bss_disassoc() only when arvif->is_up is
true, and log when it is skipped. The next patch brings down a station
vdev that never came up after the stop in
ath10k_mac_op_unassign_vif_chanctx().

Normal disconnects are not changed. With this patch and the next one,
in a CONFIG_ATH10K_DEBUG build, no DOWN was skipped in 5 WPA3 cycles
(4 of them with an association rejection with status 30 first) and
5 WPA2 cycles, and each normal disconnect sent exactly one VDEV_DOWN
from ath10k_bss_disassoc(). The change is not specific to WCN3990, but
only WCN3990 was tested.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c10-00459-QCAHLSWMTPLZ-1

Assisted-by: LLM sparse
Signed-off-by: Shunsuke Nagashima <shunsuke@nagashi.ma>
---
Notes:

- This patch was run on the device only together with the next patch.
  The path it changes was run in a CONFIG_ATH10K_DEBUG build: a hardware
  restart through debugfs while an association was pending (waiting
  after a status 30 rejection). With only the next patch (the same code
  as in this series), the firmware asserted in the VDEV_DOWN from
  ath10k_bss_disassoc() 29 of 29 times. With this patch added, it did
  not assert (0 of 5), and the down was skipped each time. The debugfs
  restart path itself gives SMMU fault and IRQ warnings, with or without
  this patch.

- Related: Fabricio Akio's "wifi: ath10k: don't reset TxBF on
  disassociation" (patchwork 14880772) changes ath10k_bss_disassoc()
  next to this patch. The two do not depend on each other; either one
  applies on top of the other with git am -3.

- Only WCN3990 was tested (hw1.0 SNOC, WLAN.HL.2.0.c10-00459). TDLS,
  P2P client and multiple vifs were not tested.

- Test kernel: a v7.2-based kernel on a comma four (SDM845) that also
  carries three out-of-tree ath10k patches (MAC address, in-order rx
  A-MSDU, SET_KEY wait).

AI-assistance disclosure:

I worked on this with Claude (mainly claude-opus-5-5 and
claude-fable-5-1) and Codex (gpt-6-astra). They helped go through the
logs and sniffer captures, draft the code changes and the debug builds,
and write the English of the commit messages. I reviewed the code. All
device tests ran on my own comma four, and the results above come from
those runs.
---
 drivers/net/wireless/ath/ath10k/mac.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index b30cdd1888f4..88ebcd2d1110 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3199,10 +3199,21 @@ static void ath10k_bss_disassoc(struct ieee80211_hw *hw,
 	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %i disassoc bssid %pM\n",
 		   arvif->vdev_id, arvif->bssid);
 
-	ret = ath10k_wmi_vdev_down(ar, arvif->vdev_id);
-	if (ret)
-		ath10k_warn(ar, "failed to down vdev %i: %d\n",
-			    arvif->vdev_id, ret);
+	/* During hw restart reconfiguration, mac80211 replays disassociation
+	 * for a station with a pending connection attempt. The vdev is started
+	 * but not up, and the AP peer exists. A down then asserts at least
+	 * WCN3990 firmware.
+	 */
+	if (arvif->is_up) {
+		ret = ath10k_wmi_vdev_down(ar, arvif->vdev_id);
+		if (ret)
+			ath10k_warn(ar, "failed to down vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+	} else {
+		ath10k_dbg(ar, ATH10K_DBG_MAC,
+			   "mac vdev %i disassoc bssid %pM skip down (not up)\n",
+			   arvif->vdev_id, arvif->bssid);
+	}
 
 	arvif->def_wep_key_idx = -1;
 

-- 
Git-157)



