Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x229.google.com ([2a00:1450:4013:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6wFI-0003rm-1A
 for ath10k@lists.infradead.org; Wed, 07 Aug 2013 05:25:17 +0000
Received: by mail-ea0-f169.google.com with SMTP id z7so598279eaf.14
 for <ath10k@lists.infradead.org>; Tue, 06 Aug 2013 22:24:51 -0700 (PDT)
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Subject: [PATCH] ath10k: setup peer UAPSD flag correctly
Date: Wed,  7 Aug 2013 07:23:56 +0200
Message-Id: <1375853036-2418-1-git-send-email-janusz.dziedzic@tieto.com>
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
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, linux-wireless@vger.kernel.org

Setup UAPSD peer rate control (FW flag)
correctly.

Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index cf2ba4d..505be82 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -973,7 +973,7 @@ static void ath10k_peer_assoc_h_qos_ap(struct ath10k *ar,
 			   sta->uapsd_queues, sta->max_sp);
 
 		arg->peer_flags |= WMI_PEER_APSD;
-		arg->peer_flags |= WMI_RC_UAPSD_FLAG;
+		arg->peer_rate_caps |= WMI_RC_UAPSD_FLAG;
 
 		if (sta->uapsd_queues & IEEE80211_WMM_IE_STA_QOSINFO_AC_VO)
 			uapsd |= WMI_AP_PS_UAPSD_AC3_DELIVERY_EN |
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
