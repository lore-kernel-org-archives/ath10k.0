Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wi9k7-0002lC-BZ
 for ath10k@lists.infradead.org; Wed, 07 May 2014 21:51:12 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/2] ath10k: Fix spelling mistake in comments.
Date: Wed,  7 May 2014 14:50:39 -0700
Message-Id: <1399499440-32365-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

Simple typo fix.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index fa31b23..71a4470 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2340,9 +2340,9 @@ struct wmi_pdev_param_map {
 #define WMI_PDEV_PARAM_UNSUPPORTED 0
 
 enum wmi_pdev_param {
-	/* TX chian mask */
+	/* TX chain mask */
 	WMI_PDEV_PARAM_TX_CHAIN_MASK = 0x1,
-	/* RX chian mask */
+	/* RX chain mask */
 	WMI_PDEV_PARAM_RX_CHAIN_MASK,
 	/* TX power limit for 2G Radio */
 	WMI_PDEV_PARAM_TXPOWER_LIMIT2G,
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
