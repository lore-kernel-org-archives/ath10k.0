Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YDWHi-000294-R6
 for ath10k@lists.infradead.org; Tue, 20 Jan 2015 10:43:47 +0000
Received: by mail-wi0-f170.google.com with SMTP id em10so3801389wid.1
 for <ath10k@lists.infradead.org>; Tue, 20 Jan 2015 02:43:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/2] ath10k: fix pmf for wmi-tlv on qca6174
Date: Tue, 20 Jan 2015 11:42:43 +0100
Message-Id: <1421750563-15945-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1421750563-15945-1-git-send-email-michal.kazior@tieto.com>
References: <1421750563-15945-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Marek Kwaczynski <marek.kwaczynski@tieto.com>, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

From: Marek Kwaczynski <marek.kwaczynski@tieto.com>

New wmi-tlv firmware uses HTT 3.0 protocol which
uses TX_FRM command for management frames (instead
of a dedicated command). To support PMF it is
necessary to provide explicit tailroom.

Signed-off-by: Marek Kwaczynski <marek.kwaczynski@tieto.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 5c64139..5780b87 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -481,6 +481,12 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
 	}
 	skb_cb->htt.txbuf_paddr = paddr;
 
+	if ((ieee80211_is_action(hdr->frame_control) ||
+	     ieee80211_is_deauth(hdr->frame_control) ||
+	     ieee80211_is_disassoc(hdr->frame_control)) &&
+	     ieee80211_has_protected(hdr->frame_control))
+		skb_put(msdu, IEEE80211_CCMP_MIC_LEN);
+
 	skb_cb->paddr = dma_map_single(dev, msdu->data, msdu->len,
 				       DMA_TO_DEVICE);
 	res = dma_mapping_error(dev, skb_cb->paddr);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
