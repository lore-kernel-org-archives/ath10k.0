Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnYnR-0003N3-36
 for ath10k@lists.infradead.org; Mon, 13 Mar 2017 22:50:35 +0000
From: <ryanhsu@qca.qualcomm.com>
Subject: [PATCH 4.11] ath10k: fix incorrect wlan_mac_base in qca6174_regs
Date: Mon, 13 Mar 2017 15:49:03 -0700
Message-ID: <1489445343-8719-1-git-send-email-ryanhsu@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: ryanhsu@qca.qualcomm.com

From: Ryan Hsu <ryanhsu@qca.qualcomm.com>

In the 'commit ebee76f7fa46 ("ath10k: allow setting coverage class")',
it inherits the design and the address offset from ath9k, but the address
is not applicable to QCA6174, which leads to a random crash while doing the
resume() operation, since the set_coverage_class.ops will be called from
ieee80211_reconfig() when resume() (if the wow is not configured).

Fix the incorrect address offset here to avoid the random crash.

Verified on QCA6174/hw3.0 with firmware WLAN.RM.4.4-00022-QCARMSWPZ-2.

Fixes: ebee76f7fa46 ("ath10k: allow setting coverage class")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Hsu <ryanhsu@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index 33fb268..d9f37ee 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -51,7 +51,7 @@
 	.rtc_soc_base_address			= 0x00000800,
 	.rtc_wmac_base_address			= 0x00001000,
 	.soc_core_base_address			= 0x0003a000,
-	.wlan_mac_base_address			= 0x00020000,
+	.wlan_mac_base_address			= 0x00010000,
 	.ce_wrapper_base_address		= 0x00034000,
 	.ce0_base_address			= 0x00034400,
 	.ce1_base_address			= 0x00034800,
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
