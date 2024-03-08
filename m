Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B621DC5475B
	for <ath10k@archiver.kernel.org>; Fri,  8 Mar 2024 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BySKygHjkpO4pgRVR1fU42e8wVrU3nPHIKrOcc5drfc=; b=C8VJ1d5mZoHzVyorphvZF9vcDH
	FzdB3HlHWnmaidx68u7ZlPM0M/9w1SYOH6FBVuBBXw4+NyHWixbvOl6jBIqQ7djk1znfuwQ6u+wVu
	yKgxIr2DQPvFy9cysT1cvfO2cRuFDeCYENh1yVpy8SxmbXometKdaEfZrhUXKEgDYGgXEO3oBpCmr
	GDqH2SJ4t4giLpUAocb5oVe8KWGjNjGSvSfLzgJo5PoY3UvLDEmeTNLBh5icz/gwueutSkhXGYXj7
	rm07frodepWIJFgA+8WyCV+W03S5Nfy0JlSjzk1fsDlFPYiSHzQZqIzJvsh4KJsfKyAO9hHj4QvNb
	q/70fAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riboF-00000009kqJ-1iU9;
	Fri, 08 Mar 2024 15:06:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riboC-00000009kox-13Ip
	for ath10k@lists.infradead.org;
	Fri, 08 Mar 2024 15:06:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 90E296066F;
	Fri,  8 Mar 2024 15:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57542C43394;
	Fri,  8 Mar 2024 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709910411;
	bh=7hPKA+WyRR2wPp58WUztimwXnR4OlEnInvhO2YFNqHI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BDkSlMMe5tR2s4HlKT2gsr6FmIHpZSmGaD/YU0+SbP3XMALb0WdHeHYxZ64/Komz+
	 lLrhYRPxteYyuLWmNQzTvguxplAbbtSOsC58nlrwrZJL3vfmEjrRD8QeH9PXCioL0o
	 s+T1pf+33BFQG8PVRAg5StNZ9fYttLWDBtKA5mDMfjlXBwesoLLb8ARBJyLZ97/Zxw
	 ilX0thJlWazX2K/J2zmSXih3z3mMwX0/VgsexgpIdesSsCT/zKQwcmA+S5n4TF8iJ/
	 9mLWzYpVZ54CH3tLbjpdcPJI+D2HqOY+iOzMWeLZ4OVG34uC8yfg5JQrAjojZAs+3R
	 AczjgJ2TPumgg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath10k: poll service ready message before
 failing
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240227030409.89702-1-quic_bqiang@quicinc.com>
References: <20240227030409.89702-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170991040833.1311983.10804124328210267048.kvalo@kernel.org>
Date: Fri,  8 Mar 2024 15:06:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_070652_371102_C3AACAD0 
X-CRM114-Status: UNSURE (   7.37  )
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

> Currently host relies on CE interrupts to get notified that
> the service ready message is ready. This results in timeout
> issue if the interrupt is not fired, due to some unknown
> reasons. See below logs:
> 
> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not received
> ...
> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
> 
> And finally it causes WLAN interface bring up failure.
> 
> Change to give it one more chance here by polling CE rings,
> before failing directly.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> 
> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices")
> Reported-by: James Prestwood <prestwoj@gmail.com>
> Tested-By: James Prestwood <prestwoj@gmail.com> # on QCA6174 hw3.2
> Link: https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e57b7d62a1b2 wifi: ath10k: poll service ready message before failing

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240227030409.89702-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


