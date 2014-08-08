Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22d.google.com ([2a00:1450:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFgWm-0005RW-Th
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 09:32:01 +0000
Received: by mail-wi0-f173.google.com with SMTP id f8so705166wiw.0
 for <ath10k@lists.infradead.org>; Fri, 08 Aug 2014 02:31:36 -0700 (PDT)
From: Michal Kazior <michal.kazior@tieto.com>
Subject: [RFC 1/3] ath10k: move pci init structures
Date: Fri,  8 Aug 2014 11:22:13 +0200
Message-Id: <1407489735-28091-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
References: <1407489735-28091-1-git-send-email-michal.kazior@tieto.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>, Michal Kazior <michal.kazior@tieto.com>

It doesn't make much sense to have copy engine
configuration structures spread across the whole
source file.

Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 192 +++++++++++++++++-----------------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 2d340cc..38a9546 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -229,6 +229,102 @@ static const struct ce_pipe_config target_ce_config_wlan[] = {
 	/* CE7 used only by Host */
 };
 
+/*
+ * Map from service/endpoint to Copy Engine.
+ * This table is derived from the CE_PCI TABLE, above.
+ * It is passed to the Target at startup for use by firmware.
+ */
+static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_VO,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 3,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_VO,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 2,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_BK,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 3,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_BK,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 2,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_BE,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 3,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_BE,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 2,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_VI,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 3,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_DATA_VI,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 2,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_CONTROL,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 3,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_WMI_CONTROL,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 2,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_RSVD_CTRL,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 0,		/* could be moved to 3 (share with WMI) */
+	},
+	{
+		 ATH10K_HTC_SVC_ID_RSVD_CTRL,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 1,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_TEST_RAW_STREAMS,	/* not currently used */
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 0,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_TEST_RAW_STREAMS,	/* not currently used */
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 1,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_HTT_DATA_MSG,
+		 PIPEDIR_OUT,		/* out = UL = host -> target */
+		 4,
+	},
+	{
+		 ATH10K_HTC_SVC_ID_HTT_DATA_MSG,
+		 PIPEDIR_IN,		/* in = DL = target -> host */
+		 1,
+	},
+
+	/* (Additions here) */
+
+	{				/* Must be last */
+		 0,
+		 0,
+		 0,
+	},
+};
+
 static bool ath10k_pci_irq_pending(struct ath10k *ar)
 {
 	u32 cause;
@@ -1457,102 +1553,6 @@ static int ath10k_pci_bmi_wait(struct ath10k_ce_pipe *tx_pipe,
 }
 
 /*
- * Map from service/endpoint to Copy Engine.
- * This table is derived from the CE_PCI TABLE, above.
- * It is passed to the Target at startup for use by firmware.
- */
-static const struct service_to_pipe target_service_to_ce_map_wlan[] = {
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_VO,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 3,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_VO,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 2,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_BK,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 3,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_BK,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 2,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_BE,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 3,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_BE,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 2,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_VI,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 3,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_DATA_VI,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 2,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_CONTROL,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 3,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_WMI_CONTROL,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 2,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_RSVD_CTRL,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 0,		/* could be moved to 3 (share with WMI) */
-	},
-	{
-		 ATH10K_HTC_SVC_ID_RSVD_CTRL,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 1,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_TEST_RAW_STREAMS,	/* not currently used */
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 0,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_TEST_RAW_STREAMS,	/* not currently used */
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 1,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_HTT_DATA_MSG,
-		 PIPEDIR_OUT,		/* out = UL = host -> target */
-		 4,
-	},
-	{
-		 ATH10K_HTC_SVC_ID_HTT_DATA_MSG,
-		 PIPEDIR_IN,		/* in = DL = target -> host */
-		 1,
-	},
-
-	/* (Additions here) */
-
-	{				/* Must be last */
-		 0,
-		 0,
-		 0,
-	},
-};
-
-/*
  * Send an interrupt to the device to wake up the Target CPU
  * so it has an opportunity to notice any changed state.
  */
-- 
1.8.5.3


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
