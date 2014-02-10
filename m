Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x235.google.com ([2a00:1450:4013:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WCpkC-0001Ot-M6
 for ath10k@lists.infradead.org; Mon, 10 Feb 2014 12:13:49 +0000
Received: by mail-ea0-f181.google.com with SMTP id k10so737548eaj.12
 for <ath10k@lists.infradead.org>; Mon, 10 Feb 2014 04:13:25 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH] ath10k: AP: handle HT station which does not have HT RX MCS
Date: Mon, 10 Feb 2014 13:12:55 +0100
Message-Id: <1392034375-13532-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This is a workaround for HT-enabled STAs which break the spec
and have no HT capabilities RX mask (no HT RX MCS map).

As per spec, in section 20.3.5 Modulation and coding scheme (MCS),
MCS 0 through 7 are mandatory in 20MHz with 800 ns GI at all STAs.

Firmware asserts if such situation occurs.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 144b4d6..162920a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1148,8 +1148,23 @@ static void ath10k_peer_assoc_h_ht(struct ath10k *ar,
 		if (ht_cap->mcs.rx_mask[i/8] & (1 << i%8))
 			arg->peer_ht_rates.rates[n++] = i;
 
-	arg->peer_ht_rates.num_rates = n;
-	arg->peer_num_spatial_streams = max((n+7) / 8, 1);
+	/*
+	 * This is a workaround for HT-enabled STAs which break the spec
+	 * and have no HT capabilities RX mask (no HT RX MCS map).
+	 *
+	 * As per spec, in section 20.3.5 Modulation and coding scheme (MCS),
+	 * MCS 0 through 7 are mandatory in 20MHz with 800 ns GI at all STAs.
+	 *
+	 * Firmware asserts if such situation occurs.
+	 */
+	if (n == 0) {
+		arg->peer_ht_rates.num_rates = 8;
+		for (i = 0; i < arg->peer_ht_rates.num_rates; i++)
+			arg->peer_ht_rates.rates[i] = i;
+	} else {
+		arg->peer_ht_rates.num_rates = n;
+		arg->peer_num_spatial_streams = max((n+7) / 8, 1);
+	}
 
 	ath10k_dbg(ATH10K_DBG_MAC, "mac ht peer %pM mcs cnt %d nss %d\n",
 		   arg->addr,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
