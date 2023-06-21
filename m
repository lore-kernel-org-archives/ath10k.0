Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BDAEB64D7
	for <ath10k@archiver.kernel.org>; Wed, 21 Jun 2023 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzP1Uk6ESHsLCriupJu3c/GUEeDiO2235zjSCsGG0aw=; b=N2wy9sNmawU52q
	Z3BmKlOP2aWtD858RRJPTOewQ3ZJyh4rPe6K1kA2vsPl1q0gNIh3v/hXzMq5eh+9+kEhjimHHoyd0
	oXx4fuhr4jjSlLOxJsPobIfoF+8QFENR3v8/rdlnwM6kXFaV2nX5gPaJcizVrc0x6QDJy1WZj9ys3
	Kam2zHN+HbZBWBIQyk5jIrpbMXr3ytfQmVmgzDNmaIXHJH0PuEcKTtbAvWkNYxAP3X4aG3jtzoAg9
	PGCWJJKVA0COskfxwXOwN0mosAgIuBqW5cMjfQCrRyzeZwwXHIW7+//hb/D/EnUA17vj94Q4If7ES
	1qMKZpdLMfhBuhD5ACxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Fp-00FLNe-1c;
	Wed, 21 Jun 2023 18:08:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2Fm-00FLMt-36
	for ath10k@lists.infradead.org;
	Wed, 21 Jun 2023 18:08:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F154B6167A;
	Wed, 21 Jun 2023 18:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2E6C433C8;
	Wed, 21 Jun 2023 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687370905;
	bh=Ilmbq3lRTsDXxIeuCsvSBkem45vmJYvfQqpkYO6UnhA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LLa4z57eFw6O8Z8Tbs4K+hqhYfPCTMrCkeeifGikvfq7fJ0nLbWrwgPn/zLzC+Owb
	 bg8J+7X+KbQzuSquLX1BrG5ebFlbdjvTwHfp4vwssLSyhvhMmFOkzsL7JE+8S6faMa
	 Gd+j0ZIyD/V/9XLhUnqhO7E/LHcaizXV1OEQHlmbZdj6cY3G2wIFm7v51HPm+m0tEI
	 RhAAm2cnUFk8z1rGvjfxTuUqmnfm3LUFzCuMI1GfLiHZB9yHjdyqTTxaph65j29N49
	 fc4Y45OkmSmW+X42N8sp3fbne/Nxtum9uoqP92R5G26MpTQnEGyeQrDV09Xx+WkYgs
	 FTWy0U3bFGeDQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: improve structure padding
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230616090439.2484857-1-arnd@kernel.org>
References: <20230616090439.2484857-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <168737090122.871827.14684779188680131550.kvalo@kernel.org>
Date: Wed, 21 Jun 2023 18:08:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_110827_093768_C461F32C 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Arnd Bergmann <arnd@kernel.org> wrote:

> Including an aligned structure inside of a packed one is ambiguous
> and can lead to misaligned data, as pointed out by this clang warning:
> 
> drivers/net/wireless/ath/ath10k/htt.h:715:34: error: field prefix within 'struct htt_rx_indication' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         struct htt_rx_indication_prefix prefix;
>                                         ^
> drivers/net/wireless/ath/ath10k/htt.h:736:34: error: field prefix within 'struct htt_rx_indication_hl' is less aligned than 'struct htt_rx_indication_prefix' and is usually due to 'struct htt_rx_indication_hl' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         struct htt_rx_indication_prefix prefix;
>                                         ^
> drivers/net/wireless/ath/ath10k/htt.h:1564:2: error: field  within 'struct htt_tx_fetch_ind' is less aligned than 'union htt_tx_fetch_ind::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1564:2)' and is usually due to 'struct htt_tx_fetch_ind' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
>         union {
>         ^
> drivers/net/wireless/ath/ath10k/htt.h:1702:2: error: field  within 'struct htt_resp' is less aligned than 'union htt_resp::(anonymous at drivers/net/wireless/ath/ath10k/htt.h:1702:2)' and is usually due to 'struct htt_resp' being packed, which can lead to unaligned accesses [-Werror,-Wunaligned-access]
> 
> These structures appear to actually need the packing since they
> are embedded at misaligned offsets. Add even more such annotations
> here to enforce bytewise access throughout the driver.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

12ec37be3faf wifi: ath10k: improve structure padding

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230616090439.2484857-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
