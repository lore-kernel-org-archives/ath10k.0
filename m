Return-Path: <SRS0=TZpM=PV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9BA0C433F5
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 15:27:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 758E360F02
	for <ath10k@archiver.kernel.org>; Tue,  2 Nov 2021 15:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 758E360F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fH5GQe+4H8c5BEZEPxH8mvFClqM4gUWZtFvynrsY4EE=; b=L6kgqJRNxvUFcn/pBEh78NiAAp
	GoMN+qYIEkhV3/JVmXlmjS6NiZ1AozqL3sjIHWx+xpdgerGBTEZRHDt70zTkV2AbHNFulYT/pyBnY
	A8LwHR/IR8FmCLuXasgs1WyI3oOzkwkCLQkKwELtRG2WEbsUSD2l3BmG4roAXklPFNL0M/dctf9mN
	krujvnzlhRuqCYcFtGjQ+Vw2oXqdv7XolTSQshQz+EPZ4QWcv2KvDTgYXdcPiA5heajWej6wQC8PX
	ut/DUBK20tql7YA2pdlwWSjP/Yo2KY53Sjql56Q00gxTcZnuyBvU1I+svxWR6TuavXipsI9y5c22f
	Xde8fuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhvga-0028W3-Jk; Tue, 02 Nov 2021 15:26:52 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhvgY-0028V2-4D
 for ath10k@lists.infradead.org; Tue, 02 Nov 2021 15:26:51 +0000
Received: by mail-lj1-x232.google.com with SMTP id e2so35502196ljg.13
 for <ath10k@lists.infradead.org>; Tue, 02 Nov 2021 08:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fxVnPZH6b6L2I7aYk+0v0By0qTM5ney7UTSCmiLQK+A=;
 b=x5JmB/0OUUm0n3pUNm0d3bDFVZ9zoYTwmC68+WhMKiYCDd8J6meh19KGHZHjteCmGj
 Gb+poFRw+Q5O4+zzJh7M1JgxVnp1aEyWS9A6EwcLLgY1LpLfVZUgGn2Yl2smq1KttslG
 jPUkrYMvywbQCMzI5XmPp3b7So9dWZKEff10PaYosjnRDQLTQFGGPrDw8wBORG8lCbKW
 055tT1pMfjVah6HOGuwIlD2rt3+wAoJcH5D10pnUSYQaFdjeh/fCItdq489Cn5qMhSnu
 pXYuysYzaAZvTPJAXCBoDBvy2nCrHmK0DLmb5ukSGYKQGQKHUnB+TYuHVt5IerDWDAHS
 SkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fxVnPZH6b6L2I7aYk+0v0By0qTM5ney7UTSCmiLQK+A=;
 b=SVM5B5xWUYBMBwl4LvUUspLIi0uN0zIzr5XsMMAkemvPsFEC/lah7vGmJXysjOWryY
 +1ptqTZ3iO/TE+FowQg3NLRgswDhcClWm1eh3r3R443VF94rl8Rfd/S5esg1xQg2CMTc
 H/rM6TLtUG0apHkrec42+/Fwiczu94hv7dP8bOZDVisruYUt6BEbvEPjakCHf0jdi2C8
 eOfCcvHoIxq1UpQ071JYC2pfJUXG09IomKUFR0vNa1DOOZnY7S9aU8r3wXzlibW/QbL2
 lDKfDOhn89xQAwfo3jkXf0guiB9vE/xnDmUXUW9zoGF7mi5ezIQbtPjfC6PJXteV3Tww
 cMsA==
X-Gm-Message-State: AOAM532XltYyXrldLyjNwSZtaHGsxgSxBbVII4UOwwLztxYhRU2KQ5nD
 gcddDBDP0EZcXs/4jYc//8OU+w==
X-Google-Smtp-Source: ABdhPJywD1fXGsmUvzlGsbwzhNq/8e0eLaGhh844IKPxeN7lhccCNTjpZy9biEo0Bug7ay78GS+QVg==
X-Received: by 2002:a2e:7210:: with SMTP id n16mr29186843ljc.155.1635866807510; 
 Tue, 02 Nov 2021 08:26:47 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id c1sm1844823ljr.111.2021.11.02.08.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 08:26:46 -0700 (PDT)
Subject: Re: [PATCH v1 01/15] dt-bindings: add pwrseq device tree bindings
To: Rob Herring <robh@kernel.org>
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
 ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
 <20211006035407.1147909-2-dmitry.baryshkov@linaro.org>
 <YXf6TbV2IpPbB/0Y@robh.at.kernel.org>
 <37b26090-945f-1e17-f6ab-52552a4b6d89@linaro.org>
 <CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <31792ef1-20b0-b801-23b7-29f303b91def@linaro.org>
Date: Tue, 2 Nov 2021 18:26:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLAnJqZ95_bf6_fFmPJFMjuy43UfP2UxzEmFMNnG_t-Ug@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_082650_272500_BF9C237F 
X-CRM114-Status: GOOD (  27.92  )
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

On 28/10/2021 00:53, Rob Herring wrote:
> On Tue, Oct 26, 2021 at 9:42 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 26/10/2021 15:53, Rob Herring wrote:
>>> On Wed, Oct 06, 2021 at 06:53:53AM +0300, Dmitry Baryshkov wrote:
>>>> Add device tree bindings for the new power sequencer subsystem.
>>>> Consumers would reference pwrseq nodes using "foo-pwrseq" properties.
>>>> Providers would use '#pwrseq-cells' property to declare the amount of
>>>> cells in the pwrseq specifier.
>>>
>>> Please use get_maintainers.pl.
>>>
>>> This is not a pattern I want to encourage, so NAK on a common binding.
>>
>>
>> Could you please spend a few more words, describing what is not
>> encouraged? The whole foo-subsys/#subsys-cells structure?
> 
> No, that's generally how common provider/consumer style bindings work.
> 
>> Or just specifying the common binding?
> 
> If we could do it again, I would not have mmc pwrseq binding. The
> properties belong in the device's node. So don't generalize the mmc
> pwrseq binding.
> 
> It's a kernel problem if the firmware says there's a device on a
> 'discoverable' bus and the kernel can't discover it. I know you have
> the added complication of a device with 2 interfaces, but please,
> let's solve one problem at a time.

The PCI bus handling is a separate topic for now (as you have seen from 
the clearly WIP patches targeting just testing of qca6390's wifi part).

For me there are three parts of the device:
- power regulator / device embedded power domain.
- WiFi
- Bluetooth

With the power regulator being a complex and a bit nasty beast. It has 
several regulators beneath, which have to be powered up in a proper way.
Next platforms might bring additional requirements common to both WiFi 
and BT parts (like having additional clocks, etc). It is externally 
controlled (after providing power to it you have to tell, which part of 
the chip is required by pulling up the WiFi and/or BT enable GPIOs.

Having to duplicate this information in BT and WiFi cases results in 
non-aligned bindings (with WiFi and BT parts using different set of 
properties and different property names) and non-algined drivers (so the 
result of the powerup would depend on the order of drivers probing).

So far I still suppose that having a single separate entity controlling 
the powerup of such chips is the right thing to do.

I'd prefer to use the power-domain bindings (as the idea seems to be 
aligned here), but as the power-domain is used for the in-chip power 
domains, we had to invent the pwrseq name.

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
