Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFaHf-0002eL-Ra
 for ath10k@lists.infradead.org; Thu, 16 Jul 2015 03:56:33 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NRK00X93AXJNA30@mailout4.samsung.com> for
 ath10k@lists.infradead.org; Thu, 16 Jul 2015 12:56:07 +0900 (KST)
From: Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] ath10k: fixing wrong initialization of struct channel
Date: Thu, 16 Jul 2015 09:25:33 +0530
Message-id: <1437018933-25832-1-git-send-email-maninder1.s@samsung.com>
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
To: kvalo@qca.qualcomm.com, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Maninder Singh <maninder1.s@samsung.com>, pankaj.m@samsung.com

chandef is initialized with NULL and on the very next line,
we are using it to get channel, which is not correct.

channel should be initialized after obtaining chandef.

Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 218b6af..3d196b5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -836,7 +836,7 @@ static inline int ath10k_vdev_setup_sync(struct ath10k *ar)
 static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
 {
 	struct cfg80211_chan_def *chandef = NULL;
-	struct ieee80211_channel *channel = chandef->chan;
+	struct ieee80211_channel *channel = NULL;
 	struct wmi_vdev_start_request_arg arg = {};
 	int ret = 0;
 
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
