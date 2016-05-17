Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b2aSe-0006HX-V6
 for ath10k@lists.infradead.org; Tue, 17 May 2016 08:34:41 +0000
From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Subject: [PATCH] ath10k: Fix legacy rate packet debug messages
Date: Tue, 17 May 2016 14:05:31 +0530
Message-ID: <1463474131-26835-1-git-send-email-mohammed@qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

Legacy rate packets may not necessarily be having a rx status
flag of '0' always, for example management frame have flags
like RX_FLAG_ONLY_MONITOR / RX_FLAG_MACTIME_END also set

Just check 'VHT' and 'HT' flags are not set , and simply clasify it as
legacy rate packets

Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index cc979a4..0419a21 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -939,7 +939,8 @@ static void ath10k_process_rx(struct ath10k *ar,
 		   is_multicast_ether_addr(ieee80211_get_DA(hdr)) ?
 							"mcast" : "ucast",
 		   (__le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_SEQ) >> 4,
-		   status->flag == 0 ? "legacy" : "",
+		   (status->flag & (RX_FLAG_HT | RX_FLAG_VHT)) == 0 ?
+							"legacy" : "",
 		   status->flag & RX_FLAG_HT ? "ht" : "",
 		   status->flag & RX_FLAG_VHT ? "vht" : "",
 		   status->flag & RX_FLAG_40MHZ ? "40" : "",
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
