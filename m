Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSATU-0000yA-7Y
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 19:23:56 +0000
From: greearb@candelatech.com
Subject: [PATCH 4/4 v2] ath10k:  invalid msdu-id logging
Date: Mon, 24 Mar 2014 12:20:44 -0700
Message-Id: <1395688844-24640-5-git-send-email-greearb@candelatech.com>
In-Reply-To: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
References: <1395688844-24640-1-git-send-email-greearb@candelatech.com>
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

Make this message more obvious that it is a serious
problem (will cause tx flush issues, at least).

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

v2:  Add this to series, but ordering is not overly important.

 drivers/net/wireless/ath/ath10k/txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/txrx.c b/drivers/net/wireless/ath/ath10k/txrx.c
index 0541dd9..9be5974 100644
--- a/drivers/net/wireless/ath/ath10k/txrx.c
+++ b/drivers/net/wireless/ath/ath10k/txrx.c
@@ -58,7 +58,7 @@ void ath10k_txrx_tx_unref(struct ath10k_htt *htt,
 		   tx_done->msdu_id, !!tx_done->discard, !!tx_done->no_ack);
 
 	if (tx_done->msdu_id >= htt->max_num_pending_tx) {
-		ath10k_warn("warning: msdu_id %d too big, ignoring\n",
+		ath10k_warn("error: msdu_id %d too big, ignoring\n",
 			    tx_done->msdu_id);
 		return;
 	}
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
