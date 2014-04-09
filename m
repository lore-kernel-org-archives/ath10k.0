Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXpVn-0004WU-L6
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 10:13:50 +0000
Received: by mail-ee0-f53.google.com with SMTP id b57so1649164eek.26
 for <ath10k@lists.infradead.org>; Wed, 09 Apr 2014 03:13:22 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH 2/3] ath10k: don't wait for device init if it crashed
Date: Wed,  9 Apr 2014 12:07:07 +0200
Message-Id: <1397038028-7665-3-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
References: <1397038028-7665-1-git-send-email-michal.kazior@tieto.com>
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

When warm resetting it's possible for device to
crash during initialization. Instead of waiting 3
seconds just return failure as soon as
FW_IND_EVENT_PENDING is set.

This speeds up device bootup and recovery in some
cases.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index cd3b00c..8337608 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2452,6 +2452,9 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val == 0xffffffff)
 			continue;
 
+		if (val & FW_IND_EVENT_PENDING)
+			break;
+
 		if (val & FW_IND_INITIALIZED)
 			break;
 
@@ -2470,6 +2473,12 @@ static int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		goto out;
 	}
 
+	if (val & FW_IND_EVENT_PENDING) {
+		ath10k_warn("device has crashed during init\n");
+		ret = -ECOMM;
+		goto out;
+	}
+
 	if (!(val & FW_IND_INITIALIZED)) {
 		ath10k_err("failed to receive initialized event from target: %08x\n",
 			   val);
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
