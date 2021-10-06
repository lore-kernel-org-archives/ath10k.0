Return-Path: <SRS0=0INN=O2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEFCC433EF
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:50:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C61AF610A3
	for <ath10k@archiver.kernel.org>; Wed,  6 Oct 2021 03:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C61AF610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCOkZWdBtvQ3GMcEVfafyclJ6TYaNECLvr/s4jJqXCs=; b=vqQQtetFTBMBZs
	27TDvSaG8eIgwkptztelk7Oj1i2fUWYJVsaGzQK4O018rt6JwoPryes6fd9WQRGIzJAXUO0bEAtQQ
	1gQJAl7BWd3qcd0boXfgIvcphFVPVKq1/SBJcrSbc3uonLR9LJiDDHYsho8JviuXTe4xGCRJrIWbY
	dEMzuOvn/OYer4GZjA0jcgJMGU+AeafjXpO/xDYLkd/+mdz3SrEZZzsHicTZe4QBpsSadjjgXbkZZ
	B3NoddUBvsP6ylYtImmUBZRMp7WhpCQ1CB3/x1pUKb91TwZ6gcTXL+L58F5ZYVE/fVth/4c/bzB7e
	xmHWSgcPUJBMmlsY601w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXxvp-00ChWi-3G; Wed, 06 Oct 2021 03:49:25 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXxvl-00ChWN-U4
 for ath10k@lists.infradead.org; Wed, 06 Oct 2021 03:49:23 +0000
Received: by mail-lf1-x12a.google.com with SMTP id y26so4421182lfa.11
 for <ath10k@lists.infradead.org>; Tue, 05 Oct 2021 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l6uSTYKI1iDVQ1/5MVV35eiuQr3oTGL96afJoVN7XpE=;
 b=XMP0oiRighob77xlb1PXIzbL2qu7sd7BzC0FticBn2Be9aA1nYfrnT70VCqohLdx3q
 vA8YhA0yyD5li8ZRYbhNQz+bdNWHdMYyMIk/y4Ha2x3vA3udI+GGWlrbxZsA8V1I10i1
 +QF/eMLISmlGltEdbr7NmJVTaVM6rHQWjAxJgTpetWPilWj8OFNsLi/Zcq240E8/V4Qh
 FRNjGIq5x8LN0FTLd2H8v1Q5jPAVjGnYoo+hpozvUPnpE50RwWjatQsa30Z7S5s2o/jI
 CNlW4Kha+zjkWTI/jp7b5/BBvFjjpVfJRGQ48r7KLmQhSADf9iuCcnB03Pjt5t5/Grtx
 a2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l6uSTYKI1iDVQ1/5MVV35eiuQr3oTGL96afJoVN7XpE=;
 b=nPi6qtf1Ca99RO7GniPumy4w/ISOQobUATx1bgfs1LXw2Rp6yAO82RqbM+lTRLChO7
 ncz5UqZ2qHXuWhNtFAnAGTe/yQL1YGCuHtCSjNZAs7LlLQQ+vRUC5WPlOASSIywUz4SD
 hbtWoorNZzmYOyV1NrM+z6f7HqzI4As/rG1AnH4NoLwrWWMCgH4Gs+RUPpY0s7iZrgBk
 jLOrU2FlXKYvmfKD5H/HYmw0O6KzApFVA22n54ZsvhP7DX6TZBSM/3edj8UCjZ1EvLiE
 AYtxHfWJkf14ugdH2SK+VbWNamihhiCpQ7ZkdH+MEg9ZbUW7EHHcM5Pk60M5EXm2qDeB
 t/hQ==
X-Gm-Message-State: AOAM5313rsy0xxzKRH1i2fRSdZLHalk4lwHti48gKECSu8vGz6Gp3s3j
 qBGbX41z+OQvcD/z5L4qmWNHaPWlbZA9j3W0FVM0KQ==
X-Google-Smtp-Source: ABdhPJya/cHmu4jYQmBnP1nXJTIFK74KW21Myh3oIz3kpdEwg32cUPpqXnXVmYd4H6feMiKWwtLp8SDERd4E6oJYIJg=
X-Received: by 2002:a2e:5442:: with SMTP id y2mr26848306ljd.436.1633492159155; 
 Tue, 05 Oct 2021 20:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
 <4a508fc1-6253-9c11-67fb-f84f17fd2719@kali.org>
