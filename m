Return-Path: <SRS0=uzqH=HK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62580C433E6
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 17:49:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD8664E84
	for <ath10k@archiver.kernel.org>; Mon,  8 Feb 2021 17:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD8664E84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ly0juVTflh4mgERNP6Y5gApl2Tw0oU7eQdO405a4cGA=; b=dakQf03YTSi8DKXzhsMIfqLRu
	A9le38/7XPTzMMNcFswCTql4XaXVRjhv28OgFeKLQVAkbXGeBb7qZvz7EFud5HOlgTNLsP0G6ZH58
	tyiGxYyxiR8kFVjDO8h3XdfTnPTl4Q9IoBovyQu7S+TSmMK1mXgTVB+nvdifdB5br692RlXF9qUBy
	efV+660cQ0EeuXa1VYyLuqRGfTe3Kqp4jlWxoCgchd5MwNcs35lP3GykG7gybJTRl1sgm1VC8hzSN
	3/Ztk7kIWQrAM/NFj0HnWwaQGprJq9chhrZ4v9uLOMw9r2iuBfKoDtdXyfuQCroGy5rsCBVc/LieS
	NqN5x4B9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9AeE-0005JY-Lg; Mon, 08 Feb 2021 17:48:30 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9AeB-0005IG-HG
 for ath10k@lists.infradead.org; Mon, 08 Feb 2021 17:48:29 +0000
Received: by mail-oi1-x229.google.com with SMTP id l3so6535000oii.2
 for <ath10k@lists.infradead.org>; Mon, 08 Feb 2021 09:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hqIt/UwNUJoQOM09qoHwRbtdcgdq4vD+X81GKl6pUvg=;
 b=dIROg9GEeJLWJ7XzvQzbHYvDvby5DZSA5wtm0HUz+hH2dGsD3gA6Kmiit0wOe4THHY
 PFGw2biv/f4Jt3Pmu2/yyyDY6LEptMbHzdQ093MuxDa5rv4qROkzjHFekTzKF0PccSag
 v3r7b0aWCGMpeHb+QlgQX8AjF6YRATpuqzJPQFniDXHWE5/CII87sM/T9ni8CoMBw341
 RejS20ewHvzHs7IB9RLQzcF872UhB3z273h10F15S/qg96XUWfScRkkdo8oNT36Yr0Vq
 Z7et1TtnD0QGfzFZPQny/zxIOrbUVuzRjznOwu0qz/L39S1XAGXn9/iDbEdrbU1gQ/hb
 SzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hqIt/UwNUJoQOM09qoHwRbtdcgdq4vD+X81GKl6pUvg=;
 b=R4UdQZXOcCS9ky6BhfWfLoij/8OsXuU2haixBVpQFo05ey9u453wtaHfhkzkD0Lme5
 U9CVMv47fOMw5Md1abPg5BbdMU0LyiJoXbWae+dHTbqc+GABhDwDFkkxSPDwyagTDxMP
 5F6SVDKwn1smOw3Lth2o0qRATtlrTx23+rk7IlHqoK2XlRKN1LI5kq7QmP1o5dC785Na
 pQJNhroPUvB0BKxNRHi+yUcryTIeH+MuE+e3HnBy4atk9HmmaIfMQh7b+p8+rvxjUP+i
 HVgSMuYuynMOn2E056qG/eVVKAQifqsGf9k0QX5q9aE1xoK8qby6hAECGOHDlid1/pMh
 T0rw==
X-Gm-Message-State: AOAM531e5v3jNFkn7u8XSoXaUbpofgfpFd4fGCXxwWvpLKYYb8XvCHPa
 4cxiWmCvRP5LqKea5FqCn1jbXg==
