Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C540CD1288
	for <ath10k@archiver.kernel.org>; Wed,  3 Apr 2024 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xisRU98FOj2W+20B4b6Klt6ixkoYCwgIlj8fAHDvOCk=; b=DdowBgnT80GlZAg4vf03NA6bVl
	QilWWmNLg8knlc9bnarFlbE+ToI7p7F80j21aRo0eilRNXdHSZk1LQPGKidOSAEwN5BsZEjldZncS
	h4Dsz+i9ymuYPmM5J+zBAaSDduV8KlMeM+ooYI/l01U6MDNdzM6g5RcdDKp4j691EbsShlNHaW8mu
	agg0aoTfy1akSCApYnvcOelGKL3WApFOWhI3bPo+0mrYZdWcZOL55ngGdIhgPKx7CIoVQKQOIqXwi
	a1kugJk0/OuGo65nrNvfVernZ5zt0cPpAQi+v0ms/vnXQ/VxwkAyMrmXoaIzCJ2Qc9SE1ml6R8eFx
	TPgDTsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs10t-0000000GIv1-1Coa;
	Wed, 03 Apr 2024 13:50:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs10q-0000000GItT-0l9q
	for ath10k@lists.infradead.org;
	Wed, 03 Apr 2024 13:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CADA2CE28DA;
	Wed,  3 Apr 2024 13:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B22C433C7;
	Wed,  3 Apr 2024 13:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712152245;
	bh=ik1Yx7g2yV54SqbOiKkosaQPOUnk7YH54MIOwB7vzuU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Xd/SRhp2o//KNgIe7V9q/Vqg3uMo+ldj6QJa3Gna1jr+O1daos75LaAQurJDXj7S3
	 SQpjuyBXs8LKDZxlP2b6Q+t74wd0XPqaj4IOEZ9K2UETteki/AyE1R7VudIVAZaENq
	 t/G855WrxmaMUoZu26xsKMpeZo93MW9/e+9u1lhhOArsZyD+c7TpDuzQUFPvqdAEmp
	 W8NBlBtB59+jYcGHqyzg+EJ0sbaweDiylmVe3DFIzAQgGQgLIfpS/KYgZlRv/jGOB3
	 +sqnbyIPXuYuM1xTlr7CXju+xbTt6y9gynfhQrsH0cgQH3XmKWrXtymyAWFJXgOp63
	 NXFLXnaF0P3OA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  Brian Norris <briannorris@chromium.org>,  Ajay
 Singh <ajay.kathat@microchip.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  <linux-wireless@vger.kernel.org>,
  <ath10k@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] wifi: ath10k: sdio: simplify module initialization
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
	<f78fa061-3b34-47d2-a40c-bbec744f0f97@quicinc.com>
Date: Wed, 03 Apr 2024 16:50:41 +0300
In-Reply-To: <f78fa061-3b34-47d2-a40c-bbec744f0f97@quicinc.com> (Jeff
	Johnson's message of "Fri, 29 Mar 2024 10:22:00 -0700")
Message-ID: <87jzle5zda.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_065048_419127_748FB368 
X-CRM114-Status: GOOD (  13.36  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 3/29/2024 10:10 AM, Krzysztof Kozlowski wrote:
>> This driver's initialization functions do not perform any custom code,
>> except printing messages.  Printing messages on modules
>> loading/unloading is discouraged because it pollutes the dmesg
>> regardless whether user actually has this device.  Core kernel code
>> already gives tools to investigate whether module was loaded or not.
>> 
>> Drop the printing messages which allows to replace open-coded
>> module_sdio_driver().
>> 
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>
>> 
>> ---
>> 
>> FYI:
>> I have ongoing patchset touching few lines above this patch chunk
>> (sdio_driver) which might go via different tree. If that patchset is
>> applied via different tree, it might result in a trivial conflict, but
>> there is no dependency. They can go via separate trees (except that
>> trivial conflict).
>
> I'll let Kalle respond if he'll take this through the ath tree vs letting you
> take it through your tree

I prefer to avoid conflicts as much as possible. In this patchset I'm
not anticipating any conflicts with wireless trees, so if we can avoid
any conflicts, please take this patchset via the other tree:

Acked-by: Kalle Valo <kvalo@kernel.org>

I'll drop this patchset from my queue. But if I should take these to
wireless trees instead just let me know.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

