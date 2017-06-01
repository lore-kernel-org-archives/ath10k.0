Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGVV4-0000zm-0I
 for ath10k@lists.infradead.org; Thu, 01 Jun 2017 19:11:15 +0000
Received: by mail-pf0-x242.google.com with SMTP id w69so8377375pfk.1
 for <ath10k@lists.infradead.org>; Thu, 01 Jun 2017 12:10:53 -0700 (PDT)
MIME-Version: 1.0
From: Norik Dzhandzhapanyan <norikd@gmail.com>
Date: Thu, 1 Jun 2017 12:10:52 -0700
Message-ID: <CAAV6Hgmjq9DDpcUUTZtDwodUjKrkzjnKSNZ+sK8U=M_AQgr-iQ@mail.gmail.com>
Subject: [PATCH 1/1] Add per chain RSSI reporting.
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org

Report per chain RSSI

Signed-off-by: Norik Dzhandzhapanyan <norikd@gmail.com>

---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c
b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 6c0a821fe79d..110953e0bff9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -829,6 +829,22 @@ static void ath10k_htt_rx_h_signal(struct ath10k *ar,
                    struct ieee80211_rx_status *status,
                    struct htt_rx_desc *rxd)
 {
+    int i;
+
+    for(i=0;i<IEEE80211_MAX_CHAINS;i++)
+    {
+        status->chains &= ~BIT(i);
+
+        if (rxd->ppdu_start.rssi_chains[i].pri20_mhz != 0x80)
+        {
+            status->chain_signal[i] = ATH10K_DEFAULT_NOISE_FLOOR +
+                rxd->ppdu_start.rssi_chains[i].pri20_mhz;
+
+            status->chains |= BIT(i);
+
+        }
+    }
+
     /* FIXME: Get real NF */
     status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
              rxd->ppdu_start.rssi_comb;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
