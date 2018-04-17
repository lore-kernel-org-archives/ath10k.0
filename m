Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8POm-0001Ws-73
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 12:07:50 +0000
From: pillair@codeaurora.org
Subject: [PATCH v2 4/4] ath10k: Enable sta idle power save
Date: Tue, 17 Apr 2018 17:37:01 +0530
Message-Id: <1523966821-21903-5-git-send-email-pillair@codeaurora.org>
In-Reply-To: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
References: <1523966821-21903-1-git-send-email-pillair@codeaurora.org>
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
Cc: Rakesh Pillai <pillair@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, linux-wireless@vger.kernel.org

From: Govind Singh <govinds@codeaurora.org>

Enable sta power save in fw for the targets that
supports idle power save. The idle ps enable command
will be ignored by the firmware which does not support
this feature.

Signed-off-by: Govind Singh <govinds@codeaurora.org>
Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
---
 drivers/net/wireless/ath/ath10k/mac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7e02ca02b28e..1d9222af1bb2 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4679,6 +4679,13 @@ static int ath10k_start(struct ieee80211_hw *hw)
 		}
 	}
 
+	param = ar->wmi.pdev_param->idle_ps_config;
+	ret = ath10k_wmi_pdev_set_param(ar, param, 1);
+	if (ret && ret != -EOPNOTSUPP) {
+		ath10k_warn(ar, "failed to enable idle_ps_config: %d\n", ret);
+		goto err_core_stop;
+	}
+
 	__ath10k_set_antenna(ar, ar->cfg_tx_chainmask, ar->cfg_rx_chainmask);
 
 	/*
-- 
2.14.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
