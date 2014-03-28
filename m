Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh06.mail.saunalahti.fi ([62.142.5.116])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTVia-0003Om-9J
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 12:17:05 +0000
Subject: [PATCH] ath10k: update wal_dbg_tx_stats structure with missing
 parameter.
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 28 Mar 2014 14:16:39 +0200
Message-ID: <20140328121639.4591.17459.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Bartosz Markowski <bartosz.markowski@tieto.com>

The filed has been missing (missmatched with FW ABI)
since 999.999.0.629 firmware release.

It's very imporatant to keep these structs up to date with FW,
due to the arithmetic we use while read the fw_stats.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index e0421c271ad1..8b07cebdd6de 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -2710,6 +2710,9 @@ struct wal_dbg_tx_stats {
 	/* wal pdev resets  */
 	__le32 pdev_resets;
 
+	/* frames dropped due to non-availability of stateless TIDs */
+	__le32 stateless_tid_alloc_failure;
+
 	__le32 phy_underrun;
 
 	/* MPDU is more than txop limit */


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
