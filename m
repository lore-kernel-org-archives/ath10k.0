Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX1th-0006tV-Mx
 for ath10k@lists.infradead.org; Wed, 02 Sep 2015 06:51:54 +0000
From: <c_mpubbi@qti.qualcomm.com>
Subject: [PATCH] ath10k: invalid mcs reported in rx descriptor
Date: Wed, 2 Sep 2015 12:21:05 +0530
Message-ID: <1441176665-3365-1-git-send-email-c_mpubbi@qti.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>, linux-wireless@vger.kernel.org

From: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>

Sometimes hardware reports invalid mcs index in rx descriptor
when operating in VHT80 mode and all packets with invalid mcs
will be eventually dropped in mac80211. This issue is observerd during
testing on QCA99X0 chipsets.

This patch adds a warn message for dumping the rx desc info which helps
in analysing the issue when invalid mcs is received.

Signed-off-by: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 1b7a043..9985772 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -697,6 +697,29 @@ static void ath10k_htt_rx_h_rates(struct ath10k *ar,
 		bw = info2 & 3;
 		sgi = info3 & 1;
 
+		if (mcs > 0x09) {
+			ath10k_warn(ar, "invalid MCS received %u\n", mcs);
+			ath10k_warn(ar, "rxd %08x mpdu start %08x %08x msdu start %08x %08x ppdu start %08x %08x %08x %08x %08x\n",
+				    __le32_to_cpu(rxd->attention.flags),
+				    __le32_to_cpu(rxd->mpdu_start.info0),
+				    __le32_to_cpu(rxd->mpdu_start.info1),
+				    __le32_to_cpu(rxd->msdu_start.common.info0),
+				    __le32_to_cpu(rxd->msdu_start.common.info1),
+				    rxd->ppdu_start.info0,
+				    __le32_to_cpu(rxd->ppdu_start.info1),
+				    __le32_to_cpu(rxd->ppdu_start.info2),
+				    __le32_to_cpu(rxd->ppdu_start.info3),
+				    __le32_to_cpu(rxd->ppdu_start.info4));
+
+			ath10k_warn(ar, "msdu end %08x mpdu end %08x\n",
+				    __le32_to_cpu(rxd->msdu_end.common.info0),
+				    __le32_to_cpu(rxd->mpdu_end.info0));
+
+			ath10k_dbg_dump(ar, ATH10K_DBG_HTT_DUMP, NULL,
+					"rx desc msdu payload: ",
+					rxd->msdu_payload, 50);
+		}
+
 		status->rate_idx = mcs;
 		status->vht_nss = nss;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
