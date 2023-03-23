Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6F7C6FD1C
	for <ath10k@archiver.kernel.org>; Thu, 23 Mar 2023 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E+nGkha33JOV4pWdvFs6CT0m99H3I5OA+2/+TMRnlyI=; b=sfZuYm4WtZ29n3
	Dz2rkdWrdYiBIRFhag5O/VEqPj4vFZkbX2mxmSw3Je7RQUzaU69uG4oe9wZbXSAVZoMHL+rqSUTIJ
	+uUuNZg7CziSc+AwaCCQuXReQBIr85kPRS7ShU+eu3uNnIMQM1qMJlb04PLanNoM3rWaiTRSuS+2/
	E9sX1r031pD6k+/XdaHW4ar8EU7Z9ptngzfaWkafsE2IYnxDnviYGztpyRXcuMicLbP9lL3Xz9jC/
	6kN2/bAlLy9aJjNxZFBLZyjpuSHCa0QomN6bsMqYnDxuJY8kkywrnHbKeUUYE54iLO4cV+WTgDfHf
	E6WNoljBqaYNOtSavpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOGK-002XTB-0N;
	Thu, 23 Mar 2023 16:58:04 +0000
Received: from ns2.wdyn.eu ([5.252.227.236])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOGG-002XRx-1k
	for ath10k@lists.infradead.org;
	Thu, 23 Mar 2023 16:58:02 +0000
From: Alexander Wetzel <alexander@wetzel-home.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wetzel-home.de;
	s=wetzel-home; t=1679590667;
	bh=b65rg+Ns9zniat0wIt6g2YkntDD1KWVkHkHtk40xSCk=;
	h=From:To:Cc:Subject:Date;
	b=FT7RrLICxvsBUjsNmMBwIsnO/PJxVYmQ+LBDrZnNPm0cDwDl3r1tVJVs0A72twOmq
	 lFE6ZkABxP0hzpDC/3H7CRQftfCSiqvY0ZCxtUyFsjpdvlG88k/bWQM3dWS1e4ik5M
	 3xpGqCmLVtCGGq3UK7tgOAAx4v9ZrXicTYtYC0pg=
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Alexander Wetzel <alexander@wetzel-home.de>,
	Felix Fietkau <nbd@nbd.name>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Serialize wake_tx_queue ops
Date: Thu, 23 Mar 2023 17:55:27 +0100
Message-Id: <20230323165527.156414-1-alexander@wetzel-home.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_095801_029462_F336D89C 
X-CRM114-Status: GOOD (  12.32  )
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

Serialize the ath10k implementation of the wake_tx_queue ops.
ath10k_mac_op_wake_tx_queue() must not run concurrent since it's using
ieee80211_txq_schedule_start().

Fixes: bb2edb733586 ("ath10k: migrate to mac80211 txq scheduling")
Reported-by: Felix Fietkau <nbd@nbd.name>
Link: https://lore.kernel.org/r/519b5bb9-8899-ae7c-4eff-f3116cdfdb56@nbd.name
CC: <stable@vger.kernel.org>
Signed-off-by: Alexander Wetzel <alexander@wetzel-home.de>
---

The intend of this patch is to sort out an issue discovered in the discussion
referred to by the Link tag.

I can't test it with real HW and thus just implemented the per-ac queue lock
Felix suggested. One obvious alternative to the per-ac lock would be to
bring back the txqs_lock commit bb2edb733586 ("ath10k: migrate to mac80211 txq
scheduling") dropped.

Alexander

---
 drivers/net/wireless/ath/ath10k/core.c | 3 +++
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 drivers/net/wireless/ath/ath10k/mac.c  | 6 ++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5eb131ab916f..533ed7169e11 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3643,6 +3643,9 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	mutex_init(&ar->dump_mutex);
 	spin_lock_init(&ar->data_lock);
 
+	for (int ac = 0; ac < IEEE80211_NUM_ACS; ac++)
+		spin_lock_init(&ar->queue_lock[ac]);
+
 	INIT_LIST_HEAD(&ar->peers);
 	init_waitqueue_head(&ar->peer_mapping_wq);
 	init_waitqueue_head(&ar->htt.empty_tx_wq);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index f5de8ce8fb45..4b5239de4018 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1170,6 +1170,9 @@ struct ath10k {
 	/* protects shared structure data */
 	spinlock_t data_lock;
 
+	/* serialize wake_tx_queue calls per ac */
+	spinlock_t queue_lock[IEEE80211_NUM_ACS];
+
 	struct list_head arvifs;
 	struct list_head peers;
 	struct ath10k_peer *peer_map[ATH10K_MAX_NUM_PEER_IDS];
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7675858f069b..9c4bf2fdbc0f 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4732,13 +4732,14 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 {
 	struct ath10k *ar = hw->priv;
 	int ret;
-	u8 ac;
+	u8 ac = txq->ac;
 
 	ath10k_htt_tx_txq_update(hw, txq);
 	if (ar->htt.tx_q_state.mode != HTT_TX_MODE_SWITCH_PUSH)
 		return;
 
-	ac = txq->ac;
+	spin_lock_bh(&ar->queue_lock[ac]);
+
 	ieee80211_txq_schedule_start(hw, ac);
 	txq = ieee80211_next_txq(hw, ac);
 	if (!txq)
@@ -4753,6 +4754,7 @@ static void ath10k_mac_op_wake_tx_queue(struct ieee80211_hw *hw,
 	ath10k_htt_tx_txq_update(hw, txq);
 out:
 	ieee80211_txq_schedule_end(hw, ac);
+	spin_unlock_bh(&ar->queue_lock[ac]);
 }
 
 /* Must not be called with conf_mutex held as workers can use that also. */
-- 
2.40.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
