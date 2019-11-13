Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iV2B9-0005ez-Lm
 for ath10k@lists.infradead.org; Wed, 13 Nov 2019 23:36:05 +0000
Received: by mail-pf1-x442.google.com with SMTP id x28so2748159pfo.6
 for <ath10k@lists.infradead.org>; Wed, 13 Nov 2019 15:36:03 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] ath10k: qmi: Sleep for a while before assigning MSA memory
Date: Wed, 13 Nov 2019 15:35:58 -0800
Message-Id: <20191113233558.4040259-1-bjorn.andersson@linaro.org>
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
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>
Cc: govinds@codeaurora.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org

Unless we sleep for a while before transitioning the MSA memory to WLAN
the MPSS.AT.4.0.c2-01184-SDM845_GEN_PACK-1 firmware triggers a security
violation fairly reliably. Unforutnately recovering from this failure
always results in the entire system freezing.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 637f83ef65f8..a0ba07b85362 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -773,6 +773,13 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
 	if (ret)
 		return;
 
+	/*
+	 * HACK: sleep for a while inbetween receiving the msa info response
+	 * and the XPU update to prevent SDM845 from crashing due to a security
+	 * violation, when running MPSS.AT.4.0.c2-01184-SDM845_GEN_PACK-1.
+	 */
+	msleep(20);
+
 	ret = ath10k_qmi_setup_msa_permissions(qmi);
 	if (ret)
 		return;
-- 
2.23.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
