Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x22d.google.com ([2a00:1450:4013:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSBR9-0002un-6t
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 20:25:35 +0000
Received: by mail-ee0-f45.google.com with SMTP id d17so4846722eek.18
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 13:25:12 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH v2 2/2] ath10k: fix rssi and rate reporting
Date: Mon, 24 Mar 2014 21:24:58 +0100
Message-Id: <1395692698-4745-2-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395692698-4745-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1395692698-4745-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

RSSI and RATES fields are valid only when START_VALID
bit is set. So, in current implementation we have to
remember/caclulate them when START_VALID and report the same
when only END_VALID is set.
Currently during heavy traffic we could have:
- 10 packets with START_VALID - correct RSSI and RATES
- 10 packets with END_VALID
- 10 packets with START_VALID - correct RSSI and RATES
- 10 packets with END_VALID
...
Next using monitor interface we will see:
- 10 packets with correct rssi/rates
- 10 packets with rssi=-95/rate=6Mbps

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index be25e16..f7ecc10 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1154,8 +1154,6 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 
 	lockdep_assert_held(&htt->rx_ring.lock);
 
-	memset(rx_status, 0, sizeof(*rx_status));
-
 	fw_desc_len = __le16_to_cpu(rx->prefix.fw_rx_desc_bytes);
 	fw_desc = (u8 *)&rx->fw_desc;
 
@@ -1164,8 +1162,11 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 	mpdu_ranges = htt_rx_ind_get_mpdu_ranges(rx);
 
 	/* Fill this once, while this is per-ppdu */
-	rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR;
-	rx_status->signal += rx->ppdu.combined_rssi;
+	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_START_VALID) {
+		memset(rx_status, 0, sizeof(*rx_status));
+		rx_status->signal  = ATH10K_DEFAULT_NOISE_FLOOR +
+				     rx->ppdu.combined_rssi;
+	}
 
 	if (rx->ppdu.info0 & HTT_RX_INDICATION_INFO0_END_VALID) {
 		/* TSF available only in 32-bit */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
