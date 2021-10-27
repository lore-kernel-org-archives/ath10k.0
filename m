Return-Path: <SRS0=kfTG=PP=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D5BC433EF
	for <ath10k@archiver.kernel.org>; Wed, 27 Oct 2021 21:54:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571D061039
	for <ath10k@archiver.kernel.org>; Wed, 27 Oct 2021 21:54:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 571D061039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WSAgMDE0m623USU+wiTXlGKhILeQO7HK6axMKFVnbw=; b=Ud/oQZt6hUOJYJ
	5UPGbURmztNXJ8mzpqYlFYDLigg2ktd/4Gx8fguYo3Q8IW88Iv3cbM4HNa0yydZtWslaL/RUeJvxk
	MjsuXoii697jmBdh0pPCnu/v1NU/73BOUDBd/1qqVhv8EmC8tLYejU/WQ6Q7KHvySLQSj+hraoIE1
	9YI26DgeuElMPlAmqnj6OV1f8QfD85er1IWiaTQbrR58iNP1DobcPiPfXmf6jsMWnQRF2tPxXxSjC
	mIgfOgBzPEo11orSIMTGmMak/WWNSviGf7WKVbH4aMcDJ8R8butR5HE9PBYM9U1smIjdEjeQIJ45F
	Ww/ErVk+WGW6WMGLbpAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfqsC-006KrV-1D; Wed, 27 Oct 2021 21:54:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfqs9-006Kr1-CN
 for ath10k@lists.infradead.org; Wed, 27 Oct 2021 21:54:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9519610CF
 for <ath10k@lists.infradead.org>; Wed, 27 Oct 2021 21:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635371652;
 bh=P97TBuOSU6VCfn0fOqxvrzobUnZ38EQAx73aJ380G0I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=M3VfebhT9aqmPN+g46qbnnrewNbanEgi94dTcPhTU7mpjH5jB8Y7+HKwlB8s7jjVw
 AhPYMHtft/LjFNLK9Hsgj2L68/zVZEBGbpWec7MeDUupldbzjTlVnOAleK8/azkKW8
 iFoc69n5G3V3irQEsvfGSmy36nnA8Gg9ufrGzY2OC7kVp2uH4tt5vzrFHWkHMKIJj/
 7wTkzJE1LXtsccFy9kec2XLrFpEWyaIMu7GE41Q4IEaMYAg7teyu8b/AaSKfJARIyI
 Nlg/tP+rBkWt+6QT1/8s4X3SDvNG/rDkbALb4JlBMtTBjRHbngtdRbmIuIn7wfMf0g
 O4mAIg9NwhW1g==
Received: by mail-ed1-f51.google.com with SMTP id g8so16588976edb.2
 for <ath10k@lists.infradead.org>; Wed, 27 Oct 2021 14:54:12 -0700 (PDT)
X-Gm-Message-State: AOAM531ZJdrxNfY+TuU6gB+GJ5aqBnh9RtCkGkGC7Crdejp1hf+bL5L6
 zzudAlBhOguDlFBzRBLPXoN6pnr5N0wtfFQSxw==
X-Google-Smtp-Source: ABdhPJz4kxW1DR4UGq5S1PijHQ34O4WuSLKy+4MFc+0p8RGDh6RSrjWvUEec/qgQMkxVs4c2i1XYv6o1JFKR1o6WZok=
X-Received: by 2002:a17:907:7f10:: with SMTP id
 qf16mr244409ejc.390.1635371651311; 
 Wed, 27 Oct 2021 14:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
 <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
 <37b26090-945f-1e17-f6ab-52552a4b6d89@linaro.org>
In-Reply-To: <37b26090-945f-1e17-f6ab-52552a4b6d89@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 27 Oct 2021 16:53:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com>
Message-ID: <CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com>
Subject: Re: [PATCH v1 01/15] dt-bindings: add pwrseq device tree bindings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_145413_484596_1F7C7C11 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Oct 26, 2021 at 9:42 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 26/10/2021 15:53, Rob Herring wrote:
> > On Wed, Oct 06, 2021 at 06:53:53AM +0300, Dmitry Baryshkov wrote:
> >> Add device tree bindings for the new power sequencer subsystem.
> >> Consumers would reference pwrseq nodes using "foo-pwrseq" properties.
> >> Providers would use '#pwrseq-cells' property to declare the amount of
> >> cells in the pwrseq specifier.
> >
> > Please use get_maintainers.pl.
> >
> > This is not a pattern I want to encourage, so NAK on a common binding.
>
>
> Could you please spend a few more words, describing what is not
> encouraged? The whole foo-subsys/#subsys-cells structure?

No, that's generally how common provider/consumer style bindings work.

> Or just specifying the common binding?

If we could do it again, I would not have mmc pwrseq binding. The
properties belong in the device's node. So don't generalize the mmc
pwrseq binding.

It's a kernel problem if the firmware says there's a device on a
'discoverable' bus and the kernel can't discover it. I know you have
the added complication of a device with 2 interfaces, but please,
let's solve one problem at a time.

Rob

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
