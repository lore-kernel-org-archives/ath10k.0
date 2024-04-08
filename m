Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A72CD1296
	for <ath10k@archiver.kernel.org>; Mon,  8 Apr 2024 15:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV2QGCABE36oWSsPi/l6CQE6DAlPBHE1k65KDD12Caw=; b=NKXDnN0MzRXg2wtXM/TWkNGcQb
	jqE7duKyOsWOCjwYaFeyPOvfQNQaqKNNt2RO67FfkkTKSHeF1WiZVWD/OfZZi4q54vA8QyATh8jmP
	Yko7y1if5CHg3uUt924XJbp8uCoYalhK/Y0m+zi6mbS7URd5vRQoFKZKVUaqJgNLdXXb4Lv0rLCTf
	dRnVOPqiNH6JaDTz4EGmoxpa/fXmi9ahY77tOR6plezs9/4qABbStVaBkhXPAZsazj87LokXA2sa6
	zulRV9Zh91TYmfWrzsKPTwYV6xSg0Zkl0TSXM+5hMhebVdDsOvLl3Ol1d9pFgHM4F5CLYg+SYc4fQ
	dAHWmjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtrIz-0000000G5mF-25kS;
	Mon, 08 Apr 2024 15:53:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtrIw-0000000G5ku-0d68
	for ath10k@lists.infradead.org;
	Mon, 08 Apr 2024 15:53:07 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-343f62d8124so2192816f8f.2
        for <ath10k@lists.infradead.org>; Mon, 08 Apr 2024 08:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1712591582; x=1713196382; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PV2QGCABE36oWSsPi/l6CQE6DAlPBHE1k65KDD12Caw=;
        b=aPsuLxxi7Er40qZwh2bfIA37lsaTz92OwQ4H+LCbtq483z069xox5VtVQR1oqUDT5b
         TN4v+FPDlSE8EpXVWN6xPwPocWughAcJCAwVjMel2OqoxaQTz72leHx7wqgoWIygNhPB
         M91nDRmw9i2Y4GdLQh/9lsMD5+THm2JNSbmLwPWfHQCbiJKNBKtXYu17zWnS4QuVSnVT
         w9OSar1nQGrPW6zYid4DQD25a7Nf+n+6kw+JcG6rk7OADC+/QK0Pkw4fKqlq6EsXK4zJ
         sKPFHaOsh7yQP3PzfWsm4jGzi6IALP1kRXHGJshCc2eRWrNCtI243T6FXQyOWlnXyY5J
         nZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591582; x=1713196382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PV2QGCABE36oWSsPi/l6CQE6DAlPBHE1k65KDD12Caw=;
        b=H7tDvfECT7TZJTQPv0t60lu+5tl04BESTl0dPNrPdCswXf5MAnQ2+q1pFHH7KnwozJ
         a3cM+SOy7eU+/fOmFKzbAfi+sQZDpZt1xQnLAveE/hZJNskVtphL1a03rCFxAc9N9Egd
         Bh9bjoI7vrq2t/6raE9lDp43DcVYZbbOl1X0rH3XMSw+h77tW0FoYdiFBlxVz0417WD1
         B3wf9vykr6W70mRh0zmek7RYHs6fr4olToXrDUK5mpySp27HTf6GETYhhsTn4lxLN9bc
         IUDVAW0qmHZr0ig9fvqn4MEhh7nb4v8RF9XUwQ1gXWzTT95fQaDbV6p0D0Ya5LZel6R7
         dZHg==
X-Forwarded-Encrypted: i=1; AJvYcCUrnBIUB/uRGm8PXXCcB8450V8Cn15ps7Ck7YG0DM/3hoOsV1uw2C5mZNtHQJlqfhs/Z1fvxShJsRtrgjs7Br1Y5dzSCuovvEsLKQ==
X-Gm-Message-State: AOJu0YwUX8C3vUPhL4L0ntiPfF4P3/mrf/4C08SM02EkoNqEaBPR+/MF
	l1jR1xx9yAjM49UVwvy+qCNu5s2q2P2mxlwtb0omOsFV8oHUP+lxKn6ozhEePf4=
X-Google-Smtp-Source: AGHT+IF87J4Q/rgFnwCIm8WBGlFyl1vMp8m6s/lxg+SxFZ0lmZ8/wXNjMI8XEjSdYdJzrpjZ6SXNIA==
X-Received: by 2002:adf:e647:0:b0:345:5ff1:245d with SMTP id b7-20020adfe647000000b003455ff1245dmr4115241wrn.32.1712591582423;
        Mon, 08 Apr 2024 08:53:02 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id z15-20020a5d4c8f000000b00343daeddcb2sm9341328wrs.45.2024.04.08.08.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:53:02 -0700 (PDT)
Message-ID: <ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
Date: Mon, 8 Apr 2024 17:53:01 +0200
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
 <87h6gh406w.fsf@kernel.org>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <87h6gh406w.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_085306_232750_645336C8 
X-CRM114-Status: GOOD (  19.91  )
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

On 04/04/2024 17:28, Kalle Valo wrote:

> Marc Gonzalez wrote:
> 
>> On 04/04/2024 13:57, Kalle Valo wrote:
>>
>>> Dmitry Baryshkov wrote:
>>>
>>>> I'd say, we should take a step back and actually verify how this was
>>>> handled in the vendor kernel.
>>>
>>> One comment related to this: usually vendor driver and firmware branches
>>> go "hand in hand", meaning that a version of driver supports only one
>>> specific firmware branch. And there can be a lot of branches. So even if
>>> one branch might have a check for something specific, there are no
>>> guarantees what the other N+1 branches do :/
>>
>> The consequences and ramifications of the above comment are not clear to me.
>>
>> Does this mean:
>> "It is pointless to analyze a given version (or even several versions)
>> of the vendor driver downstream, because there are exist a large number
>> of variations of the code." ?
> 
> I was trying to say that because the design philosophy between vendor
> drivers and upstream drivers is very different, we can't 100% trust
> vendor drivers. It's a very good idea to check what vendor drivers do
> but we just need to be careful before making any conclusions. Testing
> real hardware (and corresponding firmware) is the most reliable way to
> know how different products/firmware work, unfortunately.
> 
>> And thus, "it is nonsensical to try to "align" the mainline driver to
>> "the" vendor driver, as there is no single "vendor driver"" ?
> 
> No no, I'm not saying that. I have suffered this "N+1 different firmware
> branches behaving slighly differently" problem since ath6kl days so for
> me this is business as usual, sadly. I'm sure we can find a solution for
> ath10k.

Hello Kalle,

I can spin a v3, no problem.

Do you prefer:

Option A = never waiting for the MSA_READY indicator for ANYONE
Option B = not waiting for the MSA_READY indicator when qcom,no-msa-ready-indicator is defined
Option C = not waiting for the MSA_READY indicator for certain platforms (based on root compatible)
Option D = some other solution not yet discussed

Dmitry has tested Option A on 5 platforms, where it does not induce regressions.
I worked on msm8998, where Option A (or any equivalent) unbreaks WiFi.

Please provide guidance :)

Regards


