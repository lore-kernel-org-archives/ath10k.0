Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sitav-80046.hsr.ch ([152.96.80.46] helo=mail.strongswan.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fsNkk-0005xi-Nb
 for ath10k@lists.infradead.org; Wed, 22 Aug 2018 07:40:32 +0000
From: Martin Willi <martin@strongswan.org>
Subject: [PATCH] ath10k: schedule hardware restart if WMI command times out
Date: Wed, 22 Aug 2018 09:39:52 +0200
Message-Id: <20180822073952.30922-1-martin@strongswan.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

When running in AP mode, ath10k sometimes suffers from TX credit
starvation. The issue is hard to reproduce and shows up once in a
few days, but has been repeatedly seen with QCA9882 and a large
range of firmwares, including 10.2.4.70.67.

Once the module is in this state, TX credits are never replenished,
which results in "SWBA overrun" errors, as no beacons can be sent.
Even worse, WMI commands run in a timeout while holding the conf
mutex for three seconds each, making any further operations slow
and the whole system unresponsive.

The firmware/driver never recovers from that state automatically,
and triggering TX flush or warm restarts won't work over WMI. So
issue a hardware restart if a WMI command times out due to missing
TX credits. This implies a connectivity outage of about 1.4s in AP
mode, but brings back the interface and the whole system to a usable
state. WMI command timeouts have not been seen in absent of this
specific issue, so taking such drastic actions seems legitimate.

Signed-off-by: Martin Willi <martin@strongswan.org>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index fd612d2905b0..40ce0e4006bc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -1869,6 +1869,12 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 	if (ret)
 		dev_kfree_skb_any(skb);
 
+	if (ret == -EAGAIN) {
+		ath10k_warn(ar, "wmi command %d timeout, restarting hardware\n",
+			    cmd_id);
+		queue_work(ar->workqueue, &ar->restart_work);
+	}
+
 	return ret;
 }
 
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
