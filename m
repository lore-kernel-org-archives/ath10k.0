Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJhgl-0007CZ-VW
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 12:07:12 +0000
Received: by mail-wi0-f174.google.com with SMTP id n3so1938078wiv.1
 for <ath10k@lists.infradead.org>; Fri, 06 Feb 2015 04:06:50 -0800 (PST)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFT] ath10k: restart fw on tx-credit timeout
Date: Fri,  6 Feb 2015 13:05:54 +0100
Message-Id: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
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
Cc: greearb@candelatech.com, linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, malaakso@elisanet.fi

It makes little sense to continue and let
firmware-host state become inconsistent if a WMI
command can't be submitted to firmware.

This effectively prevents after-affects of
tx-credit starvation bug which include spurious
sta kickout events and inability to associate new
stations after some time when acting as AP.

This should also speed up recovery/teardown in
some cases when firmware stops responding for some
reason.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index aeea1c7..776b257 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1045,9 +1045,15 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 		(ret != -EAGAIN);
 	}), 3*HZ);
 
-	if (ret)
+	if (ret) {
 		dev_kfree_skb_any(skb);
 
+		if (ret == -EAGAIN) {
+			ath10k_warn(ar, "firmware unresponsive, restarting..\n");
+			queue_work(ar->workqueue, &ar->restart_work);
+		}
+	}
+
 	return ret;
 }
 
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
