Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by casper.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhLi2-0006yE-KR
 for ath10k@lists.infradead.org; Tue, 06 Sep 2016 19:07:04 +0000
From: Thomas Pedersen <twp@qca.qualcomm.com>
Subject: [PATCH] ath10k: enable peer stats by default
Date: Tue, 6 Sep 2016 12:05:28 -0700
Message-ID: <1473188728-14995-1-git-send-email-twp@qca.qualcomm.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: Thomas Pedersen <twp@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>

IFTYPE_MESH_POINT need to rely on these for accurate path
selection metrics. Other modes will probably also find
them useful. Enabling peer stats has the side effect of
reducing max number of STAs from 128 to 118. There should
be negligible performance impact.

If users really need 128 STAs and don't mind losing out on
peer stats, they can still disable them:

echo 0 > debugfs/ieee80211/phyn/ath10k/peer_stats

Signed-off-by: Thomas Pedersen <twp@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index c9d163e..c0ab4f4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2145,6 +2145,9 @@ static void ath10k_core_register_work(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, register_work);
 	int status;
 
+	/* peer stats are enabled by default */
+	set_bit(ATH10K_FLAG_PEER_STATS, &ar->dev_flags);
+
 	status = ath10k_core_probe_fw(ar);
 	if (status) {
 		ath10k_err(ar, "could not probe fw (%d)\n", status);
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
