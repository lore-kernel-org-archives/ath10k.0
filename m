Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKQsd-0007IO-4I
 for ath10k@lists.infradead.org; Mon, 12 Jun 2017 15:03:49 +0000
Received: by mail-lf0-x243.google.com with SMTP id o28so9679099lfk.1
 for <ath10k@lists.infradead.org>; Mon, 12 Jun 2017 08:03:30 -0700 (PDT)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: [RFC v2 10/10] ath10k: wmi: disable softirq's while calling
 ieee80211_rx
Date: Mon, 12 Jun 2017 17:03:11 +0200
Message-Id: <1497279791-9598-11-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1497279791-9598-1-git-send-email-erik.stromdahl@gmail.com>
References: <1497279791-9598-1-git-send-email-erik.stromdahl@gmail.com>
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
To: kvalo@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>

Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
---
 drivers/net/wireless/ath/ath10k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index 472b42b..d5d0d5c 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -2383,7 +2383,10 @@ int ath10k_wmi_event_mgmt_rx(struct ath10k *ar, struct sk_buff *skb)
 		   status->freq, status->band, status->signal,
 		   status->rate_idx);
 
+	local_bh_disable();
 	ieee80211_rx(ar->hw, skb);
+	local_bh_enable();
+
 	return 0;
 }
 
-- 
2.7.4


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
