Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHQ3q-0005DG-Nm
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 05:25:51 +0000
From: Raja Mani <rmani@qti.qualcomm.com>
Subject: [PATCH 2/2] ath10k: Increase max client to 512 in qca99x0
Date: Tue, 21 Jul 2015 10:52:58 +0530
Message-ID: <1437456178-7862-2-git-send-email-rmani@qti.qualcomm.com>
In-Reply-To: <1437456178-7862-1-git-send-email-rmani@qti.qualcomm.com>
References: <1437456178-7862-1-git-send-email-rmani@qti.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Raja Mani <rmani@qti.qualcomm.com>

When max client was set to 512 in qca99x0, there was host memory
alloc failure during wmi service ready event handling. This issue
got resolved now, increasing max client limit from 256 to 512.

Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 9172285..a43105d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -363,10 +363,7 @@ enum ath10k_hw_rate_cck {
 						 (TARGET_10_4_NUM_VDEVS))
 #define TARGET_10_4_ACTIVE_PEERS		0
 
-/* TODO: increase qcache max client limit to 512 after
- * testing with 512 client.
- */
-#define TARGET_10_4_NUM_QCACHE_PEERS_MAX	256
+#define TARGET_10_4_NUM_QCACHE_PEERS_MAX	512
 #define TARGET_10_4_QCACHE_ACTIVE_PEERS		50
 #define TARGET_10_4_NUM_OFFLOAD_PEERS		0
 #define TARGET_10_4_NUM_OFFLOAD_REORDER_BUFFS	0
-- 
1.8.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
