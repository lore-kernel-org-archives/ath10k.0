Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74703CD128A
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMk/LPFqs7VskBV22jyb1Tdh2P4ZoSSQNrYCMOikFmQ=; b=uGFysMHr8q2PqF/rnPRcVQky+8
	ThwbNrzBOXQfpmqn+5SgfdNGv1lSKzE2V/bxQ67p830ShIp+MpfDOmHRN/3OiQmZ/1ej+3wg8oz9T
	/V1V1FKZUsPNgonblN7nN/6ashoSL+IFzZ/nHSkTgPV9qnukqa3chxZQON4fnIK9I18IHsI4UYxP/
	oI7+7A0M74CqtdJqVv/EDXV1qUHAvC9BzEqZRiczY6w/0qq0OS+inH96OCkTtVas46tdI+x0866DE
	lB8dkMq1tKMUX0/1w8aypsg7HeQjcPfEYXL9wnavI1aUyZs8GE+rJylfuWtv+jsN4z9XCqWwzQ72V
	BC1QXGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs59l-0000000HLGr-2p01;
	Wed, 03 Apr 2024 18:16:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs59i-0000000HLF8-0j05
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 18:16:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3436b096690so989453f8f.1
        for <ath10k@lists.infradead.org>; Wed, 03 Apr 2024 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712168166; x=1712772966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yMk/LPFqs7VskBV22jyb1Tdh2P4ZoSSQNrYCMOikFmQ=;
        b=HW1uTYfGCT/wWepEcDc6s9vg/Uf9Th8JGAEAEGWbWr7rKwPZxv3YjqK/IfLMChan+/
         sHUJzLjkhb6w1kneervtkbXmK4+AeHjp0tbPawWsBDx0Rwf51m3lDjzY6pIb0aGKAIiu
         Ka5x1J2tWRqqgMvZBQf+lh8oVPeGpdi8irLW292vlx2wlkcKmgkG4asOows5EvWShyrp
         q4df3xrf6IlClHyCmTaQgxdqi94iCMYtQ/IvDXemFwNDRnicYnYmMzMjxne7vxD4mY/s
         GImgDXqz29AVZZrAbc66Wz145TmNhxwL/d06TK1HomPR4f3SDg/UVySLW/lJDvspcNp1
         gW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712168166; x=1712772966;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMk/LPFqs7VskBV22jyb1Tdh2P4ZoSSQNrYCMOikFmQ=;
        b=jxOVYaZx/EZ/PiN14asCbeGpD7cL8/InT5N8Es+qqmJCRjKMFczlhAo0/fBZOtFqA9
         V26nDrCfYUa8ymXEbGGfh/FmsphLq8rcHmuTqdBzD5wHF4bqC11VTlWbpZPWQpX2qzzA
         sH421ceJK2veHqTc1LHKRv2M7NgkU4gw+OMMa0qkm9vnQZcEQRZ0soDZCrbCeIsEPvH9
         gK/kIF/YXEvJltcJqKyG62JJnVD6fZT2/4OiGWocNJH4tVentVJ20vh/uJNQ6TM6v7BV
         16KBDs2IMuVdwMMpHZr4dIcGgPWubFk/0+yw7vcLgmQy35EBR1Lcqn9IISyuMxolXGIB
         3Zbw==
X-Forwarded-Encrypted: i=1; AJvYcCXmakT2YdpFYDp/MmcLOdNuGXExXndus8ZjjwGEJfquM7ohhxKP71D13HY+vWKL7X3HKkCBCh/z1iH99jLrkTdqf9BDDY/EmM+ZNg==
X-Gm-Message-State: AOJu0Yw6z9E//CKJ639qYL0ctYSkPSnMI/5PqQgRmAz3X8u3Q2U1+A5K
	KxasYyPBa0c2riQJuIX2OBkyDGttOc3xWsXVV2QcVUPVBDCB+sDdvgM6N+g8RJ8=
X-Google-Smtp-Source: AGHT+IGo6IK4jzvPBeq+2C/SXoVrcSjTLf8DS+QLbHtNh0mgQm3NoGkkSkE8i74VGzKZ5Xv8eEXnFQ==
X-Received: by 2002:a5d:690d:0:b0:343:8485:4edd with SMTP id t13-20020a5d690d000000b0034384854eddmr3336441wru.23.1712168165964;
        Wed, 03 Apr 2024 11:16:05 -0700 (PDT)
Received: from ?IPV6:2a02:8428:2a4:1a01:79e6:9288:5142:9623? ([2a02:8428:2a4:1a01:79e6:9288:5142:9623])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c450a00b004161b59e230sm6352480wmo.41.2024.04.03.11.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 11:16:05 -0700 (PDT)
Message-ID: <43e18846-cc4f-4b30-8019-4617359ddaa0@freebox.fr>
Date: Wed, 3 Apr 2024 20:16:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 MSM <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <91031ed0-104a-4752-8b1e-0dbe15ebf201@freebox.fr>
 <CAA8EJpooJLbV+nVWedru=r6fascd8ZxKumiMm_iyzzJwyQ-tig@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJpooJLbV+nVWedru=r6fascd8ZxKumiMm_iyzzJwyQ-tig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_111614_364238_DE8BF24F 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

On 03/04/2024 16:12, Dmitry Baryshkov wrote:

> From [Jeff's] message it looks like we are expected to get MSA READY even on msm8998.

This is the code we're using:

https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/net/wireless/ath/ath10k/qmi.c

When ATH10K_SNOC_DRIVER_EVENT_SERVER_ARRIVE,
driver registers an "indicator handler"
ath10k_snoc_qmi_wlfw_clnt_ind()

It handles QMI_WLFW_FW_READY_IND_V01 by posting
ATH10K_SNOC_DRIVER_EVENT_FW_READY_IND
which is handled in the
ath10k_snoc_driver_event_work() work queue.

But QMI_WLFW_MSA_READY_IND_V01 only triggers
a debug log and setting qmi_cfg->msa_ready = true;

$ git grep '\<msa_ready\>'
drivers/net/wireless/ath/ath10k/qmi.c:          qmi_cfg->msa_ready = true;
drivers/net/wireless/ath/ath10k/qmi.c:  qmi_cfg->msa_ready = false;
drivers/net/wireless/ath/ath10k/qmi.h: * msa_ready: wlan firmware msa memory ready for board data download
drivers/net/wireless/ath/ath10k/qmi.h:  bool msa_ready;

So basically, the vendor ath10k driver ignores QMI_WLFW_MSA_READY_IND_V01.


I will test the following patch which aligns the behavior
of mainline driver to that of vendor driver:

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..0e1ab5aca663b 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 		switch (event->type) {
 		case ATH10K_QMI_EVENT_SERVER_ARRIVE:
 			ath10k_qmi_event_server_arrive(qmi);
+			ath10k_qmi_event_msa_ready(qmi);
 			break;
 		case ATH10K_QMI_EVENT_SERVER_EXIT:
 			ath10k_qmi_event_server_exit(qmi);
@@ -1048,7 +1049,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
 			ath10k_qmi_event_fw_ready_ind(qmi);
 			break;
 		case ATH10K_QMI_EVENT_MSA_READY_IND:
-			ath10k_qmi_event_msa_ready(qmi);
+			printk(KERN_WARNING "IGNORING MSA_READY INDICATOR");
 			break;
 		default:
 			ath10k_warn(ar, "invalid event type: %d", event->type);


Dmitry Baryshkov reported:
Works on sm8150, sdm845, qrb2210

Regards


