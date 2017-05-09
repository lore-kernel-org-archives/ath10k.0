Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from gateway31.websitewelcome.com ([192.185.143.40])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7wfU-0006mK-Q9
 for ath10k@lists.infradead.org; Tue, 09 May 2017 04:22:38 +0000
Received: from cm2.websitewelcome.com (cm2.websitewelcome.com [192.185.178.13])
 by gateway31.websitewelcome.com (Postfix) with ESMTP id 610D2810A07
 for <ath10k@lists.infradead.org>; Mon,  8 May 2017 23:22:02 -0500 (CDT)
Date: Mon, 8 May 2017 23:21:59 -0500
From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] net: wireless: ath: ath10k: remove unnecessary code
Message-ID: <20170509042159.GA19727@embeddedgus>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>

The name of an array used by itself will always return the array's address.
So these tests will always evaluate as false and therefore the _return_
will never be executed.

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 2f1743e..135cf83 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -5933,15 +5933,6 @@ static struct sk_buff *ath10k_wmi_10_4_op_gen_init(struct ath10k *ar)
 
 int ath10k_wmi_start_scan_verify(const struct wmi_start_scan_arg *arg)
 {
-	if (arg->ie_len && !arg->ie)
-		return -EINVAL;
-	if (arg->n_channels && !arg->channels)
-		return -EINVAL;
-	if (arg->n_ssids && !arg->ssids)
-		return -EINVAL;
-	if (arg->n_bssids && !arg->bssids)
-		return -EINVAL;
-
 	if (arg->ie_len > WLAN_SCAN_PARAMS_MAX_IE_LEN)
 		return -EINVAL;
 	if (arg->n_channels > ARRAY_SIZE(arg->channels))
-- 
2.5.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
