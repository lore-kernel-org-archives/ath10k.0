Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh04.mail.saunalahti.fi ([62.142.5.110])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFqmu-0005AN-Rm
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 20:29:21 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh04.mail.saunalahti.fi (Postfix) with ESMTP id C740A1A25D4
 for <ath10k@lists.infradead.org>; Fri,  8 Aug 2014 23:28:57 +0300 (EEST)
Subject: [PATCH v5 3/7] ath10k: save firmware debug log messages
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 08 Aug 2014 23:28:55 +0300
Message-ID: <20140808202855.20713.57686.stgit@potku.adurom.net>
In-Reply-To: <20140808201815.20713.85582.stgit@potku.adurom.net>
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
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

From: Ben Greear <greearb@candelatech.com>

They may be dumped through the firmware dump debugfs
file.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fffb15b1b50b..cd79858016f3 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1210,6 +1210,12 @@ static int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
 
 	trace_ath10k_wmi_dbglog(skb->data, skb->len);
 
+	/* First 4 bytes are a messages-dropped-due-to-overflow counter,
+	 * and should not be recorded in the dbglog buffer, so we skip
+	 * them.
+	 */
+	ath10k_debug_dbglog_add(ar, skb->data + 4, skb->len - 4);
+
 	return 0;
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
