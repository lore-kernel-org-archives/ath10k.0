Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB63D0C5E5
	for <ath10k@archiver.kernel.org>; Fri, 25 Oct 2024 08:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxT94cQL1fAndlDPcyAmj+ZFucIh1j+4l3cVtvOBc3c=; b=TucPKTHrMWH6ChLtXTZqEkXXSp
	kD7lr40+gZuSDONcu3jD25DpTziEkWyZvro0G7V5Tkn7v0vR21136FkFK85oQSx79HiCSFXT846fI
	FZhxWinLp8H+/5v0FHA+jq8n3W7eFwmLKksaF69/TRDlIbVsnjSNDV067G1ymzXQaitToQD7ArpCD
	Afetth8TdIDYaUpNo7Dvv0J02jok6jHhWcgirass3GFXUwq/1jhttVek0YEd++RcpAoJsJ6o7brPc
	Saafa4UoqKZ0TZkoYd+mfae+2fReNo6XJDL7/4FGQ6J4WYXBesUi+j74Cvf7NWrwclX7VzL/XBTM1
	dU0hOWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ffm-00000002ydu-18oQ;
	Fri, 25 Oct 2024 08:27:54 +0000
Received: from e2i340.smtp2go.com ([103.2.141.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FeR-00000002yQA-2u5E
	for ath10k@lists.infradead.org;
	Fri, 25 Oct 2024 08:26:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1729845677; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=GxT94cQL1fAndlDPcyAmj+ZFucIh1j+4l3cVtvOBc3c=; b=Arcj2uhFO1G/6d/B3+UtbQFo3w
	e9vmhfD88kE3AWSe64CuTGZ8Ctw3bllHlRLGDoP6jYqH54wscviaUZbORjOd3wlQW7TslJhzmP/a3
	NMw9i0SNmvSK0nSZIkalh9J/jjkxWB6IyHzNgO0G/VdA/ZegTZQzaJZ5sUX51tjBAytBfYeSYOxvN
	fkL8VYTys/yIXgfhkGdT+qPqT+UUqQFc5azQLdd2paXeGzQ0amqjQ+5FrYSlBrq+YCnJAosRTLSs4
	1dX+0ZlELGuvteQ1QXRiV0yZHt/f8Gfm9IZ+1j+AAcctjtu90zLbjKDXp01C8751NkdbgKtDx94lr
	MY1ATR3w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1729844777; h=from : subject
 : to : message-id : date;
 bh=GxT94cQL1fAndlDPcyAmj+ZFucIh1j+4l3cVtvOBc3c=;
 b=TT8JnMLtUYRhKNPGedAC7lUdLOI6ccV9DP7MuWUyPF5dFQW4FtiFfEmwqhn+7zk4Jl5ue
 bULCVu2fMpekaM7LbvNmyOJm+gckuiIuAkTrUxYz2zz6f69wUpajePe6fn9n4NhEvDR+E9A
 6OGZvIktPzx8umAl+yNjVTRFZ6Y1y+yBUjkERHTlARWuvr290oFn1oHvvqzbbplz+jHhNgd
 KofKw5Pf93N1LEqPY2mEelezsSOBXpBkQotF5e4bLc/Rp6yII8EvGMEVSxsmixcTF5APfeR
 N1nSbHmr18EgItVWDok8ufwMnUjUskDtPP1NnDqRro5C5IbaQQt/xgpbZxEQ==
Received: from [10.172.233.45] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FeB-TRjx9W-Q5; Fri, 25 Oct 2024 08:26:15 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1t4FeB-AIkwcC8o9Lr-IbvN; Fri, 25 Oct 2024 08:26:15 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Cedric Veilleux <veilleux.cedric@gmail.com>,
 Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v3 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Date: Fri, 25 Oct 2024 10:23:48 +0200
Message-Id: <d0a3e1b61ae7ff8cc1a474b37d1064eeea11cbff.1729844329.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1729844329.git.repk@triplefau.lt>
References: <cover.1729844329.git.repk@triplefau.lt>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: fOmMm2SrXaqV.R75wZfKBQE_P._SwmhQQx8jp
Feedback-ID: 510616m:510616apGKSTK:510616sRI4AHN5Hf
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_012631_903570_CADC49DC 
X-CRM114-Status: GOOD (  17.40  )
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

The ieee80211 flush callback can be called to flush only part of all hw
queues. The ath10k's flush callback implementation (i.e. ath10k_flush())
was waiting for all pending frames of all queues to be flushed ignoring
the queue parameter. Because only the queues to be flushed are stopped
by mac80211, skb can still be queued to other queues meanwhile. Thus
ath10k_flush() could fail (and wait 5sec holding ar->conf lock) even if
the requested queues are flushed correctly.

A way to reproduce the issue is to use two different APs because
each vdev has its own hw queue in ath10k. Connect STA0 to AP0 and STA1
to AP1. Then generate traffic from AP0 to STA0 and kill STA0 without
clean disassociation frame (e.g. unplug power cable, reboot -f, ...).
Now if we were to flush AP1's queue, ath10k_flush() would fail (and
effectively block 5 seconds with ar->conf or even wiphy's lock held)
with the following warning:

 ath10k_pci 0000:01:00.0: failed to flush transmit queue (skip 0 ar-state 2): 0

Wait only for pending frames of the requested queues to be flushed in
ath10k_flush() to avoid that long blocking.

Reported-by: Cedric Veilleux <veilleux.cedric@gmail.com>
Closes: https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/net/wireless/ath/ath10k/htt.h    |  7 +++--
 drivers/net/wireless/ath/ath10k/htt_tx.c | 18 ++++++++++--
 drivers/net/wireless/ath/ath10k/mac.c    | 35 ++++++++++++++++--------
 drivers/net/wireless/ath/ath10k/txrx.c   |  2 +-
 4 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index d150f9330941..ca8bf3b6766d 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -1870,6 +1870,7 @@ struct ath10k_htt {
 	spinlock_t tx_lock;
 	int max_num_pending_tx;
 	int num_pending_tx;
+	int num_pending_per_queue[IEEE80211_MAX_QUEUES];
 	int num_pending_mgmt_tx;
 	struct idr pending_tx;
 	wait_queue_head_t empty_tx_wq;
@@ -2447,8 +2448,10 @@ void ath10k_htt_tx_txq_update(struct ieee80211_hw *hw,
 void ath10k_htt_tx_txq_recalc(struct ieee80211_hw *hw,
 			      struct ieee80211_txq *txq);
 void ath10k_htt_tx_txq_sync(struct ath10k *ar);
-void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt);
-int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt);
+void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt,
+			       struct ieee80211_txq *txq);
+int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt,
+			      struct ieee80211_txq *txq);
 void ath10k_htt_tx_mgmt_dec_pending(struct ath10k_htt *htt);
 int ath10k_htt_tx_mgmt_inc_pending(struct ath10k_htt *htt, bool is_mgmt,
 				   bool is_presp);
diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 211752bd0f65..ef5a992e8cce 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -140,19 +140,26 @@ void ath10k_htt_tx_txq_update(struct ieee80211_hw *hw,
 	spin_unlock_bh(&ar->htt.tx_lock);
 }
 
-void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt)
+void ath10k_htt_tx_dec_pending(struct ath10k_htt *htt,
+			       struct ieee80211_txq *txq)
 {
+	int qnr = -1;
+
 	lockdep_assert_held(&htt->tx_lock);
 
 	htt->num_pending_tx--;
 	if (htt->num_pending_tx == htt->max_num_pending_tx - 1)
 		ath10k_mac_tx_unlock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
 
-	if (htt->num_pending_tx == 0)
+	if (txq)
+		qnr = --htt->num_pending_per_queue[txq->vif->hw_queue[txq->ac]];
+
+	if (htt->num_pending_tx == 0 || qnr == 0)
 		wake_up(&htt->empty_tx_wq);
 }
 
-int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
+int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt,
+			      struct ieee80211_txq *txq)
 {
 	lockdep_assert_held(&htt->tx_lock);
 
@@ -163,6 +170,11 @@ int ath10k_htt_tx_inc_pending(struct ath10k_htt *htt)
 	if (htt->num_pending_tx == htt->max_num_pending_tx)
 		ath10k_mac_tx_lock(htt->ar, ATH10K_TX_PAUSE_Q_FULL);
 
+	if (!txq)
+		return 0;
+
+	htt->num_pending_per_queue[txq->vif->hw_queue[txq->ac]]++;
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 86386a0af14d..74c28a68a7f0 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4385,7 +4385,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 	u16 airtime;
 
 	spin_lock_bh(&ar->htt.tx_lock);
-	ret = ath10k_htt_tx_inc_pending(htt);
+	ret = ath10k_htt_tx_inc_pending(htt, txq);
 	spin_unlock_bh(&ar->htt.tx_lock);
 
 	if (ret)
@@ -4394,7 +4394,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 	skb = ieee80211_tx_dequeue_ni(hw, txq);
 	if (!skb) {
 		spin_lock_bh(&ar->htt.tx_lock);
-		ath10k_htt_tx_dec_pending(htt);
+		ath10k_htt_tx_dec_pending(htt, txq);
 		spin_unlock_bh(&ar->htt.tx_lock);
 
 		return -ENOENT;
@@ -4416,7 +4416,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		ret = ath10k_htt_tx_mgmt_inc_pending(htt, is_mgmt, is_presp);
 
 		if (ret) {
-			ath10k_htt_tx_dec_pending(htt);
+			ath10k_htt_tx_dec_pending(htt, txq);
 			spin_unlock_bh(&ar->htt.tx_lock);
 			return ret;
 		}
@@ -4430,7 +4430,7 @@ int ath10k_mac_tx_push_txq(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to push frame: %d\n", ret);
 
 		spin_lock_bh(&ar->htt.tx_lock);
-		ath10k_htt_tx_dec_pending(htt);
+		ath10k_htt_tx_dec_pending(htt, txq);
 		if (is_mgmt)
 			ath10k_htt_tx_mgmt_dec_pending(htt);
 		spin_unlock_bh(&ar->htt.tx_lock);
@@ -4693,7 +4693,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 			is_presp = ieee80211_is_probe_resp(hdr->frame_control);
 		}
 
-		ret = ath10k_htt_tx_inc_pending(htt);
+		ret = ath10k_htt_tx_inc_pending(htt, txq);
 		if (ret) {
 			ath10k_warn(ar, "failed to increase tx pending count: %d, dropping\n",
 				    ret);
@@ -4706,7 +4706,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 		if (ret) {
 			ath10k_dbg(ar, ATH10K_DBG_MAC, "failed to increase tx mgmt pending count: %d, dropping\n",
 				   ret);
-			ath10k_htt_tx_dec_pending(htt);
+			ath10k_htt_tx_dec_pending(htt, txq);
 			spin_unlock_bh(&ar->htt.tx_lock);
 			ieee80211_free_txskb(ar->hw, skb);
 			return;
@@ -4719,7 +4719,7 @@ static void ath10k_mac_op_tx(struct ieee80211_hw *hw,
 		ath10k_warn(ar, "failed to transmit frame: %d\n", ret);
 		if (is_htt) {
 			spin_lock_bh(&ar->htt.tx_lock);
-			ath10k_htt_tx_dec_pending(htt);
+			ath10k_htt_tx_dec_pending(htt, txq);
 			if (is_mgmt)
 				ath10k_htt_tx_mgmt_dec_pending(htt);
 			spin_unlock_bh(&ar->htt.tx_lock);
@@ -8045,10 +8045,12 @@ static int ath10k_mac_op_set_frag_threshold(struct ieee80211_hw *hw, u32 value)
 	return -EOPNOTSUPP;
 }
 
-void ath10k_mac_wait_tx_complete(struct ath10k *ar)
+static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
+					 unsigned long queues)
 {
 	bool skip;
 	long time_left;
+	unsigned int q;
 
 	/* mac80211 doesn't care if we really xmit queued frames or not
 	 * we'll collect those frames either way if we stop/delete vdevs
@@ -8058,10 +8060,14 @@ void ath10k_mac_wait_tx_complete(struct ath10k *ar)
 		return;
 
 	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
-			bool empty;
+			bool empty = true;
 
 			spin_lock_bh(&ar->htt.tx_lock);
-			empty = (ar->htt.num_pending_tx == 0);
+			for_each_set_bit(q, &queues, ar->hw->queues) {
+				empty = (ar->htt.num_pending_per_queue[q] == 0);
+				if (!empty)
+					break;
+			}
 			spin_unlock_bh(&ar->htt.tx_lock);
 
 			skip = (ar->state == ATH10K_STATE_WEDGED) ||
@@ -8076,6 +8082,13 @@ void ath10k_mac_wait_tx_complete(struct ath10k *ar)
 			    skip, ar->state, time_left);
 }
 
+void ath10k_mac_wait_tx_complete(struct ath10k *ar)
+{
+	unsigned int queues = GENMASK(ar->hw->queues - 1, 0);
+
+	_ath10k_mac_wait_tx_complete(ar, queues);
+}
+
 static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			 u32 queues, bool drop)
 {
@@ -8097,7 +8110,7 @@ static void ath10k_flush(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	}
 
 	mutex_lock(&ar->conf_mutex);
-	ath10k_mac_wait_tx_complete(ar);
+	_ath10k_mac_wait_tx_complete(ar, queues);
 	mutex_unlock(&ar->conf_mutex);
 }
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 5b6750ef7d19..b848962fc8fb 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -82,7 +82,7 @@ int ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 
 	flags = skb_cb->flags;
 	ath10k_htt_tx_free_msdu_id(htt, tx_done->msdu_id);
-	ath10k_htt_tx_dec_pending(htt);
+	ath10k_htt_tx_dec_pending(htt, txq);
 	spin_unlock_bh(&htt->tx_lock);
 
 	rcu_read_lock();
-- 
2.40.0


