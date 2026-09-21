Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 300FCC982EE
	for <ath10k@archiver.kernel.org>; Mon, 21 Sep 2026 19:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlEfKXCg5rHiDJTVNsbZVHr7bZvcSttFpXBa5Vfys1Y=; b=u88UcpXTb+vy9EhkXIGh7KlczS
	/S4z7WaZtmEx+ILljIv0aqE9kIoFCwVhoSdFpfVhSMDXHLR1uxrlMd5J3D2BiOhRRIVO339cDji3o
	hLx4CSKnigFNjhuxBScA4aDiUwabwpoHCvXnBab6gM6Q7wOPIAjY8B47dSYlzfMrypoWuFFc/09O7
	erq+rdDpw2ZrbAGUMNklp9VP98tIAZH/lTKXux5FsPnx/j9W/4DzNl69mYtjXC5XWjdB+Gl25IZOC
	txlTQH+eKxNMYqQ/0JJp6PUbRCtn3WPfum7dT1k6SgEcqhG8qjeKWlYITTqkNDSyfbij/bYw9OvV6
	lwuME8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jrk-00000003FX5-1c4w;
	Mon, 21 Sep 2026 19:39:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jri-00000003FWO-1VNg
	for ath10k@lists.infradead.org;
	Mon, 21 Sep 2026 19:39:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 705BE60142
	for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A2591F00893
	for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790019589;
	bh=TlEfKXCg5rHiDJTVNsbZVHr7bZvcSttFpXBa5Vfys1Y=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc;
	b=fXCi+50g/p6esnKbXrT5l4yOjkyme47lIAOq0dB5cRkLF2KIs6GzFdtPXYLVK8yGT
	 hHCJQER3efnQMbY8TgYuYm9QGDH/WzeDtOnrG+wGe9AHVpPxCtVAk3ngSIV8dz9jrp
	 bQ9To2081tZyhZ5jugatQkysS+2w37QcjrWvu4JIJp63BbTlPGKyxwavLnTdbtVnaW
	 Fobv3CAi54ZHj1NKCFrLGnndnW+Mr30RevnGWUeNG7jeflM7bdpHwAyTx/NwLQTtYF
	 Lcr+p8PmwO+jDPFrJkDAY6Jmds34hq1xguy4oOr4f1u5In14Njq6J8i+MjJNzCNGgf
	 CVDfgj4SLPxxw==
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85e68bdbcc1so24702017b3.2
        for <ath10k@lists.infradead.org>; Mon, 21 Sep 2026 12:39:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByW05moU5W2v5XxkafSHXU7/R/kTGeXtx9i5OQTT8fpPeN7Gi3jODhzooNtrQoJZnoM0M6SkTc=@lists.infradead.org
X-Gm-Message-State: AFuF++n7ykiO0hlXfGGt3LUl8drGuf/0zW9Y+cFICs6QssIZHcT83Q5G
	RTbq/xSAT9KF0WDE80InnfNaq0PecoJNDbtLh/NENLhW33trpHWRZR/TqSBPimlktTDRBzEqd48
	YqFkjV1FUXhywIVtTZhTFgTL66V9HsoU=
X-Received: by 2002:a05:690e:1408:b0:671:70d2:5290 with SMTP id
 956f58d0204a3-6718227eb94mr3905390d50.83.1790019588512; Mon, 21 Sep 2026
 12:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
In-Reply-To: <3c89c245-3a4f-46f0-93eb-a138f10a1ef2@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 21 Sep 2026 15:39:37 -0400
X-Gmail-Original-Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
X-Gm-Features: AcwNN1UJvQ-v6KBYcktupCrDFyB4cuYBhh0oniY8Yx8HTq1Dje0_HKhmeUNPLNQ
Message-ID: <CA+5PVA4BCQm8yVav7Tcxjyo61jyHpk+W4QbsR2JB+GZAxGpzhQ@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260921
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1270

josh

On Mon, Sep 21, 2026 at 2:58=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
>
> For ath10k and ath11k there are no changes.
>
> For ath12k there are two board updates:
> QCC2072 hw1.0: Add initial support for CQ2390 targeted for IOT platforms
> WCN7850 hw2.0: Add support for board-ids 0x201 & 0x202
>
> Please let me know if there are any problems.
>
> Thanks,
> /jeff
>
> ----------------------------------------------------------------
>
> The following changes since commit 2b8daaf611fbade74f26a5b58ec1defe6a02f5=
e0:
>
>   Merge branch 'qcom-fw-version-diff' into 'main' (2026-09-19 17:16:57 +0=
000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20260921
>
> for you to fetch changes up to e88807ffbf0fce50130cf1f7475acfb8ba365c12:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2026-09-21 11:50:36 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (2):
>       ath12k: QCC2072 hw1.0: update board-2.bin
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  ath12k/QCC2072/hw1.0/board-2.bin | Bin 401232 -> 526720 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin | Bin 2253964 -> 2431852 bytes
>  2 files changed, 0 insertions(+), 0 deletions(-)

