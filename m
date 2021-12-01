Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A5C433F5
	for <ath10k@archiver.kernel.org>; Wed,  1 Dec 2021 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OA0WezHhb12pcJRAUsewtYC7Lnz06JTEtImlg1lwLOQ=; b=HDhgZv3FTAxc6J
	erPiyA8jwZ7nMKnGSGCwJ3Hp1znXPlR2JK9LbSF0gkYaLWgJMTnRhnFmZCMPWJKU+3XvZ3hMlcu9R
	1rLJd7TWb4jCgf9i54miNnuYZvA4/wtunEWgYsATNT4QMyuJ856tqy9DQkI97lCnonbvpvxkLG35p
	Hjx72xa68xAbLGRxSr9GdHOqBgRpSPEXdkcGHHalOsApT5mJKAnlAGwEBF95qWjsCkuZGIeozWo6n
	tEtL+H8kZSS2iy82RjuXfsTbr9BrNFEtbQ7xSaJjwOivIycoRMOYv/XCQvvpd9dVOZ1KM3p+H04ew
	eECUu1LD0BbeGDLGg7Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msQZu-0091HS-Hy; Wed, 01 Dec 2021 14:27:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msQZq-0091Gl-Q7
 for ath10k@lists.infradead.org; Wed, 01 Dec 2021 14:27:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 29D4ACE1DBB;
 Wed,  1 Dec 2021 14:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6095AC53FAD;
 Wed,  1 Dec 2021 14:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638368835;
 bh=cABx7SjPkF7eMidshLb5+U7AF+87bMcGUj3Fg4iQhYA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=igHWq+zfP6VtYDxqML3FvR+5Z14u1Mce7zWLeCHoOYz5OdbxZPRkzJ+tpM6km3u+G
 aF8/eKwr4gvx4P+hVRVzZBLTuQnfNW+D/Kb8yXEzBftY1qcW3krXUpMUlbrSxJ7cfr
 S51OUhoF4WR/Xx5c/gx2DlkgjgWOwGPH2QuVdXcjEsZlYbF9B+VfBQeDFDwMgrK0TD
 Sjmt3fMpmOcor8JExeYlcMfhliuBOHKlIJHTbt+23KNe1gUxwAxVUfVpcpKkEN0+AB
 mVhj91WETrU4Uqu29YdbFsRBTKg2EWZsPmYvsK18RHnVEi5B0QszimEj5ustSFiYqm
 gkmpWOOqrAL3Q==
From: Kalle Valo <kvalo@kernel.org>
To: Fabio Estevam <festevam@denx.de>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org
Subject: Re: [PATCH v3] ath10k: Fix the MTU size on QCA9377 SDIO
References: <20211124131047.713756-1-festevam@denx.de>
Date: Wed, 01 Dec 2021 16:27:07 +0200
In-Reply-To: <20211124131047.713756-1-festevam@denx.de> (Fabio Estevam's
 message of "Wed, 24 Nov 2021 10:10:47 -0300")
Message-ID: <87sfvcl7t0.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_062719_221071_FCAEBF22 
X-CRM114-Status: GOOD (  27.15  )
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

Fabio Estevam <festevam@denx.de> writes:

> On an imx6dl-pico-pi board with a QCA9377 SDIO chip, simply trying to
> connect via ssh to another machine causes:
>
> [   55.824159] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.832169] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.838529] ath10k_sdio mmc1:0001:1: failed to push frame: -12
> [   55.905863] ath10k_sdio mmc1:0001:1: failed to transmit packet, dropping: -12
> [   55.913650] ath10k_sdio mmc1:0001:1: failed to submit frame: -12
> [   55.919887] ath10k_sdio mmc1:0001:1: failed to push frame: -12
>
> , leading to an ssh connection failure.
>
> One user inspected the size of frames on Wireshark and reported
> the followig:
>
> "I was able to narrow the issue down to the mtu. If I set the mtu for
> the wlan0 device to 1486 instead of 1500, the issue does not happen.
>
> The size of frames that I see on Wireshark is exactly 1500 after
> setting it to 1486."
>
> Clearing the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE avoids the problem and
> the ssh command works successfully after that.
>
> Introduce a 'credit_size_workaround' field to ath10k_hw_params for
> the QCA9377 SDIO, so that the HI_ACS_FLAGS_ALT_DATA_CREDIT_SIZE
> is not set in this case.
>
> Tested with QCA9377 SDIO with firmware WLAN.TF.1.1.1-00061-QCATFSWPZ-1.
>
> Fixes: 2f918ea98606 ("ath10k: enable alt data of TX path for sdio")
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v2:
> - Set the credit_size_workaround field as true for QCA9377 SDIO.
>
>  drivers/net/wireless/ath/ath10k/core.c | 4 +++-
>  drivers/net/wireless/ath/ath10k/hw.h   | 3 +++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 72a366aa9f60..8a325ae97b0e 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -571,6 +571,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		.ast_skid_limit = 0x10,
>  		.num_wds_entries = 0x20,
>  		.uart_pin_workaround = true,
> +		.credit_size_workaround = true,

I prefer to have also the false cases for every hardware so in the
pending branch I added those:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=afbf52bffb36bc25e7a1e81e1f975bb75696d3c8

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