In-Reply-To: <4a508fc1-6253-9c11-67fb-f84f17fd2719@kali.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Oct 2021 06:49:08 +0300
Message-ID: <CAA8EJprsfzFWP1KH61UEkjJmY8rDFTN5i_53Mc0e9n3oxJsBNA@mail.gmail.com>
Subject: Re: [RFC v2 00/13] create power sequencing subsystem
To: Steev Klimaszewski <steev@kali.org>
Cc: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, 
 linux-wireless <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_204922_008133_F85FB62F 
X-CRM114-Status: GOOD (  39.39  )
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

Hi Steev,

On Tue, 14 Sept 2021 at 02:39, Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 8/29/21 8:12 AM, Dmitry Baryshkov wrote:
> > This is the second RFC on the proposed power sequencer subsystem. This
> > is a generification of the MMC pwrseq code. The subsystem tries to
> > abstract the idea of complex power-up/power-down/reset of the devices.
> >
> > To ease migration to pwrseq and to provide compatibility with older
> > device trees, while keeping drivers simple, this iteration of RFC
> > introduces pwrseq fallback support: pwrseq driver can register fallback
> > providers. If another device driver requests pwrseq instance and none
> > was declared, the pwrseq fallback code would go through the list of
> > fallback providers and if the match is found, driver would return a
> > crafted pwrseq instance. For now this mechanism is limited to the OF
> > device matching, but it can be extended further to use any combination
> > of device IDs.
> >
> > The primary set of devices that promted me to create this patchset is
> > the Qualcomm BT+WiFi family of chips. They reside on serial+platform or
> > serial + SDIO interfaces (older generations) or on serial+PCIe (newer
> > generations).  They require a set of external voltage regulators to be
> > powered on and (some of them) have separate WiFi and Bluetooth enable
> > GPIOs.
> >
> > This patchset being an RFC tries to demonstrate the approach, design and
> > usage of the pwrseq subsystem. Following issues are present in the RFC
> > at this moment but will be fixed later if the overall approach would be
> > viewed as acceptable:
> >
> >  - No documentation
> >    While the code tries to be self-documenting proper documentation
> >    would be required.
> >
> >  - Minimal device tree bindings changes
> >    There are no proper updates for the DT bindings (thus neither Rob
> >    Herring nor devicetree are included in the To/Cc lists). The dt
> >    schema changes would be a part of v1.
> >
> >  - Lack of proper PCIe integration
> >    At this moment support for PCIe is hacked up to be able to test the
> >    PCIe part of qca6390. Proper PCIe support would require automatically
> >    powering up the devices before the bus scan depending on the proper
> >    device structure in the device tree.
> >
> > Changes since RFC v1:
> >  - Provider pwrseq fallback support
> >  - Implement fallback support in pwrseq_qca.
> >  - Mmove susclk handling to pwrseq_qca.
> >  - Significantly simplify hci_qca.c changes, by dropping all legacy
> >    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
> >    parts of the chip.
> >
> I tested this here, on the Lenovo Yoga C630, after creating a patch to
> do basically the same thing as the db845c does.  One thing I noticed, if
> PWRSEQ=y and the rest are =m, there is a build error.  I suppose once
> the full set is posted and not RFC, I can send the patch for that.

Please excuse me for the delay in the response. I was carried away by
other duties. Yes, could you please provide a fixup patch.
I'm going to send v1 now, containing mostly cosmetical and
documentation changes. I'll include your patch in v2.

> One question I have, if you don't mind, in patch 11, you add a second
> channel to qca power sequencer.  I've added that here, but in the c630's
> dts, "vreg_l23a_3p3: ldo23" is empty, so I added the same numbers in for
> the regulator, and I'm wondering how to test that it's actually working
> correctly?

That's a good question. I have not looked in the details in the ath10k
documentation. I'll try finding it.
Maybe Kalle Valo can answer your question. Could you please duplicate
your question on the ath10k mailing list?

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
