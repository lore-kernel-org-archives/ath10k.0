Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3362FC433EF
	for <ath10k@archiver.kernel.org>; Fri,  1 Apr 2022 11:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ozfizf28aFMboPwtxDwmfu9cUXg6IkdLmMOkE9BGkpM=; b=mzJC3Ej9CukuZt
	lOvwu6CYfZuoVpFMVbIJjTfJ6u/+ydPgm4SCoFDwmQPGEj4zfjTcGDbr2PW5PcDU2GmAukWxU6IJO
	EIffXHpClKcN1El8k3unvCHbg+j+ZbqAcYKnPpnbSWGNhdlioU+sAhvuKRBSrxWgozGuHFWmq6bDG
	PLZPrvxeBuZqrmMbVQ7/2foJGepPa1GLDprH+gS36lNRPJsLYhOR0natGQ6PhIjqPXZ9GDLr08C2e
	7f0K71wrepBx5yaLqPYfcfbNZSp9flt0QOPfc7EBpzyiDEegmvbZXW4LxKi0JrUHAitdAhGSx5/8h
	FzFubssK4pkyY4hWuntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFkD-005OzT-Il; Fri, 01 Apr 2022 11:47:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFk9-005Oz9-VY
 for ath10k@lists.infradead.org; Fri, 01 Apr 2022 11:47:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C4DDB82480;
 Fri,  1 Apr 2022 11:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9F8C340F2;
 Fri,  1 Apr 2022 11:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648813622;
 bh=/KTUnEim6qiPvokXTY1tZy6chpDJLR1TQ8pWRBWMM9Y=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=IsqvONJGXNjP3lE8l5/PnDNhsrBQbgT6MJg9oKwGlNb1yq+/pg5t7cwXHocpLiiZK
 vB15ehPqG8NFyvhYz8CMLcE5WMLj4ighC0zaUOypTtOPAy5PDdIvzK3jZj5S5/B0dc
 mnhra5MehRryxTGpRdTyRVZVXExr6aaR+TeJGlsawCwHPXxhZ57/uu1mBrhnLQO5gt
 PP8Ovv29f1dTmANg/X/D4IjAxjzLTFHsUzhCFTTlfx4a6425jHGZyvjhjdvRaltsLU
 pYGKYINrUsN9VvGgUdQUBxr+5gdI2kZWLtf75JZKuUh+z72gscHGa5vJ21FB19yKL0
 255YG7CuETq3g==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k: add support for MSDU IDs for USB devices
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220327171340.7893-1-erik.stromdahl@gmail.com>
References: <20220327171340.7893-1-erik.stromdahl@gmail.com>
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 davem@davemloft.net, kuba@kernel.org,
 Erik Stromdahl <erik.stromdahl@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164881361956.6665.6628829771701180891.kvalo@kernel.org>
Date: Fri,  1 Apr 2022 11:47:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_044706_198517_378E8C86 
X-CRM114-Status: UNSURE (   7.65  )
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

Erik Stromdahl <erik.stromdahl@gmail.com> wrote:

> commit 93bbdec6683e1c8ba2cc4e6 ("ath10k: htt: support MSDU ids with
> SDIO") introduced MSDU ID allocation in the htt TX path for high latency
> devices. This feature needs to be enabled for USB as well in order to
> have a functional TX path.
> 
> Tested-on: QCA9377 hw1.0 USB 1.0.0.299
> 
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

2c977be2cc5c ath10k: add support for MSDU IDs for USB devices
d930e2560ebe ath10k: enable napi on RX path for usb

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220327171340.7893-1-erik.stromdahl@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
