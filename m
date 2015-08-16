Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-f169.google.com ([209.85.213.169])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQzqQ-0000oC-LM
 for ath10k@lists.infradead.org; Sun, 16 Aug 2015 15:27:35 +0000
Received: by igui7 with SMTP id i7so39885905igu.0
 for <ath10k@lists.infradead.org>; Sun, 16 Aug 2015 08:26:21 -0700 (PDT)
Received: from hash ([2001:470:1d:6db:230:48ff:fe9d:9c89])
 by smtp.gmail.com with ESMTPSA id ht6sm8224894igb.11.2015.08.16.08.26.21
 for <ath10k@lists.infradead.org>
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Aug 2015 08:26:21 -0700 (PDT)
From: Bob Copeland <me@bobcopeland.com>
Subject: [PATCH 1/3] ath10k: enable monitor when OTHER_BSS requested
Date: Sun, 16 Aug 2015 11:25:55 -0400
Message-Id: <1439738757-29199-2-git-send-email-me@bobcopeland.com>
In-Reply-To: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
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
Cc: Bob Copeland <me@bobcopeland.com>

By default, ath10k restricts received frames to those matching BSSID.
When other BSS frames are requested (e.g. in mesh mode), add an internal
monitor device so those frames are not filtered.

Signed-off-by: Bob Copeland <me@bobcopeland.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 96f4285..5c85896 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -1050,6 +1050,7 @@ static bool ath10k_mac_monitor_vdev_is_needed(struct ath10k *ar)
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
