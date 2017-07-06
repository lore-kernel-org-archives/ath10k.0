Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dT0V9-0007su-Kb
 for ath10k@lists.infradead.org; Thu, 06 Jul 2017 06:43:01 +0000
Subject: [PATCH] ath10k: fix indenting in ath10k_wmi_update_noa()
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 6 Jul 2017 09:42:20 +0300
Message-ID: <149932333976.15174.4921279022358234069.stgit@potku.adurom.net>
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

Commit 59ae1d127ac0 ("networking: introduce and use skb_put_data()") introduced
a new checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi.c:3308: code indent should use tabs where possible

Fix that.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 3efb404b83c0..96cd1ebd6a7e 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -3305,7 +3305,7 @@ static void ath10k_wmi_update_noa(struct ath10k *ar, struct ath10k_vif *arvif,
 	if (arvif->u.ap.noa_data)
 		if (!pskb_expand_head(bcn, 0, arvif->u.ap.noa_len, GFP_ATOMIC))
 			skb_put_data(bcn, arvif->u.ap.noa_data,
-			             arvif->u.ap.noa_len);
+				     arvif->u.ap.noa_len);
 }
 
 static int ath10k_wmi_op_pull_swba_ev(struct ath10k *ar, struct sk_buff *skb,


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
