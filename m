Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D377D109C040
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UKhz06dTSTV88sZEw14fI5dsnV4A6kC4eZthMCgr2Q=; b=GuN14dKI5ZpsWk+71CGNxahAyS
	OqEJ80Ve4z9RFYoOOibVnoe3rdOqOFiIK6xKZ2BaFe8XmHqqg/XDTDRNlUCFFZae76uLCQkQCy3Z4
	jP3nUz7N03prO6z/Sgja0Wb83dTsVqo9/rdrQKIcDIbqNmolzmhEWBEpjR1an5o3KIeC4lSnTp0uo
	6tkaqgn2660aS3SHFz2zFjxRk6FPM4MSNcWw+StGXcQp6VMml6Z2ZQFmojrIuTNvCCTs8rhl+BP7j
	i5lNI3TPgQOMmC2TFAf9N9TLp2wGZ6UBpYcf+0qELLINX5T/6uYU3YRRMm7T4FJcfmIfI3Mizkk5B
	96TvRLSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STn-000000041Zs-42lp;
	Wed, 25 Mar 2026 17:57:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STm-000000041Zd-3qyg
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 17:57:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C5BD60103;
	Wed, 25 Mar 2026 17:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB3CDC2BCB0;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461437;
	bh=SRtdPBa0tcNCzl+HO0BObCvLUHh2UjsIHIIIQfNSZlI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EbWhKFgrWvOyu1Bkls+wkgIu5jN63+7sCO7rwEl6dzagOTLNt3QI/0jXXjP3xqXVG
	 TPP1iPH1EO59Q8w7Nl0Xy2jWdTaKpBfkM85sFnTVgypGKFkIb+FWr/f0gz4RcHrQBS
	 aTArQYepo5Oc9kfzfOH2Q3dfOmZgB5U3RTfhfQ6XkQOqvT8sryJfgxjzgqoVLsvpZs
	 hpa4wyvFYwR9BwV2RddUVsuOGg5TXwA5xLfP17ErG0d/m5rY+eNWlD7Xby4cwfEqm/
	 kDOTxNakE37AWHBHB4Lh7NXwg3JCq2EPsOYJ2UZWAEABjz/upaOEMZIb16Gal2UuL+
	 WMYFGCzUevT4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE6109C052;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 25 Mar 2026 18:57:16 +0100
Subject: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
In-Reply-To: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3364; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=UTkKBACGLvaXcmRbJw5uCHiS4miIsN2vwhwdC9DQ5n0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxCH78K9ly8lE2lWicWxBVkBFyYWU04No+j2Jp
 qVgJGG89FKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQh+wAKCRBgAj/E00kg
 cnP1D/0atIwyGIZK7+wVOOqpa3UaZtclm1FJLcJIQpZ5fPRlUvXpvInUN9KAOLwzDy29m3b9VWf
 /osir0ogyljci6mawtR+bRGu3Ms1Ecvt/l980YfVrVAkPiFUdADdwA9lYPoxQuLSbvO9BZIxnH2
 sUlVHEGaZoZ6K8M8dqP3jlRDwXPO1rn/JKNKw+ycc5Jvin1NhS6uT2PQc9hWXbFDZXnzBTwoeIY
 9x7PK4VpcPMDvipLkwilkJmUtPMK+hZ3+ikNJY7hFy6srUNLRqja8XS+IiA5V2V41U8h4uw/m6M
 aN+MGS9i2ornGL7s9bmrYfW656w+Sn52Nq2bixIeF5pgZtYt0QBvZq8tWZwxISlmL/9Cd8moNjR
 1OofbzQ8sAdX654u3jGYrkWUiqdk2gFUAeQgs4bbJBLa4DbViRAP7DlNkxbW1Tc0t9ChmOEC4Hw
 pVyaJVShcs2sAPbwts+pTaWkDASlnLV/vxYzg1akal7mv/xrH1uP1Fn9TwZ2M8LWf4frO4DEnHQ
 7I9d9W7oZ0tH4qEv0qFT86XDLnQKR/AMHUO0hyc1x5+waf0u4myJ+z/tDkscYAXwDYsUH0CGIW3
 MOXvPh0CQkem9Mrvz1PiLheo2mjzxq97NZj6Xq8T6XZrNqixqXHZvIqeCzUrQ2C4AfFUPRJJ761
 K89RaYQ42ci4BbQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Amit Pundir <amit.pundir@linaro.org>

Some firmware versions do not support the host capability QMI request.
Since this request occurs before firmware-N.bin and board-M.bin are
loaded, the quirk cannot be expressed in the firmware itself.

The root cause is unclear, but there appears to be a generation of
firmware that lacks host capability support.

Without this quirk, ath10k_qmi_host_cap_send_sync() returns
QMI_ERR_MALFORMED_MSG_V01 before loading the firmware. This error is not
fatal - Wi-Fi services still come up successfully if the request is simply
skipped.

Add a device-tree quirk to skip the host capability QMI request on devices
whose firmware does not support it.

For example, firmware build
"QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"
on Xiaomi Poco F1 phone requires this quirk.

Suggested-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index eebd78e7ff6bc..e7f90fd9e9b83 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -808,6 +808,7 @@ ath10k_qmi_ind_register_send_sync_msg(struct ath10k_qmi *qmi)
 static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
 {
 	struct ath10k *ar = qmi->ar;
+	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 	int ret;
 
 	ret = ath10k_qmi_ind_register_send_sync_msg(qmi);
@@ -819,9 +820,15 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
 		return;
 	}
 
-	ret = ath10k_qmi_host_cap_send_sync(qmi);
-	if (ret)
-		return;
+	/*
+	 * Skip the host capability request for the firmware versions which
+	 * do not support this feature.
+	 */
+	if (!test_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags)) {
+		ret = ath10k_qmi_host_cap_send_sync(qmi);
+		if (ret)
+			return;
+	}
 
 	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
 	if (ret)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index f72f236fb9eb3..3106502275781 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1362,6 +1362,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
 
 	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
 		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
+
+	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quirk"))
+		set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
 }
 
 int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 1ecae34687c21..46574fd8f84ee 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -51,6 +51,7 @@ enum ath10k_snoc_flags {
 	ATH10K_SNOC_FLAG_MODEM_STOPPED,
 	ATH10K_SNOC_FLAG_RECOVERY,
 	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
+	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
 };
 
 struct clk_bulk_data;

-- 
2.53.0



