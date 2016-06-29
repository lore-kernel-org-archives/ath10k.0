Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bIE98-00023e-5t
 for ath10k@lists.infradead.org; Wed, 29 Jun 2016 11:59:10 +0000
Received: by mail-lf0-x233.google.com with SMTP id l188so31744637lfe.2
 for <ath10k@lists.infradead.org>; Wed, 29 Jun 2016 04:58:49 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] mac80211: fix fq lockdep warnings
Date: Wed, 29 Jun 2016 14:00:34 +0200
Message-Id: <1467201634-11060-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1467026569-19329-1-git-send-email-michal.kazior@tieto.com>
References: <1467026569-19329-1-git-send-email-michal.kazior@tieto.com>
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
To: johannes@sipsolutions.net
Cc: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Some lockdep assertions were not fulfilled and
resulted in a kernel warning/call trace if driver
used intermediate software queues (e.g. ath10k).

Existing code sequences should've guranteed safety
but it's always good to be extra careful.

The call trace could look like this:

 [ 237.335805] ------------[ cut here ]------------
 [ 237.335852] WARNING: CPU: 3 PID: 1921 at include/net/fq_impl.h:22 fq_flow_dequeue+0xed/0x140 [mac80211]
 [ 237.335855] Modules linked in: ath10k_pci(E-) ath10k_core(E) ath(E) mac80211(E) cfg80211(E)
 [ 237.335913] CPU: 3 PID: 1921 Comm: rmmod Tainted: G        W   E   4.7.0-rc4-wt-ath+ #1377
 [ 237.335916] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010
 [ 237.335918]  00200286 00200286 eff85dac c14151e2 f901574e 00000000 eff85de0 c1081075
 [ 237.335928]  c1ab91f0 00000003 00000781 f901574e 00000016 f8fbabad f8fbabad 00000016
 [ 237.335938]  eb24ff60 00000000 ef3886c0 eff85df4 c10810ba 00000009 00000000 00000000
 [ 237.335948] Call Trace:
 [ 237.335953]  [<c14151e2>] dump_stack+0x76/0xb4
 [ 237.335957]  [<c1081075>] __warn+0xe5/0x100
 [ 237.336002]  [<f8fbabad>] ? fq_flow_dequeue+0xed/0x140 [mac80211]
 [ 237.336046]  [<f8fbabad>] ? fq_flow_dequeue+0xed/0x140 [mac80211]
 [ 237.336053]  [<c10810ba>] warn_slowpath_null+0x2a/0x30
 [ 237.336095]  [<f8fbabad>] fq_flow_dequeue+0xed/0x140 [mac80211]
 [ 237.336137]  [<f8fbc67a>] fq_flow_reset.constprop.56+0x2a/0x90 [mac80211]
 [ 237.336180]  [<f8fbc79a>] fq_reset.constprop.59+0x2a/0x50 [mac80211]
 [ 237.336222]  [<f8fc04e8>] ieee80211_txq_teardown_flows+0x38/0x40 [mac80211]
 [ 237.336258]  [<f8f7c1a4>] ieee80211_unregister_hw+0xe4/0x120 [mac80211]
 [ 237.336275]  [<f933f536>] ath10k_mac_unregister+0x16/0x50 [ath10k_core]
 [ 237.336292]  [<f934592d>] ath10k_core_unregister+0x3d/0x90 [ath10k_core]
 [ 237.336301]  [<f85f8836>] ath10k_pci_remove+0x36/0xa0 [ath10k_pci]
 [ 237.336307]  [<c1470388>] pci_device_remove+0x38/0xb0
 ...

Fixes: 5caa328e3811 ("mac80211: implement codel on fair queuing flows")
Fixes: fa962b92120b ("mac80211: implement fair queueing per txq")
Tested-by: Kalle Valo <kvalo@qca.qualcomm.com>
Reported-by: Kalle Valo <kvalo@qca.qualcomm.com>
Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---

Notes:
    v1:
     - added Tested-by [Kalle]
     - swapped first/last name in Reported-by to match Tested-by
     - improve commit log

 net/mac80211/tx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index fa8d38eb9236..91461c415525 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1449,7 +1449,9 @@ int ieee80211_txq_setup_flows(struct ieee80211_local *local)
 	local->cvars = kcalloc(fq->flows_cnt, sizeof(local->cvars[0]),
 			       GFP_KERNEL);
 	if (!local->cvars) {
+		spin_lock_bh(&fq->lock);
 		fq_reset(fq, fq_skb_free_func);
+		spin_unlock_bh(&fq->lock);
 		return -ENOMEM;
 	}
 
@@ -1469,7 +1471,9 @@ void ieee80211_txq_teardown_flows(struct ieee80211_local *local)
 	kfree(local->cvars);
 	local->cvars = NULL;
 
+	spin_lock_bh(&fq->lock);
 	fq_reset(fq, fq_skb_free_func);
+	spin_unlock_bh(&fq->lock);
 }
 
 struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
-- 
2.1.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
