Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YM19z-0006PP-W0
 for ath10k@lists.infradead.org; Thu, 12 Feb 2015 21:18:56 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH 2/3] ath10k: Update chirp value in pulse event
Date: Thu, 12 Feb 2015 13:17:04 -0800
Message-ID: <1423775825-19498-2-git-send-email-poh@qca.qualcomm.com>
In-Reply-To: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com>
References: <1423775825-19498-1-git-send-email-poh@qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org

Firmware reports chirp status in phy error event if it's detected
and the chirp status is valuable to distinguish radar types.
So save it to use for DFS parttern detector.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 81561e4..0c06361 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2550,7 +2550,7 @@ static void ath10k_dfs_radar_report(struct ath10k *ar,
 	pe.freq = ar->hw->conf.chandef.chan->center_freq;
 	pe.width = width;
 	pe.rssi = rssi;
-
+	pe.chirp = (MS(reg0, RADAR_REPORT_REG0_PULSE_IS_CHIRP) != 0);
 	ath10k_dbg(ar, ATH10K_DBG_REGULATORY,
 		   "dfs add pulse freq: %d, width: %d, rssi %d, tsf: %llX\n",
 		   pe.freq, pe.width, pe.rssi, pe.ts);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
