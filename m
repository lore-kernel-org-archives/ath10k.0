Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLmv-00059A-R4
 for ath10k@lists.infradead.org; Wed, 04 Nov 2020 16:37:34 +0000
From: Tamizh chelvam <tamizhr@codeaurora.org>
Subject: [PATCH] ath10k: fix compilation warning
Date: Wed,  4 Nov 2020 22:07:17 +0530
Message-Id: <1604507837-29361-1-git-send-email-tamizhr@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, Tamizh Chelvam <tamizhr@codeaurora.org>

From: Tamizh Chelvam <tamizhr@codeaurora.org>

This change fixes below compilation warning.

smatch warnings:
 drivers/net/wireless/ath/ath10k/mac.c:9125 ath10k_mac_op_set_tid_config() error: uninitialized symbol 'ret'.

No functional changes. Compile tested only.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Tamizh Chelvam <tamizhr@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 12edb1b..9f3224d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -9182,10 +9182,11 @@ static int ath10k_mac_op_set_tid_config(struct ieee80211_hw *hw,
 			goto exit;
 	}
 
+	ret = 0;
+
 	if (sta)
 		goto exit;
 
-	ret = 0;
 	arvif->tids_rst = 0;
 	data.curr_vif = vif;
 	data.ar = ar;
-- 
1.9.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
