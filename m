Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12355CD1283
	for <ath10k@archiver.kernel.org>; Thu, 28 Mar 2024 17:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y8/g+cHkPSXhHlEKcSVfgwp5KAJjPgctuVitEMx931o=; b=tflVpA0oE9wXN1y1LG7cDvW4HZ
	G/yHU8vL+vj9LM8f68r82k9+kncIj6ItQILTVfLdZBP0NDTcCpKeSRqEMAPGoVQ+Z4XHRQLguh8yr
	SzQSKBQJRlhbxntseiuBbM1l5L0NK0Fi5THibcOpU+TB0alFj+8HZWmvjFttoVoS1xiJXGnKA3WqU
	5Y8fKRtibQM1iIAci+zZ/3dwhNcCqHmwEivKQZ0CnQwv1Hg+o91y2wcw1dYYAj9djaKVGBHIoBC5z
	QPDjPrFNZtDwTAdvjP8QDzs+h0sc81t6XjMOkFdCFmDM7VQ+QVoGlazr4mBX5F2ITQ8htPjzcjxsp
	ygcK3Xtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptGL-0000000EvmR-0hrR;
	Thu, 28 Mar 2024 17:10:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rptGG-0000000EviX-0LXi
	for ath10k@lists.infradead.org;
	Thu, 28 Mar 2024 17:09:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-41488e17e1cso7575645e9.0
        for <ath10k@lists.infradead.org>; Thu, 28 Mar 2024 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711645788; x=1712250588; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y8/g+cHkPSXhHlEKcSVfgwp5KAJjPgctuVitEMx931o=;
        b=qAaaownyIu4VaBdPC/U0UPOyMmxbb8qYxn0ghR+zM6Vc4Ugskjrtz2xqyp9RpFOMcT
         BhpUE8BMblcDfrsiU270FOmxsrNwq0jHUT+3hmowdOep/qjPM+xKAB0Kjujavm5z84f/
         ce/3r16PQKtM6OkEiJgkMMGmQyIeoD9rZd0ZTJmMJhjFoPlMNmlNg8Qvr05vzsduGUFR
         yssYZa3P+P9T6gwI742MvSK+maIXwJYe93YxCZB4QN+ur8nWCrnz/pqbuM2lJ41lhWgc
         rKh2gT/adAlBjyJq3XQ9vbAfHUcHX2/Ho6YhgpmnUDgnMk9iuwm9zH9QR5xp4YzPghmi
         +qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645788; x=1712250588;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y8/g+cHkPSXhHlEKcSVfgwp5KAJjPgctuVitEMx931o=;
        b=IyrNzsP2TUQkF3gTEoUaA65I6yI0AaNGdRJR/zh9zm7/oTvwjgCXbsWM3gLthhdyMl
         Gxh+JXo0ZbBtX4Ue/M14UbdYB/Pcg6uwpjCeLM00s3/pdCIwuzbuM5UDr1dkWBPRb37G
         ZEPfZxbZV03gdknrPqdiToYvGVcJWltFF98262p55OwCGIjSX+geZqDAepMRNO/gKYml
         gFhveqLB0P6WOBMUJgmjGRt4fHlploFxA+eDuNsgFq2S7q3WnMM8O9RMcxkQeIoqSJIY
         VYbaIiwBGUxv2/XpG40MjQ7E8uyrssXcRE+qSSD6W2BW628qmSC4Re+mq7E7vJvKX5WF
         tS/g==
X-Gm-Message-State: AOJu0YwQIrWvht9lad6ojKi11hdyjg33Q3p2OGkKUvcv3tWkRBA1SKd4
	0gHQGfMAGdBRmY8+3UDaYleHnHBHZSuHCVeV+nNwvd/3wt9p9Ouwbs3hFLqSX5JPlr5EtEzTtQf
	u
X-Google-Smtp-Source: AGHT+IHOl+8pLp638KlWCuohcoJcoPfMOHatFiZG43JVDO7VUY/xCGKW1oVbaGfCkvHbEXNELOF7jw==
X-Received: by 2002:a05:600c:3ba6:b0:415:43f2:332b with SMTP id n38-20020a05600c3ba600b0041543f2332bmr2148445wms.2.1711645788367;
        Thu, 28 Mar 2024 10:09:48 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id o10-20020a05600c510a00b004148a5e3188sm5997405wms.25.2024.03.28.10.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:09:47 -0700 (PDT)
Message-ID: <c908125e-84fb-42f3-bbb5-3d4a909038d8@freebox.fr>
Date: Thu, 28 Mar 2024 18:09:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
 <243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr>
 <9293793d-00e8-42ce-87b2-05abc3b49387@freebox.fr>
 <CAA8EJppn6M9dpzyu9d283AUtaeN-i-L=-aM5P9BEELXPLFS8YQ@mail.gmail.com>
 <4b7bf7cc-ede6-4c2a-983c-da4c8c09c5d1@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <4b7bf7cc-ede6-4c2a-983c-da4c8c09c5d1@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_100956_342934_4B4D5680 
X-CRM114-Status: GOOD (  15.96  )
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

On 26/03/2024 21:21, Jeff Johnson wrote:

> On 3/26/2024 10:51 AM, Dmitry Baryshkov wrote:
> 
>> On Tue, 26 Mar 2024 at 19:45, Marc Gonzalez wrote:
>>> 
>>> [ It has been pointed out to me that the previous message was unclear. ]
>>> [ Below is my 2nd attempt at a clearer message. ]
>>> 
>>> Problem: firmware-5.bin has not been parsed yet when we have to handle
>>> the ATH10K_QMI_EVENT_SERVER_ARRIVE case, so we can't rely on feature bits
>>> to work around the lack of MSA_READY indicator.
>> 
>> Then, I'd say, we have to resort to the DT property, unless Kalle or
>> Jeff have other proposals.
> 
> Another option is to follow the downstream driver model and only expect this
> based upon static configuration within the driver.
> 
> Downstream driver has:
> 	if (priv->device_id == ADRASTEA_DEVICE_ID) {
> 		ret = wlfw_msa_mem_info_send_sync_msg(priv);
> 		ret = wlfw_msa_ready_send_sync_msg(priv);
> 	}
> 
> https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/platform/-/blob/wlan-platform.lnx.1.0.r4-rel/icnss2/main.c?ref_type=heads#L968
> 
> The downstream MSA logic (including some other code that populates MSA-related
> fields in the QMI messages) is only invoked for ADRASTEA_DEVICE_ID.
> 
> We could introduce a new hw_params parameter to have the same semantics.
> 
> But I'm OK with the DT option as well.
> 
> Kalle?

I'll send a v2 series with the DT option + setting the quirk flag for
all msm8998 devices. I'll include msm8998 board maintainers for feedback.

Regards



