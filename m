Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb06.tieto.com ([131.207.168.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1F0C-0007vw-39
 for ath10k@lists.infradead.org; Mon, 22 Jul 2013 12:14:08 +0000
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH v2 2/4] ath10k: don't reset HTC endpoints unnecessarily
Date: Mon, 22 Jul 2013 14:13:29 +0200
Message-ID: <1374495211-20353-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1374495211-20353-1-git-send-email-michal.kazior@tieto.com>
References: <1374129193-3533-1-git-send-email-michal.kazior@tieto.com>
 <1374495211-20353-1-git-send-email-michal.kazior@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

Endpoints are re-initialized upon HTC start anyway
so there's no need to do that twice in case of
restarting HTC (i.e. in case of hardware
recovery).

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 47b7752..ef3329e 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -958,7 +958,6 @@ void ath10k_htc_stop(struct ath10k_htc *htc)
 	}
 
 	ath10k_hif_stop(htc->ar);
-	ath10k_htc_reset_endpoint_states(htc);
 }
 
 /* registered target arrival callback from the HIF layer */
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
