Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W67oc-0000xe-JA
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:06:39 +0000
From: greearb@candelatech.com
Subject: [PATCH 1/4] ath10k:  Print out firmware feature bits from IE.
Date: Wed, 22 Jan 2014 16:05:59 -0800
Message-Id: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Aids in understanding excactly what a firmware is
offering.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3b59af3..56048b1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -470,8 +470,12 @@ static int ath10k_core_fetch_firmware_api_n(struct ath10k *ar, const char *name)
 				if (index == ie_len)
 					break;
 
-				if (data[index] & (1 << bit))
+				if (data[index] & (1 << bit)) {
+					ath10k_dbg(ATH10K_DBG_BOOT,
+						   "Enabling feature bit: %i\n",
+						   i);
 					__set_bit(i, ar->fw_features);
+				}
 			}
 
 			ath10k_dbg_dump(ATH10K_DBG_BOOT, "features", "",
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
