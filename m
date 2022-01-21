Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7823FC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 06:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/66Q+E3ea7bFOuI2FJ+ikghNObanfaLPL39d+fB0Xc=; b=UR45P/NeybRL5X
	+Kn3i8Zi94L2PE5Sg1eNDhYb/t73BHay7648TCBDb3NYjZlecSJr/5u3IB6zO1nYrdI+2nausAXV0
	E9g7F+0YNka50Kjaw0AYD9AnJo/V4jpSotiv0zwHzlQ4wSp7YkIFCIV/d5NS+sJMxt9pKS/MvsZFA
	0OYcGTBuy2yNL1gdurjP1xqtXTAof8kF/0O5SzwCmPtjAF19j5Z2066mDdrNvWKGMMnglJCsI019E
	A71y2uwe4Yp5QClDeJP2w6eTQ1WT/p+4aFN3kxXRzTXmCvOuOolyv8RjMLuOE7PXW6m1J7YRsn6r3
	nJTu8hNPEStj8DFYsYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAnfG-00DzQI-4z; Fri, 21 Jan 2022 06:44:50 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAnfD-00DzOr-0c
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 06:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642747487; x=1674283487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gnN8J7Hmx0zp2CogqSWzfQlfG3AuVKS1SW9uZDHI86I=;
 b=yJtFaQpF8f5NhnUxmQFboowMP5fr8nwVTSY+L94/cXUy6jFXAdS5LSr/
 xL2iiknIWC1E9UM24OlpczP7RWX5Zj1QvLH7/wNef8oETmJq5y0VeJPuM
 WIlLVw7dQmeWhMrFTZAusUekhbtbLnq2XsGmfDIcfS7w89l0gBKJww+dA E=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 22:44:45 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Jan 2022 22:44:43 -0800
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jan 2022 12:14:35 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id C04EA225AE; Fri, 21 Jan 2022 12:14:34 +0530 (IST)
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_pillair@quicinc.com, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [RFC 2/2] ath10k: Delay the unmapping of the buffer
Date: Fri, 21 Jan 2022 12:14:27 +0530
Message-Id: <20220121064427.32059-3-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20220121064427.32059-1-quic_youghand@quicinc.com>
References: <20220121064427.32059-1-quic_youghand@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_224447_143222_6F1D6DCB 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

We are seeing a corner case smmu fault issue where copy engine is still
accessing the memory though host unmaps it hence as work around
we are delaying the unmapping the memory.

Tested-on: WLAN.HL.3.2.2.c10-00757-QCAHLSWMTPL-1

Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 15 +++++++++++++++
 drivers/net/wireless/ath/ath10k/htc.c  |  5 +++++
 drivers/net/wireless/ath/ath10k/hw.h   |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index fcaed7d176568..65f775fb5ccab 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -93,6 +93,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA988X_HW_2_0_VERSION,
@@ -130,6 +131,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9887_HW_1_0_VERSION,
@@ -168,6 +170,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -200,6 +203,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.bmi_large_size_download = true,
 		.dynamic_sar_support = true,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -237,6 +241,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA6174_HW_2_1_VERSION,
@@ -274,6 +279,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA6174_HW_3_0_VERSION,
@@ -311,6 +317,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA6174_HW_3_2_VERSION,
@@ -351,6 +358,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = true,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA99X0_HW_2_0_DEV_VERSION,
@@ -394,6 +402,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9984_HW_1_0_DEV_VERSION,
@@ -444,6 +453,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9888_HW_2_0_DEV_VERSION,
@@ -491,6 +501,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9377_HW_1_0_DEV_VERSION,
@@ -528,6 +539,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -567,6 +579,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = QCA9377_HW_1_1_DEV_VERSION,
@@ -639,6 +652,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = false,
 		.dynamic_sar_support = false,
 		.tx_credit_limit = false,
+		.delay_unmap_buffer = false,
 	},
 	{
 		.id = WCN3990_HW_1_0_DEV_VERSION,
@@ -669,6 +683,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
 		.tx_mac_seq_by_fw = true,
 		.dynamic_sar_support = true,
 		.tx_credit_limit = true,
+		.delay_unmap_buffer = true,
 	},
 };
 
diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 108980476d654..e2640f244918e 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -55,6 +55,11 @@ void ath10k_htc_notify_tx_completion(struct ath10k_htc_ep *ep,
 	ath10k_dbg(ar, ATH10K_DBG_HTC, "%s: ep %d skb %pK\n", __func__,
 		   ep->eid, skb);
 
+	/* WAR - Delay the unmapping of the buffer */
+	if (ar->hw_params.delay_unmap_buffer &&
+	    ep->ul_pipe_id == 3)
+		mdelay(2);
+
 	ath10k_htc_restore_tx_skb(ep->htc, skb);
 
 	if (!ep->ep_ops.ep_tx_complete) {
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index 0d96df311b026..3f7539e8da0fc 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -628,6 +628,9 @@ struct ath10k_hw_params {
 
 	/* limit tx credit */
 	bool tx_credit_limit;
+
+	/* WAR - Delay the unmapping of the buffer */
+	bool delay_unmap_buffer;
 };
 
 struct htt_rx_desc;
-- 
2.29.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
