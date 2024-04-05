Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E69CD11C2
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 12:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXjaSwdqCjovN9pj4QZqbyEENHMxVjVAz127GuwwYY0=; b=NssWBVKXGaw5lG7VYJFree7pgI
	Q/FxLbE8bgTcGzLEqPBDYmtfY8eP623Vm4iQB9to6KgK6byGjrzuLXL0klrPKSX+iSW3ug0U8t//b
	n641c3R5/5+DvBaC+jetVQCBq8YdhJxoF4frypFlb1mih7k8NwaqKRozzd81GGebVyGSYpFBEJU+1
	YQ6Fp7C18Bx2l+4Khy6IOh7ldjenjbsh6owGYXjlNwhDv5fWIXKihbRKjWYnH/hjLDn5uwud8hZiq
	/raGXblSmp/BDgH8eI3weAjapTLhD1tcmNyxXQaFO1M9xEwJ1jhh6Ee0Rwl6uQPZTzsLISmanfX45
	FO2vfXEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsitF-00000006zpL-11Bb;
	Fri, 05 Apr 2024 12:41:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsit8-00000006znw-2uw9
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 12:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F064CE372F;
	Fri,  5 Apr 2024 12:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366B1C433F1;
	Fri,  5 Apr 2024 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712320903;
	bh=XstQV4I3hA64wkJdbVIzI8G3hTpnTOdEI888VqMr7I4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pFHM2C2GbsBvF2xfSpXbDbaeeEthKyyQgnk3Sh1pD+g7kaPMyMOdDsUUKD8nhM5ei
	 b2Wrjp9NU01rX5iBliGumbHoX/2Uas8in0Of+sBK9wmOIK9ItUsc+0xeoYjiAFLC+M
	 3RTH2EaieomEgwH69yqkFwNxh3zfPfohpjhKZbSQMLF6eseattZCeR8jxqDjXwmJk0
	 DjsaoTkLKvG6tEvkbIOhvjBZzMqATIKYE0HqU1SIThb3v8zBpyiox4mz8CQ4rsGvnQ
	 34zZP9u3HcKyKiw6J3e3nHKstbXuWjqfbR/b5w4viCAk65sw5lYGu+5wfYmy9We2Fu
	 /hFNursI5SIog==
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
	<87cys7hard.fsf@kernel.org>
	<CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
	<87v85wg39y.fsf@kernel.org>
	<CAA8EJpq_XLUEMC67ck2tZRjqS0PazCkQWWMGmwydeWxTETHwcg@mail.gmail.com>
	<871q7k3tnq.fsf@kernel.org>
	<CAA8EJppASEmj6-Jt7OCABAeqr8umSgXaDDha9nn2nRafuZ-Gvw@mail.gmail.com>
Date: Fri, 05 Apr 2024 15:41:38 +0300
In-Reply-To: <CAA8EJppASEmj6-Jt7OCABAeqr8umSgXaDDha9nn2nRafuZ-Gvw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 5 Apr 2024 15:34:29 +0300")
Message-ID: <87sf002d8d.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_054147_279808_62073ED4 
X-CRM114-Status: GOOD (  27.02  )
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

> On Fri, 5 Apr 2024 at 15:01, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Fri, 8 Mar 2024 at 17:19, Kalle Valo <kvalo@kernel.org> wrote:
>> >>
>> >> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> >>
>> >> >> To be on the safe side using 'qcom-rb1' makes sense but on the other
>> >> >> hand that means we need to update linux-firmware (basically add a new
>> >> >> symlink) everytime a new product is added. But are there going to be
>> >> >> that many new ath10k based products?
>> >> >>
>> >> >> Using 'qcm2290' is easier because for a new product then there only
>> >> >> needs to be a change in DTS and no need to change anything
>> >> >> linux-firmware. But here the risk is that if there's actually two
>> >> >> different ath10k firmware branches for 'qcm2290'. If that ever happens
>> >> >> (I hope not) I guess we could solve that by adding new 'qcm2290-foo'
>> >> >> directory?
>> >> >>
>> >> >> But I don't really know, thoughts?
>> >> >
>> >> > After some thought, I'd suggest to follow approach taken by the rest
>> >> > of qcom firmware:
>> >>
>> >> Can you provide pointers to those cases?
>> >
>> > https://gitlab.com/kernel-firmware/linux-firmware/-/tree/main/qcom/sc8280xp/LENOVO/21BX
>> >
>> >>
>> >> > put a default (accepted by non-secured hardware) firmware to SoC dir
>> >> > and then put a vendor-specific firmware into subdir. If any of such
>> >> > vendors appear, we might even implement structural fallback: first
>> >> > look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
>> >> > finally just under hw1.0.
>> >>
>> >> Honestly that looks quite compilicated compared to having just one
>> >> sub-directory. How will ath10k find the directory names (or I vendor and
>> >> model names) like 'Google' or 'blueline' in this example?
>> >
>> > I was thinking about the firmware-name = "sdm845/Google/blueline". But
>> > this can be really simpler, firmware-name = "blueline" or
>> > "sdm845/blueline" with no need for fallbacks.
>>
>> I have been also thinking about this and I would prefer not to have the
>> fallbacks. But good if you agree with that.
>>
>> IMHO just "sdm845-blueline" would be the most simple. I don't see the
>> point of having a directory structure when there are not that many
>> directories really. But this is just cosmetics.
>
> It is "not many directories" if we are thinking about the
> linux-firmware or open devices. But once embedded distros start
> picking this up for the supported devices, this can quickly become a
> nuisance.

Ok. Just out of curiosity, any ideas how many devices/products are there
with wcn3990 who want to use ath10k?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

