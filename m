Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDPx-0004Hg-Qt
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 13:54:38 +0000
Received: by mail-la0-f48.google.com with SMTP id gi9so3924812lab.21
 for <ath10k@lists.infradead.org>; Mon, 20 Oct 2014 06:54:15 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 1/9] ath10k: don't drop control and null func Rx
Date: Mon, 20 Oct 2014 15:40:30 +0200
Message-Id: <1413812438-14640-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
References: <1413812438-14640-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

HTT_RX_IND_MPDU_STATUS_MGMT_CTRL was pretty greedy
and because of that ath10k ended up dropping
Control Frames as well as Null Func frames.

Reported-by: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index fbb3175..63c69d8 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -1200,8 +1200,7 @@ static bool ath10k_htt_rx_amsdu_allowed(struct ath10k_htt *htt,
 	}
 
 	/* Skip mgmt frames while we handle this in WMI */
-	if (status == HTT_RX_IND_MPDU_STATUS_MGMT_CTRL ||
-	    attention & RX_ATTENTION_FLAGS_MGMT_TYPE) {
+	if (attention & RX_ATTENTION_FLAGS_MGMT_TYPE) {
 		ath10k_dbg(ar, ATH10K_DBG_HTT, "htt rx mgmt ctrl\n");
 		return false;
 	}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
