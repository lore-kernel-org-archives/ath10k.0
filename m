Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAkz3-0002gd-CZ
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 19:49:05 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/8] ath10k:  add wmi-id to htc credits debugging.
Date: Mon, 12 Jan 2015 10:32:38 -0800
Message-Id: <1421087564-10384-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
References: <1421087564-10384-1-git-send-email-greearb@candelatech.com>
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

This helps when trying to figure out exactly which commands
are consuming credits when trying to debug wmi credit hangs.
---
 drivers/net/wireless/ath/ath10k/htc.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index d56e7f6..16b939a 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -137,9 +137,18 @@ int ath10k_htc_send(struct ath10k_htc *htc,
 			goto err_pull;
 		}
 		ep->tx_credits -= credits;
-		ath10k_dbg(ar, ATH10K_DBG_HTC,
-			   "htc ep %d consumed %d credits (total %d)\n",
-			   eid, credits, ep->tx_credits);
+		if (eid == ar->wmi.eid) {
+			struct wmi_cmd_hdr* hdr;
+			hdr = (struct wmi_cmd_hdr*)(skb->data + sizeof(struct ath10k_htc_hdr));
+			ath10k_dbg(ar, ATH10K_DBG_HTC,
+				   "htc ep %d consumed %d credits (total %d, wmi-cmd 0x%x)\n",
+				   eid, credits, ep->tx_credits, __le32_to_cpu(hdr->cmd_id));
+		}
+		else {
+			ath10k_dbg(ar, ATH10K_DBG_HTC,
+				   "htc ep %d consumed %d credits (total %d)\n",
+				   eid, credits, ep->tx_credits);
+		}
 		spin_unlock_bh(&htc->tx_lock);
 	}
 
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
