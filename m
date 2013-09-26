Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from ebb05.tieto.com ([131.207.168.36])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VPDnL-0002bL-1T
 for ath10k@lists.infradead.org; Thu, 26 Sep 2013 15:48:00 +0000
From: Bartosz Markowski <bartosz.markowski@tieto.com>
Subject: [PATCH v3 03/13] ath10k: warn if give WMI command is not supported
Date: Thu, 26 Sep 2013 17:47:07 +0200
Message-ID: <1380210437-4391-4-git-send-email-bartosz.markowski@tieto.com>
In-Reply-To: <1380210437-4391-1-git-send-email-bartosz.markowski@tieto.com>
References: <1380210437-4391-1-git-send-email-bartosz.markowski@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, Bartosz Markowski <bartosz.markowski@tieto.com>

This will show and make it easier to track the API
differences in the new AP firmware.

Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index cfb2082..8386050 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -390,6 +390,12 @@ static int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb,
 {
 	int ret = -EINVAL;
 
+	if (cmd_id == WMI_CMD_UNDEFINED) {
+		ath10k_warn("wmi command %d is not supported by firmware\n",
+			    cmd_id);
+		return ret;
+	}
+
 	wait_event_timeout(ar->wmi.tx_credits_wq, ({
 		/* try to send pending beacons first. they take priority */
 		ath10k_wmi_tx_beacons_nowait(ar);
-- 
1.7.10


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
