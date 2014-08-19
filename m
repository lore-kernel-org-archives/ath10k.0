Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJehR-0001fu-Kn
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 08:23:26 +0000
Subject: [PATCH v7 3/8] ath10k: save firmware debug log messages
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Tue, 19 Aug 2014 11:23:00 +0300
Message-ID: <20140819082300.16842.40769.stgit@potku.adurom.net>
In-Reply-To: <20140819082038.16842.46876.stgit@potku.adurom.net>
References: <20140819082038.16842.46876.stgit@potku.adurom.net>
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
Cc: linux-wireless@vger.kernel.org

From: Ben Greear <greearb@candelatech.com>

They may be dumped through the firmware dump debugfs
file.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 23acbadeb8fa..eafc565240f1 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1290,6 +1290,16 @@ static int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
 
 	trace_ath10k_wmi_dbglog(skb->data, skb->len);
 
+	spin_lock_bh(&ar->data_lock);
+
+	/* First 4 bytes are a messages-dropped-due-to-overflow counter,
+	 * and should not be recorded in the dbglog buffer, so we skip
+	 * them.
+	 */
+	ath10k_debug_dbglog_add(ar, skb->data + 4, skb->len - 4);
+
+	spin_unlock_bh(&ar->data_lock);
+
 	return 0;
 }
 


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
