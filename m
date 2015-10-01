Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh01.mail.saunalahti.fi ([62.142.5.107])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhbSj-0006Jx-6b
 for ath10k@lists.infradead.org; Thu, 01 Oct 2015 10:51:45 +0000
Subject: [PATCH 6/6] ath10k: split an unnecessary long line
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Thu, 01 Oct 2015 13:51:21 +0300
Message-ID: <20151001105121.8770.73290.stgit@potku.adurom.net>
In-Reply-To: <20151001105001.8770.96252.stgit@potku.adurom.net>
References: <20151001105001.8770.96252.stgit@potku.adurom.net>
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

from checkpatch:

drivers/net/wireless/ath/ath10k/mac.c:1113: line over 90 characters

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index ab0864feb514..75573ece6373 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1110,7 +1110,8 @@ static int ath10k_monitor_recalc(struct ath10k *ar)
 
 			ret = ath10k_monitor_stop(ar);
 			if (ret)
-				ath10k_warn(ar, "failed to stop disallowed monitor: %d\n", ret);
+				ath10k_warn(ar, "failed to stop disallowed monitor: %d\n",
+					    ret);
 				/* not serious */
 		}
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
