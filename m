Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeO63-00076F-1z
 for ath10k@lists.infradead.org; Thu, 28 May 2020 19:21:46 +0000
Received: by mail-pg1-x544.google.com with SMTP id j21so48627pgb.7
 for <ath10k@lists.infradead.org>; Thu, 28 May 2020 12:21:40 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] ath10k: Remove ath10k_qmi_register_service_notifier()
 declaration
Date: Thu, 28 May 2020 12:21:09 -0700
Message-Id: <20200528122105.1.I31937dce728b441fd72cbe23447bc4710fd56ddb@changeid>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Govind Singh <govinds@codeaurora.org>, linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, netdev@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

The ath10k/qmi.h header file contains a declaration for the function
ath10k_qmi_register_service_notifier().  This function doesn't exist.
Remove the declaration.

This patch is a no-op and was just found by code inspection.

Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/net/wireless/ath/ath10k/qmi.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index dc257375f161..e03581182919 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -112,7 +112,6 @@ int ath10k_qmi_wlan_enable(struct ath10k *ar,
 			   enum wlfw_driver_mode_enum_v01 mode,
 			   const char *version);
 int ath10k_qmi_wlan_disable(struct ath10k *ar);
-int ath10k_qmi_register_service_notifier(struct notifier_block *nb);
 int ath10k_qmi_init(struct ath10k *ar, u32 msa_size);
 int ath10k_qmi_deinit(struct ath10k *ar);
 int ath10k_qmi_set_fw_log_mode(struct ath10k *ar, u8 fw_log_mode);
-- 
2.27.0.rc0.183.gde8f92d652-goog


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
