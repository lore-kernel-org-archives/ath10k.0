Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSBQ7-0002ne-8N
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 20:24:32 +0000
Received: by mail-ee0-f49.google.com with SMTP id c41so4866721eek.36
 for <ath10k@lists.infradead.org>; Mon, 24 Mar 2014 13:24:04 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH v2 3/8] ath10k: introduce ieee80211_rx_status to htt_rx_info
Date: Mon, 24 Mar 2014 21:23:17 +0100
Message-Id: <1395692603-4693-3-git-send-email-janusz.dziedzic@tieto.com>
In-Reply-To: <1395692603-4693-1-git-send-email-janusz.dziedzic@tieto.com>
References: <1395692603-4693-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Will be used as a template, and final storage for
rx_status.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt.h    |    2 ++
 drivers/net/wireless/ath/ath10k/htt_rx.c |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
index 654867f..e80f033 100644
--- a/drivers/net/wireless/ath/ath10k/htt.h
+++ b/drivers/net/wireless/ath/ath10k/htt.h
@@ -21,6 +21,7 @@
 #include <linux/bug.h>
 #include <linux/interrupt.h>
 #include <linux/dmapool.h>
+#include <net/mac80211.h>
 
 #include "htc.h"
 #include "rx_desc.h"
@@ -1174,6 +1175,7 @@ struct htt_peer_unmap_event {
 
 struct htt_rx_info {
 	struct sk_buff *skb;
+	struct ieee80211_rx_status rx_status;
 	enum htt_rx_mpdu_status status;
 	enum htt_rx_mpdu_encrypt_type encrypt_type;
 	s8 signal;
diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fd14c3a..f18e41c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -756,7 +756,7 @@ static void ath10k_process_rx(struct ath10k *ar, struct htt_rx_info *info)
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)info->skb->data;
 
 	status = IEEE80211_SKB_RXCB(info->skb);
-	memset(status, 0, sizeof(*status));
+	memcpy(status, &info->rx_status, sizeof(*status));
 
 	if (info->encrypt_type != HTT_RX_MPDU_ENCRYPT_NONE) {
 		status->flag |= RX_FLAG_DECRYPTED | RX_FLAG_IV_STRIPPED |
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
