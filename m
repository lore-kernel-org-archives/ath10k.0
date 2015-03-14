Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWhv6-0001uR-Qh
 for ath10k@lists.infradead.org; Sat, 14 Mar 2015 08:59:46 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH 1/2] ath10k: wmi: match wait_for_completion_timeout return type
Date: Sat, 14 Mar 2015 04:55:02 -0400
Message-Id: <1426323302-1310-1-git-send-email-hofrat@osadl.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Michal Kazior <michal.kazior@tieto.com>, Nicholas Mc Guire <hofrat@osadl.org>

return type of wait_for_completion_timeout is unsigned long not int. This
patch adjusts the type and name of the return variable and adjusts the 
success/fail values to match those used at the call site in ath10k_core_start

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Adjustment of return values was proposed by Michal Kazior
<michal.kazior@tieto.com> - thanks!

Patch was only compile tested with x86_64_defconfig + CONFIG_ATH_CARDS=m,
CONFIG_ATH10K=m

Patch is against 4.0-rc3 (localversion-next is -next-20150313)

 drivers/net/wireless/ath/ath10k/wmi.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index c7ea77e..65e495d 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -884,20 +884,24 @@ void ath10k_wmi_put_wmi_channel(struct wmi_channel *ch,
 
 int ath10k_wmi_wait_for_service_ready(struct ath10k *ar)
 {
-	int ret;
+	unsigned long time_left;
 
-	ret = wait_for_completion_timeout(&ar->wmi.service_ready,
-					  WMI_SERVICE_READY_TIMEOUT_HZ);
-	return ret;
+	time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
+						WMI_SERVICE_READY_TIMEOUT_HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
+	return 0;
 }
 
 int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar)
 {
-	int ret;
+	unsigned long time_left;
 
-	ret = wait_for_completion_timeout(&ar->wmi.unified_ready,
-					  WMI_UNIFIED_READY_TIMEOUT_HZ);
-	return ret;
+	time_left = wait_for_completion_timeout(&ar->wmi.unified_ready,
+						WMI_UNIFIED_READY_TIMEOUT_HZ);
+	if (!time_left)
+		return -ETIMEDOUT;
+	return 0;
 }
 
 struct sk_buff *ath10k_wmi_alloc_skb(struct ath10k *ar, u32 len)
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
