Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05191CD1284
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tknSODYMU/l/2VPgjwwryjgmML6llAA/U7CzR6kpVHI=; b=Cbk/alcOmEUm71py7pIJSEV4h0
	NTmokgWnWhGttEBlwpalsf4vxKY+RUBhauEwifRyiZjXWxx7DS+8u7hix5It1w/1PMme4J88ZSCqh
	9Y8ls3mt0tMtyAV/SislBDyHi4ABg7X3nK7qvh6+za54/T0htGbuZzGx3Do6aecTRm+guRYqHefrl
	ONnatkXksn2dRd+A8JuD8yaBvXm9qD93fLaKQkBitUpa+iUpM6u4ZpZcyem2skPnrBCbH/U9pPQVt
	GwXWj7ml8a/5kMQ7+qTIhXYbjHtC+yT+omaYq9ZPjt5yeHQK2SY9pZF0Grs2VgyJCOztA/ekmkWtu
	g4wNcjxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMv4-00000002mTy-24Gt;
	Thu, 04 Apr 2024 13:14:18 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMv0-00000002mTc-2Pdh
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 13:14:15 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6150670d372so10307857b3.1
        for <ath10k@lists.infradead.org>; Thu, 04 Apr 2024 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712236452; x=1712841252; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tknSODYMU/l/2VPgjwwryjgmML6llAA/U7CzR6kpVHI=;
        b=vCphCjj4yd2R18VE3qLB35pEyLuzkpHZKhjGGCfQpH4moiMGjTsSmbTRDAF8IQcsJI
         HfDpizE9VUuTTftpB5ehZB3GJgu0SVLrpdubKL92Ln1htdWh+ibSUSBdF1iUl2nLnLXa
         Bo3DXzz9Dcvhj29l9kWt2JqbSYBKBv3zy5Yf/PPY2IOxOEAjjm66+VOZXQctabrYFRKV
         wdbGPZ4YynMCpj0Eoo4fLP/KbzbV2nf9OnoU3p5cn/CSC1CGyHI7Kp1NI1rwLlQP217J
         Cu9+gwu8sZo72dxIvyd9mY3keDYByeln0mA7ReenA7eMuNQW8MFbdL0aGul9JlnR9iDe
         +iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712236452; x=1712841252;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tknSODYMU/l/2VPgjwwryjgmML6llAA/U7CzR6kpVHI=;
        b=XGQNXcI8N4RvL+ApIO/LiDFdFXX9YYnjIzrvkWKr6cI7ZyXzFBbJ7NHxuKGxgPvr/a
         HBFPtYXe35nL1sPIvP/u9xuRpAuGeSQewaDNMiCW7CY1fYJqdXXSwUiroSf20HClo7Ut
         fQx0t2+30AD4vPDfFcxQgaQjybsQzll1OOYkMDxfrZSGCYOY5oSZlFvdNCxHeoOXEzOH
         4hnunj60WNM60rq6nV3iuQh/eEeK6bEmzNhH7RPwgHVw7eM9YpztChxFU3k5hBv9UQmA
         Ac8HQkwIJq+vLweMEUytFe8QFcM0AWD+ybtzkZiHlBwBkfKcbKPmoBGO8dVN/6SYFGDl
         VbeA==
X-Forwarded-Encrypted: i=1; AJvYcCVtTmy5VO07M74vXcYsm3zz2391IAJFWaxlJixLpKHAw4FJ5h4PVBzSJ5Td3oV8yk4+WR98sk2VNz1RBk6B9lCrOpilg2WERO685Q==
X-Gm-Message-State: AOJu0YzH4H4G72jE991eT6s115pkdsfnFuTlVE4876nw4rOmwuLZgFR6
	T7ac+NgD6Ks30RlpFJQUx4MkbqD847G5yiEkkwtngIapNJQUnhkn+KxivtpQKg/RgAinlCcZHh+
	IXkvFOUak+KM8Cc76EJP1ew0P5uKsHowfRLbm2NYPyTYTat9j
X-Google-Smtp-Source: AGHT+IHryU3PLO20GBRCCgKMJ6XaprTWbXPQPdQ4lA3pQDeAvfm7RbBhJGsftpZ1ACzQsnluXERsu8pQW/NEsN9JBts=
X-Received: by 2002:a25:2e4b:0:b0:dc6:8534:bb06 with SMTP id
 b11-20020a252e4b000000b00dc68534bb06mr2340069ybn.17.1712236452434; Thu, 04
 Apr 2024 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr> <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org> <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org> <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
In-Reply-To: <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 4 Apr 2024 16:14:01 +0300
Message-ID: <CAA8EJprBe_th5n_J4BRxUhAO1k89cZOGyTfCBzGQazN5fe9Nuw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set qcom,no-msa-ready-indicator
 for wifi
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kalle Valo <kvalo@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	ath10k <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>, 
	DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>, 
	Bjorn Andersson <andersson@kernel.org>, Jami Kettunen <jamipkettunen@gmail.com>, 
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_061414_651603_38DCC769 
X-CRM114-Status: GOOD (  24.94  )
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

On Thu, 4 Apr 2024 at 15:30, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>
> On 04/04/2024 13:57, Kalle Valo wrote:
>
> > Dmitry Baryshkov wrote:
> >
> >> I'd say, we should take a step back and actually verify how this was
> >> handled in the vendor kernel.
> >
> > One comment related to this: usually vendor driver and firmware branches
> > go "hand in hand", meaning that a version of driver supports only one
> > specific firmware branch. And there can be a lot of branches. So even if
> > one branch might have a check for something specific, there are no
> > guarantees what the other N+1 branches do :/
>
> The consequences and ramifications of the above comment are not clear to me.
>
> Does this mean:
> "It is pointless to analyze a given version (or even several versions)
> of the vendor driver downstream, because there are exist a large number
> of variations of the code." ?
>
> And thus, "it is nonsensical to try to "align" the mainline driver to
> "the" vendor driver, as there is no single "vendor driver"" ?
>
> Thus, the following patch (or one functionally-equivalent) is not acceptable?

For reference, I tested this patch on sdm845 (db845c), qcm2290 aka
qrb2210 (rb1), sm6115 aka qrb4210 (rb2) and sm8150 platforms.
I was not able to fully test it on sda660, modem crashes without this
patch (there is no MSA_READY indication) and with the patch applied
the device hangs, most likely because of the IOMMU or clocking issue.

>
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
> index 38e939f572a9e..fd9ac9717488a 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
>                 switch (event->type) {
>                 case ATH10K_QMI_EVENT_SERVER_ARRIVE:
>                         ath10k_qmi_event_server_arrive(qmi);
> +                       printk(KERN_NOTICE "NOT WAITING FOR MSA_READY INDICATOR");
> +                       ath10k_qmi_event_msa_ready(qmi);
>                         break;
>                 case ATH10K_QMI_EVENT_SERVER_EXIT:
>                         ath10k_qmi_event_server_exit(qmi);
> @@ -1048,7 +1050,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
>                         ath10k_qmi_event_fw_ready_ind(qmi);
>                         break;
>                 case ATH10K_QMI_EVENT_MSA_READY_IND:
> -                       ath10k_qmi_event_msa_ready(qmi);
> +                       printk(KERN_NOTICE "IGNORING ACTUAL MSA_READY INDICATOR");
>                         break;
>                 default:
>                         ath10k_warn(ar, "invalid event type: %d", event->type);
>
>
>
> Regards
>


-- 
With best wishes
Dmitry

