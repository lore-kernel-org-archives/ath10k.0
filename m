Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C68C433EF
	for <ath10k@archiver.kernel.org>; Tue, 17 May 2022 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpPWv1Qz5g09zlCx3tTWmQ4l3Zd3rnVH4FfsqQ0bOkE=; b=k7gbt2p9i5lypW
	Sr27ukMShTYDcLtpK56t1lh8NuEXL1pzoR23xXaZQGxigIB+ny/hxzil1Lj4ll4mknGy6Y0cHcXFx
	KqfcnKeAetqI+sDqayizRItcFwMDvQiIcnEcYxkzQpTRWJjbthBl0/akvo4rLDefiX36XFMDcXK/M
	kJfXHD1+CMDwwGJG7pIaU7WO+C+mupqO8jUIcmwONKBtK3Cg4kzG5NodV+TCJdld2iI8Ier0HUKTa
	BsrF7ojJe506cr4VcIDJBH0UHMB4JvqOHOrTl8+TvXtN5JBVdk8DB2/wpzwcs5nKHIcG3cSV1y/cD
	xCaTupINe1M1gTGpbG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqsiH-00CV4z-TJ; Tue, 17 May 2022 08:37:53 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqsiF-00CV3s-0V
 for ath10k@lists.infradead.org; Tue, 17 May 2022 08:37:52 +0000
Received: by mail-vk1-xa36.google.com with SMTP id d132so8705261vke.0
 for <ath10k@lists.infradead.org>; Tue, 17 May 2022 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9Asr0SeltTw/PH/mfYIRVg4glPFZ1rj4w1tcUD07rs=;
 b=PIYIRnb82+X/4SqmLtRLy7keWVP2YyhMzpyh9YAKvbSGIIACp3IurgVNVgMpFh3cRo
 y7iHeZ7/vfQt/kEaAHdq45GTyzvSPoxboGVuLozgy/VyzG1LID+3VCdZIiei2y0W07pC
 o0WzSsGYaJwTGceJg3nMuh6hGG+RoytIKdztWMSnC3JMzHioRNGR3s9LDLaVIDfckDA0
 0cSxjpsqs8x0RyMLeKnhPe04lsGbrIwx8HnhprF+ZF16Nj9rwr4M0+6T0Sv8UNNrjlkw
 gdcxGEJcWiC/+mRpXsbn44FM1v3QeYubU6Znziqj71tAPxysaNGX5rmqhI58DpX2Dhv4
 fdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9Asr0SeltTw/PH/mfYIRVg4glPFZ1rj4w1tcUD07rs=;
 b=p2Yx6mtxIdc8RbzpgLw+ojr7jFhFs82PgNV6GwFgoCBduiBXn0qerdVT54hHkT2h0n
 N9Qq/CqhfgNF/cMZ4xiaV4LR+kx1aKBzqr8bHyFk9nwjfP9fXqjkhOVoiRKq8LJ7glHE
 UnPC0W8FRbOPhX3N9yDRByjQU7cfLzXE8ke3yF9YBvcRffeeq7nMjbnNeLtUDFWN/S5a
 /297rVnXlAxFgwACFrQXolAaITuruAj580cvUXXtYUsLc/LipEgvImFDEUSh79ShUYhy
 LTc5a3Wbg05LPXeVliuSqT27yg4XjlR+2AjkeUv1kQK97jEmplHRAfDHi6H/8RcheJQu
 c/Jg==
X-Gm-Message-State: AOAM530ALw8Xlt2nCdWhF0qs8EBLyKi4RV8tvoutNDtYfOKEpL7fkBCb
 qvoxYlHA6zvzq/fJkECDj82Fw9c8RSL1yNxiWT4=
X-Google-Smtp-Source: ABdhPJz1VBgB0+0+lF8vdD2fAqckoVwXjPs32pRcGWWJu3JLt4+yvqqO3vM9ugzS91PuNTenkRJRAc2813RR0OA0L7c=
X-Received: by 2002:a05:6122:890:b0:352:b096:d44b with SMTP id
 16-20020a056122089000b00352b096d44bmr8021401vkf.41.1652776667432; Tue, 17 May
 2022 01:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220516032519.29831-1-ryazanov.s.a@gmail.com>
 <CAByNJ6qDgqwxqGe0+uKSGCFKLULqEQ+NeBr-dAP=2Maov9ynqA@mail.gmail.com>
In-Reply-To: <CAByNJ6qDgqwxqGe0+uKSGCFKLULqEQ+NeBr-dAP=2Maov9ynqA@mail.gmail.com>
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Date: Tue, 17 May 2022 11:37:36 +0300
Message-ID: <CAHNKnsRx0VWDVsP_KOKaPrU=eODOUCmpyBbYsN1rYEBXvRdaGA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ath10k: add encapsulation offloading support
To: Edward Matijevic <motolav@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>, ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_013751_087863_311A0FB5 
X-CRM114-Status: GOOD (  10.33  )
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

Hello Edward,

On Tue, May 17, 2022 at 5:37 AM Edward Matijevic <motolav@gmail.com> wrote:
> Hello,
> I confirm now my QCA9377 pci module has no regressions in either modes
> with these patches
> I was able to test it as an AP and it worked under ETHERNET mode
> without any obvious regressions but I'm unable to check maximum
> throughput
>
> My hardware info from dmesg and tested on kernel 5.17.7
> qca9377 hw1.0 target 0x05020000 chip_id 0x003820ff sub 11ad:0806
> firmware ver WLAN.TF.2.1-00021-QCARMSWP-1 api 6 features
> wowlan,ignore-otp crc32 42e41877
>
> My quoted statement of a possible regression seems to have been my old
> CPU acting up and is ok to remove

Thank you for the update.

-- 
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
