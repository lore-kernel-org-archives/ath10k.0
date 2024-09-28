Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FD7CF6495
	for <ath10k@archiver.kernel.org>; Sat, 28 Sep 2024 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S999j/GuvTcM2yJ9dhz3AX/2l+wRFZYBJQWxrk1DGg=; b=xtoiENr4jNNmJZCtbdKkrIo/rj
	uD8wZRCv4WmDNNlqkARaAEfeGvqofgiWhwUAMQo/16fxdYzNtaafkLsMtrUSdapHovu/aa8dlkL6N
	dkCLEI9MLXuTJARiCRKTMwbeIdidlIc6bqS1AtjBUbe2ExImLNRc8xTce0Lfz01WSeGWPJm9tT4YZ
	PLkVeiwQAZzsJYmcUD8X4256G76XgdlFhGvxQaJj76yZwIebzeLl5rfqUV9NiI81PPhaosWwHS93B
	Xl+FfnYlmyLhM3CoQIZKBzvjD3/WcjsuQHHludxgzZxj9vxK5YvvNih4XDTOx4WGrWq2OxLTlgKYj
	2A+AbkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTU8-0000000CrOz-1Da4;
	Sat, 28 Sep 2024 09:11:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTU6-0000000CrNl-0Ftu
	for ath10k@lists.infradead.org;
	Sat, 28 Sep 2024 09:11:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CDAA5C5423;
	Sat, 28 Sep 2024 09:11:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613A3C4CECF;
	Sat, 28 Sep 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514684;
	bh=OJ3gO0JwDTJwnTctZQnELZ3cghcWHB1pcbja2AailI8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=n2xtlhk6BD4fbK6P276W0InOdSg4UVsuylMASUwP8JWAagf7bkTCDzgEDeGpRKkD5
	 ail25wNetiu0z2oiFGGcKCMjxvGrjRnJcqwqnMHf+dpYlUwm4IUqyGH+9TIcU/c+2f
	 tnrbCX0PZ1XtggcrUlFJi4pcIvLJY2wrPBEpQ848xiym9lyM3mvceWup110QcyroB/
	 msesWHB21ko15cVFSvkF5YdSXCGxx/mFK69dEMmJRU0bw6Qrgbm9q4smYzL86GmTCf
	 MIZdil8BV/wMAPAIxRkg9jTdSil8SSuPAu1hMAHGGxlsjs+vFrY5zw5szhx/luTwbJ
	 4fNeL9h/EUKjA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath10k: fix invalid VHT parameters in
 supported_vht_mcs_rate_nss1
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240711020344.98040-2-quic_bqiang@quicinc.com>
References: <20240711020344.98040-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751468142.2249584.250066721438756221.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:11:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021126_175770_A3057CF8 
X-CRM114-Status: UNSURE (   8.51  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> In supported_vht_mcs_rate_nss1, the rate for MCS9 & VHT20 is defined as
> {780,  867}, this does not align with firmware's definition and therefore
> fails the verification in ath10k_mac_get_rate_flags_vht():
> 
>         invalid vht params rate 960 100kbps nss 1 mcs 9
> 
> Change it to {865,  960} to align with firmware, so this issue could be
> fixed.
> 
> Since ath10k_hw_params::supports_peer_stats_info is enabled only for
> QCA6174, this change does not affect other chips.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
> 
> Fixes: 3344b99d69ab ("ath10k: add bitrate parse for peer stats info")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/lkml/fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

d50886b27850 wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss1
52db16ec5bae wifi: ath10k: fix invalid VHT parameters in supported_vht_mcs_rate_nss2

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240711020344.98040-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


