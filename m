Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8k6g-0002Aa-44
 for ath10k@lists.infradead.org; Thu, 11 May 2017 09:10:00 +0000
Received: by mail-wr0-x22d.google.com with SMTP id w50so15177750wrc.0
 for <ath10k@lists.infradead.org>; Thu, 11 May 2017 02:09:37 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: [PATCH] ath10k: Fix reported HT MCS rates with NSS > 1
Date: Thu, 11 May 2017 11:09:30 +0200
Message-Id: <20170511090930.18205-1-sven.eckelmann@openmesh.com>
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
Cc: akolli@qti.qualcomm.com, linux-wireless@vger.kernel.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

The QCA4019 firmware 10.4-3.2.1-00050 reports only HT MCS rates between
0-9. But 802.11n MCS rates can be larger than that. For example a 2x2
device can send with up to MCS 15.

The firmware encodes the higher MCS rates using the NSS field. The actual
calculation is not documented by QCA but it seems like the NSS field can be
mapped for HT rates to following MCS offsets:

 * NSS 1: 0
 * NSS 2: 8
 * NSS 3: 16
 * NSS 4: 24

This offset therefore has to be added for HT rates before they are stored
in the rate_info struct.

Fixes: cec17c382140 ("ath10k: add per peer htt tx stats support for 10.4")
Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 84b6067ff6e7..6c0a821fe79d 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -2229,9 +2229,15 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
 	txrate.mcs = ATH10K_HW_MCS_RATE(peer_stats->ratecode);
 	sgi = ATH10K_HW_GI(peer_stats->flags);
 
-	if (((txrate.flags == WMI_RATE_PREAMBLE_HT) ||
-	     (txrate.flags == WMI_RATE_PREAMBLE_VHT)) && txrate.mcs > 9) {
-		ath10k_warn(ar, "Invalid mcs %hhd peer stats", txrate.mcs);
+	if (txrate.flags == WMI_RATE_PREAMBLE_VHT && txrate.mcs > 9) {
+		ath10k_warn(ar, "Invalid VHT mcs %hhd peer stats",  txrate.mcs);
+		return;
+	}
+
+	if (txrate.flags == WMI_RATE_PREAMBLE_HT &&
+	    (txrate.mcs > 7 || txrate.nss < 1)) {
+		ath10k_warn(ar, "Invalid HT mcs %hhd nss %hhd peer stats",
+			    txrate.mcs, txrate.nss);
 		return;
 	}
 
@@ -2254,7 +2260,7 @@ ath10k_update_per_peer_tx_stats(struct ath10k *ar,
 		arsta->txrate.legacy = rate;
 	} else if (txrate.flags == WMI_RATE_PREAMBLE_HT) {
 		arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
-		arsta->txrate.mcs = txrate.mcs;
+		arsta->txrate.mcs = txrate.mcs + 8 * (txrate.nss - 1);
 	} else {
 		arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
 		arsta->txrate.mcs = txrate.mcs;
-- 
2.11.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
