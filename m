Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHOK6-00081N-7u
 for ath10k@lists.infradead.org; Thu, 26 Mar 2020 08:57:13 +0000
From: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Subject: [PATCH] ath10k: Fix the race condition in firmware dump work queue
Date: Thu, 26 Mar 2020 14:27:57 +0530
Message-Id: <1585213077-28439-1-git-send-email-mkenna@codeaurora.org>
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
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Govindaraj Saminathan <gsamin@codeaurora.org>, linux-wireless@vger.kernel.org

There is a race condition, when the user writes 'hw-restart' and
'hard' in the simulate_fw_crash debugfs file without any delay.
In the above scenario, the firmware dump work queue(scheduled by
'hard') should be handled gracefully, while the target is in the
'hw-restart'.

Tested HW: QCA9984
Tested FW: 10.4-3.9.0.2-00044

Co-developed-by: Govindaraj Saminathan <gsamin@codeaurora.org>
Signed-off-by: Govindaraj Saminathan <gsamin@codeaurora.org>
Signed-off-by: Maharaja Kennadyrajan <mkenna@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index ded7a22..cd1c5d6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2074,6 +2074,7 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 	ath10k_pci_irq_sync(ar);
 	napi_synchronize(&ar->napi);
 	napi_disable(&ar->napi);
+	cancel_work_sync(&ar_pci->dump_work);
 
 	/* Most likely the device has HTT Rx ring configured. The only way to
 	 * prevent the device from accessing (and possible corrupting) host
-- 
1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
