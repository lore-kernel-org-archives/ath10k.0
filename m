Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dzzM4-0007hC-TM
 for ath10k@lists.infradead.org; Thu, 05 Oct 2017 06:09:58 +0000
From: <akolli@qti.qualcomm.com>
Subject: [PATCH] ath10k: fix sending wmi cmd during the tdls teardown
Date: Thu, 5 Oct 2017 11:42:06 +0530
Message-ID: <1507183926-711-1-git-send-email-akolli@qti.qualcomm.com>
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
Cc: Anilkumar Kolli <akolli@qti.qualcomm.com>, akolli@codeaurora.org, linux-wireless@vger.kernel.org

From: Anilkumar Kolli <akolli@codeaurora.org>

The current firmware 10.4-3.5.1-00035 on QCA9888 supports
TDLS explicit mode, it expects WMI_TDLS_ENABLE_PASSIVE
for tdls setup and WMI_TDLS_DISABLE for tdls teardown.

Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 38a97086708b..cad2e42dcef6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7870,7 +7870,8 @@ static int ath10k_wmi_10_4_op_get_vdev_subtype(struct ath10k *ar,
 	if (!skb)
 		return ERR_PTR(-ENOMEM);
 
-	if (test_bit(WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY, ar->wmi.svc_map))
+	if (test_bit(WMI_SERVICE_TDLS_EXPLICIT_MODE_ONLY, ar->wmi.svc_map) &&
+	    state == WMI_TDLS_ENABLE_ACTIVE)
 		state = WMI_TDLS_ENABLE_PASSIVE;
 
 	if (test_bit(WMI_SERVICE_TDLS_UAPSD_BUFFER_STA, ar->wmi.svc_map))
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
