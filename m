Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFJmc-0002ng-1X
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:14:50 +0000
Received: by mail-we0-f173.google.com with SMTP id q58so3874474wes.32
 for <ath10k@lists.infradead.org>; Thu, 07 Aug 2014 02:14:28 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/5] ath10k: dont reset the chip on hif_stop
Date: Thu,  7 Aug 2014 11:05:05 +0200
Message-Id: <1407402308-29899-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
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

The copy engine structures are never changed until
driver unregisters the device so it is not
necessary to reset the device chip anymore when
stopping.

This reduces driver register time approx. by 200ms.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 7efcf8e..6a5ca9e 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1192,13 +1192,6 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
 
 	ath10k_pci_buffer_cleanup(ar);
 
-	/* Make the sure the device won't access any structures on the host by
-	 * resetting it. The device was fed with PCI CE ringbuffer
-	 * configuration during init. If ringbuffers are freed and the device
-	 * were to access them this could lead to memory corruption on the
-	 * host. */
-	ath10k_pci_warm_reset(ar);
-
 	ar_pci->started = 0;
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
