Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wl0VN-0000p3-CL
 for ath10k@lists.infradead.org; Thu, 15 May 2014 18:35:45 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k:  Ensure rx-frag ignores rssi.
Date: Thu, 15 May 2014 11:35:23 -0700
Message-Id: <1400178923-26306-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

It seems ath10k firmware gives us no way to know
the rssi for rx-fragments.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

Patch is against my tree, hopefully will apply OK against upstream
but have not tested that yet.

 drivers/net/wireless/ath/ath10k/htt_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index f94ac44..f62b0e4 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1343,6 +1343,7 @@ static void ath10k_htt_rx_frag_handler(struct ath10k_htt *htt,
 	}
 
 	/* FIXME: implement signal strength */
+	rx_status->flag |= RX_FLAG_NO_SIGNAL_VAL;
 
 	hdr = (struct ieee80211_hdr *)msdu_head->data;
 	rxd = (void *)msdu_head->data - sizeof(*rxd);
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
