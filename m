Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-sn1nam01on0057.outbound.protection.outlook.com
 ([104.47.32.57] helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dEO3b-00082C-Sm
 for ath10k@lists.infradead.org; Fri, 26 May 2017 22:50:09 +0000
From: Norik Dzhandzhapanyan <norikd@ethertronics.com>
Subject: [PATCH] Per chain RSSI reporting
Date: Fri, 26 May 2017 22:49:45 +0000
Message-ID: <SN1PR08MB1373BF583E9CE2AA6A0F6381B0FC0@SN1PR08MB1373.namprd08.prod.outlook.com>
Content-Language: en-US
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Add support for per chain RSSI reporting w/smoothing.

Signed-off-by: Norik Dzhandzhapanyan norikd@ethertronics.com


--- htt_rx.c.orig  2017-05-26 15:26:37.918504255 -0700
+++ htt_rx.c        2017-05-26 12:10:33.139809025 -0700
@@ -825,14 +825,71 @@ static bool ath10k_htt_rx_h_channel(stru
              return true;
}

+/*
+ * Signal data is somewhat glitchy. We smooth it out here with
+ * a 16 point moving average by storing samples in a buffer.
+ * As new samples come in, remove the oldest and add the newest
+ * to the running sum.  Avoids changes/impact to other generic averaging.
+ */
+
+/* Moving average buffer */
+#define MA_SAMPLES (16)
+
+struct ma_buffer
+{
+             int count;
+             int head;
+             int tail;
+             int sum;
+             int samps[MA_SAMPLES];
+};
+
+struct ma_buffer ma_buffers[IEEE80211_MAX_CHAINS] = {{ 0 }};
+
+static int ath_cb_moving_average(struct ma_buffer *mb, int8_t samp)
+{
+             if (mb->count < MA_SAMPLES) {
+                            mb->count++;
+                            mb->sum += samp;
+                            mb->tail = 0;
+             } else {
+                            int oldest = mb->samps[mb->tail];
+                            mb->tail = (mb->head == MA_SAMPLES - 1) ? 0 : mb->head + 1;
+                            mb->sum = mb->sum - oldest + samp;
+             }
+
+             mb->samps[mb->head] = samp;
+             mb->head = (mb->head == MA_SAMPLES - 1) ? 0 : mb->head + 1;
+
+             return (mb->sum / mb->count);
+}
+
static void ath10k_htt_rx_h_signal(struct ath10k *ar,
                                                              struct ieee80211_rx_status *status,
                                                              struct htt_rx_desc *rxd)
{
-              /* FIXME: Get real NF */
-              status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
-                                            rxd->ppdu_start.rssi_comb;
-              status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
+    int i;
+
+    for(i=0;i<IEEE80211_MAX_CHAINS;i++)
+    {
+        status->chains &= ~BIT(i);
+
+        if (rxd->ppdu_start.rssi_chains[i].pri20_mhz != 0x80)
+        {
+            int8_t rssi = ATH10K_DEFAULT_NOISE_FLOOR +
+                rxd->ppdu_start.rssi_chains[i].pri20_mhz;
+
+            status->chains |= BIT(i);
+
+            /* Compute the moving average of rssi */
+                                status->chain_signal[i] = ath_cb_moving_average(&ma_buffers[i], rssi);
+        }
+    }
+
+    /* FIXME: Get real NF */
+    status->signal = ATH10K_DEFAULT_NOISE_FLOOR +
+        rxd->ppdu_start.rssi_comb;
+    status->flag &= ~RX_FLAG_NO_SIGNAL_VAL;
}

 static void ath10k_htt_rx_h_mactime(struct ath10k *ar,
The contents of this transmission are Ethertronics Inc. Confidential and may contain proprietary or legally privileged information which may not be disclosed, copied or distributed without the express written consent of Ethertronics Inc. The information is intended to be for the use of the individual or entity named on this transmission. If you are not the intended recipient, be aware that any disclosure, copying, distribution or use of the contents of this information is prohibited. If you have received this transmission in error, please notify us by telephone immediately so that we can arrange for the retrieval of the original documents at no cost to you. Alternatively, notify the sender by replying to this transmission and delete the message without disclosing it. Thank you

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
