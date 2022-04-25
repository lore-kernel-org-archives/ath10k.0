Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9833AC433EF
	for <ath10k@archiver.kernel.org>; Mon, 25 Apr 2022 18:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qu1n5b8MOHfWImx3ABI8DoODtbOVk3COwjehI2LBQzM=; b=xYPuh7kQ9dqiwm
	oqLrzGnkC61SvVMAnDPCUeEAOQDl/gabv/Py0N1tHyYnFv8P5zvQmYMsNdLlRAplw4oQ4mb7l0Gsi
	1G/L+Hq137EHcBTOzzPtLOIKNqzYk49/L18jC7WQjpabE1UBREsB7ZXzO8hPsmksNnswowIsLFINB
	WnSiQgfu0gLYd5ouW1pqhrvCOQqlrOO4OMlCciv1n2xkhCWGQTTG4MiV63w1T9UeV4dVQSI7bQMyD
	nnQV6vEM8CDY1GYNhvTXcRIpgiGJLgp4R2I4I5ADQ77MAR2Hjc1LFUXeQoS9W/uAwTllEE+DxkWPU
	2S5OFV+GBhqNfktm9OwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj3qm-00AzD4-IG; Mon, 25 Apr 2022 18:54:20 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj3qj-00AzAX-88
 for ath10k@lists.infradead.org; Mon, 25 Apr 2022 18:54:19 +0000
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e9027efe6aso9742516fac.10
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2022 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yaCTjN5CZzui2ztqLkxvGGCYTFHIuiGBpbp3r9GpozM=;
 b=L4K++dPQRP+MDKtfMHchKPwefz1Mk5XkaIVfDC5UgwCSxVRbl8+VCMBFGhXXyigOFF
 b3Yjvi2VpRRnsVtMX32hY+SiEuIvgLnKyn3k6xyGLFzJyTeFX6czxPd7GO/CIEhhooCJ
 ulZXlRslJqczsGJMoOIXoEVfXD2T7C4ylx0vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yaCTjN5CZzui2ztqLkxvGGCYTFHIuiGBpbp3r9GpozM=;
 b=HlUc5IbmFZOF+LtXyVoREKVmSsCInvVEtwYvJ/YvOJWNqQV7vMVkz5NVZvYj/OIomU
 HHGfvFOsaE4lBYx7kxCui3enYHCW2IgCw7ZXxqS+VRb8HQZtJC+RthS4rrHXzC9FFfPe
 tr1Q63UdmR+HD2BaRRElETqsczwHTbkD2iCQop5a79lqQlxbJpbe5oK7KECXrDsAfeNW
 IXVIl09sp4RPUWf/qxJ9/ZulEoEbQLQKESisyNF05CDMzIp6W+DnyQj7NhELfYkPkSLR
 yKGhimdKi/9udUQLKafXIqpzv9hWxAtCe+12NIHZI916ZhElxYpHnZOxrRMTq3OODqt1
 283w==
X-Gm-Message-State: AOAM532dNh+JT9uvEdemncepClKpMTVvjG4kIS9rCi5ozC5c0GWxrH61
 uk/70ezrLZmHVC2POX7j7osS1jVRSuE3Gw==
X-Google-Smtp-Source: ABdhPJyNORpTZWVbBdxs1DUR2G3czTyeJhlko1wYH5Eue5aO9DbkmF//0k9N2HfmPf5CgSHSi9pQLg==
X-Received: by 2002:a05:6870:e3c1:b0:d7:2dc8:7fd0 with SMTP id
 y1-20020a056870e3c100b000d72dc87fd0mr7834304oad.104.1650912853829; 
 Mon, 25 Apr 2022 11:54:13 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com.
 [209.85.160.42]) by smtp.gmail.com with ESMTPSA id
 j72-20020a9d17ce000000b005e6b89f9f54sm4123952otj.32.2022.04.25.11.54.12
 for <ath10k@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 11:54:13 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-e656032735so15790247fac.0
 for <ath10k@lists.infradead.org>; Mon, 25 Apr 2022 11:54:12 -0700 (PDT)
X-Received: by 2002:a05:6870:4201:b0:e6:47c4:e104 with SMTP id
 u1-20020a056870420100b000e647c4e104mr11422188oac.257.1650912851468; Mon, 25
 Apr 2022 11:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200527165718.129307-1-briannorris@chromium.org>
 <YmPadTu8CfEARfWs@xps>
In-Reply-To: <YmPadTu8CfEARfWs@xps>
From: Brian Norris <briannorris@chromium.org>
Date: Mon, 25 Apr 2022 11:54:00 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPeJ6fD9hvc0Nq_RY05YRdSP77U_96vUZcTYgkQKY9Bvg@mail.gmail.com>
Message-ID: <CA+ASDXPeJ6fD9hvc0Nq_RY05YRdSP77U_96vUZcTYgkQKY9Bvg@mail.gmail.com>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
To: Patrick Steinhardt <ps@pks.im>
Cc: ath10k <ath10k@lists.infradead.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 Linux Kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_115417_361049_0746BD93 
X-CRM114-Status: GOOD (  28.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Patrick,

On Sat, Apr 23, 2022 at 3:52 AM Patrick Steinhardt <ps@pks.im> wrote:
> This revert is in fact causing problems on my machine. I have a QCA9984,
> which exports two network interfaces. While I was able to still use one
> of both NICs for 2.4GHz, I couldn't really use the other card to set up
> a 5GHz AP anymore because all frequencies were restricted. This has
> started with v5.17.1, to which this revert was backported.
>
> Reverting this patch again fixes the issue on my system. So it seems
> like there still are cards out there in the wild which have a value of
> 0x0 as their regulatory domain.
>
> Quoting from your other mail:
>
> > My understanding was that no QCA modules *should* be shipped with a
> > value of 0 in this field. The instance I'm aware of was more or less a
> > manufacturing error I think, and we got Qualcomm to patch it over in
> > software.
>
> This sounds like the issue should've already been fixed in firmware,
> right?

See the original patch:
https://git.kernel.org/linus/2dc016599cfa9672a147528ca26d70c3654a5423

"Tested with QCA6174 SDIO with firmware WLAN.RMH.4.4.1-00029."

That patch was only tested for QCA6174 SDIO, and the 6174 firmware has
since been updated. So none of that really applies to QCA9984. I
suppose your device was also not working before v5.6 either, and IIUC,
according to Qualcomm your hardware is a manufacturing error (i.e.,
invalid country code).

I don't know what to tell you exactly, other than that the original
patch was wrong/unnecessary (and broke various existing systems) so it
should be reverted. I'm not quite sure how to fix the variety of
hardware out there (like yours) that may be using non-conforming
EEPROM settings. It would seem to me that we might need some more
targeted way of addressing broken hardware, rather than changing this
particular default workaround. I'm honestly not that familiar with
this Qualcomm regulatory stuff though, so my main contribution was
just to suggest reverting (i.e., don't break what used to work); I'm
not as savvy on providing alternative "fixes" for you.

(That said: I *think* what's happening is that in the absence of a
proper EEPROM code, ath drivers fall back to a default=US country
code, and without further information to know you're compliant,
regulatory rules disallow initiating radiation (such as, an AP) on
5GHz.)

>  I've added the relevant dmesg
> snippets though in case I'm mistaken:

With what kernel? That looks like pre-v5.17.1. The "broken"
(post-5.17.1) logs might be a bit more informative.

Sorry,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
