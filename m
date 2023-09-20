Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FCCCE79D0
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 13:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HkEgaSX213tSZgW0Adxt7hSzDkl3OK3hSidMJ8VHARw=; b=He+bhkhTgqKBFP
	tVaCnqxKEFUoiVj/WtnFryWQeVh9bEUVSTAOkvOcUxBMgIhrfxMDvHXmcBgQqFw+B464wqF0XuHiG
	Jwt01SN55PZj/0J4uVwghT5xpuS86rCLuJ+ArOIKGOL7kpre1JCRK7vTkVKQMkkfb9OPxQUM6uQSR
	P5na9gQlvBQsvZDlfVy65XyktuPmJAd36HqFc2kZRlPSxWtkeGbImbxR/LpHmOowxBCD3v9LxN+Am
	ZWS3HpJrNzzyhMkpajdvfmod2/nSBbWcNJAOyipXW4JK4Qbfien7Fe25BKqw+ZzBvuMs+OCHE0PA6
	gFXfbNezb3NwKsyStq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qixAq-003AU5-0N;
	Wed, 20 Sep 2023 13:23:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qixAo-003ASV-07
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 13:23:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9A0EAB81D73;
	Wed, 20 Sep 2023 13:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186B1C433C8;
	Wed, 20 Sep 2023 13:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695216199;
	bh=2Et11YtI8kBzyLko0A2MfjzkF+6hxxDNxXxX0g0Jl8U=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Ss+Tkz3brJULw9FCZUQKqAVU1bZUmIQwcTwz4OWfH34VkeBVKeLhkD4oWKx/Wi5Ls
	 fV3pQTEPTWElBbIpv2Qdzb46X4t+0/UYjbX9AIx9F0RYLQ2aK9juSSLVJBdPzB4OYE
	 +nnsazloGFtngv/0VazOi9uALgY5xrlwKviBQB5Wvqnxk8bnD9iPxQMDlWLNSLLUjA
	 pqJcRz4LDSexgY/it52oJm7B+oHSfcYsG9hOZ6zKbCTrortk2+DgvpiO20uzzibuZo
	 NKawn6d6io7WKg2Pgnb2pbWOU69tgCuPfKofqIyamSpe9HbyyOmvdJdSzNmuQIBp3D
	 BmOpBkZwqJpgQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
  linux-wireless@vger.kernel.org,  lvc-project@linuxtesting.org,
  ath10k@lists.infradead.org
Subject: Re: [PATCH 1/6] [v3] wifi: ath10k: cleanup CE ring initialization
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
	<20230824055117.42309-1-dmantipov@yandex.ru>
Date: Wed, 20 Sep 2023 16:23:16 +0300
In-Reply-To: <20230824055117.42309-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Thu, 24 Aug 2023 08:51:06 +0300")
Message-ID: <874jjpashn.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_062322_219851_A9C764CA 
X-CRM114-Status: GOOD (  15.56  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Commit 25d0dbcbd5c7 ("ath10k: split ce initialization and allocation")
> changes 'ath10k_ce_init_src_ring()' and 'ath10k_ce_init_dest_ring()'
> so these functions can't return -ENOMEM but always returns 0. This way
> both of them may be converted to 'void', and 'ath10k_ce_init_pipe()'
> may be simplified accordingly.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v3: split to smaller units per Jeff's suggestion
> v2: change 'ath10k_ce_alloc_rri()' to return -ENOMEM in case
> of 'dma_alloc_coherent()' failure and fix error handling in
> 'ath10k_snoc_hif_power_up()'

[...]

> -static int ath10k_ce_init_src_ring(struct ath10k *ar,
> -				   unsigned int ce_id,
> -				   const struct ce_attr *attr)
> +static void ath10k_ce_init_src_ring(struct ath10k *ar,
> +				    unsigned int ce_id,
> +				    const struct ce_attr *attr)

I have on purpose avoided to use void functions in ath10k/ath11k/ath12k.
The problem is that if some of the functions return void and some of the
functions return int it's much harder to review the code. If most/all of
the functions return the same error value type as int it makes a lot
easier to read the code.

Is there a benefit from function returning void? Why do this in the
first place?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
