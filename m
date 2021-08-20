Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BF17C4338F
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 18:08:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0699361056
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 18:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0699361056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6777tIifNa0+WgELUIbfcJy8YDcBeMrhOgkSxAJ1viI=; b=zOs5rQzDZZ7UOD
	o+s2UotMDOvU9sVto4be5/8UwZe2im5rNKckfWZuNG0jFBb+fffylwxsunEtFM8uQsH2TZ9uNb4Vj
	NzTHrYJtin6Oq6lDv1HDh+cBg32DTn5tGJuRV/Lmtz31CK+wpRjwYSKprcOOoReyvekoSU86yLAzw
	K9qKonMcG+Rg0ufi/+Bn5LvTXZqRiZJFNm7glNnFScZ1/C7gZEbamsJ6at+TuqZN+zc4j9zAqs1x7
	wAd0hAUtZOH6NfLhgUt63pGmJzjeNfatMxBES4E3BULPwLJyHDQfkbmp14147N7lC/ulCrINQvEcX
	67OubJ+XJcANKEqo+k0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8v9-00Bnpc-Tg; Fri, 20 Aug 2021 18:07:11 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8v4-00BnoS-2B
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 18:07:09 +0000
Received: by mail-qk1-x734.google.com with SMTP id 14so11748126qkc.4
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 11:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2P/6ZDosW5/PVcVOFh8CyCIBugd9jmsRIXNI9frVp7k=;
 b=eKlYoSg3dyAbESo+fqg+WE15YLNT8pnJoLbLlt4p3gPHdJcPfp3zxOG3s4YPxNRYRA
 wA/+17Kcf4OTu6WSv5rvKqFSNJjVgyZil/Aa+dRjpq1fyJs7xT7HCyWE5Lez19Fctvpn
 fnt8zYEUB6XDJTwGrbo+cxtaQ8xBfy2lhSw/pUcTUjHq3SYmL42O7NATxxGUxx/p6PSR
 X9CvVNLLR5FUVuHZUm2uMHxa9qn0/npIpTtFzrf84CoEsU3pVNpAkQHFSKrI4BjqhFYk
 jKjg6TogdUzt0VlXmNMV8Hk+zLDxDpdka2jmr+B9Uk7If6pBiWAdgmz88s0DbRPoFKJU
 sMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2P/6ZDosW5/PVcVOFh8CyCIBugd9jmsRIXNI9frVp7k=;
 b=KAhYLPPFwe9XBvxNbkVHmr0pBuR+wayq+KABuKKW2dItFIBodk1uzn/MM88HUxTSXk
 qoQM+zNZVE4znx1OaiV5mrTJw0yxGojxo6c2vehjbQXBsLe6vJNgmT8p5vsuHGsuKJ6S
 IGir9WNv212pTS+92Q19FjD530fvz6TOd22dfSS5XWKRB3KCydF24EajySS1zshMPeIR
 I6N0kaD6YLrcez8n00ZblDMMZm96fFBj4Y7K7DmrQxAxbdUTGi+8RWagyUBkVVX08V5p
 G/dOo1HDaKBRTkE3SNc3GRpAbog5tXhyh/5XsY1Hfo4LoXBOmCWzOkVzVpCyirRyucnr
 lNIw==
X-Gm-Message-State: AOAM5333VdImUri35VVwd0TcVre+/XHy+SwsuYPGxkUw9jewO60DMm86
 P9uXxi+aSb017i65l6I8gGf/r3N8q7FcFoayPgjHVg==
X-Google-Smtp-Source: ABdhPJy0huyrDFkZklcWqufreDpJu2i+J+NGLsKEiT3nXZbNTjdURslsF8xR7EyStcydsSHXMEetryziZu3Y6KGLCVk=
X-Received: by 2002:a37:7801:: with SMTP id t1mr10378336qkc.162.1629482824676; 
 Fri, 20 Aug 2021 11:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
 <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
 <YR/gQ0K9MjddBVwY@ripper>
In-Reply-To: <YR/gQ0K9MjddBVwY@ripper>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Aug 2021 21:06:53 +0300
Message-ID: <CAA8EJpo7R4azxybBmKC4uzAm_dvP4tpm4g9VoDMTdw6XZCxzTg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/15] create power sequencing subsystem
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Stanimir Varbanov <svarbanov@mm-sol.com>, MSM <linux-arm-msm@vger.kernel.org>, 
 linux-mmc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, 
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_110706_209505_72F13BFB 
X-CRM114-Status: GOOD (  32.96  )
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

On Fri, 20 Aug 2021 at 20:01, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 20 Aug 06:08 PDT 2021, Dmitry Baryshkov wrote:
>
> > Hi,
> >
> > On Thu, 19 Aug 2021 at 18:23, Marcel Holtmann <marcel@holtmann.org> wrote:
> > > > This is an RFC of the proposed power sequencer subsystem. This is a
> > > > generification of the MMC pwrseq code. The subsystem tries to abstract
> > > > the idea of complex power-up/power-down/reset of the devices.
> > > >
> > > > The primary set of devices that promted me to create this patchset is
> > > > the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> > > > interfaces (older generations) or on serial+PCIe (newer generations).
> > > > They require a set of external voltage regulators to be powered on and
> > > > (some of them) have separate WiFi and Bluetooth enable GPIOs.
> > > >
> > > > This patchset being an RFC tries to demonstrate the approach, design and
> > > > usage of the pwrseq subsystem. Following issues are present in the RFC
> > > > at this moment but will be fixed later if the overall approach would be
> > > > viewed as acceptable:
> > > >
> > > > - No documentation
> > > >   While the code tries to be self-documenting proper documentation
> > > >   would be required.
> > > >
> > > > - Minimal device tree bindings changes
> > > >   There are no proper updates for the DT bindings (thus neither Rob
> > > >   Herring nor devicetree are included in the To/Cc lists). The dt
> > > >   schema changes would be a part of v1.
> > > >
> > > > - Lack of proper PCIe integration
> > > >   At this moment support for PCIe is hacked up to be able to test the
> > > >   PCIe part of qca6390. Proper PCIe support would require automatically
> > > >   powering up the devices before the scan basing on the proper device
> > > >   structure in the device tree.
> > > >
> > > > ----------------------------------------------------------------
> > > > Dmitry Baryshkov (15):
> > > >      power: add power sequencer subsystem
> > > >      pwrseq: port MMC's pwrseq drivers to new pwrseq subsystem
> > > >      mmc: core: switch to new pwrseq subsystem
> > > >      ath10k: add support for pwrseq sequencing
> > > >      Bluetooth: hci_qca: merge qca_power into qca_serdev
> > > >      Bluetooth: hci_qca: merge init paths
> > > >      Bluetooth: hci_qca: merge qca_power_on with qca_regulators_init
> > > >      Bluetooth: hci_qca: futher rework of power on/off handling
> > > >      Bluetooth: hci_qca: add support for pwrseq
> > >
> > > any chance you can try to abandon patching hci_qca. The serdev support in hci_uart is rather hacking into old line discipline code and it is not aging well. It is really becoming a mess.
> >
> > I wanted to stay away from rewriting the BT code. But... New driver
> > would have a bonus point that I don't have to be compatible with old
> > bindings.
>
> It would be preferable if this was a implementation-only change and that
> we kept the existing binding and existing dtb continued to work.

This would require setting up the pwrseq from within the bt driver. I
did not have that in mind. However that'd ease the bt code, since we
won't have to handle the fallback/back-compatibility. Let me think
about it.

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
