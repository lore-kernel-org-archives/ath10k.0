Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C952AC4321E
	for <ath10k@archiver.kernel.org>; Fri,  2 Dec 2022 18:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WIdjUPWfPfEAwtuIGlV+qXcUHYxiZlthDUPGyOZp3cw=; b=49SFHjd0PtA3s5
	9TkiYuPoxjgMD5N1OC1FTmj1Nfw2P4kfCc2sOXlVa6Pn4gbtWxZmtRf4FC5+KxpoNEuMWaMKl5CT1
	67mKF+1z36QMm0GlU+Ou2eXtAqaGKXTQ56eCZHeJtbNZEzUfIXZikcqZFItXOUjtuTmjB6YGzsTw7
	YzWCHMXOTNChmv1yVS1Eh9PsZkUtQpAG8/jC/Zaaw4xjjvvkWBeAytD2BHcri+BTHl9JVmNWn6tlW
	mZCY434DeXJmFzKpDmvq/NtFQBul2J9SFulce1TPAIRmloLvxUPXw7wOZgJXfSZ9I5wlDiEB4AMgp
	1YBLppn5ZXVYn0FubKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AiU-000cpV-4W; Fri, 02 Dec 2022 18:24:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1AiR-000co4-0u
	for ath10k@lists.infradead.org; Fri, 02 Dec 2022 18:24:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9B57B8222C
	for <ath10k@lists.infradead.org>; Fri,  2 Dec 2022 18:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0A1C433D6;
	Fri,  2 Dec 2022 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670005487;
	bh=daFI3VrqJ1nxDaMH4ZCDmVBTFhL9mnMuXznIP5kTJ/g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=W2lyL0VGcY4Ji15/vMmd/Y43cIiQn05WSZ7EP3qeqeg2NXexle/dhSlwf6U10JiYJ
	 r54RZlxCKngzGoHJLVAPjNrRzPnd2yydl7azuL3KAJ16k9LnSXIQqLOR2Rz+apsuvy
	 PM/L/IO7zT/iN3RHy/3jYfEbyMTl+8SWNCBOWnao6wnAisy9iW0f6sBfncMRJtVJAI
	 Ya6Uh74NuUxyDKUlhsjTZN9kLblyXyy5cUGueUg0aG76FxiiE7xDsNKrKnNhTX3Vfo
	 KagHHr9enK6XH20wrhkvZIuahD7Yssw3ntlrELZGihYtmDFoheoHMt8tqulWwPxfYO
	 dkMy+BSmHEsjQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: fix QCOM_SMEM dependency
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221202103027.25974-1-kvalo@kernel.org>
References: <20221202103027.25974-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167000548228.19912.958966715275438470.kvalo@kernel.org>
Date: Fri,  2 Dec 2022 18:24:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_102451_242329_378C1E0C 
X-CRM114-Status: UNSURE (   9.89  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Nathan noticed that when HWSPINLOCK is disabled there's a Kconfig warning:
> 
>   WARNING: unmet direct dependencies detected for QCOM_SMEM
>     Depends on [n]: (ARCH_QCOM [=y] || COMPILE_TEST [=n]) && HWSPINLOCK [=n]
>     Selected by [m]:
>     - ATH10K_SNOC [=m] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ATH [=y] && ATH10K [=m] && (ARCH_QCOM [=y] || COMPILE_TEST [=n])
> 
> The problem here is that QCOM_SMEM depends on HWSPINLOCK so we cannot select
> QCOM_SMEM and instead we neeed to use 'depends on'.
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Link: https://lore.kernel.org/all/Y4YsyaIW+CPdHWv3@dev-arch.thelio-3990X/
> Fixes: 4d79f6f34bbb ("wifi: ath10k: Store WLAN firmware version in SMEM image table")
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to wireless-next.git, thanks.

d03407183d97 wifi: ath10k: fix QCOM_SMEM dependency

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221202103027.25974-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
