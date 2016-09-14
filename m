Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkD7O-0000b5-3i
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 16:33:03 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH] ath10k: Fix spinlock use in coverage class hack
Date: Wed, 14 Sep 2016 18:32:31 +0200
Message-Id: <20160914163231.20863-1-benjamin@sipsolutions.net>
In-Reply-To: <8760q0j8st.fsf@kamboji.qca.qualcomm.com>
References: <8760q0j8st.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, "Thiagarajan,
 Vasanthakumar" <vthiagar@qti.qualcomm.com>, Benjamin Berg <benjamin@sipsolutions.net>, linux-wireless@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, "ath10k @ lists . infradead . org" <ath10k@lists.infradead.org>, michal.kazior@tieto.com, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>

ath10k_hw_qca988x_set_coverage_class needs to hold both conf_mutex and
the data_lock spin lock for parts of the function. However, data_lock
is only needed while storing the coverage_class to store the value that
the card is configured to.

Fix the locking issue by only holding data_lock for the required duration.

Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
---

And yes, I fully agree with your points of it being rather fragile. But as
you said, it should be entirely safe if not used. Obviously a firmware
implementation would be preferential.

This locking issue was pretty unnecessary. Lets see if any more issues show
up in a closer review.

 drivers/net/wireless/ath/ath10k/core.h | 2 +-
 drivers/net/wireless/ath/ath10k/hw.c   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 89b07be..5f8c31f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -915,7 +915,7 @@ struct ath10k {
 	struct work_struct set_coverage_class_work;
 	/* protected by conf_mutex */
 	struct {
-		/* protected by data_lock */
+		/* writing also protected by data_lock */
 		s16 coverage_class;
 
 		u32 reg_phyclk;
diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index e182f09..bd5ca6a 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -243,7 +243,6 @@ static void ath10k_hw_qca988x_set_coverage_class(struct ath10k *ar,
 	u32 fw_dbglog_level;
 
 	mutex_lock(&ar->conf_mutex);
-	spin_lock_bh(&ar->data_lock);
 
 	/* Only modify registers if the core is started. */
 	if ((ar->state != ATH10K_STATE_ON) &&
@@ -356,12 +355,14 @@ static void ath10k_hw_qca988x_set_coverage_class(struct ath10k *ar,
 
 store_regs:
 	/* After an error we will not retry setting the coverage class. */
+	spin_lock_bh(&ar->data_lock);
 	ar->fw_coverage.coverage_class = value;
+	spin_unlock_bh(&ar->data_lock);
+
 	ar->fw_coverage.reg_slottime_conf = slottime_reg;
 	ar->fw_coverage.reg_ack_cts_timeout_conf = timeout_reg;
 
 unlock:
-	spin_unlock_bh(&ar->data_lock);
 	mutex_unlock(&ar->conf_mutex);
 }
 
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
