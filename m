Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51756C021AA
	for <ath10k@archiver.kernel.org>; Wed, 19 Feb 2025 19:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHgCKGhRvgr46kIuBqHOa57kL1o3vnrcWGzCekOjTRM=; b=ZRC8NsJkifrNFlXSTqVDuFGvIY
	dBRqHgqn+J2f1/7zs36JG8VC5Jj7D/DSpqcA83Sg5rUeSUvi8Ii1ApyV2x1STKM7DUydo3+9IDZ8O
	cdkZVQMJyLqJsat2s/yx+i836dIwEIHgUFN9uAUmf45Jq/ffedhon+6nQNGYT/hEHYQaiw7NXqfnA
	jYGQqTZ37/S9LXCd/gINHf//VIeJz8aYOcFjHETA4OsaXKAC7QuUGEQ0mGSVwfcibRBm5QVerLT7K
	Z4NiyR8zL46JQJDv3hNgg5CvC1it01jSmP4ajW9BIudDTkJGRHrHKXCwMnVVZpJnfrPa2Z5oRt3oF
	x1T3xQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpj6-0000000EcZH-3pgS;
	Wed, 19 Feb 2025 19:27:20 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpbR-0000000EaDq-01QH
	for ath10k@lists.infradead.org;
	Wed, 19 Feb 2025 19:19:26 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e6827984b2so1010256d6.1
        for <ath10k@lists.infradead.org>; Wed, 19 Feb 2025 11:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739992763; x=1740597563; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dHgCKGhRvgr46kIuBqHOa57kL1o3vnrcWGzCekOjTRM=;
        b=E6edEDIM9/Eeunt/7Va4cdr1yzViU1vGPgWDho/AcSU4bafpF3gQuY8y7W9w/x+yUy
         eP5cjY0u1DKhUxIVmlHAnxAHBnm6xr1zUnlSCSOf/a2xemk2qYG7cfp3zJjzDwMBCi79
         IL4nBAV1uCChFXZ9K2nCblFR9Y5MH/Sbd4yCzy2hOi6vpnIY1HLVk/Tfu4eQHLtRScOT
         AKJMVHjneT0oy9Kr1w3G3vYQGFa8TUrkoNEi6U+kVedsmng/Vz5PX/fFHa/jCgYYpblL
         w3PfRwL7R1m5RRLYHvKr53oQcG0D0aogMqsaXVcYTCKERYHU6egsNJUvR608hr2T38qg
         YgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739992763; x=1740597563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dHgCKGhRvgr46kIuBqHOa57kL1o3vnrcWGzCekOjTRM=;
        b=VcW9pjuEjRJDtTdlrlD+lrNDoW4KiozEd86WaxcG4L7jeLgyUR3xpz1hefNEl/SlIv
         r8bwTS/I4xv1G+BE17aB0XAF8HohRsx9CVNPqqzZhoS/FW2VX5imgE8A++9BV1RTx/Tw
         4wQpZi1vFrpROM1YgbbJOytndUDPOT1obyCuUxDLnSCQ5tMIjj31D879d4qJylfO2QdS
         a3pGOtIpGFKytS9/szCqdlD9bBUwg3u/dU3Pq/HZhSWTRTe6hrzKzXgylQbVFrSlLEJ0
         TzPLDfupcFVRZssBK6bfyaa1I0lBLXCxnMGjO9RFHR0XpnZ+FeU3BDV27U/kNGHAoQL0
         Phzw==
X-Forwarded-Encrypted: i=1; AJvYcCVtTlGB2Sh9Rh+HiXbZYvOG97nV9JBzDApj9XoA3hJSXmzyYUF9LKrx5T1z0c3tMOXEl0Q7O4A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqYeJEUzFYbokxSks7KbQouJo1OknNi1WAUH/yNFFAufCXyT1R
	xUOuam9Y6biI09MzG7SaXzfSF8Z3D3ocOeHaFjeCJJw6KEAYiUCazrqyzA==
