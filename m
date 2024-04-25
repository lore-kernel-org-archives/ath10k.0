Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1902EC4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 11:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HaiwvUlPF7WAHLG6FS4I2jCzZYZaAZS8Db4/cIEwfh4=; b=BTw7JGCrH1hHHHeP6/M1uaS7nK
	8sDHBWt0xsDuo6RW57GFMxY0g5q+ex6EVhN9jYnh/XkF2QgyhqRMX0uuDWEvDKPiPnYTxeYAPeSl+
	GLh0/nqfPdYcZjIetu1s1Pd39qjktK+Rqzh8DHue+wnvX7ryoNblUVK1LhmQlhJXODJRQciRV9uTP
	6deYBqb8HUL5tKGOm8Ju1xIzoVf9muUl3kCR3YPM0BKfE45QtnVl0GMGLFhjwDtpSpR/N8MG7drap
	qk8dDCQuHPlRgpMmccdOifFHU9blIPb0/EUoTOF8dSXjAtZA/uY5raAIBwg0BGdj02xOMAvVgeC90
	HSa6BdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxb1-0000000844b-2s0r;
	Thu, 25 Apr 2024 11:48:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzxax-0000000843b-19la
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 11:48:57 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-34b1e35155aso997360f8f.3
        for <ath10k@lists.infradead.org>; Thu, 25 Apr 2024 04:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1714045732; x=1714650532; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HaiwvUlPF7WAHLG6FS4I2jCzZYZaAZS8Db4/cIEwfh4=;
        b=Z4cVgVitgIetnwkreHARfCqMydxxDERdAkdBlPgRTSmH22ODesCDGgmmiMJYCunZGn
         5xTX/U3Qgg//KrBS4YlMwFMAY4QBDUMHdvxYAzQBRgg7Avg5ov4C4ssAx4Au46XhqjhM
         Up/ZKM9gc0z5q6UvgFgo/JuOOsKYOtGe3nJYOWfHLwrYUwnD3kNo4dZQtrrGAoKjPBiC
         GM9oulawSfbdCeSwiZfS5GOqjatywiIAUcZNf3us94b9QgRwa/L/7B0y58fruIc50Fye
         KrTONmEaRcv10FJCyuZTVc0/Bqdx1MqoM4mfQeInrulPYZhHz3CgxP6Z1uxtQrKkI7da
         g4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714045732; x=1714650532;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HaiwvUlPF7WAHLG6FS4I2jCzZYZaAZS8Db4/cIEwfh4=;
        b=h0E64/Qo9bHaJnxuiJjYEAwZHSRqrDdZ30E/n1kD+P3jJYVD+/7vLNxOxcTdgRRC1y
         dzL4/hHUft65MO0stBH+N7W+VunyTxjovPNigM+J400s+4nlYuGrd3ECN2irTJobse8v
         qnRfgDIzYHQ7P575L1YcBz20hy92hhNxzzyeh6bWx/qyMZK38a6dNVRcIWDWx878BMKm
         bDBQ49INePBb4KNt14GJObBJY25NykD48VvvnSOXVW382fp7wV0vfhDuI+0dJpRfxRT4
         ZBNswDqVJXHeNYK8hNXx1w+ia8LzTpr723sNqrDXzX4JkovVwQ2UrWr3Owfh38ND66kA
         DqZw==
X-Forwarded-Encrypted: i=1; AJvYcCWyAcAKg6cWzR6VvdYWXVXW0Bz4j/VBFDoedNoeUuYlC6lPP/KOKK2Ar0Tex83o9mtrrPldhSWwD7gIjl0mM1hA13cdgz2Y8dKP0Q==
X-Gm-Message-State: AOJu0YwuHaTOxmjqyMnWLMi5Ky0f9q0qmLXw79hskcdu5gAMyUvxs9B3
	GuFAE4cIjmTLJNYjx0NeApoESYwU5U30SJWvQ0dUdeS8VTcuLYDw4GFx5ErZfVU=
X-Google-Smtp-Source: AGHT+IEQKdEXXjmwHYjGtrZx+A4ntpBLtbov3wrDvOhIJp7CrXwZrZ9Zsbj80j2w2j8dI4s5T//PLA==
X-Received: by 2002:a05:6000:12c3:b0:34a:d130:611b with SMTP id l3-20020a05600012c300b0034ad130611bmr4607478wrx.17.1714045731749;
        Thu, 25 Apr 2024 04:48:51 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d4591000000b0034658db39d7sm19844255wrq.8.2024.04.25.04.48.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 04:48:51 -0700 (PDT)
Message-ID: <de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr>
Date: Thu, 25 Apr 2024 13:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
To: Kalle Valo <kvalo@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k
 <ath10k@lists.infradead.org>, wireless <linux-wireless@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Bjorn Andersson <andersson@kernel.org>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
References: <fd26ce4a-a9f3-4ada-8d46-ed36fb2456ca@freebox.fr>
 <5cdad89c-282a-4df5-a286-b8404bc4dd81@freebox.fr>
 <252618e8-9e80-4774-a96c-caa7f838ef01@linaro.org>
 <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org> <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
 <87h6gh406w.fsf@kernel.org> <ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
 <871q6tu6bn.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <871q6tu6bn.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_044855_484338_D6ADD8A3 
X-CRM114-Status: GOOD (  16.85  )
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

On 25/04/2024 11:42, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> Do you prefer:
>>
>> Option A = never waiting for the MSA_READY indicator for ANYONE
>> Option B = not waiting for the MSA_READY indicator when
>> qcom,no-msa-ready-indicator is defined
>> Option C = not waiting for the MSA_READY indicator for certain
>> platforms (based on root compatible)
>> Option D = some other solution not yet discussed
> 
> After firmware-N.bin solution didn't work (sorry about that!) my
> preference is option B.

Actually, Option B is this patch series.
Could you formally review it?

Perhaps one thing I could do slightly differently is to NOT call
ath10k_qmi_event_msa_ready() a second time if we DO receive the
indicator later.


>> Dmitry has tested Option A on 5 platforms, where it does not induce regressions.
>> I worked on msm8998, where Option A (or any equivalent) unbreaks WiFi.
> 
> What do you mean here? Are you saying that option A works on all
> devices? I'm guessing I'm misunderstanding something.

No one serious would ever claim "this works on all devices".

Dmitry and I tested the following patch:

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


Dmitry tested several platforms:

> For reference, I tested this patch on sdm845 (db845c), qcm2290 aka
> qrb2210 (rb1), sm6115 aka qrb4210 (rb2) and sm8150 platforms.
> I was not able to fully test it on sda660, modem crashes without this
> patch (there is no MSA_READY indication) and with the patch applied
> the device hangs, most likely because of the IOMMU or clocking issue.

I tested on apq8098 (msm8998 sibling).
Patch makes adapter work on my msm8998 platform.

Regards


