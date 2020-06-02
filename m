Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfzQi-00050V-Qt
 for ath10k@lists.infradead.org; Tue, 02 Jun 2020 05:25:45 +0000
Received: by mail-pg1-x542.google.com with SMTP id o6so4569771pgh.2
 for <ath10k@lists.infradead.org>; Mon, 01 Jun 2020 22:25:39 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] wireless: ath10k: Return early in
 ath10k_qmi_event_server_exit() to avoid hard crash on reboot
Date: Tue,  2 Jun 2020 05:25:33 +0000
Message-Id: <20200602052533.15048-1-john.stultz@linaro.org>
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
To: lkml <linux-kernel@vger.kernel.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, Govind Singh <govinds@codeaurora.org>, Rakesh Pillai <pillair@qti.qualcomm.com>, Brian Norris <briannorris@chromium.org>, ath10k@lists.infradead.org, Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Kalle Valo <kvalo@codeaurora.org>

Ever since 5.7-rc1, if we call
ath10k_qmi_remove_msa_permission(), the db845c hard crashes on
reboot, resulting in the device getting stuck in the usb crash
debug mode and not coming back up wihthout a hard power off.

This hack avoids the issue by returning early in
ath10k_qmi_event_server_exit().

A better solution is very much desired!

Feedback and suggestions welcome!

Cc: Rakesh Pillai <pillair@qti.qualcomm.com>
Cc: Govind Singh <govinds@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Amit Pundir <amit.pundir@linaro.org>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org
Reported-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 85dce43c5439..ab38562ce1cb 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -854,6 +854,11 @@ static void ath10k_qmi_event_server_exit(struct ath10k_qmi *qmi)
 	struct ath10k *ar = qmi->ar;
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
+	/*
+	 * HACK: Calling ath10k_qmi_remove_msa_permission causes
+	 * hardware to hard crash on reboot
+	 */
+	return;
 	ath10k_qmi_remove_msa_permission(qmi);
 	ath10k_core_free_board_files(ar);
 	if (!test_bit(ATH10K_SNOC_FLAG_UNREGISTERING, &ar_snoc->flags))
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
