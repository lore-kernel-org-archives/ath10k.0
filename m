Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([79.140.42.25] helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XHDko-0003J8-39
 for ath10k@lists.infradead.org; Tue, 12 Aug 2014 15:12:54 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: [PATCH] ath10k: unregister spectral before mac
Date: Tue, 12 Aug 2014 17:12:17 +0200
Message-Id: <1407856337-13067-1-git-send-email-sw@simonwunderlich.de>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Simon Wunderlich <sw@simonwunderlich.de>

If spectral is unregistered after mac80211, the relayfs file has already
been removed recursively by mac/cfg80211, and spectral tries to remove
the file once more, thus leading to double free problems. Better clean
up spectral before to avoid that problem.

Reported-by: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Simon Wunderlich <sw@simonwunderlich.de>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d3474b4..ba2e87a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1043,6 +1043,12 @@ void ath10k_core_unregister(struct ath10k *ar)
 	if (!test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags))
 		return;
 
+	/* Stop spectral before unregistering from mac80211 to remove the
+	 * relayfs debugfs file cleanly. Otherwise the parent debugfs tree
+	 * would be already be free'd recursively, leading to a double free.
+	 */
+	ath10k_spectral_destroy(ar);
+
 	/* We must unregister from mac80211 before we stop HTC and HIF.
 	 * Otherwise we will fail to submit commands to FW and mac80211 will be
 	 * unhappy about callback failures. */
@@ -1050,8 +1056,6 @@ void ath10k_core_unregister(struct ath10k *ar)
 
 	ath10k_core_free_firmware_files(ar);
 
-	ath10k_spectral_destroy(ar);
-
 	ath10k_debug_destroy(ar);
 }
 EXPORT_SYMBOL(ath10k_core_unregister);
-- 
2.1.0.rc1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
