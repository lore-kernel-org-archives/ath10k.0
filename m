Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.neratec.com ([46.140.151.2])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4mKj-0001Ou-Ca
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 08:35:02 +0000
From: Zefir Kurtisi <zefir.kurtisi@neratec.com>
Subject: [PATCH] ath: DFS - limit number of potential PRI sequences
Date: Tue, 16 Jun 2015 10:34:03 +0200
Message-Id: <1434443643-28477-1-git-send-email-zefir.kurtisi@neratec.com>
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
To: linux-wireless@vger.kernel.org
Cc: ath9k-devel@venema.h4ckr.net, ath10k@lists.infradead.org, poh@qca.qualcomm.com, Zefir Kurtisi <zefir.kurtisi@neratec.com>

In the PRI detector, after the current radar pulse
has been checked agains existing PRI sequences, it
is considered as part of a new potential sequence.

Previously, the condition to accept a new sequence
was to have at least the same number of pulses as
the longest matching sequence. This was wrong,
since it led to duplicates of PRI sequences.

This patch changes the acceptance criteria for new
potential sequences from 'at least' to 'more than'
the longest existing.

Detection performance remains unaffected, while
the number of PRI sequences accounted at runtime
(and with it CPU load) is reduced by up to 50%.

Signed-off-by: Zefir Kurtisi <zefir.kurtisi@neratec.com>
---
 drivers/net/wireless/ath/dfs_pri_detector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/dfs_pri_detector.c b/drivers/net/wireless/ath/dfs_pri_detector.c
index 1b5ad19..cc5c592 100644
--- a/drivers/net/wireless/ath/dfs_pri_detector.c
+++ b/drivers/net/wireless/ath/dfs_pri_detector.c
@@ -273,7 +273,7 @@ static bool pseq_handler_create_sequences(struct pri_detector *pde,
 				tmp_false_count++;
 			}
 		}
-		if (ps.count < min_count)
+		if (ps.count <= min_count)
 			/* did not reach minimum count, drop sequence */
 			continue;
 
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
