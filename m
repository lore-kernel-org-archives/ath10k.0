Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A169CCF2566
	for <ath10k@archiver.kernel.org>; Sat, 12 Oct 2024 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixfGgqFjjobcB6ENcsNj193mNxIb5LfMXGOC7kBenes=; b=E8AF8OpZjzC3TIP+LDgxRiVSDM
	JGTUmdPzOMPgCMdScGBUlnQL1S9BRtf7ekLjjbyAqRM0QrujCoVw7rdpicZmQVZ7b8TFwF+oOsXcu
	f3BejbLTxXVjmbX5nuiMum/9uf46cIs/wHr3FoSuCT9KbpgaVaVICyUh4FOmz7WPGovWB221VVuSK
	wb25Cn2GijCMTJQgbMtbMsIUcqL+hP+zIOGLecHWDVcfW7eILmgtA4QDQez6EqU3XX9gw110c1AVb
	g4SD3lvPwu6WeNrEalLhLIcFJTYEZPp4JIn6AU2efSfmF50AB5UetjCrTd63xmepnDZg1LfVebgjJ
	nEoXrxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szcse-00000001JrP-2b1B;
	Sat, 12 Oct 2024 14:14:04 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szcsa-00000001Jpx-47ev
	for ath10k@lists.infradead.org;
	Sat, 12 Oct 2024 14:14:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1728743326; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=ixfGgqFjjobcB6ENcsNj193mNxIb5LfMXGOC7kBenes=; b=Tp+yKIvhIbLZ4P/pvF7D7d1Csk
	yRpqr0HmTrULfGIWeRaokXLnQtGf9VpSgy3rjvP4E2eRIgTcOBlsO/HKEK0DGiieIyD3EpaALMa8T
	BFJMTuh4gAQBgXFNmn2hizBSgbSh8fQjBQVFBg+HBss/D6jMKyJ4xaY1uH04J3YldoQeBdo7D8zx7
	3u8aBUp0ZkJKzkPZSnx9K5tjZFk4WEPgJG4p2J51Am/XPinCku3WdgGEapa9ywULHFao1WUONA0Zd
	ZL67VbEsK3B1eVkj4CDuvrRslXg0KT3CbsA1j4u+jgvVycXblIP5kuj7Vbb2gjRdJ5FxiDRXBqbyB
	LzMAoy7w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1728742426; h=from : subject
 : to : message-id : date;
 bh=ixfGgqFjjobcB6ENcsNj193mNxIb5LfMXGOC7kBenes=;
 b=G5nmTj+9AUCj6pntcScmGzxX2SW2meEzXvarie3bnsVcZFQTx8RE+rizIwneFB9lnCWaY
 dRX4TffwcKLg/aAkEzXvGZrRdJi+ZeeCEhq9/Un+PEg1xwGFf0VgkIlmu1HkSWSLB+xjKMz
 QuIA2j+WAIfN5+BXNRmQY3DysO35gMkIiEdrQRTv/Q2Q+dspEQ4XlsTDV8Umld/e3vJLm4m
 GO9nLM/rrKc8yJLYlldUw2MKyVyvtbMorZETlZT6X4IVNg/gaihz3dsQJbFz6H/D+TtBXko
 8/VFjhWst7mZLMeAjoy9yoOA5Uj5t/pCU9sR1CQ+ICGb7cZeLT4P+P2yrF/A==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1szcsL-TRjz8V-B8; Sat, 12 Oct 2024 14:13:45 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1szcsK-4o5NDgrqNZz-nw9B; Sat, 12 Oct 2024 14:13:44 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH 1/2] wifi: ath10k: Implement ieee80211 flush_sta callback
