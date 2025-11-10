Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114F3CCFA13
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6VB+NaaZFxNDzfkG1UeDAjFWL6A0yol/GSaPyRSuKc=; b=rXJM9yqVwu6onQ3PwxRjoFhhoO
	Q1SEU9DOiR5L4FjE/FglWpAw0J8loN0I5GmWUp8C1CLRETCbyrR4FALHEk+b/qtC10MFSNz/7wLJ1
	bY9o21axBmHUtwt9OU1c0NnvWLfM4Mvn+8rRMvlKRTDKqpWRcvnD0JToW2ZZy9E2ru5vUoeo52Ydv
	qCHhVtbat22QGGZObLhbcPvJBVRvpPOc3OhqAW55rymWw1zmRpH4L5f/CJ0czqfCw9rFIqU+srYOT
	KYtjUSwnoMUIrmdXSujn9hSVBZy0PiKTKEHq1Hq05LBe/pbJVdqzFreB3/bZuaJ5b4/LMUk7hLeRn
	YyEmunXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqn-00000005aAJ-0xfw;
	Mon, 10 Nov 2025 14:26:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqj-00000005a8q-3WCZ
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 14:26:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9247443B58;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15472C16AAE;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784788;
	bh=W4Xddx38U7txo280gHy7sOIWzGCYOYJpHgLuNmY+Btw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fte1e5EnfQZ+Hig1V8Hth6zhLbY2x9QqQN2UmgPo3QfD0RZCF0luwUegqsm6p/InF
	 S1bft4Fnu4dXJZkU+JT8/CeC2ASmTiyy7757G3kRV7QxprXwG3KyMiVIAhBaE3Sp/2
	 9EAQnHBzMs69agAdl/RRNHvcVIY0rHb3NLOyRYY3pVnChLI8cxt04xMN8Nhx4w2J6r
	 w6e+9I/cPDShcE5Gl+owvKKXy5EPXNEEFoWPg7Ny8f/HFtzkTRfJXXMQvUQuhgODY8
	 P1q3PkcV67uhmiltakjgagKJWjj/uE9zCJe1NotM3eXz/TnSCTBRZii4sKt+ShfQd3
	 uf9KOpvSKrYcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086DFCCF9E3;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 15:26:25 +0100
Subject: [PATCH v2 2/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-skip-host-cam-qmi-req-v2-2-0daf485a987a@ixit.cz>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3371; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=cmCfFb27+/OOz6UjhCZlw+5Qa2NlZ1ZstLT1jWys+FM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEfYSlTvetXSMCyXMTJHDwfIRcg2vCUwZXAFmd
 NUrd3jkOsSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRH2EgAKCRBgAj/E00kg
 cpDmD/sEm3qBpsLiWVYLsbJmuSuoEKwoT+H9uGhkq6SYayKQI57gdTfrK9vjP4cX3H0RjVg2yzg
 pk0KHMxM5Gz8Rr6IcGF/OMP7CmtFMFl8T+JZT61mhEkQ6slaoxT4ogrxKc2QYNCaNWh4zlbODwX
 va9qGl3cB8R/XZDWInXMNWyikAtA/Z2cuh6pCcCS/M7WLQ4ptaWk8OzS77WNZM8jmspp8rtAbJF
 gAKbePqoODZAR3whBMj8/mEw130bl+YmIlE1QudFoayzHCuTojRcSay6XR/Q3cqAl6pzkGOF8DA
 w4RSVoSlt/Wffijv6qmCqq01s4MO17hrrjAfPq8/V8AVmESZXGau6ex0I4DmedPb40VQ524IJtj
 BQLHoEQxhuaB+pVetvvuoNblppSxNsABmpecind0DG2AWJ+XYnnIXeMWf7ZkTBeFcINh9jAA63E
 DzAU+t1scOnMYpXMI0kHJPSWl1LpIjp4fHv0445izxisp8X9Ht+gGoxyGZWM5HzISEN5Zx8EiRb
 XFg5+nBW5L+g1P6awZ36IMx4W82QwUORfAstXQKSFgh7C4YaPxTja2ZXNp4ywpuQDqnHKqagVay
 6sK8nVCgDMLFNWmXhhtPbmY0ILgfZ/Rx1wwQraY4cAkHhbiM73boA6Qn0EFHnE0TbA9uk0hE9hM
 0aQ7pICcGC7s0vQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_062629_918766_340C9B2D 
X-CRM114-Status: GOOD (  17.19  )
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

There are firmware versions which do not support host capability
QMI request. We suspect either the host cap is not implemented or
there may be firmware specific issues, but apparently there seem
to be a generation of firmware that has this particular behavior.

For example, firmware build on Xiaomi Poco F1 (sdm845) phone:
"QC_IMAGE_VERSION_STRING=WLAN.HL.2.0.c3-00257-QCAHLSWMTPLZ-1"

If we do not skip the host cap QMI request on Poco F1, then we
get a QMI_ERR_MALFORMED_MSG_V01 error message in the
ath10k_qmi_host_cap_send_sync(). But this error message is not
fatal to the firmware nor to the ath10k driver and we can still
bring up the WiFi services successfully if we just ignore it.

Hence introducing this DeviceTree quirk to skip host capability
QMI request for the firmware versions which do not support this
feature.

Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
---
 drivers/net/wireless/ath/ath10k/qmi.c  | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h |  1 +
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 8275345631a0b..ba5ab942e7ef8 100644
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
index b3f6424c17d36..4def51cac2ed5 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1346,6 +1346,9 @@ static void ath10k_snoc_quirks_init(struct ath10k *ar)
 
 	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-8bit-quirk"))
 		set_bit(ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK, &ar_snoc->flags);
+
+	if (of_property_read_bool(dev->of_node, "qcom,snoc-host-cap-skip-quirk"))
+		set_bit(ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK, &ar_snoc->flags);
 }
 
 int ath10k_snoc_fw_indication(struct ath10k *ar, u64 type)
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index d4bce17076960..403f35af34c5d 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -50,6 +50,7 @@ enum ath10k_snoc_flags {
 	ATH10K_SNOC_FLAG_MODEM_STOPPED,
 	ATH10K_SNOC_FLAG_RECOVERY,
 	ATH10K_SNOC_FLAG_8BIT_HOST_CAP_QUIRK,
+	ATH10K_SNOC_FLAG_SKIP_HOST_CAP_QUIRK,
 };
 
 struct clk_bulk_data;

-- 
2.51.0



