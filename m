Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78826CCFA1A
	for <ath10k@archiver.kernel.org>; Tue, 11 Nov 2025 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMx2XLf6qtPnmgl2rSdlsqAkUBN6LRNeT4071Ryw4Lc=; b=qgFqVvbLCbEfkFDRkroRYVhhIo
	COUTAI672O1HRIZPAVx2zNjkp1gm2gWRkLCqzL/NA8y9aQ52+NSCU6luGzIDLX5W/BCkJqWxoVEja
	+Uy9aJNa4BgbYnqWc1Fc6OVAVQ3YHdlxMuEjPqHdOa2+UfqkRQXZBBZQ6crB6nsbjDWNbgIs4ou/a
	2xFaGoeYPXuvqCM5ELf3RTSL6osO2u+ikJkha2Do5qN/1MFjZ/ZPqPjhTDQo/vNI05DOknZHkuQ6N
	7Nwk7/EahkbLqURUka6gd+YfleIVHc0ib5m2eT2CS449084bkFasJRWL4x5AV3w+x/Bgk6p++SEHK
	On0YqbMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZq-00000007B4m-0F8W;
	Tue, 11 Nov 2025 12:34:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInZo-00000007B4D-4BKR
	for ath10k@lists.infradead.org;
	Tue, 11 Nov 2025 12:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4767361909;
	Tue, 11 Nov 2025 12:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C163EC19422;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762864463;
	bh=D4wbUhiFW8lL58BJ96tV/S4vY+chn5S9Zd4+E3M3Z0k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SpN6pEHQvQisjuZ+MYq5O0aTZM4syGd4jvueEvbxoaPIJ+UzQamzcyeOddIZ+3t8B
	 OS8xitaYndGrIpqUHIErnKLQM6i3iCT4GtXuGNwzR8aPFRGu0H2bUv7HzYQrAU3NvH
	 F43KrJf8hj0K7e9ZglHuDDsL0hXmZCSUxIfsuV8xpb07+MauiWTkFcbWxBu2EyNfQf
	 UJu1kWDMdxzsWAhVVG9WjIHMRMGFUff4VRIhLRdtoPNmdShsaiTgwM3+T2LR4Ktzdh
	 W3O8DNk23932Pw65hLvWxghQOtLhUW+QmTZpY89Cz2GzPr+ChT++4Vcklo1JKKS4r0
	 +VI0orQbRNMZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7977CCFA1A;
	Tue, 11 Nov 2025 12:34:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 11 Nov 2025 13:34:22 +0100
Subject: [PATCH 1/2] ath10k: Introduce a firmware quirk to skip host cap
 QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-xiaomi-beryllium-firmware-v1-1-836b9c51ad86@ixit.cz>
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
In-Reply-To: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
To: Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Selvaraj <foss@joelselvaraj.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3152; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=5FMo9aFaXqxUB4HypgN53V7+QK1qunFr3c9JmlKcclY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEy1OcjSNQgfs3SkjYQdqB3Ac1e1i9BymzVK5p
 q4Vd41ioPWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRMtTgAKCRBgAj/E00kg
 cuyWEAC9D0030HM8wP/qOsIJRe/Pu8yq1QRUwOLD8sGwTzLPMwrqnQvJxZAZYY4KDsblKksdaqB
 E6isr1E4Rwhw5/0C/CLclqBDTR5rESUqxnXB2wgAnRtIS6Gcf4V+Eoo5tNWo9NXoxES+dcfEfm8
 iIHczTJEU1p+gAeI4FBS548n3rA52l99eq15iCO7gMwGZaPWsJimQm3wrtQujkBQc+WKwCb/GgX
 +nOIXwd6X13j1/zyk8BVIud1PTTvzpWIjmpEPiQDig0/KJIfU1RecnWuMXmW3C+Y/peFjpJmnXb
 lv1/40F5WjdPWiViIpu4ilAO2FIdjcrkJzIRReREHA/9yHb8I+p4FDwIO5qGEe7Q1eSYp6jmqAb
 cbG6mvK8RmkwE71vUk8CHTnRTmLyJd/CWmLXHUTEfxWljiy1sW8emsS8QhVpuizCrSMeplh1aqA
 QMvB51XPKAIaiabfWZnS5LcAeGgd0o77VBCI6R+PK9ijJOpwH8hguuOh6Dev9VT4DQh1fRu7qsr
 vYTvxKNFVTRtICrzq5G8AtjGIy0aaBhjsNUvQBLukVtQoQKl2DEiw/lTz38Ghxo03IEc9kxLI3k
 zhUodl6gKCl6O9hByLElR7Qjxx4cbAxFpuqxtPSIp7jXvKpb+TCpZxOEWc82FMTaT8CgWttDnwV
 R1n70DsqzVPrzBA==
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

From: David Heidelberg <david@ixit.cz>

There are firmware versions which do not support host capability
QMI request. We suspect either the host cap is not implemented or
there may be firmware specific issues, but apparently there seem
to be a generation of firmware that has this particular behavior.

For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
"QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"

If we do not skip the host cap QMI request on Xiaomi Poco F1,
then we get a QMI_ERR_MALFORMED_MSG_V01 error message in the
ath10k_qmi_host_cap_send_sync(). But this error message is not
fatal to the firmware nor to the ath10k driver and we can still
bring up the WiFi services successfully if we just ignore it.

Hence introducing this firmware quirk to skip host capability
QMI request for the firmware versions which do not support this
feature.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/net/wireless/ath/ath10k/core.c |  1 +
 drivers/net/wireless/ath/ath10k/core.h |  3 +++
 drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f0..7602631696798 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -773,6 +773,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ] = "no-host-cap-qmi-req",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 73a9db302245d..b20541e4046f8 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -838,6 +838,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firmware does not support host capability QMI request */
+	ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 8275345631a0b..5dc8ea39372c1 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -819,9 +819,16 @@ static void ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
 		return;
 	}
 
-	ret = ath10k_qmi_host_cap_send_sync(qmi);
-	if (ret)
-		return;
+	/*
+	 * Skip the host capability request for the firmware versions which
+	 * do not support this feature.
+	 */
+	if (!test_bit(ATH10K_FW_FEATURE_NO_HOST_CAP_QMI_REQ,
+		      ar->running_fw->fw_file.fw_features)) {
+		ret = ath10k_qmi_host_cap_send_sync(qmi);
+		if (ret)
+			return;
+	}
 
 	ret = ath10k_qmi_msa_mem_info_send_sync_msg(qmi);
 	if (ret)

-- 
2.51.0



