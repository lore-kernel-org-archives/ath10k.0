Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE76CD128D
	for <ath10k@archiver.kernel.org>; Thu, 28 Mar 2024 17:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfZaLSH9sfGg1t8HLxW0Yvj6/ynr0oCl38jYR5QeVdw=; b=vcolbTyPdiK7BH+QKBZhwik+0g
	hlQrZk+JEouF5NZxnjx2gG5a5DD81L2yW5St3ep5dIkCwI1Q/HRYWOM1Fcf2nfEufSEI2tUjs0zBI
	K2uVGPjinUXWAAewNh/WPi3eLlI9xJU0FNpNtsAaGUCc7uB8fQhpbsuXGTHNzQWRuCeosaDHetoGM
	xoq8Esh2AhiYcdYf25kwASiCTzeN80fCjLQ+GwypM0lyGbN38XlLqp5g1vVIgeV+oLjVuuCdzHm+H
	iZPyJtmr39M40tmV1Ps232VstscMmfbiR361AasdfkSbkKrYwew0wHStQirytLyN8K9I6NVhtqGb9
	/FoMI56A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj8-0000000F0Ho-0lkg;
	Thu, 28 Mar 2024 17:39:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptj3-0000000F0FK-3igR
	for ath10k@lists.infradead.org;
	Thu, 28 Mar 2024 17:39:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5157af37806so1419526e87.0
        for <ath10k@lists.infradead.org>; Thu, 28 Mar 2024 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711647579; x=1712252379; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SfZaLSH9sfGg1t8HLxW0Yvj6/ynr0oCl38jYR5QeVdw=;
        b=JAdQQWlz7pHdJBByNzG5zWCJJ6fXclQr3/1eGOCfS3tqfAU9iB9654VDvY/d3EALU8
         1K3euzJY2yKgBNlrlqh4FGCJqHc2WHvOatC6WRQrkUgxk5HuO0TR7VRo5hLl4J22vMRQ
         dSvLl8BaOSgFWDBTlcqek/9HQfhKKqjzrZgyhVIyiY+6GIO8+dtrVQC94DNrQZGoaW03
         xk5BeBd7SEat50l8rnABBwnuWntobpFYEAUsnyYnrljRTVcODm9rjl2kwormVG9FHmY8
         cvek20D4tSUhJdHbDR/XeS0XuXuCXcCekeG+Sobrc9p7Mol+MJCLj2KSGPpYdkuWqdwD
         ejAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711647579; x=1712252379;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SfZaLSH9sfGg1t8HLxW0Yvj6/ynr0oCl38jYR5QeVdw=;
        b=TeO8nbK9XKSb+XIvwl9XMxq5kJ2e61DNDRJLQQ+FImIocRSvbzOhZbJ/YXsDbYYQGE
         REXr6xnF4+X10P3++QFG7jwupVEEG1GRL28XbKZh8mQ5jVdFqb2G32XMMm0t5M5Id157
         t5hVZ6AkE4g1EL82srUo9b1rUxWjcVsRKjGjKDeu8fh2DvWXXtaO7wCDrGI67OPtQk9L
         AEfQW9bw6tgvrFSwW91Cp13y6mrUQozRtvoOSHAHj5REzKn33sIzin/nNbPTOvcNHmnn
         +6bffu7+IZYjNq+fXdeMUE3APcP29ja1dYxofQhXjTfeWn5bvWcr86rrGljq6MyGwYir
         mMdA==
X-Forwarded-Encrypted: i=1; AJvYcCV87u8glDTFY9h/tBI4e1oE4vCC6C75TkwnF3O2iuL6NWwjhZ18qEF49+hMEG0jKntJajeg+0+5o27QdjCO0bkFAIfz+VSrLY/nOA==
X-Gm-Message-State: AOJu0YwFLnA0/rCXD65kqMFoc0+o3n3c4zCmnwj9mfiIE67ay3qqdaMB
	yCIhpGHYMSrqpifD5niUWiqtERe+atsZ/mdwJW0y5rW1MWYpCJyAm5aYLVEuNdA=
X-Google-Smtp-Source: AGHT+IHJtfFGSxBmjD4dNUNq1FwHZ5u75l7O+jY6a7/Z/DevlcIO9iRfXrTDZupUiLsfoB+TOXi3tw==
X-Received: by 2002:a19:2d4c:0:b0:513:ed0f:36c9 with SMTP id t12-20020a192d4c000000b00513ed0f36c9mr84250lft.45.1711647578797;
        Thu, 28 Mar 2024 10:39:38 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b004148a5e3188sm6066643wms.25.2024.03.28.10.39.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:39:38 -0700 (PDT)
Message-ID: <45448d42-bc48-4b9e-adca-59a47e0674f5@freebox.fr>
Date: Thu, 28 Mar 2024 18:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] wifi: ath10k: fake missing MSA_READY indicator
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
In-Reply-To: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_103942_471513_9F6DCC1B 
X-CRM114-Status: GOOD (  12.97  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The ath10k driver waits for an "MSA_READY" indicator
to complete initialization. If the indicator is not
received, then the device remains unusable.

Several msm8998-based devices are affected by this issue.
Oddly, it seems safe to NOT wait for the indicator, and
proceed immediately when QMI_EVENT_SERVER_ARRIVE.

fw_version 0x100204b2
fw_build_timestamp 2019-09-04 03:01
fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2

Jeff Johnson wrote:

  The feedback I received was "it might be ok to change all ath10k qmi
  to skip waiting for msa_ready", and it was pointed out that ath11k
  (and ath12k) do not wait for it.

  However with so many deployed devices, "might be ok" isn't a strong
  argument for changing the default behavior.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 7 +++++++
 drivers/net/wireless/ath/ath10k/qmi.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..50e28fa37e430 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,10 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			if (qmi->fake_msa_ready_indicator) {
+				ath10k_dbg(ar, ATH10K_DBG_QMI, "qmi HACK fake msa_ready indicator");
+				ath10k_qmi_event_msa_ready(qmi);
+			}
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);
@@ -1077,6 +1081,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
 		qmi->msa_fixed_perm = true;
 
+	if (of_property_read_bool(dev->of_node, "qcom,no-msa-ready-indicator"))
+		qmi->fake_msa_ready_indicator = true;
+
 	ret = qmi_handle_init(&qmi->qmi_hdl,
 			      WLFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
 			      &ath10k_qmi_ops, qmi_msg_handler);
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index 89464239fe96a..c68526aad8946 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -107,6 +107,7 @@ struct ath10k_qmi {
 	char fw_build_timestamp[MAX_TIMESTAMP_LEN + 1];
 	struct ath10k_qmi_cal_data cal_data[MAX_NUM_CAL_V01];
 	bool msa_fixed_perm;
+	bool fake_msa_ready_indicator;
 	enum ath10k_qmi_state state;
 };
 
-- 
2.34.1