X-Google-Smtp-Source: ABdhPJyqiIARYiS9Nx6R2dRAOu7L9fFAY66xYQB52vNM3asD8uPvwfyxjaG4SWOx1mRUBpZwO/soKA==
X-Received: by 2002:a54:4689:: with SMTP id k9mr12050417oic.149.1612806503972; 
 Mon, 08 Feb 2021 09:48:23 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id c17sm853063otp.58.2021.02.08.09.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 09:48:22 -0800 (PST)
Date: Mon, 8 Feb 2021 11:48:20 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Introduce a devicetree quirk to skip host cap
 QMI requests
Message-ID: <YCF5ZC/WMRefTRcQ@builder.lan>
References: <1601058581-19461-1-git-send-email-amit.pundir@linaro.org>
 <20200929190817.GA968845@bogus> <20201029134017.GA807@yoga>
 <CAMi1Hd20UpNhZm6z5t5Kcy8eTABiAj7X_Gm66QnJspZWSio0Ew@mail.gmail.com>
 <20201124175146.GG185852@builder.lan>
 <87sg8heeta.fsf@codeaurora.org>
 <CAMi1Hd2FN6QQzbKHooVyqQfH1NFTNLt4RwxyVXRf+5DwTc9ojg@mail.gmail.com>
 <87czxa4grv.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87czxa4grv.fsf@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_124827_884701_F74D9CD3 
X-CRM114-Status: GOOD (  23.26  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: Amit Pundir <amit.pundir@linaro.org>, Rob Herring <robh@kernel.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Konrad Dybcio <konradybcio@gmail.com>,
 dt <devicetree@vger.kernel.org>, David S Miller <davem@davemloft.net>,
 John Stultz <john.stultz@linaro.org>, Jakub Kicinski <kuba@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Mon 08 Feb 11:21 CST 2021, Kalle Valo wrote:

> Amit Pundir <amit.pundir@linaro.org> writes:
> 
> > Hi Kalle,
> >
> > On Mon, 7 Dec 2020 at 22:25, Kalle Valo <kvalo@codeaurora.org> wrote:
> >>
> >> This is firmware version specific, right? There's also enum
> >> ath10k_fw_features which is embedded within firmware-N.bin, we could add
> >> a new flag there. But that means that a correct firmware-N.bin is needed
> >> for each firmware version, not sure if that would work out. Just
> >> throwing out ideas here.
> >
> > Apologies for this late reply. I was out for a while.
> 
> No worries.
> 
> > If by that (the firmware version) you mean "QC_IMAGE_VERSION_STRING",
> > then that may be a bit tricky. Pocophone F1 use the same firmware
> > family version (WLAN.HL.2.0.XXX), used by Dragonboard 845c (which has
> > Wi-Fi working upstream).
> 
> I'm meaning the ath10k firmware meta data we have in firmware-N.bin
> (N=2,3,4...) file. A quick summary:
> 
> Every ath10k firmware release should have firmware-N.bin. The file is
> created with this tool:
> 
> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-fwencoder
> 
> firmware-N.bin contains various metadata, one of those being firmware
> feature flags:
> 
> enum ath10k_fw_features {
> 	/* wmi_mgmt_rx_hdr contains extra RSSI information */
> 	ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX = 0,
> 
> 	/* Firmware from 10X branch. Deprecated, don't use in new code. */
> 	ATH10K_FW_FEATURE_WMI_10X = 1,
> 
>         [...]
> 
> So what you could is add a new flag enum ath10k_fw_features, create a
> new firmware-N.bin for your device and enable the flag on the firmware
> releases for your device only.
> 
> I don't know if this is usable, but one solution which came to my mind.

It sounds quite reasonable to pass this using firmawre-N.bin instead of
DT, however that would imply that we need to find firmware-N.bin in the
device-specific directory, where we keep the wlanmdsp.mbn as well - and
not under /lib/firmware/ath10k


For other devices (e.g. ADSP, modem or wlanmdsp.mbn) we're putting these
in e.g. /lib/firmware/qcom/LENOVO/81JL/ and specifies the location using
a firmware-name property in DT.

Regards,
Bjorn

> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
