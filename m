Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ea0-x233.google.com ([2a00:1450:4013:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjqTr-0005xB-BI
 for ath10k@lists.infradead.org; Fri, 22 Nov 2013 13:09:15 +0000
Received: by mail-ea0-f179.google.com with SMTP id r15so513019ead.10
 for <ath10k@lists.infradead.org>; Fri, 22 Nov 2013 05:08:42 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 3/8] ath10k: fix memory leak on hif_start failpath
Date: Fri, 22 Nov 2013 14:05:13 +0100
Message-Id: <1385125518-13461-4-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
References: <1385125518-13461-1-git-send-email-michal.kazior@tieto.com>
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

If post_rx failed then completions were not freed.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index d4536cb..4067890 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1205,6 +1205,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	if (ret) {
 		ath10k_warn("failed to post RX buffers for all pipes: %d\n",
 			    ret);
+		ath10k_pci_stop_ce(ar);
 		return ret;
 	}
 
-- 
1.8.4.rc3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
