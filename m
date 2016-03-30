Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1alMSe-00031A-P0
 for ath10k@lists.infradead.org; Wed, 30 Mar 2016 20:11:29 +0000
From: greearb@candelatech.com
Subject: [PATCH] wmi:  Retry if CE logic is out of buffers.
Date: Wed, 30 Mar 2016 13:10:43 -0700
Message-Id: <1459368643-13300-1-git-send-email-greearb@candelatech.com>
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
Cc: Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

I believe the CE tx buffer reaping logic may be able to fall
behind in certain cases (lots of serial console logging, lots
of WMI messages).

Dropping WMI messages is a very serious problem, so it is worth
waiting a bit in hopes the tx buffers become available again.

Signed-off-by: Ben Greear <greearb@candelatech.com>
---

Probably the ath10k_err should be made dbg or rate-limited before
this goes upstream..in meantime, it might help shed some light on
this problem.

 drivers/net/wireless/ath/ath10k/wmi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index f042711..43d23fc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1819,6 +1819,7 @@ static void ath10k_wmi_op_ep_tx_credits(struct ath10k *ar)
 int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 {
 	int ret = -EOPNOTSUPP;
+	int retry = 1000;
 
 	might_sleep();
 
@@ -1832,7 +1833,19 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 		/* try to send pending beacons first. they take priority */
 		ath10k_wmi_tx_beacons_nowait(ar);
 
-		ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
+		while (--retry) {
+			ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
+			if ((ret == -ENOBUFS) &&
+			    !test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags)) {
+				/* CE transport logic is full, maybe we cannot reap entries fast
+				 * enough?
+				 */
+				ath10k_err(ar, "CE transport is full, sleeping for 1ms\n");
+				msleep(1);
+				continue;
+			}
+			break;
+		}
 
 		if (ret && test_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags))
 			ret = -ESHUTDOWN;
-- 
2.4.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