X-Gm-Gg: ASbGncswXwEJu5e/ty8Y/T1xOskj8O1OyDXk4NLC7/APz/3yaYvMKk/FOF+faYX2ba2
	gIHk2sWGWwidAtjDAUQ14fpsDmz3zbHCReCcXPhvWxkJPJM1r/YB04zr2lYyBBMCInkZny78s48
	vpR5Zg64BMaFcR/D8nw0AoAU2bCPxTYH5TT6mLbjrVVELlsRRkJkkRWv/lk1UMmbzfnrgY7AVxf
	C/vUgjSF4ZYmuTGEm+nVZsqFoVhpmQh+RnPfAtDsXUjkd5SUWyGqPYgfBJiW8qHurOB612SZk5x
	D+tpAPF7J9hiEs957jo=
X-Google-Smtp-Source: AGHT+IE9Mg8QbzyhYEjAJEprcufd27B1cDpoyHYYGgqxwP22pmQsQ/qHFCOORKofk2sd369NYIUDAQ==
X-Received: by 2002:a05:6214:21cb:b0:6e4:6ff6:bac2 with SMTP id 6a1803df08f44-6e66ce2c480mr232972566d6.40.1739992763178;
        Wed, 19 Feb 2025 11:19:23 -0800 (PST)
Received: from [10.100.121.195] ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e65d7848ebsm78136626d6.32.2025.02.19.11.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 11:19:22 -0800 (PST)
Message-ID: <548270b0-8267-4a94-85ab-597ade0f5082@gmail.com>
Date: Wed, 19 Feb 2025 11:19:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] Convert mac80211 to TXQs only
To: Alexander Wetzel <Alexander@wetzel-home.de>,
 linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>, ath10k@lists.infradead.org,
 Remi Pommarel <repk@triplefau.lt>
References: <20250217081721.45110-1-Alexander@wetzel-home.de>
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
In-Reply-To: <20250217081721.45110-1-Alexander@wetzel-home.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_111925_051328_0B0CA329 
X-CRM114-Status: GOOD (  29.45  )
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

Hi Alexander,

