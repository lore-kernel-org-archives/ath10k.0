Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from www.osadl.org ([62.245.132.105])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y5vre-0000nF-Bd
 for ath10k@lists.infradead.org; Tue, 30 Dec 2014 12:25:31 +0000
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: [PATCH 4/4] ath10k: fixup wait_for_completion_timeout return handling
Date: Tue, 30 Dec 2014 07:20:46 -0500
Message-Id: <1419942046-17985-5-git-send-email-der.herr@hofr.at>
In-Reply-To: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
References: <1419942046-17985-1-git-send-email-der.herr@hofr.at>
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
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, Nicholas Mc Guire <der.herr@hofr.at>, Michal Kazior <michal.kazior@tieto.com>, Yanbo Li <yanbol@qti.qualcomm.com>, Ben Greear <greearb@candelatech.com>

wait_for_completion_timeout does not return negative values so
"ret" handling here should check for timeout only.

patch was only compile tested for x86_64_defconfig + CONFIG_ATH10K=m

patch is against linux-next 3.19.0-rc1 -next-20141226

Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 drivers/net/wireless/ath/ath10k/htt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.c b/drivers/net/wireless/ath/ath10k/htt.c
index 56cb4ac..58b6fc1 100644
--- a/drivers/net/wireless/ath/ath10k/htt.c
+++ b/drivers/net/wireless/ath/ath10k/htt.c
@@ -102,7 +102,7 @@ int ath10k_htt_setup(struct ath10k_htt *htt)
 
 	status = wait_for_completion_timeout(&htt->target_version_received,
 					     HTT_TARGET_VERSION_TIMEOUT_HZ);
-	if (status <= 0) {
+	if (status == 0) {
 		ath10k_warn(ar, "htt version request timed out\n");
 		return -ETIMEDOUT;
 	}
-- 
1.7.10.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
