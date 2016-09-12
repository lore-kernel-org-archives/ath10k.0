Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bjRxQ-0001Ir-8Y
 for ath10k@lists.infradead.org; Mon, 12 Sep 2016 14:11:41 +0000
From: Benjamin Berg <benjamin@sipsolutions.net>
Subject: [PATCH] ath10k: Add missing CONFIG_ATH10K_DEBUGFS check
Date: Mon, 12 Sep 2016 16:11:05 +0200
Message-Id: <20160912141105.24085-1-benjamin@sipsolutions.net>
In-Reply-To: <871t0tp1ad.fsf@kamboji.qca.qualcomm.com>
References: <871t0tp1ad.fsf@kamboji.qca.qualcomm.com>
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

The patch "ath10k: allow setting coverage class" was missing a check for
CONFIG_ATH10K_DEBUGFS so it would try to use non-existing struct elements
in some configurations. Fix this by adding the appropriate ifdef.

Signed-off-by: Benjamin Berg <benjamin@sipsolutions.net>
---

Sorry, so turns out the kbuild test robot is correct and I forgot the ifdef
to check for CONFIG_ATH10K_DEBUGFS, so here a fixup commit for it.

Other than that everything looks good to me in the pending branch.

Benjamin


 drivers/net/wireless/ath/ath10k/hw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/hw.c b/drivers/net/wireless/ath/ath10k/hw.c
index c52b5f4..e182f09 100644
--- a/drivers/net/wireless/ath/ath10k/hw.c
+++ b/drivers/net/wireless/ath/ath10k/hw.c
@@ -338,8 +338,13 @@ static void ath10k_hw_qca988x_set_coverage_class(struct ath10k *ar,
 	 * set the registers again if the firmware does an internal reset and
 	 * this way we will be notified of the event.
 	 */
+#ifdef CONFIG_ATH10K_DEBUGFS
 	fw_dbglog_mask = ar->debug.fw_dbglog_mask;
 	fw_dbglog_level = ar->debug.fw_dbglog_level;
+#else
+	fw_dbglog_mask = 0;
+	fw_dbglog_level = 0;
+#endif
 
 	if (value > 0) {
 		if (fw_dbglog_level > ATH10K_DBGLOG_LEVEL_WARN)
-- 
2.9.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
