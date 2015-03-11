Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVgrW-000556-IM
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 13:39:53 +0000
Received: by lbjb6 with SMTP id b6so8836673lbj.9
 for <ath10k@lists.infradead.org>; Wed, 11 Mar 2015 06:39:26 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [PATCH] ath10k: protect driver from unsolicited htc ep0 events
Date: Wed, 11 Mar 2015 14:37:11 +0100
Message-Id: <1426081031-15296-1-git-send-email-michal.kazior@tieto.com>
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

Some firmware revisions (tested with qca6174
rm2.0-00088) deliver unsolicited unknown (kind of
garbled) HTC ep0 event to host in some cases.

This issue was mainly observed with both qca988x
and qca6174 being installed on a single host
system. During driver probing if qca6174 booting
sequences were somehow deferred (e.g. by qca988x
implicitly making some resources busy presumably)
the unsolicited event would came around 1s after
ATH10K_HTC_MSG_READY_ID was delivered to host for
qca6174.

The unsolicited event would confuse driver and
cause HTT initialization (and subsequently
driver probing) to fail.

Make the ep0 event processing more robust. The
event will still be caught but instead will
only generate a warning now.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/htc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 2fd9e18..d33d5c4 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -414,7 +414,8 @@ static int ath10k_htc_rx_completion_handler(struct ath10k *ar,
 		struct ath10k_htc_msg *msg = (struct ath10k_htc_msg *)skb->data;
 
 		switch (__le16_to_cpu(msg->hdr.message_id)) {
-		default:
+		case ATH10K_HTC_MSG_READY_ID:
+		case ATH10K_HTC_MSG_CONNECT_SERVICE_RESP_ID:
 			/* handle HTC control message */
 			if (completion_done(&htc->ctl_resp)) {
 				/*
@@ -438,6 +439,10 @@ static int ath10k_htc_rx_completion_handler(struct ath10k *ar,
 			break;
 		case ATH10K_HTC_MSG_SEND_SUSPEND_COMPLETE:
 			htc->htc_ops.target_send_suspend_complete(ar);
+			break;
+		default:
+			ath10k_warn(ar, "ignoring unsolicited htc ep0 event\n");
+			break;
 		}
 		goto out;
 	}
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
