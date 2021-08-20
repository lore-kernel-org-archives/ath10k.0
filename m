Return-Path: <SRS0=JzU8=NL=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C956C4338F
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 17:02:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E419610CC
	for <ath10k@archiver.kernel.org>; Fri, 20 Aug 2021 17:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E419610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i4+kLDkkT95GiFEowsswwmb2ooDSW/9id2RcSNYLTFk=; b=PqrjnVS+Uj9R+Q
	/s4n6leZF5S7u0IqeYfLDpSRV14MvUh3/4GsG09GxkzVmbcCJmmx0wETfDzNDENZSHAZaDPGCIB8v
	fRqjl6GRP9trJ8WZWzONqkefbmZfnek/6WIWvWjNa3tI7VOkoC4eJUjv2u+GBHy3aHtZ9nyol9aSM
	t/R70zVT6wNXAxWmEAQQ/asAsJJQqKyIK9ScZ3BNeAYhIGFIadxGlr1JAYTSeCFjRSrbnc1GI/T3M
	oqDw9RX1z2F8rjqRRkODzMFsvHOpz9wVpvyqAWWCirWMyzg5Y93bSITX1jV80quMJ1H90DLH/Fxws
	2Q1U2A0Upe1xaQcn2yHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH7tp-00Bhd6-Hv; Fri, 20 Aug 2021 17:01:45 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH7tk-00Bhbp-A9
 for ath10k@lists.infradead.org; Fri, 20 Aug 2021 17:01:44 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so15312174oti.0
 for <ath10k@lists.infradead.org>; Fri, 20 Aug 2021 10:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7+Objv6i9DmTC/GMLfVRuDD2b04IsyqfYBCngR4TqEA=;
 b=VUVTkfJxilVSNSnmnsmdM9ydLw6cLOLjiV9O1h84iDwGGKeleSGq/z0n88M9BarB34
 zuHJZQ+Un7etTx/B98zFvsG0xZVvmMQ/q757BM4HwGqsNf0t3WAkPVDQHZUSR0zYxOOk
 3I8YoZJ6a6DWXp9r4StejHqeoL/z3O1CtHFQl77FZN2018FiWfqcoe0Pya8T43DEo0U2
 bQDBi4JNlWWbUTvMwQeLnyZD267VxMFxiAjHwynrCcB/tTVwYz3LilLD7cTC98MbZuNR
 ThTIy9p9CBDf5jvjTVyrWC7TZKjIUCorvF4o/ecR3s7qu3aqhdAmbSjGeFUHmaVu3s2b
 ho7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7+Objv6i9DmTC/GMLfVRuDD2b04IsyqfYBCngR4TqEA=;
 b=O2+W9L8Q2kyxwLW6hIqhB/rz05Tz+jcfsysIxtVusFg+cTfNbrcP+H8Vy4x+uN3a1G
 FAMpIEeAm7ajDbywt6JD50/+LUA7br55x/oQZy8GN0T+71s07JW7BehrafA+P+JuaCFE
 fN3r+rzWDPwJPyJtJokYmTHqgmUaFy4e+1koMttC3dvwyLZIMSxToTvdH9H2a9BaID6+
 8GU79fT4UQutgFz4wvZifU380YrN/qvDWUN3LvGUMRmGn8eYMSGJ9SjnRQaTeG5CQy6d
 O4b0KunMFO4Fw7u+Ovu1M7ibSdHr9zp+qdUAFh092IPhsqvz44/V7l+rQuKoJzM0ysCn
 2ZjA==
X-Gm-Message-State: AOAM532i3GLVprWq2ulnkGEFIU75ioL9Rqr9omX0j+3YyzguyvbMsWlY
 tk1UKpMnDNyAAb7ePwXkVP+bwg==
X-Google-Smtp-Source: ABdhPJwh3RFgheApQFS1RlK2kyFKcJkU8VRb38Zvs3CD2Q+PFpUlJngtjnhNYlepCxDAJjc3/+kyZw==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr17974382otb.281.1629478897320; 
 Fri, 20 Aug 2021 10:01:37 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n73sm1564722oig.9.2021.08.20.10.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 10:01:36 -0700 (PDT)
Date: Fri, 20 Aug 2021 10:02:59 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Andy Gross <agross@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 MSM <linux-arm-msm@vger.kernel.org>, linux-mmc@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [RFC PATCH 00/15] create power sequencing subsystem
Message-ID: <YR/gQ0K9MjddBVwY@ripper>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
 <1CA665D1-86F0-45A1-862D-17DAB3ABA974@holtmann.org>
 <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAA8EJpoOxerwmwQozL3gp1nX-+oxLMFUFjVPvRy-MoVfPuvqrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_100140_438887_E456F1B8 
X-CRM114-Status: GOOD (  31.10  )
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

On Fri 20 Aug 06:08 PDT 2021, Dmitry Baryshkov wrote:

> Hi,
> 
> On Thu, 19 Aug 2021 at 18:23, Marcel Holtmann <marcel@holtmann.org> wrote:
> > > This is an RFC of the proposed power sequencer subsystem. This is a
> > > generification of the MMC pwrseq code. The subsystem tries to abstract
> > > the idea of complex power-up/power-down/reset of the devices.
> > >
> > > The primary set of devices that promted me to create this patchset is
> > > the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> > > interfaces (older generations) or on serial+PCIe (newer generations).
> > > They require a set of external voltage regulators to be powered on and
> > > (some of them) have separate WiFi and Bluetooth enable GPIOs.
> > >
> > > This patchset being an RFC tries to demonstrate the approach, design and
> > > usage of the pwrseq subsystem. Following issues are present in the RFC
> > > at this moment but will be fixed later if the overall approach would be
> > > viewed as acceptable:
> > >
> > > - No documentation
> > >   While the code tries to be self-documenting proper documentation
> > >   would be required.
> > >
> > > - Minimal device tree bindings changes
> > >   There are no proper updates for the DT bindings (thus neither Rob
> > >   Herring nor devicetree are included in the To/Cc lists). The dt
> > >   schema changes would be a part of v1.
> > >
> > > - Lack of proper PCIe integration
> > >   At this moment support for PCIe is hacked up to be able to test the
> > >   PCIe part of qca6390. Proper PCIe support would require automatically
> > >   powering up the devices before the scan basing on the proper device
> > >   structure in the device tree.
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Baryshkov (15):
> > >      power: add power sequencer subsystem
> > >      pwrseq: port MMC's pwrseq drivers to new pwrseq subsystem
> > >      mmc: core: switch to new pwrseq subsystem
> > >      ath10k: add support for pwrseq sequencing
> > >      Bluetooth: hci_qca: merge qca_power into qca_serdev
> > >      Bluetooth: hci_qca: merge init paths
> > >      Bluetooth: hci_qca: merge qca_power_on with qca_regulators_init
> > >      Bluetooth: hci_qca: futher rework of power on/off handling
> > >      Bluetooth: hci_qca: add support for pwrseq
> >
> > any chance you can try to abandon patching hci_qca. The serdev support in hci_uart is rather hacking into old line discipline code and it is not aging well. It is really becoming a mess.
> 
> I wanted to stay away from rewriting the BT code. But... New driver
> would have a bonus point that I don't have to be compatible with old
> bindings.

It would be preferable if this was a implementation-only change and that
we kept the existing binding and existing dtb continued to work.

Regards,
Bjorn

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
