Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B22C4345F
	for <ath10k@archiver.kernel.org>; Mon, 22 Apr 2024 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8bhQnAt10FkroavO7Qz6LO+wtoG2v0IJuQhquYK/pqc=; b=htTolAo2dy0NvdQpjF9QY80TEb
	HedeBX1c8ZIq12HMEymxZhEP9BCRYtCv0fyl0O+6uvITiIGICM4ifFB3yvmys1kPhwNhDv0z9XDK/
	Lh9OeTJe7rw7FMYk/VJ8hys2w8Qr/+gqDQTzt+piM4ASm0+YnwIi6DdGlwYb8ttcKRST2/TAlQDyd
	sQJK9oEUbEXaJtPShdHyI6aV9IxHBxNjgEgm8nrthC+A4ogKhPWFPC/mjGasBHgrR9tC9PEtYJaUg
	nZ0VZ8a354dcpsUYUsAnn1QvNCI3lW2TkeRpc/CWasbzMLLlg/PnUTpvVUNOiD1SqJe6JVYpTnEIF
	SNQom7yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynYZ-0000000CIyw-2oTw;
	Mon, 22 Apr 2024 06:53:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rynYU-0000000CIvC-3olx
	for ath10k@lists.infradead.org;
	Mon, 22 Apr 2024 06:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B21FCE0A1A;
	Mon, 22 Apr 2024 06:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF79BC116B1;
	Mon, 22 Apr 2024 06:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713768810;
	bh=BQ5lv0ySOhngt6oiBldECYAUh+70HIqFEVh7ZrhT2SU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Cui0MaRtDe2xqQ3NEwHoiaqNEPh9QZrdEiUYskHiBgjzUxclmHsmCP6ag5nGU84bM
	 3b5x6NxZdfPeMvegaO7mkU3QgMxZobmAm2oln8xkQM/Oy8/+Oucf2IgnmG/TyB/Wn7
	 iQdcRWT2PJLWTmUDU6bWMGk2/fV7G6TSzKe1IoWdNnlo3yMEBweewQVG1KrgHX1Sf7
	 td471aBOw8drLYvbX6PKTOaVitHwsw9ADZoAa5l91FQdSWkWxrU3MP5yynDhnSBkIW
	 O8yLZoEwnTC68ASfkWblx7Spb7MGUF+NSjqs1Yv/Qw45PpGMdE8ky27RWo8/FkcZUT
	 on4t2PTh/wcSQ==
From: Kalle Valo <kvalo@kernel.org>
To: Su Hui <suhui@nfschina.com>
Cc: quic_jjohnson@quicinc.com,  jjohnson@kernel.org,  nathan@kernel.org,
  ndesaulniers@google.com,  morbo@google.com,  justinstitt@google.com,
  c_mkenna@qti.qualcomm.com,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  llvm@lists.linux.dev,  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH wireless v2] wifi: ath10k: Fix an error code problem in
 ath10k_dbg_sta_write_peer_debug_trigger()
References: <20240422034243.938962-1-suhui@nfschina.com>
Date: Mon, 22 Apr 2024 09:53:26 +0300
In-Reply-To: <20240422034243.938962-1-suhui@nfschina.com> (Su Hui's message of
	"Mon, 22 Apr 2024 11:42:44 +0800")
Message-ID: <878r15j3bt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_235335_215873_10DB49A4 
X-CRM114-Status: GOOD (  15.30  )
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

Su Hui <suhui@nfschina.com> writes:

> Clang Static Checker (scan-build) Warning:
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:line 429, column 3
> Value stored to 'ret' is never read.
>
> Return 'ret' rather than 'count' when 'ret' stores an error code.
> By the way, remove some useless code.
>
> Fixes: ee8b08a1be82 ("ath10k: add debugfs support to get per peer tids log via tracing")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2:
>  - remove the initializer change.
>
>  drivers/net/wireless/ath/ath10k/debugfs_sta.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/debugfs_sta.c b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
> index 394bf3c32abf..c1198e9027ae 100644
> --- a/drivers/net/wireless/ath/ath10k/debugfs_sta.c
> +++ b/drivers/net/wireless/ath/ath10k/debugfs_sta.c
> @@ -432,14 +432,12 @@ ath10k_dbg_sta_write_peer_debug_trigger(struct file *file,
>  
>  	ret = ath10k_wmi_peer_set_param(ar, arsta->arvif->vdev_id, sta->addr,
>  					ar->wmi.peer_param->debug, peer_debug_trigger);
> -	if (ret) {
> +	if (ret)
>  		ath10k_warn(ar, "failed to set param to trigger peer tid logs for station ret: %d\n",
>  			    ret);
> -		goto out;
> -	}

Minimal changes with one logical change per patch, please. I'll remove
this part in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

