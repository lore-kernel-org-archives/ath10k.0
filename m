Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fyKU8-0006d9-Qk
 for ath10k@lists.infradead.org; Fri, 07 Sep 2018 17:24:06 +0000
Received: by mail-pl1-x643.google.com with SMTP id b30-v6so4600459pla.0
 for <ath10k@lists.infradead.org>; Fri, 07 Sep 2018 10:23:46 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] ath10k: utilize random MAC address if none is provided
Date: Fri,  7 Sep 2018 10:21:57 -0700
Message-Id: <20180907172157.203785-1-briannorris@chromium.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Brian Norris <briannorris@chromium.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Since commit 9d5804662ce1 ("ath10k: retrieve MAC address from system
firmware if provided"), we support pulling our MAC address from system
firmware. Along with this, we should admit that it's possible for system
firmware to be screwed up as well, omitting the MAC address there.

Provide a fallback, such that we choose a randomly-generated MAC
address, with the local assignment bit set.

This is not a preferred mode of operation and really should only serve
the purpose of keeping the system chugging along while someone figures
out what's wrong with the system. Grepping through other wireless
drivers shows very similar fallback logic though, so why not?

  git grep eth_random_addr drivers/net/wireless/

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 97548f96a2f7..484f9c74ce46 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8325,6 +8325,10 @@ int ath10k_mac_register(struct ath10k *ar)
 	void *channels;
 	int ret;
 
+	if (!is_valid_ether_addr(ar->mac_addr)) {
+		ath10k_warn(ar, "invalid MAC address; choosing random\n");
+		eth_random_addr(ar->mac_addr);
+	}
 	SET_IEEE80211_PERM_ADDR(ar->hw, ar->mac_addr);
 
 	SET_IEEE80211_DEV(ar->hw, ar->dev);
-- 
2.19.0.rc2.392.g5ba43deb5a-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
