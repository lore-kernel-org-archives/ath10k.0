Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED22EC67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 13:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6Z6e69b0NftecIGfibAAiV+Jh9yv73X56xcQbvDqO4=; b=l5Tazb0B6lqY/6TFM+VIkfqFF3
	/lVJr5CV9E81pj+F06E2MUZ6hR+HV8s2u3WhYZRwMDHRFRm8qEkh49JQcH0vf078n2hFx7fKbNSCN
	KQwzZf1uWpErwECdoxk1efH9s1k6q51S4sBk2STHllksKMK3QZbirdPW8Bun5Qxv8pRD1oCx70a68
	BqnIXT3DKmbS7AAVIm+u6/v5OYN09HueYwq4NM0iIYOv/hWfNkaE0+AueOxQM7vTlTlgkzuaAvJvo
	xTaeQWGucks2iIwkYqbnmhgAmudSf/zgCliYAkvRBri7qZmkH+b3Ta8YgZeoLUhWx5NuV3R9qWvjO
	0BnCgypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjMR-000000079zl-1seq;
	Fri, 05 Apr 2024 13:12:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjMO-000000079yl-0ZPq
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 13:12:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AB6B5CE375E;
	Fri,  5 Apr 2024 13:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D0C7C433F1;
	Fri,  5 Apr 2024 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712322715;
	bh=TnXMU4f/t+D3MLK1a/iIO51tx3i8Q3ak6lF0vvJQgks=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nYAiBhM3aAgL+JSn3kHh7cAYfNy/jRvew0og/9mA0h2j87HIVX0bSu+rRs9lj5Ueu
	 GGvoEfyxeQD5+jCSzH5q/IdQ/bsxznZQDh3q5GnGuatcE4j4J5eO9CooqMMHQ8ONn8
	 zb8bo1sQ85MWINbrK70jwkcAd1Pgs+prOGfhR+vum6gKfYwu3ZleIVrAoRtuH9H3+7
	 mJh5y+UHHPxjVlp4NM6Yn8Mir8Kpq8zbYa4+di0fi+njlE+EnSZN5AslWt1hpFD37L
	 TivYdhLtEAWQF9okdixFPtK9BBGIG4scNxzVIEK3INfcH0ZenXJqkStUCUBfTbKnBW
	 sWjuxZTj6OLvQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-arm-msm@vger.kernel.org,  Yongqin
 Liu <yongqin.liu@linaro.org>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990
 devices
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
	<CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com>
	<875xww3tv8.fsf@kernel.org>
	<CAA8EJprZTdDZZ=NSzn9xEBGB0kp0s1HHLffF0X7YSLyVxy7ZSw@mail.gmail.com>
Date: Fri, 05 Apr 2024 16:11:52 +0300
In-Reply-To: <CAA8EJprZTdDZZ=NSzn9xEBGB0kp0s1HHLffF0X7YSLyVxy7ZSw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 5 Apr 2024 16:06:48 +0300")
Message-ID: <877chc2btz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_061200_619167_5CF6AF22 
X-CRM114-Status: GOOD (  17.58  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> On Fri, 5 Apr 2024 at 14:57, Kalle Valo <kvalo@kernel.org> wrote:
>
>>
>> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>>
>> > On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
>> > <dmitry.baryshkov@linaro.org> wrote:
>> >
>> >>
>> >> The ath10k driver fails to properly handle fallback from board-2.bin to
>> >> board.bin for WCN3990 cards. This happens because the
>> >> ath10k_hw_params_list doesn't include .fw.board* parameters for the
>> >> WCN3990 platform.
>> >>
>> >> Add board data configuration for WCN3990. While we are at it, merge
>> >> common pieces of BDF support: drop .board and .eboard names from struct
>> >> ath10k_hw_params_fw and use the common name instead.
>> >>
>> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> >> ---
>> >> Dmitry Baryshkov (3):
>> >>       wifi: ath10k: populate board data for WCN3990
>> >>       wifi: ath10k: drop chip-specific board data file name
>> >>       wifi: ath10k: drop fw.eboard file name
>> >>
>> >>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
>> >>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
>> >>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
>> >>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
>> >>  4 files changed, 14 insertions(+), 45 deletions(-)
>> >> ---
>> >> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
>> >> change-id: 20240129-wcn3990-board-fw-a2d97507a712
>> >
>> > Kalle, Jeff, is there anything pending on me on this series?
>>
>> This is in my queue (Deferred state):
>>
>> https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date
>>
>> Unfortunately there is not really much time for ath10k nowadays so there
>> will be delays.
>
> No problems, each maintainer treats PW states slightly differently, so
> I was trying to understand if there is anything left on my side.

That's true. I have tried to document how we in wireless use patchwork here:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#checking_state_of_patches_from_patchwork

Though I guess I'm the only one using Deferred state.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

