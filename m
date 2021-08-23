Return-Path: <SRS0=+t3W=NO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EED0C4338F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 18:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12E2C6136F
	for <ath10k@archiver.kernel.org>; Mon, 23 Aug 2021 18:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12E2C6136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BrIKtv2IT6cQlt6tc7D/Tnk565S8fETrhjmbHth32M=; b=Ep9d481ZlXU8/Fwhnx/3xXtrMN
	w80vgko4YnL31RqkxpE/+jgPih9CDUknaT5Q9+7xboI6eSBl32uMgM7YRUQdNY3f2cL0pICBZgRop
	FW0UpuYAnY9Ea2t/+E3p4TO5pNLyr3kt8vXCbVWqsUBrgECGHHGheHPBWBt1qTMwoDPmSGhVk4s0e
	1FLnJwxEqXdlRddaKX0j7bFAz6oEH1Nemhm30Bhnu4RMjBgImuCEvFCQF5dMApQ/kGhhWAdTm6H9Y
	Sb4rLlRgAp6el7J+SLNTrYC52gGlGAbHldWkoqZMMN6G81O0mAcgKoL6zuPArKqWW8D4kHtguYoB0
	/Opxs1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIEUR-000Hfj-H2; Mon, 23 Aug 2021 18:16:07 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIEUM-000HeW-Ho
 for ath10k@lists.infradead.org; Mon, 23 Aug 2021 18:16:06 +0000
Received: by mail-qt1-x835.google.com with SMTP id d9so14539526qty.12
 for <ath10k@lists.infradead.org>; Mon, 23 Aug 2021 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=dUaF/06OdVq28sYuAKcZ+UG02Qlt2ANrvGZ24fytqiA=;
 b=qk8a8qUjaSHG6VrN2+qP7Q6H8Y3xydSMaFluNjCL65k5iBIdsyxwrKN1X9t9EvozFc
 nBq9g2KQ8RPXltIoYbv+JIYR8xfB0uxObfvcqyaI5vW43OhqXWIwPOkW0BvX02+AZ1Eg
 7ro/hXdKP121dINH789NFUOr4/BEtwLDS7CBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=dUaF/06OdVq28sYuAKcZ+UG02Qlt2ANrvGZ24fytqiA=;
 b=H92q2nvfF5IKydH4AFokLsTwjz15msr2/TA3442UR4522/09+wcaSRapyWouqRBNdI
 XD0OvbvoriX1h8ER/Z1xTN8Rcm7jNPVZvxQCHnYZGBokFP2kFQdY07cZ6Y4r9p3T/BlO
 n/0UP2CyWxRlW6ieaKJsPhPHm2v8C7QvZl6xk1eTkQOLiGL8fkRAX5HOMGkfR1GrMsbg
 ccodTt2u5kfb5Y31lCCfLz7uzJB6TRYSxrXW0DG/bzvI5HwVi0lKP8xnkPHIzoN/oSAs
 ahxGQcxAobH1JXjFRnwFb7/BV6+a65nFclYPmwJHWL++d0mf36KtyvgU9Q1xgXmb/4Cf
 nrJg==
X-Gm-Message-State: AOAM533/R3aWjiIVt/vLMD/h17QLQ5XnaLNg5FWAI1h9zb6F0lgya618
 kIEwMzSdDcquvGjimTJ9QV1q5s8pLNVDfhEN
X-Google-Smtp-Source: ABdhPJwwuakNawgGhvvrehReTxEtSonLBKWR/4Dia0llz5ad/xoiWeN+/AFmv+hxeISxDaAOAN9YSg==
X-Received: by 2002:a05:622a:118f:: with SMTP id
 m15mr30654958qtk.185.1629742560735; 
 Mon, 23 Aug 2021 11:16:00 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:843c:2c3:2cb2:fa8?
 ([2600:1700:38c5:675f:843c:2c3:2cb2:fa8])
 by smtp.gmail.com with ESMTPSA id 12sm3054907qtt.16.2021.08.23.11.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:16:00 -0700 (PDT)
Subject: Re: Revert: ath: add support for special 0x0 regulatory domain
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: Wen Gong <wgong@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Brian Norris <briannorris@chromium.org>,
 Julian Calaby <julian.calaby@gmail.com>, svp <svpm@yandex.ru>,
 felix+debian@gueux.org, Massimo Maggi <me@massimo-maggi.eu>
References: <YSJ//ki/A1EgfLga@skv.local>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <15d3d071-61a2-0847-de13-634a0c2077d5@eero.com>
Date: Mon, 23 Aug 2021 11:15:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSJ//ki/A1EgfLga@skv.local>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_111602_655176_46185E99 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


On 8/22/21 9:49 AM, Andrey Skvortsov wrote:

> 1) Current behaviour maps 0x0 regulatory domain to the most restrictive
> world domain. According to the wiki (probably based on Atheros
> documentation) 0x0 means US. Does wiki contain wrong information?

0x0 means country section in OTP is not written yet and open to set to 
any country.

QCA sets to US in this case as a default value.

> 2) If I understand correctly, 0x0 is always replaced with 0x64 and that
> makes the following code useless, because it will never be executed. Is it
> ok?
>
> drivers/net/wireless/ath/regd.c:703:708
>
> if (reg->country_code == CTRY_DEFAULT &&
>          regdmn == CTRY_DEFAULT) {
>              printk(KERN_DEBUG "ath: EEPROM indicates default "
>                  "country code should be used\n");
>              reg->country_code = CTRY_UNITED_STATES;
> }
I don't think that's true. If you're seeing 0x0 is replaced with 0x64 
(CTRY_BULGARIA = 100), it could be because your device's manufacturer 
preconfigured country code with the value.
> 3) Previously it was possible to get regulatory information using 'iw reg
> get', but now it doesn't work anymore. Is it expected behavior?
>
> [--------------------4.19 ---------------------------------]
> # iw reg get
> global
> country 98: DFS-UNSET
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5250 @ 100), (N/A, 20), (N/A), NO-OUTDOOR
> (5250 - 5350 @ 100), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
> (5650 - 5730 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS
> (5730 - 5850 @ 80), (N/A, 20), (N/A), NO-OUTDOOR
> (57240 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR
>
>
> [--------------------- 5.10 --------------------------------]
> #iw reg get
> global
> country RU: DFS-UNSET
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5350 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
> (5650 - 5850 @ 160), (N/A, 20), (N/A), NO-OUTDOOR
> (57000 - 66000 @ 2160), (N/A, 40), (N/A), NO-OUTDOOR
>
> [-----------------------------------------------------------]

The 4.19 output tells you that country code is changed to different one 
from manufacturer is set(US).

The 5.10 output seems manufacture set country code to RU. If it's the 
case, No phy level country code looks wrong or a bug.


Thanks,

Peter


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
