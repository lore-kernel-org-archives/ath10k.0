Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZMqqt-0000RR-Gn
 for ath10k@lists.infradead.org; Wed, 05 Aug 2015 05:02:56 +0000
Received: by qgeh16 with SMTP id h16so22450328qge.3
 for <ath10k@lists.infradead.org>; Tue, 04 Aug 2015 22:02:34 -0700 (PDT)
From: Victor van Poppelen <vvanpo@gmail.com>
Subject: [PATCH] ath10k: initialize features string in
 ath10k_print_driver_info() to prevent garbled dmesg output when fw_features
 == 0
Date: Wed,  5 Aug 2015 01:02:28 -0400
Message-Id: <1438750948-3842-1-git-send-email-vvanpo@gmail.com>
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
Cc: Victor van Poppelen <vvanpo@gmail.com>

---
 drivers/net/wireless/ath/ath10k/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index 1a33bf0..5f32924 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -124,7 +124,7 @@ EXPORT_SYMBOL(ath10k_info);
 
 void ath10k_print_driver_info(struct ath10k *ar)
 {
-	char fw_features[128];
+	char fw_features[128] = "";
 
 	ath10k_core_get_fw_features_str(ar, fw_features, sizeof(fw_features));
 
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