Date: Sat, 12 Oct 2024 16:13:54 +0200
Message-Id: <481540132c62b16f6d823b7556c11a0ce68f5c58.1728741827.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1728741827.git.repk@triplefau.lt>
References: <cover.1728741827.git.repk@triplefau.lt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: lu4jkc_7TQPC.EMGyB7GIFd5i.H8WG8w8xj7f
Feedback-ID: 510616m:510616apGKSTK:510616s8nGpsn1B8
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_071401_196437_5AD3DAB1 
X-CRM114-Status: GOOD (  20.10  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

When a STA reassociates, mac80211's _sta_info_move_state() waits for all
pending frame to be flushed before removing the key (so that no frame
get sent unencrypted after key removable [0]). When a driver does not
implement the flush_sta callback, ieee80211_flush_queues() is called
instead which effectively stops the whole queue until it is completely
drained.

The ath10k driver configure all STAs of one vdev to share the same
queue. So when flushing one STA this is the whole vdev queue that is
blocked until completely drained causing Tx to other STA to also stall
this whole time.

One easy way to reproduce the issue is to connect two STAs (STA0 and
STA1) to an ath10k AP. While Generating a bunch of traffic from AP to
STA0 (e.g. fping -l -p 20 <STA0-IP>) disconnect STA0 from AP without
clean disassociation (e.g. remove power, reboot -f). Then as soon as
STA0 is effectively disconnected from AP (either after inactivity
timeout or forced with iw dev AP station del STA0), its queues get
flushed using ieee80211_flush_queues(). This causes STA1 to suffer a
connectivity stall for about 5 seconds (see ATH10K_FLUSH_TIMEOUT_HZ).

Implement a flush_sta callback in ath10k to wait only for a specific
STA pending frames to be drained (without stopping the whole HW queue)
to fix that.

[0]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")

Reported-by: Cedric Veilleux <veilleux.cedric@gmail.com>
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/net/wireless/ath/ath10k/core.h   |  4 +++
 drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c | 32 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    | 43 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++
 5 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..4709e4887efc 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -558,6 +558,10 @@ struct ath10k_sta {
 	u8 rate_ctrl[ATH10K_TID_MAX];
 	u32 rate_code[ATH10K_TID_MAX];
 	int rtscts[ATH10K_TID_MAX];
+	/* protects num_fw_queued */
+	spinlock_t sta_tx_lock;
+	wait_queue_head_t empty_tx_wq;
+	unsigned int num_fw_queued;
 };
 
 #define ATH10K_VDEV_SETUP_TIMEOUT_HZ	(5 * HZ)
diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 603f6de62b0a..d150f9330941 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -2452,6 +2452,10 @@ int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt);
 void ath10k_htt_tx_mgmt_dec_pending(struct ath10k_htt *htt);
 int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_mgmt,
 				   bool is_presp);
+void ath10k_htt_tx_sta_inc_pending(struct ath10k_htt *htt,
+				   struct ieee80211_sta *sta);
+void ath10k_htt_tx_sta_dec_pending(struct ath10k_htt *htt,
+				   struct ieee80211_sta *sta);
 
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb);
 void ath10k_htt_tx_free_msdu_id(struct ath10k_htt *htt, u16 msdu_id);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 9725feecefd6..7477cb8f5d10 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -195,6 +195,38 @@ void ath10k_htt_tx_mgmt_dec_pending(struct ath10k_htt *htt)
 	htt->num_pending_mgmt_tx--;
 }
 
+void ath10k_htt_tx_sta_inc_pending(struct ath10k_htt *htt,
+				   struct ieee80211_sta *sta)
+{
+	struct ath10k_sta *arsta;
+
+	if (!sta)
+		return;
+
+	arsta = (struct ath10k_sta *)sta->drv_priv;
+
+	spin_lock_bh(&arsta->sta_tx_lock);
+	arsta->num_fw_queued++;
+	spin_unlock_bh(&arsta->sta_tx_lock);
+}
+
+void ath10k_htt_tx_sta_dec_pending(struct ath10k_htt *htt,
+				   struct ieee80211_sta *sta)
+{
+	struct ath10k_sta *arsta;
+
+	if (!sta)
+		return;
+
+	arsta = (struct ath10k_sta *)sta->drv_priv;
+
+	spin_lock_bh(&arsta->sta_tx_lock);
+	arsta->num_fw_queued--;
+	if (arsta->num_fw_queued == 0)
+		wake_up(&arsta->empty_tx_wq);
+	spin_unlock_bh(&arsta->sta_tx_lock);
+}
+
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb)
 {
 	struct ath10k *ar = htt->ar;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 646e1737d4c4..373a0aa6b01c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4423,6 +4423,8 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		spin_unlock_bh(&ar->htt.tx_lock);
 	}
 
