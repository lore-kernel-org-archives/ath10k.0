Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998A9C6FD19
	for <ath10k@archiver.kernel.org>; Mon, 13 Mar 2023 18:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmE2II0N8MYRrUubzl8RRIoAev96WFZ4ogxqtt7a8Ac=; b=qkEEdtHof8DkSu
	z6LLVhKgBgcQn3HI3PVL3bfxtP3cwcM+t7prQ7c66UZVtbtgQZzzCSWV252RPoC/yNaxVtvkubrm8
	2bCg6KEtDpPbkQbTvRJFBDr8oWZaXjZAkFl3AuqaUAz1M+jdteDHKNe2OnoMEfpVcHNm019Ix2LPW
	VLfetuvbkkCT9mGfhV4v4GKWdDcjfHkXPkbRsCfKVh+Rj7r81aM3Y4p8DoXnfMMpJOesMIDORV1BS
	ObvMEthbWFE4NQKEIVdqDskJuOTYw0L9sF3hjf8GEju2xsA2N+HyANyxhjbnw5H07UhovKU9pPF5F
	WQeyALHevoLcw7ee+Dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmux-007IiX-0T; Mon, 13 Mar 2023 18:29:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmut-007Ii9-Tj
	for ath10k@lists.infradead.org; Mon, 13 Mar 2023 18:29:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 34AD5B811D8;
	Mon, 13 Mar 2023 18:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C7EC433D2;
	Mon, 13 Mar 2023 18:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678732140;
	bh=KDQ88u+goxlApfNXunHcZS4KKdnQNzBLDOl5twt2rdE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WigvBTkkFSGefA8mS7GEN/M03ll/ZRujAICxeK9QF+ZOBmoxhe0nFBcyXxKxNg0fT
	 URC0QXtoipXplmqouAX2qjSV7WR9hx16XlLAG8fFbzwA64KVARkcmmhZvwIZhcglpj
	 7+x0n+K2QgEEUyOIHqmbPbgsj8DWTduO2VcgqtD6tZeFFIpHWDOVfL5lOAB60qnxkz
	 KCk09nIBPrLTIoBPYnkYoR2smFqup/xF2ee2UpA6AE5cAm5vsBsySBCkWkIjLatNz1
	 cA81cbEaztgHbiDiIlk/5Wk5jvtsXJTHPpQSoTK994ZmB3jNCjpxkKyqbIJrW/A/Zw
	 gxGCWZtdFCcZA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath10k: read qcom,coexist-support as a u32
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com>
References:  <CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com>
To: Vincent Tremblay <vincent@vtremblay.dev>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Vincent Tremblay <vincent@vtremblay.dev>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167873213607.17591.12426656381855505512.kvalo@kernel.org>
Date: Mon, 13 Mar 2023 18:28:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_112904_145660_6CD42687 
X-CRM114-Status: GOOD (  17.57  )
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

Vincent Tremblay <vincent@vtremblay.dev> wrote:

> Read qcom,coexist-support as a u32 instead of a u8
> 
> When we set the property to <1> in the DT (as specified in the doc),
> "of_property_read_u8" read 0 instead of 1. This is because of the data format.
> 
> By default <1> is written with 32 bits.
> The problem is that the driver is trying to read a u8.
> 
> The difference can be visualized using hexdump in a running device:
> Default 32 bits output:
> =======================
> 0000000 0000 0100
> 0000004
> 
> 8 bits output:
> ==============
> 0000000 0001
> 0000001
> 
> By changing "of_property_read_u8" by "of_property_read_u32", the driver
> is aligned with the documentation and is able to read the value without
> modifying the DT.
> 
> The other solution would be to force the value in the DT to be saved as
> an 8 bits value (qcom,coexist-support = /bits/ 8 <1>),
> which is against the doc and less intuitive.
> 
> Validation:
> ===========
> The patch was tested on a real device and we can see in the debug logs
> that the feature is properly initialized:
> 
> [  109.102097] ath10k_ahb a000000.wifi: boot coex_support 1 coex_gpio_pin 52
> 
> Signed-off-by: Vincent Tremblay <vincent@vtremblay.dev>

Fails to apply:

error: git diff header lacks filename information when removing 1 leading pathname component (line 6)
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/CA+RD57MwUfAzF2u31Ews4uT0+A6uhjwwd40O=9uyZihap4nxdA@mail.gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
