Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 873F7C4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKDsaCIgapS49fEJbsVraRt10SLGtde9DGR0TQvdw8A=; b=EDL6uNSP6a2IPuTOX8IMVBRYer
	DJj0KfHo+S1yudH1nCt9zvsSMbrfCF4pj21jvA3WrALI/oyKkXrezZD+Nnspfr871DGzGft3XZXy6
	zAOZOkW0lRcsvV4vTHUsLGPECPZNDtcLIpFbH+LUe3QvY4fhFP10SticRl14I+qLxJkxw8QDfb5IG
	fFpZnyoJv5Tu0NkaNrj+7fkcNHEBHsexhUPUi0FoQozOjQiZB/HFTz6hLGJkxEBYcTgUYnWXKa2EW
	kst2k91jS5XAZGuA9oKfZ6USgMQLSmI6qRQ6T3j2InlfbVqX7in7vgHPkJVyBdgeekr0HRrUq4Vlg
	NUi6z4Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzwF7-00000007olO-0pYD;
	Thu, 25 Apr 2024 10:22:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzwF2-00000007okY-3FW2
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 10:22:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 31544CE12B4;
	Thu, 25 Apr 2024 10:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE42AC113CC;
	Thu, 25 Apr 2024 10:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714040529;
	bh=9yh3q4Qez3ty/OthiP7tKVHvYd10TMNRzON0T29mCrw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lpGd1qFid9sGnxfnbafmT3LpOEXAu2O25RsaM55QPErqrJYOLGRtgYhCD0OfGBKdK
	 ZdEck5FmC+1tKnYkdKA62cIbbrhEyHGh9dMFyvtZbMK7/4BoYCpp8tZPtZd03/m8SA
	 7Wy42ewVDDGGxOcj07gd68AUAd5SL3U7yf3qVECtWG8PZ1pRtlmk9hPrLXd4jSO/ow
	 5On0I7Mvja2EonhkJ0LhfZ7lDc0uexrkuONhQwZhNid3TBAypMrP3JeTE9gMVxI3XP
	 65cQ67ZcVcDxFnbOLrW0aKkSKZtyI88lkkkogMNjRj4sJ82wcO+yZpmtupn02kPYrF
	 59NQtQFmg9tuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/3] wifi: ath10k: populate board data for WCN3990
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240130-wcn3990-board-fw-v1-1-738f7c19a8c8@linaro.org>
References: <20240130-wcn3990-board-fw-v1-1-738f7c19a8c8@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Yongqin Liu <yongqin.liu@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171404052589.2914755.17375571502543986755.kvalo@kernel.org>
Date: Thu, 25 Apr 2024 10:22:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_032213_028408_D055F140 
X-CRM114-Status: UNSURE (   5.24  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

> Specify board data size (and board.bin filename) for the WCN3990
> platform.
> 
> Reported-by: Yongqin Liu <yongqin.liu@linaro.org>
> Fixes: 03a72288c546 ("ath10k: wmi: add hw params entry for wcn3990")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

f1f1b5b055c9 wifi: ath10k: populate board data for WCN3990
de0ff4613363 wifi: ath10k: drop chip-specific board data file name
3ebae49bbc12 wifi: ath10k: drop fw.eboard file name

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240130-wcn3990-board-fw-v1-1-738f7c19a8c8@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


