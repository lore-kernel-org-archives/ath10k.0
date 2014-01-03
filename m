Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh03.mail.saunalahti.fi ([62.142.5.109])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vz2Th-0004Iv-0h
 for ath10k@lists.infradead.org; Fri, 03 Jan 2014 10:59:45 +0000
Subject: [PATCH 1/3] ath10k: handle WMI debug print events
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Fri, 03 Jan 2014 12:59:20 +0200
Message-ID: <20140103105920.13474.65657.stgit@potku.adurom.net>
In-Reply-To: <20140103105718.13474.70922.stgit@potku.adurom.net>
References: <20140103105718.13474.70922.stgit@potku.adurom.net>
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

Firmware can send simple ascii strings as debug messages using
WMI_DEBUG_PRINT_EVENTID, print those with ATH10K_DBG_WMI log level.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |   33 +++++++++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 3ec6c9a..f992570 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/skbuff.h>
+#include <linux/ctype.h>
 
 #include "core.h"
 #include "htc.h"
@@ -1676,9 +1677,37 @@ static void ath10k_wmi_event_profile_match(struct ath10k *ar,
 }
 
 static void ath10k_wmi_event_debug_print(struct ath10k *ar,
-				  struct sk_buff *skb)
+					 struct sk_buff *skb)
 {
-	ath10k_dbg(ATH10K_DBG_WMI, "WMI_DEBUG_PRINT_EVENTID\n");
+	char buf[101], c;
+	int i;
+
+	for (i = 0; i < sizeof(buf) - 1; i++) {
+		if (i >= skb->len)
+			break;
+
+		c = skb->data[i];
+
+		if (c == '\0')
+			break;
+
+		if (isascii(c) && isprint(c))
+			buf[i] = c;
+		else
+			buf[i] = '.';
+	}
+
+	if (i == sizeof(buf) - 1)
+		ath10k_warn("wmi debug print truncated: %d\n", skb->len);
+
+	/* for some reason the debug prints end with \n, remove that */
+	if (skb->data[i - 1] == '\n')
+		i--;
+
+	/* the last byte is always reserved for the null character */
+	buf[i] = '\0';
+
+	ath10k_dbg(ATH10K_DBG_WMI, "wmi event debug print '%s'\n", buf);
 }
 
 static void ath10k_wmi_event_pdev_qvit(struct ath10k *ar, struct sk_buff *skb)


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
