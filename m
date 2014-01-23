Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W67or-0000xo-9B
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 00:06:53 +0000
From: greearb@candelatech.com
Subject: [PATCH 2/4] ath10k:  Print out size of wmi-ready-event message.
Date: Wed, 22 Jan 2014 16:06:00 -0800
Message-Id: <1390435562-15473-2-git-send-email-greearb@candelatech.com>
In-Reply-To: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
References: <1390435562-15473-1-git-send-email-greearb@candelatech.com>
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
Cc: kvalo@qca.qualcomm.com, Ben Greear <greearb@candelatech.com>

From: Ben Greear <greearb@candelatech.com>

Signed-off-by: Ben Greear <greearb@candelatech.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 712a606..c99bca6 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2031,11 +2031,11 @@ static int ath10k_wmi_ready_event_rx(struct ath10k *ar, struct sk_buff *skb)
 	memcpy(ar->mac_addr, ev->mac_addr.addr, ETH_ALEN);
 
 	ath10k_dbg(ATH10K_DBG_WMI,
-		   "wmi event ready sw_version %u abi_version %u mac_addr %pM status %d\n",
+		   "wmi event ready sw_version %u abi_version %u mac_addr %pM status %d  skb->len: %i  ev-sz: %lu\n",
 		   __le32_to_cpu(ev->sw_version),
 		   __le32_to_cpu(ev->abi_version),
 		   ev->mac_addr.addr,
-		   __le32_to_cpu(ev->status));
+		   __le32_to_cpu(ev->status), skb->len, sizeof(*ev));
 
 	complete(&ar->wmi.unified_ready);
 	return 0;
-- 
1.7.11.7


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
