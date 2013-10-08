Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pb0-x22e.google.com ([2607:f8b0:400e:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTNZj-0007mX-5L
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 03:03:07 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so7941467pbb.19
 for <ath10k@lists.infradead.org>; Mon, 07 Oct 2013 20:02:44 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix RX performance when using AP 10.X FW
Date: Mon,  7 Oct 2013 20:00:36 -0700
Message-Id: <1381201236-17035-1-git-send-email-michal.kazior@tieto.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Due to oversight AP 10.X support was merged with
Ethernet RX decap mode.

Only Native Wifi RX decap mode guarantees IP
header is properly aligned and avoids sk_buff data
realignment (which is very expensive
performance-wise) in mac80211.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 3fd7b98..8aeb46d 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -123,7 +123,7 @@ enum ath10k_mcast2ucast_mode {
 #define TARGET_10X_RX_CHAIN_MASK		(BIT(0) | BIT(1) | BIT(2))
 #define TARGET_10X_RX_TIMEOUT_LO_PRI		100
 #define TARGET_10X_RX_TIMEOUT_HI_PRI		40
-#define TARGET_10X_RX_DECAP_MODE		ATH10K_HW_TXRX_ETHERNET
+#define TARGET_10X_RX_DECAP_MODE		ATH10K_HW_TXRX_NATIVE_WIFI
 #define TARGET_10X_SCAN_MAX_PENDING_REQS	4
 #define TARGET_10X_BMISS_OFFLOAD_MAX_VDEV	2
 #define TARGET_10X_ROAM_OFFLOAD_MAX_VDEV	2
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
