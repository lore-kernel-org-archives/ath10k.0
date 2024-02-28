Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E3BC47DD9
	for <ath10k@archiver.kernel.org>; Wed, 28 Feb 2024 16:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qOgqKolcgCMqkLQDBYRiEWccklZZF6TtDAuL0z45LU=; b=fSFbYyqmAct5GWFuOl55JtDlIv
	VJ74zYjX+/lAh5kStkz3VrHRxhye2qK2pxMMrXwOo1Zif3TnLqrQrDMdfBpuz7lkGeO4IokmLWFg0
	C5M1aggc97C6dMuEGhsXh4tJDqEBR22t2zjrHSfXiOYcwTtRZqGMkct7EjQS/KgUroF7sb117di+m
	yJETnbuayd7lE6Iuus1gjfeOtGi0QiBi6MDx6G2dcFJlnYxpkfrAPTnc+6w62klRNnxvRV9R8Q0tR
	WxWCVl4TW+evhNwejg7pkhC/19AKs2IMTT7kGPLiNO573FV26x2Mbs5/Y6GyGTYh90kG4KHpBbb3J
	RwkloJCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMMo-0000000A0mC-1rVF;
	Wed, 28 Feb 2024 16:01:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfMMj-0000000A0kL-416H
	for ath10k@lists.infradead.org;
	Wed, 28 Feb 2024 16:01:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-412a3ebad2aso27423195e9.1
        for <ath10k@lists.infradead.org>; Wed, 28 Feb 2024 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1709136058; x=1709740858; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qOgqKolcgCMqkLQDBYRiEWccklZZF6TtDAuL0z45LU=;
        b=igkbD1AeTJlmN9/3lYMRx15WozSt32XIxU8EnTLB0rIyfSaowELealc2plUAzQ7Cpv
         P+wB8CP6Iz+lOdgM+baMSZHe4bYo4ZUiBvcsBiklHhqBlov5k/trn2w51caTeHIfHZxu
         aRhbbwJtgoh8GIgGO6vLfYnzMkeE5Bbb6XpWRMiJEaAGlpVfykpbdHTLtnGzhNCtVUhf
         SCvSjfnts7TzvudqWkrkm4OdeTdZDDQ2R6MJhj/cpol+F9quGFqJ0IYqWHr3dLoCLQWQ
         6eipgW/W7eB1/4Xst4TzPhYDJJrKt7T/ksCjSpHv9SDvTilnMquAhmRVKZDAechSNgLC
         qlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136058; x=1709740858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qOgqKolcgCMqkLQDBYRiEWccklZZF6TtDAuL0z45LU=;
        b=TNS4Lzdq+S10EjrGILlY5KVPG+OhpVwOU7x239Imof6oO6pMENmSylHUlCikjOy5CY
         ykhuXumyIhfJSALmqEGsNJXHF5VvYfqNu7i4ui0+QT5AQY6vwTbj0XlsU0QmOfwOUMRc
         WHuOvgYPHx7p3nt3VLfaSzAqwc3zRdKJNHmVOdq9EeL9FCLqKFvZ5J3I7LRT+1iDtmJy
         HAM0V3V1ZlToJCwmk27nCOz7iwPhvXqYCM8Uer56SpzI9VbaGnoffYZUZQLqlsLGFuh0
         I/QvdWGM5U9PjYemt6F6OLSlJKyiLa3REJ8/LQ8MHjW1dMMeI7sQQFPwfafH//u/Jtgm
         PgWg==
X-Forwarded-Encrypted: i=1; AJvYcCU7hNoRVL2kgpWAlyONjmM5y0AeMFct+U8tkoI1vxyTYy2aqFTuD5aVOc+F0+A2mad04xcvI/3ikPx/CbHeAw7eYmXzlNloiXfQ8Q==
X-Gm-Message-State: AOJu0YyCy261d2G8kKmXYcVI0I0cHxiytIEitnezfD1qdB6jKq+s6Tq7
	0aNEKmX75t3R/urGeTnG/eTt4JhfqXIQSggW97qvlZgmpXmYlnDfhVks0rYr0aU=
X-Google-Smtp-Source: AGHT+IFN2sCE6PE1xyjuz871GiSbf8TCRVzfrTClfeivGcowaSF9sD8L32UjuIrf1ROZJrtBJdB69Q==
X-Received: by 2002:a05:600c:4ece:b0:412:a344:ea95 with SMTP id g14-20020a05600c4ece00b00412a344ea95mr6394878wmq.14.1709136057810;
        Wed, 28 Feb 2024 08:00:57 -0800 (PST)
Received: from ?IPV6:2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456? ([2a02:8428:2a4:1a01:6dfa:263f:dd7e:9456])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c161500b004128f41a13fsm2450042wmn.38.2024.02.28.08.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:00:57 -0800 (PST)
Message-ID: <73d85158-6286-45c3-986e-22850fa20c38@freebox.fr>
Date: Wed, 28 Feb 2024 17:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Jami Kettunen
 <jamipkettunen@gmail.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: wireless <linux-wireless@vger.kernel.org>, DT
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <d8c90f33-d0ab-4d73-9580-2547446671a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_080106_273111_47B3201C 
X-CRM114-Status: GOOD (  10.52  )
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

[ Adding Jami Kettunen who documented the same issue 3 years ago ]
[ Adding Jeffrey Hugo for his past work on msm8998 ]

On 28/02/2024 15:59, Jeff Johnson wrote:

> On 2/28/2024 5:24 AM, Marc Gonzalez wrote:
> 
>> The driver waits for this indicator before proceeding,
>> yet some WCNSS firmwares apparently do not send it.
>> On those devices, it seems safe to ignore the indicator,
>> and continue loading the firmware.
> 
> Can you list the product/hardware/firmware where this is observed?
> Would prefer to fix the firmware if the issue is there

This issue is observed on an apq8098 (msm8998) SoC using
QC_IMAGE_VERSION_STRING = WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
according to /sys/kernel/debug/qcom_soc_info/cnss/name

We are not the first to run into the issue:

https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN

"Currently if you get FW details printed in dmesg from ath10k
with nothing else seemingly happening, you'll most likely have
to fake an MSA ready indication"

https://github.com/JamiKettunen/linux-mainline-oneplus5/commit/088eaa9153803e2b028e092f88539036442da4a3


The issue is also observed on an F(x)tec Pro1 phone (msm8998-based)
with unknown firmware.

The issue was apparently also observed on the OnePlus 5,
also msm8998/sdm835-based, also unknown firmware.


If the firmwares are signed, and the signature is verified by some remote proc,
then working around the issue in the kernel seems a more pragmatic solution?

Regards


