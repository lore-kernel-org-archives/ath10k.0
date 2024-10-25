Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FA7D0C5E6
	for <ath10k@archiver.kernel.org>; Fri, 25 Oct 2024 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfS8lecAdepFQaM/ZpxsCooHN0CCYe5nh7n3SVBoO7Q=; b=Hm7rJBHKQGWGSuYJrL89Qspw9e
	9tpMwGzbXrabL2WGRjHueMF5nij82MuXncQSUCv1TKm+5gZRFVojZRwTTEY068CHVnguihnj16dNr
	ZWh9F6k1PT60cKaIBby9Zfl2FBEiDO0Xgb7EDAmxN4b4CnnHry5Ai6xNmjBm8iwVXPhu9igkcOVhJ
	3wVRM0GTCHzr7UG3zqdbPVKla1DiOA/CRtmMRF39k7RaWJHDTQ1i1K8sxBHvTbHsuwgncM50LslR7
	Y6OsMDunXblJzzeUEIN225qWKR19AZEgsZTOsQGzkz5y3pINbCFDB4d5KQpFmeeCSHDPQlwtGhl2n
	CWlxcuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ffl-00000002ydY-0TTY;
	Fri, 25 Oct 2024 08:27:53 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FeQ-00000002yQ6-27is
	for ath10k@lists.infradead.org;
	Fri, 25 Oct 2024 08:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729845677; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=YfS8lecAdepFQaM/ZpxsCooHN0CCYe5nh7n3SVBoO7Q=; b=FikaojbqvoV5HWxP7P8yu/axw1
	zfZNJxO9Vhh333tk2u2yBU7R3WHbnomVB0tzXrrHcU0cp24Di2UYLLLD1AlQEIHKJ2PV2iZZgBcIJ
	m8femALvzRC5jPyx1HhFYrgOCeCY4SN0y6qjrGzIXoudkMGhKjsAD6nyGI7OJoy7qidzaE0ZjJPAj
	2ut91dLq3fuaF1yS93juWifEOGUNKa3ZXzuDxc9hjLKVsgKgnzw0zldLEk0box1WcaEOjjIexHiA1
	Et4XCsSbMV8w5hnCl+EeGOeGT82dPoC6HRMpet4W3VG5J0br6JkSt4RFcABf5TDPBN0E2ekxjZOTx
	U9nDVqHw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729844777; h=from : subject
 : to : message-id : date;
 bh=YfS8lecAdepFQaM/ZpxsCooHN0CCYe5nh7n3SVBoO7Q=;
 b=GsZU6DcWxxf5m1lufdKvMY7vRUjP7i0/7xsvadbv3lYd3smF/MyHKCmuN61kWBAc0Wap3
 VZHGB0IQBd7Cl8C8cT34qlX/Y6IautU7KA7pjmehZoNoYL5qye+RpKpB4vYkSlCvwVOZKkB
 6k9Fz/rHoOytVLyjo5pKJZjviSbm6uo5u4Q8hMgzrSpBPeE2lGRpddN1/2kiRqyrgD9tz80
 1laj7QOnFLq82213u35kbKm2lVFxlrWEV5z7zSK/6SiJ/fIQSLrj1aQ8+9mTQQ4uJTQztQw
 KSJ1vIRLTjbazpvpW8GRMsohwPxtqhvPMLVwb/idiswIfK9rpEhRG8u2N05g==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FeB-TRjx7e-9f; Fri, 25 Oct 2024 08:26:15 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FeA-FnQW0hQ1gPJ-oCUT; Fri, 25 Oct 2024 08:26:15 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v3 1/2] wifi: ath10k: Implement ieee80211 flush_sta callback
