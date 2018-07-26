Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fiaag-0005Ei-KG
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 07:21:51 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 2/2] ath10k: Set sk_pacing_shift to 6 for 11AC WiFi chips
Date: Thu, 26 Jul 2018 15:21:17 +0800
Message-Id: <1532589677-16428-3-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
References: <1532589677-16428-1-git-send-email-wgong@codeaurora.org>
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
To: ath10k@lists.infradead.org, johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org

Upstream kernel has an interface to help adjust sk_pacing_shift to help
improve TCP UL throughput.
The sk_pacing_shift is 8 in mac80211, this is based on test with 11N
WiFi chips with ath9k. For QCA6174/QCA9377 PCI 11AC chips, the 11AC
VHT80 TCP UL throughput testing result shows 6 is the optimal.
Overwrite the sk_pacing_shift to 6 in ath10k driver.

Tested with QCA6174 PCI with firmware
WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
It's not a regression with new firmware releases.

There have 2 test result of different settings:

ARM CPU based device with QCA6174A PCI with different
sk_pacing_shift:

 sk_pacing_shift  throughput(Mbps)             CPU utilization
         6            500(-P5)      ~75% idle, Focus on CPU1: ~14%idle
         7            454(-P5)      ~80% idle, Focus on CPU1: ~4%idle
         8               288        ~90% idle, Focus on CPU1: ~35%idle
         9              ~200        ~92% idle, Focus on CPU1: ~50%idle

5G TCP UL VTH80 on X86 platform with QCA6174A PCI with sk_packing_shift
set to 6:

  tcp_limit_output_bytes            throughput(Mbps)
 default(262144)+1 Stream                 336
 default(262144)+2 Streams                558
 default(262144)+3 Streams                584
 default(262144)+4 Streams                602
 default(262144)+5 Streams                598
 changed(2621440)+1 Stream                598
 changed(2621440)+2 Streams               601

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index f31ae3b..40d24c1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8348,6 +8348,8 @@ int ath10k_mac_register(struct ath10k *ar)
 	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
 	ar->hw->wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
 
+	ar->hw->tx_sk_pacing_shift = 6;
+
 	ar->hw->vif_data_size = sizeof(struct ath10k_vif);
 	ar->hw->sta_data_size = sizeof(struct ath10k_sta);
 	ar->hw->txq_data_size = sizeof(struct ath10k_txq);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
