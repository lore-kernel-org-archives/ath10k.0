Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83927CD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFHyX9xmyQmCKJTl3I/a4sYk/OT97UDfxzGKyszVpUA=; b=I2AIizmsAtKrD2LoFDUwNqQ94p
	1FNrA/huCWuBAT/Dy67VmvsZqGKjGfyl1IljAbMXDFI5PH2fONvNMhMJuyrFRKVMbtXSRViZTxT9N
	Q52joLW/xiy0Uv17Jc040ID9yoGRMEtyoUGWmEoPMNzo7KZ4jnq2J8voIZ5kDFJQfhhQsYeYTHk+l
	iXNUbJDJ5ypA8ejVy62qq42LPJDzjUUa4CQJ+mPtsItFNUUuLu9ox9H3/oNewnmXltC+SpxsN1Zik
	31VHZbSJuxgBvOAYlGlR0GmPJUKS4YJIKhPI6GiKyD7bybfmtNhqYxFuIjgFinBEqG8eqYrdy95bY
	20r4MVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Yg-0000000GSxO-1kHz;
	Wed, 03 Apr 2024 14:25:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Ya-0000000GSvB-3J6p
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 14:25:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1919861462;
	Wed,  3 Apr 2024 14:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C1BC433C7;
	Wed,  3 Apr 2024 14:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712154339;
	bh=rEQlpF8LEm0jnwECyk8fqxYAF5glW3sXu62EM8DBMu4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gHeJypllYzbUGBJwibURijLQb0SIDI7zpW+Qaei+IC8LBG3xUNLYozHUis9iLbrl4
	 58PXcNn1ndJu7ZQJvlSHVsrufYEmyM0/bN3iATMbtOkeNRGnVTMTCK9oXYTlbCMZGT
	 iTUiFrpBT1GTywPrRFzbxLuBBLQdWiI6ElRjOnJR9VcaD/xhYyKMXNOwZXyyv/nUEB
	 6gwSK3BRDmpb77x/0iKotz4fCsKUlqfwNh6BgT4gfRCQAuCrfw+Zj1hqcd89Itwmb+
	 ADiOvohvIqDASUCxT06Tva8mOrm6XSSJVM/49vwP7Z3iGGuocm/zCutQt2PM7tbDjK
	 5SXgj2cm1uWGA==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  Jeff Johnson
 <jjohnson@kernel.org>,  Brian Norris <briannorris@chromium.org>,  Ajay
 Singh <ajay.kathat@microchip.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] wifi: ath10k: sdio: simplify module initialization
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
	<f78fa061-3b34-47d2-a40c-bbec744f0f97@quicinc.com>
	<87jzle5zda.fsf@kernel.org>
	<ec78df08-118b-4086-beec-9227b309595a@linaro.org>
Date: Wed, 03 Apr 2024 17:25:36 +0300
In-Reply-To: <ec78df08-118b-4086-beec-9227b309595a@linaro.org> (Krzysztof
	Kozlowski's message of "Wed, 3 Apr 2024 16:02:30 +0200")
Message-ID: <8734s25xr3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_072541_227822_701F2FA4 
X-CRM114-Status: GOOD (  14.29  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 03/04/2024 15:50, Kalle Valo wrote:
>
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>> On 3/29/2024 10:10 AM, Krzysztof Kozlowski wrote:
>>>> This driver's initialization functions do not perform any custom code,
>>>> except printing messages.  Printing messages on modules
>>>> loading/unloading is discouraged because it pollutes the dmesg
>>>> regardless whether user actually has this device.  Core kernel code
>>>> already gives tools to investigate whether module was loaded or not.
>>>>
>>>> Drop the printing messages which allows to replace open-coded
>>>> module_sdio_driver().
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>>
>>>>
>>>> ---
>>>>
>>>> FYI:
>>>> I have ongoing patchset touching few lines above this patch chunk
>>>> (sdio_driver) which might go via different tree. If that patchset is
>>>> applied via different tree, it might result in a trivial conflict, but
>>>> there is no dependency. They can go via separate trees (except that
>>>> trivial conflict).
>>>
>>> I'll let Kalle respond if he'll take this through the ath tree vs letting you
>>> take it through your tree
>> 
>> I prefer to avoid conflicts as much as possible. In this patchset I'm
>> not anticipating any conflicts with wireless trees, so if we can avoid
>> any conflicts, please take this patchset via the other tree:
>> 
>> Acked-by: Kalle Valo <kvalo@kernel.org>
>> 
>> I'll drop this patchset from my queue. But if I should take these to
>> wireless trees instead just let me know.
>
> Just to clarify - only the first patch has possible conflict. The rest
> should be fine.

Ah, I was not quite sure what patches had the conflict.

> Can you pick up 2-6 patches from this set?

Yeah, that sounds the best. So patches 2-6 are back in my queue:

https://patchwork.kernel.org/project/linux-wireless/list/?series=839844&state=*&order=date

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

