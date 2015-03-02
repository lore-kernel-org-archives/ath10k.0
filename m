Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMND-0007tW-9w
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 09:10:48 +0000
Received: by lams18 with SMTP id s18so28862533lam.11
 for <ath10k@lists.infradead.org>; Mon, 02 Mar 2015 01:10:25 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/3] ath10k: re-enable pci device upon resume
Date: Mon,  2 Mar 2015 10:09:04 +0100
Message-Id: <1425287344-30594-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
References: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
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

This balances out pci_disable_device() from
ath10k_pci_hif_suspend().

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d06b264..1295345 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2079,6 +2079,12 @@ static int ath10k_pci_hif_resume(struct ath10k *ar)
 		return ret;
 	}
 
+	ret = pci_enable_device(pdev);
+	if (ret) {
+		ath10k_err(ar, "failed to enable pci device: %d\n", ret);
+		return ret;
+	}
+
 	pci_restore_state(pdev);
 
 	/* Suspend/Resume resets the PCI configuration space, so we have to
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
