Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-f171.google.com ([209.85.223.171])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZiXo-0005WZ-Mw
 for ath10k@lists.infradead.org; Wed, 09 Sep 2015 16:48:25 +0000
Received: by iofb144 with SMTP id b144so29370283iof.1
 for <ath10k@lists.infradead.org>; Wed, 09 Sep 2015 09:48:03 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH v3 1/3] ath10k: enable monitor when OTHER_BSS requested
Date: Wed,  9 Sep 2015 12:47:34 -0400
Message-Id: <1441817256-3997-1-git-send-email-me@bobcopeland.com>
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
Cc: Bob Copeland <me@bobcopeland.com>, ath10k@lists.infradead.org

By default, ath10k restricts received frames to those matching BSSID.
When other BSS frames are requested (e.g. in mesh mode), add an internal
monitor device so those frames are not filtered.

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 989d2a1..80efcc8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1070,6 +1070,7 @@ static bool ath10k_mac_monitor_vdev_is_needed(struct ath10k *ar)
 		return false;
 
 	return ar->monitor ||
+	       ar->filter_flags & FIF_OTHER_BSS ||
 	       test_bit(ATH10K_CAC_RUNNING, &ar->dev_flags);
 }
 
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
