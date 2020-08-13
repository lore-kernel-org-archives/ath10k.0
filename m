Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69ox-0005vA-5v
 for ath10k@lists.infradead.org; Thu, 13 Aug 2020 09:47:00 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: [PATCH 3/3] ath10k: enable supports_peer_stats_info for QCA6174 PCI
 devices
Date: Thu, 13 Aug 2020 17:47:09 +0800
Message-Id: <1597312029-32348-4-git-send-email-wgong@codeaurora.org>
In-Reply-To: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
References: <1597312029-32348-1-git-send-email-wgong@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, wgong@codeaurora.org

When using QCA6174 PCI devices working in station mode, after connected
to AP, tx bitrate is always '1.0 MBit/s' in output of command 'iw wlan0
station dump'. (QCA6174 SDIO devices are working fine.)

After this patch, it show correct bitrate:

Station c4:04:15:5d:97:22 (on wls1)
        inactive time:  312 ms
        rx bytes:       31496
        rx packets:     173
        tx bytes:       8625
        tx packets:     46
        tx retries:     0
        tx failed:      0
        signal:         -76 [-88, -80] dBm
        signal avg:     -75 [-82, -77] dBm
        tx bitrate:     39.0 MBit/s MCS 4
        rx bitrate:     26.0 MBit/s MCS 3

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1

Signed-off-by: Wen Gong <wgong@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 22b6937ac225..c4f098c4431f 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -334,6 +334,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.hw_filter_reset_required = true,
 		.fw_diag_ce_download = true,
 		.tx_stats_over_pktlog = false,
+		.supports_peer_stats_info = true,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