On 2/17/25 12:17 AM, Alexander Wetzel wrote:
> This series switches all TX handling in mac80211 over to TXQs.
> TXQs can take over buffering in many - potentially even all - cases
> where we use separate solutions so far.
> This reduces the complexity of the TX path and making it simpler to use
> TX in mac8021.
>
> These patches continue the work to get rid of the legacy TX path we
> started drivers with
> https://lore.kernel.org/r/20221009163040.25637-1-alexander@wetzel-home.de
>
> and was inspired by this old discussion on the wireless mailing list:
> https://lore.kernel.org/r/1507217947.2387.60.camel@sipsolutions.net/
>
> Changes compared to RFC and v1 are documented in the individual patches,
> where applicable.
>
> A quick overview of the patches in the series:
>    wifi: mac80211: move rate control setup
> 	Broken off from "Add new TX queues to replace legacy TX" as
> 	requested. Moves some exiting code around.
>
>    wifi: mac80211: Always provide the MMPDU TXQ
> 	When only using TXQs for TX we akways need this.
> 	Creates and uses MMPDU TXQs even for drivers not supporting
> 	them.
>
>    wifi: mac80211: Convert vif->txq to an array
> 	We need some more TXQs for the patch below. Create them.
>
>    wifi: mac80211: Add new TX queues to replace legacy TX
> 	This starts the core of the move to TXQs.
> 	Creats all the missing TXQs and updates the support function for
> 	them. It also directly switches traffic to them, when possible.
> 	(Only offchannel is sticking to legacy TX after that.)
>
>    wifi: mac80211: Stop using legacy TX path
> 	Drop the legacy TX functions and move offchannel TX to the new
> 	alternate TXQ path named TXQ_NOQUEUE (so far).
>          With that mac80211 has two TX paths both using TXQ:
>           - The existing one, which uses the TXQ for queuing and
>           - TXQ_NOQUEUE. Which just puts frames into a TXQ and
>             immediately sends out the frame by also calling drv_tx() for
>             it. There never can be more than one frame in any of these
>             TXQs. They never see a wake_tx_queue call by the driver or
>             mac80211.
>
>    wifi: mac80211: Call ieee80211_tx_h_select_key only once
> 	A optimization which could be without the patches, too. Would
> 	just be done differently. (Not required)
>
>    wifi: mac80211: Rename IEEE80211_TX_INTFL_OFFCHAN_TX_OK
> 	Rename the flag used to select the NOQUEU TX path to make its
> 	use more obvious.
>
>    wifi: mac80211: Simplify AMPDU handling
> 	Uses TXQs to buffer frames when AMPDU is started/stopped.
>
>    wifi: mac80211: Migrate TX to kthread
> 	Moves all TX operation except TXQ_NOQUEUE to a new kthread.
>          This hooks into the existing txq scheduling and uses
> 	local->active_txqs to determine which TXQs need to run.
>
>    wifi: mac80211: Cleanup *ieee80211_wake_txq* naming
> 	Rename a few functions.
>
>   drivers/net/wireless/ath/ath10k/mac.c         |   8 +-
>   drivers/net/wireless/ath/ath9k/ath9k.h        |   2 +-
>   .../net/wireless/intel/iwlwifi/mvm/mac80211.c |   6 +-
>   .../net/wireless/mediatek/mt76/mt7603/main.c  |   3 +-
>   .../net/wireless/mediatek/mt76/mt7615/main.c  |   5 +-
>   .../net/wireless/mediatek/mt76/mt76x02_util.c |   3 +-
>   .../net/wireless/mediatek/mt76/mt7915/main.c  |   6 +-
>   .../net/wireless/mediatek/mt76/mt7921/main.c  |   5 +-
>   .../net/wireless/mediatek/mt76/mt7925/main.c  |   5 +-
>   .../net/wireless/mediatek/mt76/mt7996/main.c  |   5 +-
>   drivers/net/wireless/realtek/rtw88/mac80211.c |   4 +-
>   drivers/net/wireless/realtek/rtw88/main.c     |   2 +-
>   drivers/net/wireless/realtek/rtw89/mac80211.c |   2 +-
>   include/net/mac80211.h                        |  60 +-
>   net/mac80211/agg-tx.c                         | 129 +---
>   net/mac80211/cfg.c                            |   8 +-
>   net/mac80211/debugfs_netdev.c                 |  46 +-
>   net/mac80211/debugfs_sta.c                    |   2 -
>   net/mac80211/driver-ops.h                     |  28 +-
>   net/mac80211/ieee80211_i.h                    |  32 +-
>   net/mac80211/iface.c                          | 144 ++--
>   net/mac80211/main.c                           |   9 +-
>   net/mac80211/mesh.c                           |  13 +-
>   net/mac80211/mlme.c                           |   2 +-
>   net/mac80211/offchannel.c                     |   2 +-
>   net/mac80211/rx.c                             |  11 +-
>   net/mac80211/scan.c                           |   2 +-
>   net/mac80211/sta_info.c                       |   6 +-
>   net/mac80211/sta_info.h                       |  30 +-
>   net/mac80211/tx.c                             | 616 ++++--------------
>   net/mac80211/util.c                           | 162 +++--
>   31 files changed, 534 insertions(+), 824 deletions(-)
>
Trying to get some clarity if this might fix a regression [1] with 
ath10k where upon roaming the TX queue hangs on flush for ~4-10 seconds. 
I was hopeful for another set [2] but it looks like this only effected 
AP mode and with that applied I still notice the behavior.

In the worse case we see two failures, which add up to about 10 seconds 
of delays, more often its just the single "failed to flush transmit queue"

Feb 19 14:15:59 kernel: ath10k_pci 0000:02:00.0: failed to flush sta txq 
(sta 6a:3a:0e:22:45:08 skip 0 ar-state 1): 0
Feb 19 14:16:04 kernel: ath10k_pci 0000:02:00.0: failed to flush 
transmit queue (skip 0 ar-state 1): 0

Crossing my fingers this set will have some positive effect here

[1] 
https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
[2] 
https://lore.kernel.org/linux-wireless/cover.1732293922.git.repk@triplefau.lt/

Thanks,

James


