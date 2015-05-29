Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YyCxc-0006Y2-CY
 for ath10k@lists.infradead.org; Fri, 29 May 2015 05:36:01 +0000
Received: by wicmx19 with SMTP id mx19so6718497wic.0
 for <ath10k@lists.infradead.org>; Thu, 28 May 2015 22:35:31 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: fix possible ps sleep crash
Date: Fri, 29 May 2015 07:35:24 +0200
Message-Id: <1432877724-8256-1-git-send-email-michal.kazior@tieto.com>
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

If probing failed pci sleep timer could remain
running and trigger after ath10k structures were
freed causing invalid pointer dereference:

 BUG: unable to handle kernel paging request at ffffc90001c80004
 IP: [<ffffffff81354728>] iowrite32+0x38/0x40
 ...
 Call Trace:
  <IRQ>
  [<ffffffffa00da048>] ? __ath10k_pci_sleep+0x48/0x60 [ath10k_pci]
  [<ffffffffa00da44e>] ath10k_pci_ps_timer+0x5e/0x80 [ath10k_pci]
  [<ffffffff810b210e>] call_timer_fn+0x3e/0x120
  [<ffffffffa00da3f0>] ? ath10k_pci_wake+0x150/0x150 [ath10k_pci]
  [<ffffffff810b3d11>] run_timer_softirq+0x201/0x2e0
  [<ffffffff8105d73f>] __do_softirq+0xaf/0x290
  [<ffffffff8105da95>] irq_exit+0x95/0xa0
  [<ffffffff81950406>] smp_apic_timer_interrupt+0x46/0x60
  [<ffffffff8194e77e>] apic_timer_interrupt+0x6e/0x80

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 17a060e8efa2..f37de77811f6 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -2850,6 +2850,7 @@ err_free_pipes:
 	ath10k_pci_free_pipes(ar);
 
 err_sleep:
+	ath10k_pci_sleep_sync(ar);
 	ath10k_pci_release(ar);
 
 err_core_destroy:
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
