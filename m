Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A576FC54E41
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 11:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tU1ZkMJEhV/BrJQxdyXhNiiW28IsW+L4CZ7j35NAlE=; b=n90FsbiafcUwJwD80ypAUann0L
	B9YeA5mO4dc5auIXnPIg87CD8g9/YmKrEY1q2TOR96K+RooV++tYXfkibrTOOnuXuO39gbV0YvgN3
	Ltc35KT5daXB8cFzTMhwIvzQQJPS3L5iPRv8iv3RRgYzsao9VFCq8ebFu8UVI9ifXxGQll8KSGi0S
	S8rxXJBShxuu90uX8zXfdppx2ycDogBySj/b32/d8o0mCfTqzvQuugnHvMRiMCCq4QDvO9xq7Ca2a
	VWnIZp6T8p5zys0ZHCVLPlL8ztPFOS0ZBOPCnyJeWtdhOHADzTZzLJo2U9qsm1bloA0yMDbv5FBpZ
	IKgl7axA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhpFC-0000000HaZJ-1uvz;
	Wed, 06 Mar 2024 11:15:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhpF9-0000000HaYf-0lvn
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 11:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4184CCE1EF5;
	Wed,  6 Mar 2024 11:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C5FC433C7;
	Wed,  6 Mar 2024 11:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709723724;
	bh=YC1JZzUSGm90LAa8typocXvGi3dcuKhnwtfIEXMfegA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vMmObzNlM9Tbn7pDK2KR94nuzJA+dkX/WTBV9JAHY7Zq6pgtm9EWAr8uauJqUg2Fw
	 PQ2GNr12JQkL2VIlIu1gaL6rQsr1KJkhS/0Wau+AeicDKCWf8B4cpfRHDWaYzRdz9/
	 jQWAkUJO+clPilmjGVk/JO8AKzdjmdVS1tQJb1DrLIyfr9VJgamMaI9kGkb/BcQWUC
	 DNeXHgiEEikyZZBU1BOPHyjpN5gVdP2eeLh97OQyDR+CC/G3gJVqFIxNWjPgGpEEGq
	 c8yYEAOZCz1kNUNwB7pD3+QUES9AnH4qu1uUyQoMAW7hhBHBkirC6CRXsFDinpVcKG
	 S/KcJa5KFduBg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Rob Herring
 <robh+dt@kernel.org>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
  Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific
 firmware overrides
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
	<87plw7hgt4.fsf@kernel.org>
	<CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
Date: Wed, 06 Mar 2024 13:15:18 +0200
In-Reply-To: <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Wed, 6 Mar 2024 11:23:21 +0200")
Message-ID: <87cys7hard.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_031527_737768_D65AAEA5 
X-CRM114-Status: GOOD (  30.02  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Wed, 6 Mar 2024 at 11:04, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
>> > modem DSP via the TQFTPserv. These MBN files are signed by the device
>> > vendor, can only be used with the particular SoC or device.
>> >
>> > Unfortunately different firmware versions come with different features.
>> > For example firmware for SDM845 doesn't use single-chan-info-per-channel
>> > feature, while firmware for QRB2210 / QRB4210 requires that feature.
>> >
>> > Allow board DT files to override the subdir of the fw dir used to lookup
>> > the firmware-N.bin file decribing corresponding WiFi firmware.
>> > For example, adding firmware-name = "qrb4210" property will make the
>> > driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
>> > directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> > Changes in v2:
>> > - Fixed the comment about the default board name being NULL (Kalle)
>> > - Expanded commit message to provide examples for firmware paths (Kalle)
>> > - Added a note regarding board-2.bin to the commit message (Kalle)
>> > - Link to v1:
>> > https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
>>
>> From my point of view this looks good now but let's see what others say.
>> Is there a specific reason why you marked this as RFC still?
>
> No, I just forgot to remove it from the series settings, so you can
> consider it as final.

Good, so let's ignore the RFC label for this v2.

> I had one minor question in my head (but that's mostly for patches 3
> and 4): in linux-firmware we will have ath10k/WCN3990/hw1.0/qcm2290
> and make qrb4210 as a symlink to it. Is that fine from your POV? 

Yes, I think using a symlink is a good idea.

> Or should we use sensible device names (e.g. qcom-rb1)?

I guess 'qcom-rb1' refers to 'Qualcomm Robotics RB1' board? In other
words, the question is that should we use chipset specific names like
'qcm2290' or product based names like 'qcom-rb1'?

That's a good question for which I don't have a good answer :) I'm not
very familiar with WCN3990 hardware and SoCs to have a full picture of
all this, especially how the firmware images are signed or what
different firmware branches there are etc.

To be on the safe side using 'qcom-rb1' makes sense but on the other
hand that means we need to update linux-firmware (basically add a new
symlink) everytime a new product is added. But are there going to be
that many new ath10k based products?

Using 'qcm2290' is easier because for a new product then there only
needs to be a change in DTS and no need to change anything
linux-firmware. But here the risk is that if there's actually two
different ath10k firmware branches for 'qcm2290'. If that ever happens
(I hope not) I guess we could solve that by adding new 'qcm2290-foo'
directory?

But I don't really know, thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

