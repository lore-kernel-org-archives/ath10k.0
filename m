Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22f.google.com ([2a00:1450:400c:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YD86m-0004wy-Gh
 for ath10k@lists.infradead.org; Mon, 19 Jan 2015 08:54:53 +0000
Received: by mail-we0-f175.google.com with SMTP id k11so30137016wes.6
 for <ath10k@lists.infradead.org>; Mon, 19 Jan 2015 00:54:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: use per-vif wmm param setup if possible
Date: Mon, 19 Jan 2015 09:53:43 +0100
Message-Id: <1421657623-11706-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
References: <1421657623-11706-1-git-send-email-michal.kazior@tieto.com>
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

New wmi-tlv firmware for qca6174 supports this.

This should fix issues related to multi-vif WMM.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index a2a145b..7cbe0d4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4098,11 +4098,23 @@ static int ath10k_conf_tx(struct ieee80211_hw *hw,
 	 */
 	p->txop = params->txop * 32;
 
-	/* FIXME: FW accepts wmm params per hw, not per vif */
-	ret = ath10k_wmi_pdev_set_wmm_params(ar, &arvif->wmm_params);
-	if (ret) {
-		ath10k_warn(ar, "failed to set wmm params: %d\n", ret);
-		goto exit;
+	if (ar->wmi.ops->gen_vdev_wmm_conf) {
+		ret = ath10k_wmi_vdev_wmm_conf(ar, arvif->vdev_id,
+					       &arvif->wmm_params);
+		if (ret) {
+			ath10k_warn(ar, "failed to set vdev wmm params on vdev %i: %d\n",
+				    arvif->vdev_id, ret);
+			goto exit;
+		}
+	} else {
+		/* This won't work well with multi-interface cases but it's
+		 * better than nothing.
+		 */
+		ret = ath10k_wmi_pdev_set_wmm_params(ar, &arvif->wmm_params);
+		if (ret) {
+			ath10k_warn(ar, "failed to set wmm params: %d\n", ret);
+			goto exit;
+		}
 	}
 
 	ret = ath10k_conf_tx_uapsd(ar, vif, ac, params->uapsd);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
