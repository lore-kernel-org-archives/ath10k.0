Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD77C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 06:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4h1JrOkntgUzyNeifcsfGTEPf1NkgiMSgh2/ANe05vc=; b=KUN7HKlaTni5d7L49vt4isDKHe
	NRWJBY/G7qwfRPc+KE26lXE+75jpZBij6u5oEFPfaNeTwhXsZ/5CtjKrbXH0VpE8cWT5nr2MRdb0F
	f069i7mJ2YtFwQwO0AssIqTQDXPbRJdrDfuCMI3PjcLmNKebtCdYtRZWSYucbquNlWfYDvZxEj2+8
	+wPxgsIWD9FVIX/EuK0TCrzuKOtby6nRw3N4Gxjl7G19tPzPsvdlR91U+Ne+syEhSz9NXepyewvCu
	wh+YYdEf13bqBxFU9QLQ7s4ggQ9y1zZfq48o3vIMQsojK54xHPY6mQxrfoxWcFitTF5+0phKqhg9D
	KsAHCwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAnfH-00DzQr-To; Fri, 21 Jan 2022 06:44:51 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAnfD-00DzOt-5d
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 06:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642747487; x=1674283487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+zRG3gH0OAuV4AFliy9juiq8ATfYC/v57zrcVecvZMY=;
 b=fXwzptY0fg/XdNYQjGR0ozBp/X/+TtwpoNisCqQL9UaJy9br+GCCTGUR
 ef0OAjCbpal3yNRSuu9823HaCZ6o1HY3wRiQADlHdCfXcApRC2cn+XPz4
 5mtG3x3Bk+Peg0COczun4cYFsRA6qgtVbofWft2IVpwgGw8xZfCMfcnhk Q=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 22:44:46 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Jan 2022 22:44:45 -0800
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jan 2022 12:14:33 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id 3DA5B225AE; Fri, 21 Jan 2022 12:14:32 +0530 (IST)
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_pillair@quicinc.com, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [RFC 1/2] ath10k: Set tx credit to one for wcn3990 snoc based devices
Date: Fri, 21 Jan 2022 12:14:26 +0530
Message-Id: <20220121064427.32059-2-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220121064427.32059-1-quic_youghand@quicinc.com>
References: <20220121064427.32059-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_224447_294307_3E1917D3 
X-CRM114-Status: GOOD (  13.75  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5025221325997553595=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============5025221325997553595==
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit

Currently for WCN3990, the host driver can send two wmi commands at once,
now it is limiting to one because if HOST wants to initiate 2 DMA transfers,
it is possible when copy complete interrupt for first DMA reaches HOST,
CE has already updated SRRI for both DMA transfers and is in the middle
of 2nd DMA.HOST uses SRRI to interpret how many DMA’s have been completed
and tries to unmap/free both the DMA entries, but CE is  still in the middle
of 2nd DMA which can cause SMMU issues or corruption.

Tested-on: WLAN.HL.3.2.2.c10-00757-QCAHLSWMTPL-1
Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
 drivers/net/wireless/ath/ath10k/htc.c  | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/htc.h  |  1 +
 drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f0e12556e7dce..fcaed7d176568 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -92,6 +92,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = true,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA988X_HW_2_0_VERSION,
@@ -128,6 +129,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = true,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -165,6 +167,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -196,6 +199,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.bmi_large_size_download = true,
 		.dynamic_sar_support = true,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -232,6 +236,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -268,6 +273,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -304,6 +310,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -343,6 +350,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = true,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -385,6 +393,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -434,6 +443,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -480,6 +490,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -516,6 +527,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -554,6 +566,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -625,6 +638,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
+		.tx_credit_limit = false,
 	},
 	{
 		.id = WCN3990_HW_1_0_DEV_VERSION,
@@ -654,6 +668,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_stats_over_pktlog = false,
 		.tx_mac_seq_by_fw = true,
 		.dynamic_sar_support = true,
+		.tx_credit_limit = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 61ee413d902a7..108980476d654 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -630,13 +630,20 @@ int ath10k_htc_wait_target(struct ath10k_htc *htc)
 		return -ECOMM;
 	}
 
-	htc->total_transmit_credits = __le16_to_cpu(msg->ready.credit_count);
+	if (ar->hw_params.tx_credit_limit)
+		htc->total_transmit_credits =
+			__le16_to_cpu(HTC_HOST_MAX_CREDIT_COUNT);
+	else
+		htc->total_transmit_credits =
+			__le16_to_cpu(msg->ready.credit_count);
+
 	htc->target_credit_size = __le16_to_cpu(msg->ready.credit_size);
 
 	ath10k_dbg(ar, ATH10K_DBG_HTC,
-		   "Target ready! transmit resources: %d size:%d\n",
+		   "Target ready! transmit resources: %d size:%d actual credits:%d\n",
 		   htc->total_transmit_credits,
-		   htc->target_credit_size);
+		   htc->target_credit_size,
+		   msg->ready.credit_count);
 
 	if ((htc->total_transmit_credits == 0) ||
 	    (htc->target_credit_size == 0)) {
diff --git a/drivers/net/wireless/ath/ath10k/htc.h b/drivers/net/wireless/ath/ath10k/htc.h
index 14e5c3f712c11..a84d76f062d36 100644
--- a/drivers/net/wireless/ath/ath10k/htc.h
+++ b/drivers/net/wireless/ath/ath10k/htc.h
@@ -41,6 +41,7 @@ struct ath10k;
  */
 
 #define HTC_HOST_MAX_MSG_PER_RX_BUNDLE        32
+#define HTC_HOST_MAX_CREDIT_COUNT	1
 
 enum ath10k_htc_tx_flags {
 	ATH10K_HTC_FLAG_NEED_CREDIT_UPDATE = 0x01,
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 0dec9f01cd4dd..0d96df311b026 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -625,6 +625,9 @@ struct ath10k_hw_params {
 	bool tx_mac_seq_by_fw;
 
 	bool dynamic_sar_support;
+
+	/* limit tx credit */
+	bool tx_credit_limit;
 };
 
 struct htt_rx_desc;
-- 
2.29.0



--===============5025221325997553595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5025221325997553595==--
