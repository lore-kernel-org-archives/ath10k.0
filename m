Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by merlin.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEfhv-0001dA-3r
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 17:08:39 +0000
Received: by mail-wm0-x22f.google.com with SMTP id t79so176731004wmt.0
 for <ath10k@lists.infradead.org>; Wed, 07 Dec 2016 09:08:16 -0800 (PST)
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH 5/5] ath10k: add debug trace to rts/cts set function
Date: Wed,  7 Dec 2016 18:07:34 +0100
Message-Id: <1481130454-27244-5-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
References: <1481130454-27244-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

Align it with the cts protection call.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 6f1825964177..508366f139f1 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1275,6 +1275,9 @@ static int ath10k_recalc_rtscts_prot(struct ath10k_vif *arvif)
 		rts_cts |= SM(WMI_RTSCTS_FOR_SECOND_RATESERIES,
 			      WMI_RTSCTS_PROFILE);
 
+	ath10k_dbg(ar, ATH10K_DBG_MAC, "mac vdev %d recalc rts/cts prot %d\n",
+		   arvif->vdev_id, rts_cts);
+
 	return ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
 					 rts_cts);
 }
-- 
2.1.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