Date: Fri, 25 Oct 2024 10:23:47 +0200
Message-Id: <cecfe1de13d74c59e3e6428ee4a9c99bd1572884.1729844329.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1729844329.git.repk@triplefau.lt>
References: <cover.1729844329.git.repk@triplefau.lt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: Hw1sCimjm8Lt.Xp-7iX94jmZz.xNGMjQhbxQy
Feedback-ID: 510616m:510616apGKSTK:510616sZZiruM_TR
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_012630_723110_32A536EB 
X-CRM114-Status: GOOD (  21.71  )
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
Closes: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/net/wireless/ath/ath10k/core.h   |  2 ++
 drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
 drivers/net/wireless/ath/ath10k/htt_tx.c | 31 ++++++++++++++++++
 drivers/net/wireless/ath/ath10k/mac.c    | 40 +++++++++++++++++++++++-
 drivers/net/wireless/ath/ath10k/txrx.c   |  9 ++++--
 5 files changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 446dca74f06a..4ec2faa055c0 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -558,6 +558,8 @@ struct ath10k_sta {
 	u8 rate_ctrl[ATH10K_TID_MAX];
 	u32 rate_code[ATH10K_TID_MAX];
 	int rtscts[ATH10K_TID_MAX];
+	wait_queue_head_t empty_tx_wq;
+	atomic_t num_fw_queued;
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
index 9725feecefd6..211752bd0f65 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -195,6 +195,37 @@ void ath10k_htt_tx_mgmt_dec_pending(struct ath10k_htt *htt)
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
+	atomic_inc(&arsta->num_fw_queued);
+}
+
+void ath10k_htt_tx_sta_dec_pending(struct ath10k_htt *htt,
+				   struct ieee80211_sta *sta)
+{
+	struct ath10k_sta *arsta;
+	int v;
+
+	if (!sta)
+		return;
+
+	arsta = (struct ath10k_sta *)sta->drv_priv;
+
+	v = atomic_dec_if_positive(&arsta->num_fw_queued);
+	if (v < 0)
+		WARN_ON_ONCE(1);
+	if (v == 0)
+		wake_up(&arsta->empty_tx_wq);
+}
+
 int ath10k_htt_tx_alloc_msdu_id(struct ath10k_htt *htt, struct sk_buff *skb)
 {
 	struct ath10k *ar = htt->ar;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 646e1737d4c4..86386a0af14d 100644
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
@@ -7474,7 +7477,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
 		arsta->peer_ps_state = WMI_PEER_PS_STATE_DISABLED;
 		INIT_WORK(&arsta->update_wk, ath10k_sta_rc_update_wk);
 		INIT_WORK(&arsta->tid_config_wk, ath10k_sta_tid_cfg_wk);
-
+		init_waitqueue_head(&arsta->empty_tx_wq);
 		for (i = 0; i < ARRAY_SIZE(sta->txq); i++)
 			ath10k_mac_txq_init(sta->txq[i]);
 	}
@@ -8098,6 +8101,40 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
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
+			empty = atomic_read(&arsta->num_fw_queued) == 0;
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
@@ -9444,6 +9481,7 @@ static const struct ieee80211_ops ath10k_ops = {
 	.set_rts_threshold		= ath10k_set_rts_threshold,
 	.set_frag_threshold		= ath10k_mac_op_set_frag_threshold,
 	.flush				= ath10k_flush,
+	.flush_sta			= ath10k_flush_sta,
 	.tx_last_beacon			= ath10k_tx_last_beacon,
 	.set_antenna			= ath10k_set_antenna,
 	.get_antenna			= ath10k_get_antenna,
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index da3bc35e41aa..5b6750ef7d19 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -86,9 +86,12 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 	spin_unlock_bh(&htt->tx_lock);
 
 	rcu_read_lock();
-	if (txq && txq->sta && skb_cb->airtime_est)
-		ieee80211_sta_register_airtime(txq->sta, txq->tid,
-					       skb_cb->airtime_est, 0);
+	if (txq && txq->sta) {
+		if (skb_cb->airtime_est)
+			ieee80211_sta_register_airtime(txq->sta, txq->tid,
+						       skb_cb->airtime_est, 0);
+		ath10k_htt_tx_sta_dec_pending(htt, txq->sta);
+	}
 	rcu_read_unlock();
 
 	if (ar->bus_param.dev_type != ATH10K_DEV_TYPE_HL)
-- 
2.40.0


