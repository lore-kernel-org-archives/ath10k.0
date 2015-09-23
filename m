Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZerLc-0001hU-Hh
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 21:13:04 +0000
From: Peter Oh <poh@qca.qualcomm.com>
Subject: [PATCH] ath10k: use Rx decap mode configured when driver registered
Date: Wed, 23 Sep 2015 14:12:20 -0700
Message-ID: <1443042740-31928-1-git-send-email-poh@qca.qualcomm.com>
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

ath10k is using Native WiFi mode as default mode for both of
Tx and Rx path, but it could be changed when driver registers
with a module parameter for specific purpose such as mesh.

The Rx decap mode sent to firmware during WMI initialization should
use the same mode that driver configured at its registration stage
in case of using raw mode, so that host driver receives MAC frame
header containing necessary fields such as QoS and Mesh Control
and uses them in right way to make data traffic work.

Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 87d9de2..78da56c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5090,7 +5090,7 @@ static struct sk_buff *ath10k_wmi_10_4_op_gen_init(struct ath10k *ar)
 	config.rx_timeout_pri[2] = __cpu_to_le32(TARGET_10_4_RX_TIMEOUT_LO_PRI);
 	config.rx_timeout_pri[3] = __cpu_to_le32(TARGET_10_4_RX_TIMEOUT_HI_PRI);
 
-	config.rx_decap_mode	    = __cpu_to_le32(TARGET_10_4_RX_DECAP_MODE);
+	config.rx_decap_mode	    = __cpu_to_le32(ar->wmi.rx_decap_mode);
 	config.scan_max_pending_req = __cpu_to_le32(TARGET_10_4_SCAN_MAX_REQS);
 	config.bmiss_offload_max_vdev =
 			__cpu_to_le32(TARGET_10_4_BMISS_OFFLOAD_MAX_VDEV);
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
