Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from emh07.mail.saunalahti.fi ([62.142.5.117])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wpa1v-0001VM-3r
 for ath10k@lists.infradead.org; Wed, 28 May 2014 09:20:16 +0000
Received: from potku.adurom.net (a91-155-131-35.elisa-laajakaista.fi
 [91.155.131.35])
 by emh07.mail.saunalahti.fi (Postfix) with ESMTP id 8D6F840E1
 for <ath10k@lists.infradead.org>; Wed, 28 May 2014 12:19:51 +0300 (EEST)
Subject: [RFC PATCH 1/2] ath10k: make ath10k_wmi_cmd_send() public
From: Kalle Valo <kvalo@qca.qualcomm.com>
Date: Wed, 28 May 2014 12:19:51 +0300
Message-ID: <20140528091951.8030.61434.stgit@potku.adurom.net>
In-Reply-To: <20140528091832.8030.93169.stgit@potku.adurom.net>
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
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

We need this function to send wmi packets from testmode.c.

Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c |    5 ++---
 drivers/net/wireless/ath/ath10k/wmi.h |    4 ++++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 4b7782a529ac..921d18d599fc 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -503,7 +503,7 @@ int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar)
 	return ret;
 }
 
-static struct sk_buff *ath10k_wmi_alloc_skb(u32 len)
+struct sk_buff *ath10k_wmi_alloc_skb(u32 len)
 {
 	struct sk_buff *skb;
 	u32 round_len = roundup(len, 4);
@@ -604,8 +604,7 @@ static void ath10k_wmi_op_ep_tx_credits(struct ath10k *ar)
 	wake_up(&ar->wmi.tx_credits_wq);
 }
 
-static int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb,
-			       u32 cmd_id)
+int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
 {
 	int ret = -EOPNOTSUPP;
 
diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
index 89ef3b3749eb..02376b365098 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.h
+++ b/drivers/net/wireless/ath/ath10k/wmi.h
@@ -4260,6 +4260,10 @@ int ath10k_wmi_wait_for_service_ready(struct ath10k *ar);
 int ath10k_wmi_wait_for_unified_ready(struct ath10k *ar);
 
 int ath10k_wmi_connect(struct ath10k *ar);
+
+struct sk_buff *ath10k_wmi_alloc_skb(u32 len);
+int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id);
+
 int ath10k_wmi_pdev_set_channel(struct ath10k *ar,
 				const struct wmi_channel_arg *);
 int ath10k_wmi_pdev_suspend_target(struct ath10k *ar, u32 suspend_opt);


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
