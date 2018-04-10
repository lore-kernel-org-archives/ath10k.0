Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5nrU-0006iu-TX
 for ath10k@lists.infradead.org; Tue, 10 Apr 2018 07:38:42 +0000
From: zhichen@codeaurora.org
Subject: [PATCH] ath10k: fix tlv 5ghz channel missing issue
Date: Tue, 10 Apr 2018 15:39:54 +0800
Message-Id: <1523345994-28800-2-git-send-email-zhichen@codeaurora.org>
In-Reply-To: <1523345994-28800-1-git-send-email-zhichen@codeaurora.org>
References: <1523345994-28800-1-git-send-email-zhichen@codeaurora.org>
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
Cc: Zhi Chen <zhichen@codeaurora.org>, kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org

From: Zhi Chen <zhichen@codeaurora.org>

The 5ghz channel parameters of TLV target wasn't passed to host, it caused
host can only use lower channels from 36 to 64.

Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/wmi-tlv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
index 25efbb5..b8985ce 100644
--- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
+++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
@@ -1010,6 +1010,8 @@ static int ath10k_wmi_tlv_op_pull_svc_rdy_ev(struct ath10k *ar,
 	arg->phy_capab = ev->phy_capability;
 	arg->num_rf_chains = ev->num_rf_chains;
 	arg->eeprom_rd = reg->eeprom_rd;
+	arg->low_5ghz_chan = reg->low_5ghz_chan;
+	arg->high_5ghz_chan = reg->high_5ghz_chan;
 	arg->num_mem_reqs = ev->num_mem_reqs;
 	arg->service_map = svc_bmap;
 	arg->service_map_len = ath10k_wmi_tlv_len(svc_bmap);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
