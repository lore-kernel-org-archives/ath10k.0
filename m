Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F8AE706E5
	for <ath10k@archiver.kernel.org>; Thu, 21 Sep 2023 08:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjNEtsYR33LkqbXspd7vFYgqbVyHOcpYJWpQsytanDQ=; b=G9rQRNUJU8vcks
	Aqx/UvWv5J8f7OyKweys/Tfk96k99VIgq9YMbDB6ltgqRuVhtMtYFnaAmg3KYL25MmKkpIma5FjfX
	InV0Sof+sSlkicdyYahrHzmqn7DCcvKEUJg5OUURtoz1ew593/9/WEGP1rgSfCQxEbqSSHkimxdDr
	51c/QjL3mDIHb3aP+DucVDh6nJ7CUo4z4XFkkU5ffHrTUnC+ks6KxprPkRC+6YYB5fuZgxrVD7ulC
	U8+M8NsP6PqvZqk5EXNaxjx7cvPEEpn1Om60O7e4+7dNpXMIMaSAqVhxN+4oRRMqd5mU3Ap06gxdi
	B6ilA+4MJEfm9Igv5uUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjElb-005SqN-0l;
	Thu, 21 Sep 2023 08:10:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjElY-005Spt-2j
	for ath10k@lists.infradead.org;
	Thu, 21 Sep 2023 08:10:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0470761E56;
	Thu, 21 Sep 2023 08:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E5BC116B0;
	Thu, 21 Sep 2023 08:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283827;
	bh=88AKbaA+AwhS8raz9bZXjzCE7ETgOOVMKBcCNcy1RpE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r0+lsAVNF5tR0s5cWaq+Pkxc60xpmpbcvJv/SqRxkRG6zHI3C5bg75kBgkOYtOwEe
	 Kdxx/8IEtAOZQC3QfQgQa8sRrxzalbw6e8LvhnZ9ovU7CnyML/rrSgfMckxClATarU
	 tgAU1TlJrpmc0fUtqqEvDmQPnxdFywznVuEOoL6ELu7m6Lf655hRfLiNTZxwMIrQ/u
	 0iiBWjOduJFDq0Sk8sL+iCGrIRielVtykLyfjCufQSxDPfQJet+KWSYWfyD46/5yQT
	 hP3xXkryE1hBnssPwK2DsQpuCcjdw+2INnYpP8q1BpReKsb9NP/cfr6+CV1vss7z+A
	 xvhdLX9t1m1Fw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Annotate struct ath10k_ce_ring with
 __counted_by
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230915200636.never.762-kees@kernel.org>
References: <20230915200636.never.762-kees@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Kees Cook <keescook@chromium.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528382314.1539628.5873188832117553584.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:10:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_011028_933731_695E8D74 
X-CRM114-Status: UNSURE (   7.97  )
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

Kees Cook <keescook@chromium.org> wrote:

> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct ath10k_ce_ring.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: Jeff Johnson <quic_jjohnson@quicinc.com>
> Cc: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3f856f29551f wifi: ath10k: Annotate struct ath10k_ce_ring with __counted_by

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230915200636.never.762-kees@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
