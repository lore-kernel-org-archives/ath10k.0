Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5XX0-0006R6-16
 for ath10k@lists.infradead.org; Tue, 21 Jan 2014 09:22:02 +0000
Received: by mail-pa0-f47.google.com with SMTP id kp14so8107206pab.6
 for <ath10k@lists.infradead.org>; Tue, 21 Jan 2014 01:21:39 -0800 (PST)
From: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Subject: [PATCH] ath10k: fix the printing of 10.x FW version when FW crashed
Date: Tue, 21 Jan 2014 17:21:21 +0800
Message-Id: <1390296081-22788-1-git-send-email-yeohchunyeow@gmail.com>
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
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

10.x FW has no structure member sw_version_1. Thus,
both fw_version_release and fw_version_build are not
available. The provided fw_version_major is also wrong.
Fix this by using the fw_version from struct wiphy.

Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 29fd197..9179c88 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -833,9 +833,7 @@ static void ath10k_pci_hif_dump_area(struct ath10k *ar)
 	ath10k_err("firmware crashed!\n");
 	ath10k_err("hardware name %s version 0x%x\n",
 		   ar->hw_params.name, ar->target_version);
-	ath10k_err("firmware version: %u.%u.%u.%u\n", ar->fw_version_major,
-		   ar->fw_version_minor, ar->fw_version_release,
-		   ar->fw_version_build);
+	ath10k_err("firmware version: %s\n", ar->hw->wiphy->fw_version);
 
 	host_addr = host_interest_item_address(HI_ITEM(hi_failure_state));
 	ret = ath10k_pci_diag_read_mem(ar, host_addr,
-- 
1.7.9.5


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
