Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsuMb-0006JO-Dv
 for ath10k@lists.infradead.org; Mon, 24 Nov 2014 14:11:38 +0000
Received: by mail-wg0-f52.google.com with SMTP id a1so12305520wgh.39
 for <ath10k@lists.infradead.org>; Mon, 24 Nov 2014 06:11:10 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: fix offchannel cancel failures
Date: Mon, 24 Nov 2014 14:58:33 +0100
Message-Id: <1416837513-13386-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1416837513-13386-1-git-send-email-michal.kazior@tieto.com>
References: <1416837513-13386-1-git-send-email-michal.kazior@tieto.com>
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

When mac80211 requests driver to cancel a hw roc
the driver must not call the expired() callback or
else roc will fail in some cases depending on how
things get scheduled.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 272a9d9..42b5982 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2184,10 +2184,10 @@ void __ath10k_scan_finish(struct ath10k *ar)
 	case ATH10K_SCAN_IDLE:
 		break;
 	case ATH10K_SCAN_RUNNING:
-	case ATH10K_SCAN_ABORTING:
 		if (ar->scan.is_roc)
 			ieee80211_remain_on_channel_expired(ar->hw);
-		else
+	case ATH10K_SCAN_ABORTING:
+		if (!ar->scan.is_roc)
 			ieee80211_scan_completed(ar->hw,
 						 (ar->scan.state ==
 						  ATH10K_SCAN_ABORTING));
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
