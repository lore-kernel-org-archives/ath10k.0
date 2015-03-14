Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWiZn-0007G9-GR
 for ath10k@lists.infradead.org; Sat, 14 Mar 2015 09:41:48 +0000
From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] ath10k: debug: match wait_for_completion_timeout return type
Date: Sat, 14 Mar 2015 05:37:10 -0400
Message-Id: <1426325830-19740-1-git-send-email-hofrat@osadl.org>
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <hofrat@osadl.org>

Return type of wait_for_completion_timeout is unsigned long not int.
An appropriately named unsigned long is added and the assignments fixed up.
Missing spaces 1*HZ -> 1 * HZ were also added along the way.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
---

Patch was only compile tested with x86_64_defconfig + CONFIG_ATH_CARDS=m,
CONFIG_ATH10K=m

Patch is against 4.0-rc3 (localversion-next is -next-20150313)

 drivers/net/wireless/ath/ath10k/debug.c |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 301081d..a252774 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -380,12 +380,12 @@ unlock:
 
 static int ath10k_debug_fw_stats_request(struct ath10k *ar)
 {
-	unsigned long timeout;
+	unsigned long timeout, time_left;
 	int ret;
 
 	lockdep_assert_held(&ar->conf_mutex);
 
-	timeout = jiffies + msecs_to_jiffies(1*HZ);
+	timeout = jiffies + msecs_to_jiffies(1 * HZ);
 
 	ath10k_debug_fw_stats_reset(ar);
 
@@ -404,9 +404,10 @@ static int ath10k_debug_fw_stats_request(struct ath10k *ar)
 			return ret;
 		}
 
-		ret = wait_for_completion_timeout(&ar->debug.fw_stats_complete,
-						  1*HZ);
-		if (ret == 0)
+		time_left =
+		wait_for_completion_timeout(&ar->debug.fw_stats_complete,
+					    1 * HZ);
+		if (!time_left)
 			return -ETIMEDOUT;
 
 		spin_lock_bh(&ar->data_lock);
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
