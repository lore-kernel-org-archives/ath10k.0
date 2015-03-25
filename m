Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x232.google.com ([2a00:1450:4010:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YagVj-0008MW-Iq
 for ath10k@lists.infradead.org; Wed, 25 Mar 2015 08:18:01 +0000
Received: by lbcgn8 with SMTP id gn8so11843298lbc.2
 for <ath10k@lists.infradead.org>; Wed, 25 Mar 2015 01:17:28 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: disable burst mode
Date: Wed, 25 Mar 2015 09:14:51 +0100
Message-Id: <1427271291-31683-1-git-send-email-janusz.dziedzic@tieto.com>
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

Firmwares that indicate BURST_SERVICE as enabled
could overwrite some wmm parameters (eg. txop).
This could lead IOT and balancing issues.
Hence disable this by default.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 75dcd3a..b0d550b 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -3079,6 +3079,7 @@ static int ath10k_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx_ant)
 static int ath10k_start(struct ieee80211_hw *hw)
 {
 	struct ath10k *ar = hw->priv;
+	u32 burst_enable;
 	int ret = 0;
 
 	/*
@@ -3133,6 +3134,15 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		goto err_core_stop;
 	}
 
+	if (test_bit(WMI_SERVICE_BURST, ar->wmi.svc_map)) {
+		burst_enable = ar->wmi.pdev_param->burst_enable;
+		ret = ath10k_wmi_pdev_set_param(ar, burst_enable, 0);
+		if (ret) {
+			ath10k_warn(ar, "failed to disable burst: %d\n", ret);
+			goto err_core_stop;
+		}
+	}
+
 	if (ar->cfg_tx_chainmask)
 		__ath10k_set_antenna(ar, ar->cfg_tx_chainmask,
 				     ar->cfg_rx_chainmask);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
