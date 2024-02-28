Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614C9C5478C
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 13:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b9XPJO7rlQBlp2t51YDB1EGQoKfjBIBca4L4WINiZhQ=; b=UO/3II1OKVVc05csHpMkq9IGRD
	GCINXIcMFRbJUdKNH2oANqhSQysdqZpXCSfr2IWIP2n386Gk7TstevUGSLCrBq1KUmHrXcyQ9puvq
	aOZxzfG2etlvY4aXdgU9JuuoOmVRRfOH+rMzU8DS8H4ZWRlYA0Yz8a14+a3QYkImuT9IfCerF+MKw
	LYDA/byuFttZ+6dW6CCcPwgzs2iVE21z1+4NWchw4tmiKNeP+ce5hZSBoOQGLSQ10RO2qB9CbEWOu
	V3pyYk6+hDGVBvRhB+55zmDjdu+ztcdVOD3k7LCzA2T7VQ+COZYZqhxbz/kDVPjOKxv924hmK672q
	vWguE36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxy-00000009Sjx-0GTB;
	Wed, 28 Feb 2024 13:27:22 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfJxt-00000009SiY-0d8w
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 13:27:19 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a440b1c445eso83619966b.1
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 05:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709126836; x=1709731636; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9XPJO7rlQBlp2t51YDB1EGQoKfjBIBca4L4WINiZhQ=;
        b=SSIlZzgW74eX7v+lTSm1c+LvVncRSnTCp47NmqlofBzqzm/rNacng6Jq/8KzPhEApo
         ZacF/WOUweegLd0SHmR4TtSzigq/HyWKtaEgtVz+KlLpdATpQk+kKmmWb8F3BdOclrOp
         97OK0CcmPG1RLFy4Jwr3Y0djrSy6+AUc1e+/fK/AB0p5rlIbXwmqaKd6B4Fc+ty0MdKb
         agtCzYdSApx/NVh69OB0kppO6+QaPvf00N5Yo4HuTcvxwN8aUvZoKEip4aRztB60WeHX
         lD39p00dl/Un3+2TdvHa+DltZrULAc58OHSnyUdAz89kI390n7oLRxMrfKcri1z+l8p4
         BRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126836; x=1709731636;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b9XPJO7rlQBlp2t51YDB1EGQoKfjBIBca4L4WINiZhQ=;
        b=kXT4o1+2My9ZwYRrYcIbLi073O5vsIrX2DIxtBVRELem45bedrlMyQ4cVCw1HR3F8/
         ooYWJm6vOjGY4XirTzw/at1ysQ6pJR1s76vte7HG9G5qIo6FArCNw4qj/jm0yILg6RNc
         eeewhl4nC1cz521FsJipAXch+9WGg3HGbqdQOfu+BlW+TW+8QELfgjKhldNbIQ30DE7e
         Pg9ccR1HIS8MsI35nKQK4uDa8i+bT7NP+eR5h8H2i0P2oSuVs+2F/6r+rOejRJdwsYFp
         3zydzmDQYvhhFJb3IdKDjB40FzHtNrrXpUg98XMYvLZUZ1o+6yiCkV8YD+P7qEJBYzaW
         O6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgxhpeY9Fz6aA+qrkVED1OwuTV3VOlWULkl3vRT+Od/G5GBByLOk3Z6Ja4fWO8dEpVrjTi6lbjGZ8w1bjJbXHzqJeTiAlB360SHQ==
X-Gm-Message-State: AOJu0Yw8vKTyeceHrfCMCTrfU716WZyGjOh+i5jQFUG2sJeJRjeDiyeD
	Z/j1kN7MYBEnvmDWM9uVFFRUZAuzIhW0nFwhjMwdbF3sw2HeYD9ROwyxHdxEvzY5FmmfrSO/KAZ
	ycuM=
X-Google-Smtp-Source: AGHT+IHBq9tBWWcAxJtiydUcMmsGN4VjdQJ0kgVN2GaOpI5Vp1/hOhyXh0khuVAVbkqmVqLQ1ttCsA==
X-Received: by 2002:a17:906:7712:b0:a3e:53d9:c7d5 with SMTP id q18-20020a170906771200b00a3e53d9c7d5mr2133878ejm.36.1709126835730;
        Wed, 28 Feb 2024 05:27:15 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id s6-20020a1709060c0600b00a42e4b5ab00sm1839417ejf.41.2024.02.28.05.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:27:15 -0800 (PST)
Message-ID: <dd4b3fa0-b7f6-4115-ba12-5e5154ae9a79@freebox.fr>
Date: Wed, 28 Feb 2024 14:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] wifi: ath10k: work around missing MSA_READY indicator
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
In-Reply-To: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_052717_228047_448872F2 
X-CRM114-Status: GOOD (  10.68  )
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

From: Pierre-Hugues Husson <phhusson@freebox.fr>

On our APQ8998 device, driver never receives MSA_READY indicator.
We only seem to receive FW_READY and PIN_CONNECT indicators.
Not waiting for the MSA_READY indicator seems to fix the WiFi.

Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/net/wireless/ath/ath10k/qmi.c | 5 +++++
 drivers/net/wireless/ath/ath10k/qmi.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..c7724a3588549 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			if (qmi->skip_msa_ready)
+				ath10k_qmi_event_msa_ready(qmi);
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);
@@ -1077,6 +1079,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
 	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
 		qmi->msa_fixed_perm = true;
 
+	if (of_property_read_bool(dev->of_node, "qcom,no-msa-ready-indicator"))
+		qmi->skip_msa_ready = true;
+
 	ret = qmi_handle_init(&qmi->qmi_hdl,
 			      WLFW_BDF_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN,
 			      &ath10k_qmi_ops, qmi_msg_handler);
diff --git a/drivers/net/wireless/ath/ath10k/qmi.h b/drivers/net/wireless/ath/ath10k/qmi.h
index 89464239fe96a..3622714a405bb 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.h
+++ b/drivers/net/wireless/ath/ath10k/qmi.h
@@ -107,6 +107,7 @@ struct ath10k_qmi {
 	char fw_build_timestamp[MAX_TIMESTAMP_LEN + 1];
 	struct ath10k_qmi_cal_data cal_data[MAX_NUM_CAL_V01];
 	bool msa_fixed_perm;
+	bool skip_msa_ready;
 	enum ath10k_qmi_state state;
 };
 
-- 
2.34.1


