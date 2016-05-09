Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1azum7-0007Xu-Lr
 for ath10k@lists.infradead.org; Mon, 09 May 2016 23:39:44 +0000
From: greearb@candelatech.com
Subject: [PATCH 12/21] ath10k: Support up to 64 vdevs.
Date: Mon,  9 May 2016 16:11:06 -0700
Message-Id: <1462835475-11079-13-git-send-email-greearb@candelatech.com>
In-Reply-To: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
References: <1462835475-11079-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

The (1 << x) - 1 trick won't work when you
are trying to fill up all 64 bits, so add special
case for that.

And, move the limits to the per-nic structure instead
of per-driver to allow better dynamic use of the limits.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3f1786c..fa71d57 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1819,7 +1819,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 	if (status)
 		goto err_hif_stop;
 
-	ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
+	if (ar->max_num_vdevs >= 64)
+		ar->free_vdev_map = 0xFFFFFFFFFFFFFFFFLL;
+	else
+		ar->free_vdev_map = (1LL << ar->max_num_vdevs) - 1;
 
 	INIT_LIST_HEAD(&ar->arvifs);
 
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
