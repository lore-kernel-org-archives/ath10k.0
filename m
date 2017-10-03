Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzVQA-00049l-5O
 for ath10k@lists.infradead.org; Tue, 03 Oct 2017 22:12:11 +0000
From: greearb@candelatech.com
Subject: [PATCH] ath10k: Store coverage-class in case firmware is not booted.
Date: Tue,  3 Oct 2017 15:11:47 -0700
Message-Id: <1507068707-14050-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

From: Ben Greear <greearb@candelatech.com>

This way, we can apply the values when the NIC does come up.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/hw.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index afb0c01..31c0589 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -454,8 +454,13 @@ static void ath10k_hw_qca988x_set_coverage_class(struct ath10k *ar,
 
 	/* Only modify registers if the core is started. */
 	if ((ar->state != ATH10K_STATE_ON) &&
-	    (ar->state != ATH10K_STATE_RESTARTED))
+	    (ar->state != ATH10K_STATE_RESTARTED)) {
+		spin_lock_bh(&ar->data_lock);
+		/* Store config value for when radio boots up */
+		ar->fw_coverage.coverage_class = value;
+		spin_unlock_bh(&ar->data_lock);
 		goto unlock;
+	}
 
 	/* Retrieve the current values of the two registers that need to be
 	 * adjusted.
@@ -487,7 +492,7 @@ static void ath10k_hw_qca988x_set_coverage_class(struct ath10k *ar,
 		ar->fw_coverage.reg_ack_cts_timeout_orig = timeout_reg;
 	ar->fw_coverage.reg_phyclk = phyclk_reg;
 
-	/* Calculat new value based on the (original) firmware calculation. */
+	/* Calculate new value based on the (original) firmware calculation. */
 	slottime_reg = ar->fw_coverage.reg_slottime_orig;
 	timeout_reg = ar->fw_coverage.reg_ack_cts_timeout_orig;
 
-- 
2.4.11


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
