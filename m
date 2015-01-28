Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qa0-x22b.google.com ([2607:f8b0:400d:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YGPun-0000lA-Vu
 for ath10k@lists.infradead.org; Wed, 28 Jan 2015 10:32:06 +0000
Received: by mail-qa0-f43.google.com with SMTP id v10so15562903qac.2
 for <ath10k@lists.infradead.org>; Wed, 28 Jan 2015 02:31:44 -0800 (PST)
From: Helmut Schaa <helmut.schaa@googlemail.com>
Subject: [PATCH] ath10k: Use TX cksum offload only for CHECKSUM_PARTIAL
Date: Wed, 28 Jan 2015 11:31:32 +0100
Message-Id: <1422441092-29243-1-git-send-email-helmut.schaa@googlemail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>, Helmut Schaa <helmut.schaa@googlemail.com>

Otherwise ath10k will just checksum everything even if it did not
go through the TCP/IP stack (for example bridged frames). In the worst
case this could mean recreating the checksum for incorrect data.

Signed-off-by: Helmut Schaa <helmut.schaa@googlemail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index a1bda41..e142502 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -534,8 +534,10 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 
 	flags1 |= SM((u16)vdev_id, HTT_DATA_TX_DESC_FLAGS1_VDEV_ID);
 	flags1 |= SM((u16)tid, HTT_DATA_TX_DESC_FLAGS1_EXT_TID);
-	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
-	flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
+	if (msdu->ip_summed == CHECKSUM_PARTIAL) {
+		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L3_OFFLOAD;
+		flags1 |= HTT_DATA_TX_DESC_FLAGS1_CKSUM_L4_OFFLOAD;
+	}
 
 	/* Prevent firmware from sending up tx inspection requests. There's
 	 * nothing ath10k can do with frames requested for inspection so force
-- 
1.8.4.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
