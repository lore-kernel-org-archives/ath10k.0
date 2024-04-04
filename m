Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FB4CD1292
	for <ath10k@archiver.kernel.org>; Thu,  4 Apr 2024 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+BMPQleoesnEmuZIKvnJIR9RrNyhXeocOmGMELh+Uw=; b=gZ5233lhn4EmpXWqrWaNgcMPbl
	oWVFtZgpWI2YSki0zD4SF9PBiyYkJ7Xmg4i56vG3emLzX5JX+qcGct0c28fIElSwv+tLz5ArhbizM
	eOkvaqpCVTRbf93fl+u+hBEjBGgdP6qHgnoUaRkEgUY3fKWkNWGC6IlI3aIf8hFa32sXeJl0Kvpph
	iOALbH+8mb+JvZb0zp8OcgtaSGXNjBUBCgfC4XhfGJ2ZrvLljvHqiO1wOpkRBfTWskfmhYLBzEoHq
	o7U51B8b589lRTvEb0gwyxK2D1H3b2nc+OfPvi1MNijpvgbbFHZPPaQKHaCoXghenP1EqRCevhXYh
	GgHIAHHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMEw-00000002cWZ-2O9N;
	Thu, 04 Apr 2024 12:30:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsMEs-00000002cUv-3rPE
	for ath10k@lists.infradead.org;
	Thu, 04 Apr 2024 12:30:44 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4162c2109a5so1022615e9.1
        for <ath10k@lists.infradead.org>; Thu, 04 Apr 2024 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712233841; x=1712838641; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3+BMPQleoesnEmuZIKvnJIR9RrNyhXeocOmGMELh+Uw=;
        b=Sx3Op1BbvBGDrgZ8CuZ7yBIYBnZl9qEkEWwpSHRBH3WeYNgnwGQBwkQOGHgOA4jYRp
         sNUBn+i+eCLEUqckz8vPzZ2YU3L5YeJsen+sc7uRywwxXzR4SPccyvBV+PYUIhzoHgRu
         LyniQCER6jtqSYFguI3ULrmKgJB+Ev1DDDb+pW6T5H3lXwu+WSMsJ9R3rFDqqptMJjOn
         OvqcQsllWjd08zrCo5+uTWACJlMXng6wgQHcSlCdta49Tg3Q6dLeqT8uLbwmAp2oH7qy
         83rY8N+3bJCO4heN5kR3lGrAQt1hwMePDCeDVs6O5iY+WfmJiFFPkmLGvvTtfTrV9CIW
         nMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233841; x=1712838641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+BMPQleoesnEmuZIKvnJIR9RrNyhXeocOmGMELh+Uw=;
        b=n5B/HHl99Oo0TVGia+N0cRsgtJMjVPZ5zovCLx3DBSuExMZG+Qc0gdBR+WeQwJRd+t
         OgNDKY7+gxwGPMKNilUeH1pmHOBjOrC3Yp5NbXGN3JSHkiHgwpy4fyhm6bblwnJJm0R4
         GDadR1Ma+LKSmta2lgTC7e/3m5bwQcOTW/HT2ykpCHMkl+wmQPEN5ajhIv3helP1t5TP
         mDilGkUTBeVTY/G+4D8dEjyfRuv4rjmdbFE798lHHNQBXS9PCPP6VsAf6ysNHjTqBBBg
         Ltc7OkyqIgZxdvZD9VlyYu7FzOuAaYgZYoK5L3pSSzc5DWldKh3IZQ3qRnIaXcDt45jJ
         0HJg==
X-Forwarded-Encrypted: i=1; AJvYcCWrixkh56o658nOVuVo6022RDAUZZ6+H/n+Zon7umC5efUTx0Wh87d0qxr8ZvGGtOdTTPTZbNyP73CVdmcdUhTZxvbGcUycHvpjzA==
X-Gm-Message-State: AOJu0Yz6OaHYDNmbw6cc2KfTufZnf/J99dAsg8/hiy4F281ECgz/E1uC
	vGUv6aoEets5+V0lH8yAngh+wloWmpbUgsuCwOm7Wkb4vyqPQjMpZL7sL2Va9jc=
X-Google-Smtp-Source: AGHT+IEV9SRf3L1IqaNEnuhHOMN7UgW5DwSVakpA51/xjM2jO4fLk72OjgqTkeR4uvMKVXqT36uwBA==
X-Received: by 2002:a05:600c:3115:b0:416:1d2e:62f1 with SMTP id g21-20020a05600c311500b004161d2e62f1mr1874361wmo.5.1712233841414;
        Thu, 04 Apr 2024 05:30:41 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id bg2-20020a05600c3c8200b004149530aa97sm2617799wmb.10.2024.04.04.05.30.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 05:30:41 -0700 (PDT)
Message-ID: <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
Date: Thu, 4 Apr 2024 14:30:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Kalle Valo <kvalo@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
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
 <87ttkh49xi.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87ttkh49xi.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_053043_206202_F0AA7260 
X-CRM114-Status: GOOD (  14.14  )
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

On 04/04/2024 13:57, Kalle Valo wrote:

> Dmitry Baryshkov wrote:
> 
>> I'd say, we should take a step back and actually verify how this was
>> handled in the vendor kernel.
> 
> One comment related to this: usually vendor driver and firmware branches
> go "hand in hand", meaning that a version of driver supports only one
> specific firmware branch. And there can be a lot of branches. So even if
> one branch might have a check for something specific, there are no
> guarantees what the other N+1 branches do :/

The consequences and ramifications of the above comment are not clear to me.

Does this mean:
"It is pointless to analyze a given version (or even several versions)
of the vendor driver downstream, because there are exist a large number
of variations of the code." ?

And thus, "it is nonsensical to try to "align" the mainline driver to
"the" vendor driver, as there is no single "vendor driver"" ?

Thus, the following patch (or one functionally-equivalent) is not acceptable?

diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
index 38e939f572a9e..fd9ac9717488a 100644
--- a/drivers/net/wireless/ath/ath10k/qmi.c
+++ b/drivers/net/wireless/ath/ath10k/qmi.c
@@ -1040,6 +1040,8 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
                switch (event->type) {
                case ATH10K_QMI_EVENT_SERVER_ARRIVE:
                        ath10k_qmi_event_server_arrive(qmi);
+                       printk(KERN_NOTICE "NOT WAITING FOR MSA_READY INDICATOR");
+                       ath10k_qmi_event_msa_ready(qmi);
                        break;
                case ATH10K_QMI_EVENT_SERVER_EXIT:
                        ath10k_qmi_event_server_exit(qmi);
@@ -1048,7 +1050,7 @@ static void ath10k_qmi_driver_event_work(struct work_struct *work)
                        ath10k_qmi_event_fw_ready_ind(qmi);
                        break;
                case ATH10K_QMI_EVENT_MSA_READY_IND:
-                       ath10k_qmi_event_msa_ready(qmi);
+                       printk(KERN_NOTICE "IGNORING ACTUAL MSA_READY INDICATOR");
                        break;
                default:
                        ath10k_warn(ar, "invalid event type: %d", event->type);



Regards


