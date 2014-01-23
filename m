Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W67om-0000xn-90
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:06:48 +0000
From: greearb@candelatech.com
Subject: [PATCH 3/4] ath10k:  Add more debugging for receive errors.
Date: Wed, 22 Jan 2014 16:06:01 -0800
Message-Id: <1390435562-15473-3-git-send-email-greearb@candelatech.com>
In-Reply-To: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 8 ++++++++
 drivers/net/wireless/ath/ath10k/txrx.c   | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fe8bd1b..49e6c4e 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -937,6 +937,7 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			}
 
 			if (ath10k_htt_rx_has_decrypt_err(msdu_head)) {
+				ath10k_warn("htt rx dropping due to decrypt-err\n");
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
@@ -975,6 +976,13 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			info.skb     = msdu_head;
 			info.fcs_err = ath10k_htt_rx_has_fcs_err(msdu_head);
 			info.mic_err = ath10k_htt_rx_has_mic_err(msdu_head);
+
+			if (info.fcs_err)
+				ath10k_warn("htt rx has FCS err\n");
+
+			if (info.mic_err)
+				ath10k_warn("htt rx has MIC err\n");
+
 			info.signal  = ATH10K_DEFAULT_NOISE_FLOOR;
 			info.signal += rx->ppdu.combined_rssi;
 
diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index e404124..fc3a651 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -259,7 +259,7 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	status->freq = ch->center_freq;
 
 	ath10k_dbg(ATH10K_DBG_DATA,
-		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u\n",
+		   "rx skb %p len %u %s%s%s%s%s %srate_idx %u vht_nss %u freq %u band %u flag: 0x%x fcs-err: %i\n",
 		   info->skb,
 		   info->skb->len,
 		   status->flag == 0 ? "legacy" : "",
@@ -271,7 +271,7 @@ void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 		   status->rate_idx,
 		   status->vht_nss,
 		   status->freq,
-		   status->band);
+		   status->band, status->flag, info->fcs_err);
 	ath10k_dbg_dump(ATH10K_DBG_HTT_DUMP, NULL, "rx skb: ",
 			info->skb->data, info->skb->len);
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
