Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x231.google.com ([2a00:1450:4013:c00::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIBxY-0005yP-OA
 for ath10k@lists.infradead.org; Tue, 25 Feb 2014 06:57:45 +0000
Received: by mail-ee0-f49.google.com with SMTP id b57so512015eek.22
 for <ath10k@lists.infradead.org>; Mon, 24 Feb 2014 22:57:16 -0800 (PST)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: skip management frames in HTT path
Date: Tue, 25 Feb 2014 07:56:39 +0100
Message-Id: <1393311399-8070-1-git-send-email-janusz.dziedzic@tieto.com>
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

After we pass frames with INV_PEER to upper layer in patch:

ath10k: pass frames with invalid peer status to upper layer

we could pass some management frames (in case INVALID_PEER
and MGMT_CTRL) twice to upper layer, once via WMI and once
via HTT. Next we could handle assoc request twice. This
patch remove such regression.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index c7a5822..316433f 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -852,6 +852,20 @@ static bool ath10k_htt_rx_has_mic_err(struct sk_buff *skb)
 	return false;
 }
 
+static bool ath10k_htt_rx_is_mgmt(struct sk_buff *skb)
+{
+	struct htt_rx_desc *rxd;
+	u32 flags;
+
+	rxd = (void *)skb->data - sizeof(*rxd);
+	flags = __le32_to_cpu(rxd->attention.flags);
+
+	if (flags & RX_ATTENTION_FLAGS_MGMT_TYPE)
+		return true;
+
+	return false;
+}
+
 static int ath10k_htt_rx_get_csum_state(struct sk_buff *skb)
 {
 	struct htt_rx_desc *rxd;
@@ -944,7 +958,8 @@ static void ath10k_htt_rx_handler(struct ath10k_htt *htt,
 			status = info.status;
 
 			/* Skip mgmt frames while we handle this in WMI */
-			if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL) {
+			if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
+			    ath10k_htt_rx_is_mgmt(msdu_head)) {
 				ath10k_htt_rx_free_msdu_chain(msdu_head);
 				continue;
 			}
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
