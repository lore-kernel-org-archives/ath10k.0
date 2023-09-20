Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8068ECE79D0
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2frWKg7R9NIw6LwreZLdjoOC/SPxT60gImApDXJIZaQ=; b=ekN6GX7AFATCQu
	89K+0xfLAE0jqYL9mdy+MpZfkaWduBb2NTaI55x6Jgl3mO18uv0vvRCjl7ez3ld0HdraxwAD7k1Z3
	BzynIFaBUjs+b2VjRBuuUmpPdgpH/BItg7kIGtpt9y+Xylq96tSr7/KDxUA/UWJCB6PN/wc49SxOM
	fAFNvVMwSao658hw0qbjolLevlwXQJK8P5AkDvVhYkFeQPmtIBN8KAdjnE3elV4pljuQDc/veb0Gy
	DHNVcAqETRQ5CIFEXYBvl1ZKFJicv7+aBMshGN0jeKrXcmT94Oe5WUiWyJdnOk5QOXbqaRpMAiWCf
	09xqSOiop602C6pOjWdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixQn-003CnP-2O;
	Wed, 20 Sep 2023 13:39:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixQk-003Cmx-17
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 13:39:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EEDD5B81CC0;
	Wed, 20 Sep 2023 13:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888F8C433C7;
	Wed, 20 Sep 2023 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695217187;
	bh=OJLOcu7QGnU8Z4qYvqF4xiEoMz9vtjV6liy7IRfGmDs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZfJa2gVUGgLaNGBZzzegn3OPffvT5+6g8QiY7lZq93lwfNhiVzT8LivAgS7CLhqR8
	 asHWcVMyZYuBreSbERH+VIpxz14JIU+jA1D/tZWL+kvqfj8uVP/amZXmx3N1uQ+W/8
	 TeoxDOjhEXyTydDB8qU8VfkJbh3qGE43f+0X3uxLoTylZ6DhE2IgtdTBHHgn6FTZhk
	 ApZsOvz2tQWwsOe4x3JzcAxfbJcnoinRHKMNVWRvTfW1fwJ0ZGbnuuuLF+iypTq/Yz
	 Qnrabl6cSc4q9qePC61iZ/u6Vgk4K4Kr2cc1aXN2t7g9lCO2XxEbeangXQdupx95Tc
	 pPLdTVnuYHjFA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: fix clang-specific fortify warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230829093652.234537-1-dmantipov@yandex.ru>
References: <20230829093652.234537-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169521718481.1118199.1680199294713287417.kvalo@kernel.org>
Date: Wed, 20 Sep 2023 13:39:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_063950_535600_13F5680A 
X-CRM114-Status: GOOD (  12.77  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> When compiling with clang 16.0.6 and CONFIG_FORTIFY_SOURCE=y, I've
> noticed the following (somewhat confusing due to absence of an actual
> source code location):
> 
> In file included from drivers/net/wireless/ath/ath10k/debug.c:8:
> In file included from ./include/linux/module.h:13:
> In file included from ./include/linux/stat.h:19:
> In file included from ./include/linux/time.h:60:
> In file included from ./include/linux/time32.h:13:
> In file included from ./include/linux/timex.h:67:
> In file included from ./arch/x86/include/asm/timex.h:5:
> In file included from ./arch/x86/include/asm/processor.h:23:
> In file included from ./arch/x86/include/asm/msr.h:11:
> In file included from ./arch/x86/include/asm/cpumask.h:5:
> In file included from ./include/linux/cpumask.h:12:
> In file included from ./include/linux/bitmap.h:11:
> In file included from ./include/linux/string.h:254:
> ./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
> declared with 'warning' attribute: detected read beyond size of field (2nd
> parameter); maybe use struct_group()? [-Wattribute-warning]
>                         __read_overflow2_field(q_size_field, size);
> 
> The compiler actually complains on 'ath10k_debug_get_et_strings()' where
> fortification logic inteprets call to 'memcpy()' as an attempt to copy
> the whole 'ath10k_gstrings_stats' array from it's first member and so
> issues an overread warning. This warning may be silenced by passing
> an address of the whole array and not the first member to 'memcpy()'.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

cb4c132ebfea wifi: ath10k: fix clang-specific fortify warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230829093652.234537-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
