Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD1C19F53
	for <ath10k@archiver.kernel.org>; Mon, 29 Apr 2024 14:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slJpYmgS90L/h5w1hii7W5uz2RIsMI5ZLFBw+Kaucdg=; b=gRsGzyQQtiLv69bgIO0paG4zO0
	JuRbyJgZoFumnhYv3ZJVqFb4HBPtKSq/0vu63lqn0tMWYYTpvEbMTeY8+O6RlFNnuNablmaYD7xiS
	ugQ+pdMEkB7Dsc84J8qPBfCWIZeU62JK9jUE4KyKYQsIDh6HwCBlnEalwMPwuqixIutP7nXe3OSRX
	vRNvlB6ogU/5EKIeLTM1/Vv0NNlQ/ybt8YC4ShNXTK4G8jRmj7CZJrBU/Vctkmw6zjtDpfTxjvjRZ
	dKtKsSL0Ah0z0jGZuiDY86Pnc4m92n27Ct1UgTCzhfFrUcJkf/ykhl388fUew5+D8tjnG3h1+BEJM
	OnIq+p3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RgE-000000034OK-0IKf;
	Mon, 29 Apr 2024 14:08:30 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Rg8-000000034Lm-3VXe
	for ath10k@lists.infradead.org;
	Mon, 29 Apr 2024 14:08:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-34d1ede7e51so603141f8f.1
        for <ath10k@lists.infradead.org>; Mon, 29 Apr 2024 07:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714399702; x=1715004502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=slJpYmgS90L/h5w1hii7W5uz2RIsMI5ZLFBw+Kaucdg=;
        b=ZDztiWz+qbRBn0/8IEpYJ6+qpfvZVwyskBYjFxLbzwX9x173AUcM/bosK/lT803rSh
         2P6kQ1w4AV+tp9cmbDH+/bYKvQpcsZcCJcyOidhDf9rk0t/IZxoTUUIWfdfAk98u4HRU
         Lmk9qJ7afhriYBNFhp9f+wlluCu7AyY1Pxx0Nofcb5Ss9nk8QGK5+KL0+641G/YbN3oG
         PI5ghljHhkHYBek6SqLmi4mvV9gCWxoN8aZ/0XusxlBq3/2hl9iZ36LahZQUFtkAIM4J
         Ifa2l75GVeU4/8TVodHrNJiMAQUHOf/CtW7Rck+AenV/9KzQNqJNOis/UoubNydjDoVE
         8wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714399702; x=1715004502;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=slJpYmgS90L/h5w1hii7W5uz2RIsMI5ZLFBw+Kaucdg=;
        b=DjOEqyt86QnUrQl7bPpxjVcVv3XOXf1mjfkydLL+gH5zFrcFESibrPcwWjI5rJyn1G
         wyq1aqUgpywvutVz8SvME43k6G/WPbLvfwWFR8uNxhOxVKVMr1LJOZ7hvolRiwvkABtZ
         4hxBK9GkN+F3quyp1ajD8NdOUcdQy8VnrDa+2/HSbp+fVCkMHzPpBjaylHMPT21OpuEq
         V0LLDAcFSyjAbaHcNnFPMC6HgJ8H+5wsGxZIiu+iBaWQ+mQivjbkq22wptGgfm6cBsY/
         scmXzJuizIBCdr65SJtoc11pmrNVpp4mkKv17om5iazKJqh4xuuPhygu1r7pC6Ac2IaH
         FaOw==
X-Forwarded-Encrypted: i=1; AJvYcCW0NjWgiB1ANtrzBEyfmgN0Y4fMZqsCT5DZFZjv/vpavmbOwkNt0f4D+XdAeMNoLGBIz7Az9nBuaxo77tQ2gvGEiOFvsxZVPzj4CA==
X-Gm-Message-State: AOJu0Yxy5wbRttJXr0shbUfYKwE9eqvMTBAHtY+NR9o7Rz1o8bISWkly
	sQ2xrAMjvICrHm3pjCQ1yacqDR6X9KJIeTe3pwEsOLJna5GDDLEi/YX7veYCmKQ=
X-Google-Smtp-Source: AGHT+IE0U6L3fujZHlk20H5CVqIRzvRH48z34sBirtpJ3xZOuT9o+7jDn4hp8aLzGpTqiK2yS6z6Yg==
X-Received: by 2002:a5d:43cf:0:b0:34c:ea34:7191 with SMTP id v15-20020a5d43cf000000b0034cea347191mr2786066wrr.21.1714399701848;
        Mon, 29 Apr 2024 07:08:21 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id h1-20020a5d6881000000b0034615862c64sm29585477wru.110.2024.04.29.07.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 07:08:21 -0700 (PDT)
Message-ID: <23540303-5816-45d5-a1af-5f09d645a73b@freebox.fr>
Date: Mon, 29 Apr 2024 16:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 2/3] wifi: ath10k: do not always wait for MSA_READY
 indicator
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Language: en-US
In-Reply-To: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_070824_914296_3301181D 
X-CRM114-Status: GOOD (  12.24  )
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
 drivers/net/wireless/ath/ath10k/qmi.c | 11 +++++++++++
 drivers/net/wireless/ath/ath10k/qmi.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..f1f33af0170a0 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,10 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			if (qmi->no_msa_ready_indicator) {
+				ath10k_info(ar, "qmi not waiting for msa_ready indicator");
+				ath10k_qmi_event_msa_ready(qmi);
+			}
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);
@@ -1048,6 +1052,10 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 			ath10k_qmi_event_fw_ready_ind(qmi);
 			break;
 		case ATH10K_QMI_EVENT_MSA_READY_IND:
+			if (qmi->no_msa_ready_indicator) {
+				ath10k_warn(ar, "qmi unexpected msa_ready indicator");
+				break;
+			}
 			ath10k_qmi_event_msa_ready(qmi);
 			break;
 		default:
@@ -1077,6 +1085,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
 		qmi->msa_fixed_perm = true;
 
+	if (of_property_read_bool(dev->of_node, "qcom,no-msa-ready-indicator"))
+		qmi->no_msa_ready_indicator = true;
+
 	ret = qmi_handle_init(&qmi->qmi_hdl,
 			      WLFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
 			      &ath10k_qmi_ops, qmi_msg_handler);
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index 89464239fe96a..0816eb4e4a18a 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -107,6 +107,7 @@ struct ath10k_qmi {
 	char fw_build_timestamp[MAX_TIMESTAMP_LEN + 1];
 	struct ath10k_qmi_cal_data cal_data[MAX_NUM_CAL_V01];
 	bool msa_fixed_perm;
+	bool no_msa_ready_indicator;
 	enum ath10k_qmi_state state;
 };
 
-- 
2.34.1


