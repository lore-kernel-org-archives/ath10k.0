Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eqqFa-0008Cd-Ot
 for ath10k@lists.infradead.org; Wed, 28 Feb 2018 01:09:44 +0000
Received: from [192.168.100.149] (firewall.candelatech.com [50.251.239.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail2.candelatech.com (Postfix) with ESMTPSA id 378AC40A5A2
 for <ath10k@lists.infradead.org>; Tue, 27 Feb 2018 17:09:27 -0800 (PST)
From: Ben Greear <greearb@candelatech.com>
Subject: RFC: Possible napi deadlock work-around?
Message-ID: <33343f3f-0d5c-f17d-1606-281b94f3d333@candelatech.com>
Date: Tue, 27 Feb 2018 17:09:26 -0800
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

Does this look like a good idea?


[greearb@ben-dt3 ath10k]$ git diff
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 72b4495..c7ba49f 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1205,6 +1205,7 @@ struct ath10k {
         /* NAPI */
         struct net_device napi_dev;
         struct napi_struct napi;
+       bool napi_enabled;

         struct work_struct stop_scan_work;

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 398e413..fad4fb9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1956,6 +1956,7 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
         ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot hif start\n");

         napi_enable(&ar->napi);
+       ar->napi_enabled = true;

         ath10k_pci_irq_enable(ar);
         ath10k_pci_rx_post(ar);
@@ -2086,8 +2087,23 @@ static void ath10k_pci_hif_stop(struct ath10k *ar)
         ath10k_pci_irq_disable(ar);
         ath10k_pci_irq_sync(ar);
         ath10k_pci_flush(ar);
-       napi_synchronize(&ar->napi);
-       napi_disable(&ar->napi);
+
+       /* Calling napi_disable twice in a row (w/out starting it and/or without
+        * having NAPI active leads to deadlock because napi_disable sets
+        * NAPI_STATE_SCHED and NAPI_STATE_NPSVC when it returns, as far as I
+        * can tell.  So, guard this call to napi_disable.  I believe the
+        * failure case is something like this:
+        * rmmod ath10k_pci ath10k_core
+        *   Firmware crashes before hif_stop is called by the rmmod path
+        *   The crash handling logic calls hif_stop
+         *   Then rmmod gets around to calling hif_stop, but spins endlessly
+        *   in napi_synchronize.
+        */
+       if (ar->napi_enabled) {
+               napi_synchronize(&ar->napi);
+               napi_disable(&ar->napi);
+               ar->napi_enabled = false;
+       }

         spin_lock_irqsave(&ar_pci->ps_lock, flags);
         WARN_ON(ar_pci->ps_wake_refcount > 0);
[greearb@ben-dt3 ath10k]$

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
