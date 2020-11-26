Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiJxT-0006dP-Ip
 for ath10k@lists.infradead.org; Thu, 26 Nov 2020 16:17:24 +0000
From: Youghandhar Chintala <youghand@codeaurora.org>
Subject: [PATCH] ath10k: skip the wait for completion to recovery in shutdown
 path
Date: Thu, 26 Nov 2020 21:46:56 +0530
Message-Id: <20201126161656.18802-1-youghand@codeaurora.org>
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
To: ath10k@lists.infradead.org
Cc: kuabhs@chromium.org, Youghandhar Chintala <youghand@codeaurora.org>, briannorris@chromium.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, pillair@codeaurora.org

Currently in the shutdown callback we wait for recovery to complete
before freeing up the resources. This can lead to unwanted delay
during the shutdown and thereby increase the shutdown time.

As an attempt to take less time during shutdown, remove the wait for
recovery completion in the shutdown callback.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1

Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
Change-Id: I0474ab7dc3730aaacac888bb9a7acc2fa0e8b4f8
---
 drivers/net/wireless/ath/ath10k/snoc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 84666f72bdfa..15580a91fe98 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1790,9 +1790,6 @@ static int ath10k_snoc_remove(struct platform_device *pdev)
 
 	reinit_completion(&ar->driver_recovery);
 
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
-
 	set_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags);
 
 	ath10k_core_unregister(ar);
-- 
2.26.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
