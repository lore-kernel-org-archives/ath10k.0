Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC63EC001E0
	for <ath10k@archiver.kernel.org>; Wed,  2 Aug 2023 16:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9Yq+PKXPU488iXbvVwru9c8QZ15bvvB9ytljRiI+NY=; b=v1liSpgj6r20Fq
	z3S+MKZQgvPI5HYLpeuS1bfrW0+IQEanrHDrT5uYx0aqsdqd1G8+GkTxYAmW7up387nVOoJQBvrav
	a+6YmJobmZcMviPf9vRE8C1GPCoiWHDH50guqk3+OxNbe0ZOo6vJsj132BO5yfs8GP/U3wgvZyHz7
	QZL7fSN8VDRFfDMVtl4mvO2gGTuqbzSjOZzxcKG5006Q/NL6W7HtZFrCfeqEHt1wXcqFzXe2iQ/yI
	qxmLvT7biXXH4s+rxO1bi8U48WY5ga4N/5poTxUZUhu57XeW836YhmcPlzvs/jA9t1puVMRKxOrMX
	6WWMNF2zrtwOotRlXCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qREyw-005NvJ-28;
	Wed, 02 Aug 2023 16:45:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qREyu-005Ntm-0E
	for ath10k@lists.infradead.org;
	Wed, 02 Aug 2023 16:45:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A7F2615C2;
	Wed,  2 Aug 2023 16:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED4BC433C8;
	Wed,  2 Aug 2023 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690994750;
	bh=a6Bneo+a+CCQkSWOl1VK+7oENQT+BuRjcTU3jX299Yg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MtXbtWgxVUiq9djF63zg9tFjx2jThOuX2blZHjtWQsL2BNkNzVtueR9rnypIePE+O
	 bpmp/5G/gZ7pDJVuz1xcGKp5OkodjkpP2cQQI8s4OE9Fgqabm0GJ043fPPz1BxlTET
	 ol6RCkG7AHSy21MU5bb76W2IVJMPgM1g4jmbu6O4rLdYOmtnC0vVuWrqafDc9yPLXJ
	 3+PNWQz7zPM6WNF/DDuNz6fKvvk8xiof86xHvO650V4TrgyDfAWSrsa6WfW/EkmB1G
	 ZTkK3ryeoHjhx6klkaY75UEoewM4XTbZRk6WkB908Ert5Ac+/G/vLLb6LepspfLXU5
	 SW/2nrNhdczQw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,  Vinod Koul
 <vkoul@kernel.org>
Subject: Re: wcn3990 firmware
References: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
	<8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org>
	<87cz05wxfm.fsf@kernel.org>
	<f0ef6af9-b648-cc64-0165-eb135f0de578@linaro.org>
Date: Wed, 02 Aug 2023 19:45:47 +0300
In-Reply-To: <f0ef6af9-b648-cc64-0165-eb135f0de578@linaro.org> (Dmitry
	Baryshkov's message of "Wed, 2 Aug 2023 14:23:43 +0300")
Message-ID: <87il9xv1dw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_094552_176513_2FC3B15F 
X-CRM114-Status: GOOD (  20.25  )
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

> On 02/08/2023 13:28, Kalle Valo wrote:
>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>> 
>>> On 24/07/2023 22:38, Dmitry Baryshkov wrote:
>>>> Hello Kalle, colle
>>>> Yet-another firmware question (I remember the standard answer of not
>>>> using firmware not coming from your side). I see that for
>>>> wcn3990/hw1.0 we have wlanmdsp.mbn with the version
>>>> WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>>>> We have got the newer wlanmdsp.mbn released under
>>>> redistribution-permissive license (LICENSE.qcom from
>>>> linux-firmware). The file has the version
>>>> WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was released for the
>>>> ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.
>>>
>>> Update: with the current wlanmdsp.mbn I'm getting the following error
>>> from the DSP:
>>>
>>> [   22.468121] qcom_q6v5_pas 6080000.remoteproc: fatal error received:
>>> EX:kernel:0x0:SigVerify:0x173:PC=0xc10dd460
>>>
>>> The board is not fused, but the signature format was changed (and so
>>> were some of the fields).
>>>
>>> It seems we will have to provide the updated file somehow to
>>> linux-firmware. What would be the preferred way for us to do so?
>> I cannot take firmware files from a 3rd party.
>
> Ack
>
>> Also I don't follow the
>> WCN3990 firmware development so I can't really comment how that firmware
>> release works with different WCN3990 hardware, board files and/or
>> calibration data.
>
> It seems to work pretty normal. I have pointed out the only issue we
> have stumbled so far in
> https://bugzilla.kernel.org/show_bug.cgi?id=217748 (the warning during
> scan).
>
>> But if you think that release should be submitted to
>> linux-firmware that's up to you.
>
> This obviously means that we should not push it to
> <linux-firmware>/ath10k/WCN3990, correct?

That's the only directory ath10k uses, right? So how would any other
directory work?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
