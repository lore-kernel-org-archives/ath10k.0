Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F61DC67861
	for <ath10k@archiver.kernel.org>; Fri,  5 Apr 2024 13:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iU1YdowZKR4NxwS1m2fNh/bSZUDHJtarrpZbW985aMo=; b=T/JEZZiTlHCftlhNbQ36cqEIIZ
	ecWDdes4pIWn4vaQVNWXAwt1+83QDP5SSaHh+1z8NDczbIfhBfTTaSeY8CAoKtzo/vDCcD2e8BwRq
	YJZWjefYxErvqrFmIA/8bfpMftefma+Q2ViZTA0sWtk1Gz4sIHup+7OFsRN1eZshT7sr9HT/LGBq2
	nPKSVhq/bwydysTnoDDLgEpiP0UlqdFu0Kb9CzOLzDu6q9B6VrWFQ00KNvZPoD0F+AofIhw0XsgDn
	KXOzqnqUxqvneefwdY/GPs+mrHbRTHE88VzCSlbaZaeCKxNq1Yq+4F4YzUTu6BjQZAHfq6to1Ex8T
	LDXfjnQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjHc-000000078QI-38n9;
	Fri, 05 Apr 2024 13:07:04 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsjHa-000000078Or-0XHA
	for ath10k@lists.infradead.org;
	Fri, 05 Apr 2024 13:07:03 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-6e89e48d2c0so1027998a34.1
        for <ath10k@lists.infradead.org>; Fri, 05 Apr 2024 06:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712322420; x=1712927220; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iU1YdowZKR4NxwS1m2fNh/bSZUDHJtarrpZbW985aMo=;
        b=FOm/tGg/pX0/aTBS9U3/SznAd2ktIfXZSRBwltqFEvgLei4FH6Rg43VK+1WQXvfAyO
         lA/xBovq11iXRNl3t273V68Ze0J8EShbh2oyF8uEoHN5F2CdgGn6oULHbz31ZBLyc0XB
         kwcjne5K1xxWF94zzwZNyTUxc27x0SyRSjCeXhCd234TWgwbP7j2H79yh9kgVRfSA+FG
         6usMtqusO0k+I2dskIhmbXDUxEL8fi30XYd6mosXlMSjJCHDJ9JRvOWq7van0gu5/1V+
         agQPZhpIPBdLbLXz0M2nmigMHXm+AyBOqqtKrSJQ4UpIvhu59i+n30FdPE1dvrQbdGnj
         jLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322420; x=1712927220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU1YdowZKR4NxwS1m2fNh/bSZUDHJtarrpZbW985aMo=;
        b=wsfXS1Vhs1Y9vyXUxe8D/eGTEF3KO+gmt8tMamHjYDprc2Wo0LjgbqZ12OUR8U+5xQ
         oGVK76Wv7EKT1bdXSYOY1syJKsJt4eGfiPzNFK3CJqoGN3hZvRZiYQr5MLxjee+xpUMR
         tYKQWrQsKpYxL1+1nQPlVylGjH7AdqjHp+dlXPVEl5XjY2mHuSUFhJH6D/DtMofuH52w
         PnTbp5dTK0P+IW6dwsUId0P3Tp4VHpM0A9OCff909OC0zy5Ljp9hoAxN7YB8WpeaHIdm
         ackPqIsr4PiaWpRLnaHHs3QD+KzQPUbaACQlF3AVDwC+Nh4uqlVGMHop8YB98ob3Pr/R
         NrYg==
X-Forwarded-Encrypted: i=1; AJvYcCV905aYxWYxgFbMXrONXChrolso62VduExLq6DlPaim4z5MAUVPuTfxwE7gTeqQhOeQbrR5ayFBdVWb/tkUrJGwXRYSB7ll/+Y1bg==
X-Gm-Message-State: AOJu0YytPCm+flzzuvVE0Xu60EgRN3ZMDvGwjAopnsM7bHJ46H/lpLE+
	41jDzHta5wKdP6ThtjWOBVioZL1ArfU0TTh2cwl1/7zAf7fnwf7uFatCLTsUY/Sb17ZUKuJqDYJ
	YkCk4vmADZVP81kUml1GaC6ouDRW32WQxAeWOPQ==
X-Google-Smtp-Source: AGHT+IE+c2hDr24po6hk/C0dtlrmRnWazW8ArZW5UqRYqD6PC4fukxRp5eNcGAEsjPJWC/uAs3K3YzzUWmogRx/P+BA=
X-Received: by 2002:a05:6359:100c:b0:17b:5fda:a544 with SMTP id
 ib12-20020a056359100c00b0017b5fdaa544mr1738518rwb.24.1712322419701; Fri, 05
 Apr 2024 06:06:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240130-wcn3990-board-fw-v1-0-738f7c19a8c8@linaro.org>
 <CAA8EJprsjs8SWZmpTisyQcAZ9VC8g3_GEEc1hhp8bMZrm-hyaw@mail.gmail.com> <875xww3tv8.fsf@kernel.org>
In-Reply-To: <875xww3tv8.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 5 Apr 2024 16:06:48 +0300
Message-ID: <CAA8EJprZTdDZZ=NSzn9xEBGB0kp0s1HHLffF0X7YSLyVxy7ZSw@mail.gmail.com>
Subject: Re: [PATCH 0/3] wifi: ath10k: fix board file loading for wcn3990 devices
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Yongqin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_060702_209558_CC1EDEE9 
X-CRM114-Status: GOOD (  17.90  )
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

On Fri, 5 Apr 2024 at 14:57, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > On Tue, 30 Jan 2024 at 08:47, Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >
> >>
> >> The ath10k driver fails to properly handle fallback from board-2.bin to
> >> board.bin for WCN3990 cards. This happens because the
> >> ath10k_hw_params_list doesn't include .fw.board* parameters for the
> >> WCN3990 platform.
> >>
> >> Add board data configuration for WCN3990. While we are at it, merge
> >> common pieces of BDF support: drop .board and .eboard names from struct
> >> ath10k_hw_params_fw and use the common name instead.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >> Dmitry Baryshkov (3):
> >>       wifi: ath10k: populate board data for WCN3990
> >>       wifi: ath10k: drop chip-specific board data file name
> >>       wifi: ath10k: drop fw.eboard file name
> >>
> >>  drivers/net/wireless/ath/ath10k/core.c      | 32 ++++-------------------------
> >>  drivers/net/wireless/ath/ath10k/hw.h        | 14 ++-----------
> >>  drivers/net/wireless/ath/ath10k/pci.c       | 10 ++++-----
> >>  drivers/net/wireless/ath/ath10k/targaddrs.h |  3 +++
> >>  4 files changed, 14 insertions(+), 45 deletions(-)
> >> ---
> >> base-commit: 596764183be8ebb13352b281a442a1f1151c9b06
> >> change-id: 20240129-wcn3990-board-fw-a2d97507a712
> >
> > Kalle, Jeff, is there anything pending on me on this series?
>
> This is in my queue (Deferred state):
>
> https://patchwork.kernel.org/project/linux-wireless/list/?series=821157&state=*&order=date
>
> Unfortunately there is not really much time for ath10k nowadays so there
> will be delays.

No problems, each maintainer treats PW states slightly differently, so
I was trying to understand if there is anything left on my side.

-- 
With best wishes
Dmitry

