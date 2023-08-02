Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D6C00528
	for <ath10k@archiver.kernel.org>; Wed,  2 Aug 2023 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FZxq/2Ju7Ls8blcGzkYuIWmjx+60WhFU+5TKCesj8A=; b=KDjUYgZdPaHb1e
	+iAlKdWblvRfS9guGcTHEOOzyQFGsWtAEx1//ywrwgDPO/jzOirO9gQpbeBOW5T3NSrm0+mzZtIV2
	xZC16Ij6hMMFWm8oczFPwcqrKwNPnAzxzz22b6bD2LiU5O/xbsSuJlku+UDuPkTSkRQl17v6lWe9y
	tuabXKhhmL4TbchRdREEWzsAvHE1pjJlPkDV/3Oay88TsI5izTEH19E2s0arPyhcaG3fJsZJ67G6Y
	DdVm35t8OvfcsXlRGBRLM3BB1QhGgnZiO/6qt4TQGDq0RaWdykdmUL4V8tqBBSIg9Vv73qTAM8Eb6
	RLcd4oX+w/o5yBs26ZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR95Y-004b7f-2r;
	Wed, 02 Aug 2023 10:28:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR95V-004b7E-2w
	for ath10k@lists.infradead.org;
	Wed, 02 Aug 2023 10:28:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 379AE618F3;
	Wed,  2 Aug 2023 10:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ABEC433C8;
	Wed,  2 Aug 2023 10:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690972096;
	bh=TCTFHO1tosx5Mefn6QaTo1jK5xQ+NdcXlkcj82y1oqQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=flpD9zwcoyvg1keqNa3L+JDHyCiNy86JLqsRnfZa8M1zlgENbYtuuVfy8NX6uqyda
	 VqO5Fg6KeP3FQswKnRty7OhgfuCQNWoN529KgY3s00O29R6MaGhht7vCIvFjcP2pZt
	 xSErVlWqn8YamClTgWXKAN6XaPLzDVI2kpeoS9jVXF3bNxWwOr7YVYap7oLJh04S+g
	 g9U9LEJtq7p+bmy/KyPQ7TzigSxZE+hKQ4L25su+rXHLJ9TzZt0NHlKFnzoDYJGlbg
	 u7MQmApQ8kIc+eYL1LY7k2b0OIBJP+ltgZm4pujuM0NxJ3Pp6j/h6DII/PDBN5MO3H
	 RUVFvknplp/HA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,  Vinod Koul
 <vkoul@kernel.org>
Subject: Re: wcn3990 firmware
References: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
	<8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org>
Date: Wed, 02 Aug 2023 13:28:13 +0300
In-Reply-To: <8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org> (Dmitry
	Baryshkov's message of "Mon, 24 Jul 2023 23:02:10 +0300")
Message-ID: <87cz05wxfm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_032818_018659_D3D60C4F 
X-CRM114-Status: GOOD (  18.37  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On 24/07/2023 22:38, Dmitry Baryshkov wrote:
>> Hello Kalle, colle
>> Yet-another firmware question (I remember the standard answer of not
>> using firmware not coming from your side). I see that for
>> wcn3990/hw1.0 we have wlanmdsp.mbn with the version
>> WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>> We have got the newer wlanmdsp.mbn released under
>> redistribution-permissive license (LICENSE.qcom from
>> linux-firmware). The file has the version
>> WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was released for the
>> ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.
>
> Update: with the current wlanmdsp.mbn I'm getting the following error
> from the DSP:
>
> [   22.468121] qcom_q6v5_pas 6080000.remoteproc: fatal error received:
> EX:kernel:0x0:SigVerify:0x173:PC=0xc10dd460
>
> The board is not fused, but the signature format was changed (and so
> were some of the fields).
>
> It seems we will have to provide the updated file somehow to
> linux-firmware. What would be the preferred way for us to do so?

I cannot take firmware files from a 3rd party. Also I don't follow the
WCN3990 firmware development so I can't really comment how that firmware
release works with different WCN3990 hardware, board files and/or
calibration data. But if you think that release should be submitted to
linux-firmware that's up to you.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
