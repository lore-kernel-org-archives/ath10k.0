Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEfhq-0001ML-F8
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 17:09:04 +0000
Received: by mail-wm0-x22d.google.com with SMTP id g23so177905813wme.1
 for <ath10k@lists.infradead.org>; Wed, 07 Dec 2016 09:08:13 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 2/5] ath10k: override CE5 config for QCA9377
Date: Wed,  7 Dec 2016 18:07:31 +0100
Message-Id: <1481130454-27244-2-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
References: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Similarly to QCA6174, QCA9377 requires the CE5 configuration to be
available for other feature. Use the ath10k_pci_override_ce_config()
for it as well.

This is required for TF2.0 firmware. Previous FW revisions were
working fine without this patch.

Fixes: a70587b3389a ("ath10k: configure copy engine 5 for HTT messages")
Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 983f65bbb7fb..85367006a80a 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3132,7 +3132,7 @@ int ath10k_pci_setup_resource(struct ath10k *ar)
 	setup_timer(&ar_pci->rx_post_retry, ath10k_pci_rx_replenish_retry,
 		    (unsigned long)ar);
 
-	if (QCA_REV_6174(ar))
+	if (QCA_REV_6174(ar) || QCA_REV_9377(ar))
 		ath10k_pci_override_ce_config(ar);
 
 	ret = ath10k_pci_alloc_pipes(ar);
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
