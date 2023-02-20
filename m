Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB77C05027
	for <ath10k@archiver.kernel.org>; Mon, 20 Feb 2023 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Subject:Message-ID:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9eyAHcPfaMuovmhvz7Sh9FmLgvDrr0sy/KgGi3eaF6g=; b=yG13urfQyoIAyjw8kwwcqhEyPZ
	7VRZBvcFOT5TMNBsqvG3NDjbPtb+C1OZnICe/QboPxrVpNRViYkxRHk29OxNhopfIBQUJSD1d8ZTg
	kdQOOQG9jWxAuF4xKs3JqX6/aI6JT4+bnbbSaPDkWQd7QEi+nr2ymBahmZKXxsdwClsq43sPgny6F
	H+haGgQZXK7yTAJIt0ZFYtH28RmvxmUsKOtGVK83+lVOIGdQiWrrLzcYEXt0MH3x2tdO+gF92dsOE
	N39VhWvutnIzYG3dEjswmJYc+MbCml2t96ijM1PqJFxD0QihOCtrFfpXqEmSoeHv86omHY7rfEDuO
	r8klCwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8ei-004paa-N2; Mon, 20 Feb 2023 16:04:44 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU8ee-004pZW-V5
	for ath10k@lists.infradead.org; Mon, 20 Feb 2023 16:04:42 +0000
Received: by mail-qt1-x82c.google.com with SMTP id h16so991604qta.8
        for <ath10k@lists.infradead.org>; Mon, 20 Feb 2023 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1676909079;
        h=mime-version:subject:message-id:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fy2VQhm37C5Dv3nnU9BZUH855/QBh9EBPfOzKkcBc6E=;
        b=m5lbHMYH4qiozZgU00bc4jLkcaalGTVpUKJOmkUJEBFcBm0DaUV2EDUiLWu+OCWQ5X
         /1XDiLJuJZ6FBzgchKe/QWYCK7y+/1JSYaBCMpSpxRPjAi6xdNm7oGTYeZTm8zO98ZQe
         W5ejz/qw8X9zIiEJsMGGQ/0g8mGP9Cnk5bCNjUjh7tcYMT+AURxYCcw8qrG/E3ae73xh
         zVND7QEtKDRcO5tqeBbNCBHO9NQ9ZX9OY7/bVv5eZczPT64q2TOpXJ9X0DLbb0COrlzB
         XEA+tHvwzsZlQsXJkGoZkudoNNw1uITSCWwGMiv5FcwXSx/GfVcGcWjCmaORnrxscSeQ
         Cu7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676909079;
        h=mime-version:subject:message-id:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fy2VQhm37C5Dv3nnU9BZUH855/QBh9EBPfOzKkcBc6E=;
        b=zE/ie4k0xm6z5vETmcw2gk5E2Qr5sSsxlmgzRw/BfkvqMx0A3y2izAF8oUyKwt1ILw
         xOWhM6d9md2h3CGPezNVpEDfn9NsGfQGLLFt8aqjGjhU+IoR4t+IWWu3DCPj8yr4vysu
         zHvBcxwwsqBlNtkgZGxj7Hs/I8wyEfrCoAE2iXAG7iN4TK70xLIfrSBI6tTotd1ssZ80
         2F8KrIMdxLCd6e5zw9R48vI3gw5hItmC5l4XYMxu8y3PCfYlg0TvJTonZyt88ZH+vwfC
         B8bvXJ01CGesUxw31mfyJNDa1iLluFRzmK+BWNXtVxN4auFqCjomuPLmc0Q4bhp0ee2E
         KW7Q==
X-Gm-Message-State: AO0yUKXMmsMJaLeCxOhdNAo0hSJjKX13/5pp0efSQA4Ap1LeWvjMVz5l
	gzFD0l70AiDZcqXyWvhng+an7O9Lie8=
X-Google-Smtp-Source: AK7set9tqkcbc/vB1yzOH4q0yd08TLhLzlWsYuuJxQzFV+K9Ad2DU75LnntoxqrOBucbcuOvCqaPrw==
X-Received: by 2002:a05:622a:19a6:b0:3b8:6bef:61df with SMTP id u38-20020a05622a19a600b003b86bef61dfmr3990626qtc.6.1676909079641;
        Mon, 20 Feb 2023 08:04:39 -0800 (PST)
Received: from boobie.home (c-24-147-218-101.hsd1.ct.comcast.net. [24.147.218.101])
        by smtp.gmail.com with ESMTPSA id k5-20020ac80205000000b003b86d3ca969sm6972875qtg.51.2023.02.20.08.04.39
        for <ath10k@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES256-GCM-SHA384 bits=256/256);
        Mon, 20 Feb 2023 08:04:39 -0800 (PST)
Date: Mon, 20 Feb 2023 11:04:38 -0500 (EST)
From: Ameer Antar <antfarmer@gmail.com>
To: ath10k@lists.infradead.org
Message-ID: <812264853.5.1676909078999@boobie.home>
Subject: ath10k rx ring corrupted on QCA9984
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3_665840272.1676909078998"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_080441_021064_0CA31EAD 
X-CRM114-Status: UNSURE (   6.77  )
X-CRM114-Notice: Please train this message.
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

------=_Part_3_665840272.1676909078998
Content-Type: multipart/alternative; 
	boundary="----=_Part_4_1845107913.1676909078998"

------=_Part_4_1845107913.1676909078998
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, I have a QCA9984 chipset mpcie card (Compex WLE1216V5-20) running in AP=
 mode and occasionally crashes with the following message:

ath10k_pci 0000:08:00.0: rx ring became corrupted: -5

I found the section in 'htt_rx.c' which has a FIXME tag saying the device s=
hould be rebooted. Is there an example of this in any other place? I'd like=
 to submit a patch, but don't know where to start.

Thanks for any help.
------=_Part_4_1845107913.1676909078998--

------=_Part_3_665840272.1676909078998
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

------=_Part_3_665840272.1676909078998--