+	ath10k_htt_tx_sta_inc_pending(&ar->htt, sta);
+
 	ret = ath10k_mac_tx(ar, vif, txmode, txpath, skb, false);
 	if (unlikely(ret)) {
 		ath10k_warn(ar, "failed to push frame: %d\n", ret);
@@ -4432,6 +4434,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		if (is_mgmt)
 			ath10k_htt_tx_mgmt_dec_pending(htt);
 		spin_unlock_bh(&ar->htt.tx_lock);
+		ath10k_htt_tx_sta_dec_pending(&ar->htt, sta);
 
 		return ret;
 	}
@@ -7474,7 +7477,8 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		arsta->peer_ps_state = WMI_PEER_PS_STATE_DISABLED;
 		INIT_WORK(&arsta->update_wk, ath10k_sta_rc_update_wk);
 		INIT_WORK(&arsta->tid_config_wk, ath10k_sta_tid_cfg_wk);
-
+		spin_lock_init(&arsta->sta_tx_lock);
+		init_waitqueue_head(&arsta->empty_tx_wq);
 		for (i = 0; i < ARRAY_SIZE(sta->txq); i++)
 			ath10k_mac_txq_init(sta->txq[i]);
 	}
@@ -8098,6 +8102,42 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	mutex_unlock(&ar->conf_mutex);
 }
 
+static void ath10k_flush_sta(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			     struct ieee80211_sta *sta)
+{
+	struct ath10k_sta *arsta = (struct ath10k_sta *)sta->drv_priv;
+	struct ath10k *ar = hw->priv;
+	bool skip;
+	long time_left;
+
+	/* TODO do we need drop implemented here ? */
+
+	mutex_lock(&ar->conf_mutex);
+
+	if (ar->state == ATH10K_STATE_WEDGED)
+		goto out;
+
+	time_left = wait_event_timeout(arsta->empty_tx_wq, ({
+			bool empty;
+
+			spin_lock_bh(&arsta->sta_tx_lock);
+			empty = (arsta->num_fw_queued == 0);
+			spin_unlock_bh(&arsta->sta_tx_lock);
+
+			skip = (ar->state == ATH10K_STATE_WEDGED) ||
+			       test_bit(ATH10K_FLAG_CRASH_FLUSH,
+					&ar->dev_flags);
+
+			(empty || skip);
+		}), ATH10K_FLUSH_TIMEOUT_HZ);
+
+	if (time_left == 0 || skip)
+		ath10k_warn(ar, "failed to flush sta txq (sta %pM skip %i ar-state %i): %ld\n",
+			    sta->addr, skip, ar->state, time_left);
+out:
+	mutex_unlock(&ar->conf_mutex);
+}
+
 /* TODO: Implement this function properly
  * For now it is needed to reply to Probe Requests in IBSS mode.
  * Probably we need this information from FW.
@@ -9444,6 +9484,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.set_rts_threshold		= ath10k_set_rts_threshold,
 	.set_frag_threshold		= ath10k_mac_op_set_frag_threshold,
 	.flush				= ath10k_flush,
+	.flush_sta			= ath10k_flush_sta,
 	.tx_last_beacon			= ath10k_tx_last_beacon,
 	.set_antenna			= ath10k_set_antenna,
 	.get_antenna			= ath10k_get_antenna,
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index da3bc35e41aa..ece56379b0f0 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -91,6 +91,9 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 					       skb_cb->airtime_est, 0);
 	rcu_read_unlock();
 
+	if (txq)
+		ath10k_htt_tx_sta_dec_pending(htt, txq->sta);
+
 	if (ar->bus_param.dev_type != ATH10K_DEV_TYPE_HL)
 		dma_unmap_single(dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
-- 
2.40.0


