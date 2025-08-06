Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A768C87FD3
	for <ath10k@archiver.kernel.org>; Wed,  6 Aug 2025 16:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lgCSteki+t2ptlG/th49EEKiYbUbsa+8Xf0k+LnM4fQ=; b=5Gb9BYd74c0qnQM4TLO/zIp/eL
	QA3dRmFhutIdrvGFLeFiaTT3nahIA6t69mcztqzcLRL8yWrqYYDUO75nPrlbWzUlwgnoXn1M1nCst
	lY7L6SWxvIr41sfx+jbatBIQJ/58d//yBkVhAKHmtH9t2RkJgcogrWY8VmMvo04+Ki3tGMUgtr3Sl
	+Z4W2X56k+fDMbbSD8vkjJjFY+bR4V9UwwgvLp2HR6RsnHjvcJTEVBJRLVwSgNBstRr6z3R4kjmjE
	aj8AURuFGKa/yWc+f3KZ3GX3EDzICAYGLmZ2+TmqnQhdlhnP5hMEqIU5xqr0H0T+Ff+jxnNh5yRNS
	fhnurOcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgjW-0000000Fj8X-0rzs;
	Wed, 06 Aug 2025 16:11:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujgQE-0000000FfgZ-0iov
	for ath10k@lists.infradead.org;
	Wed, 06 Aug 2025 15:51:23 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6156a162537so16763a12.2
        for <ath10k@lists.infradead.org>; Wed, 06 Aug 2025 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754495480; x=1755100280; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgCSteki+t2ptlG/th49EEKiYbUbsa+8Xf0k+LnM4fQ=;
        b=R8iTvEnbbt4pQiMvnzd/7u031eSDYCpefItvRurh6KaPTbV3DSYgJHhKErJb5lso55
         iFse/0lBK01G31hqFbupbUyz3L8IM3B3ivdOE1SHgBqz5iGpu+Uee3fqzaFZGChAEuUu
         KdyQcjPsBtOxGD4ffll/RIJtI319JGogCQbC6MPQdFQ0OpTeXD738sssWkQz9zVHRhS2
         GYWGTcG0iLxUIyKiyRn7QdW+mcMV8p5Psb9PEMHsy1FZW4747iYxWZAGShwNXNN2uOY3
         h6FuHFrsv7dA/inTi1SYagLfT8GTu1I+UTQ6CJ6cn9EqbTcxkEMZWEHahzt6zkyL5sp1
         3yYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495480; x=1755100280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lgCSteki+t2ptlG/th49EEKiYbUbsa+8Xf0k+LnM4fQ=;
        b=JQjGCWobjz+q3Dz6k0srAMMvUyvf35ZJ9Rue+ir/Ka6ckRGqACMHhonsDxZCLFIWiH
         rfMSL1bttR/yfDm+2QPVPp0pVutOcTZpjukhdSdD5DR7ChLNNQkAlbsGPW6EEJo/cEgh
         1HrxhYV2J3FIu4eE90rzjzJ/H4tl/IzD2znL0ypUeZqL2duGjG1MIumbCxxL6Uh9X2uF
         8munr3m6Qemx00C//sr43Li57fZ17VfaX1sxV4crfpcEkouGul2t+aI08CJ3KBNttiJV
         KKrK5OyBuLi+Fr4C8RiCABMDV+fd/WIyZcLvfY5g1QvY4o6Wc59FjNaLl0NyBKY4MW08
         O4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnkAsxW6PZv1P0mWjkLUDizFhjgp1YEcKNGfJtl2RWWMbY63VrOxBa+j1fMWyhxmrUkqUOEZQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/BVOVdPDssurpp35Gz6yOqusoApXCj3FXOmBPo3k94igiW6hZ
	+OpzbP/Qu25dieGrhYCWe+EVyXgMN4Vx6MlqndbyeOO5Jl8nz5guaTqSPhDkH5TrpElrALcRsYu
	y2Tmuf+YQIC0KmeYiahEzO8nLvSUzs9Y=
X-Gm-Gg: ASbGncvrRXzGyfCQ/EHEATDvstDtryeWxEHczCnPh+XXVTvTZNa+I8xlg8e6JPXD3om
	QE8WQyCz590LpBDrDL6nBYMtY2y3uKgYS8O1PzSRvmzmgfinDbJhUUGz11NvbTmBqibrq1q55H3
	z+BhNA2rUu7zwzv8eLlP8smczw4sAsjovfDZnJdLVYXIHVCIkt/pe/u95/KtmC0f90oDl8xvWWy
	DoTo2BYLEqyOs0VnQ==
X-Google-Smtp-Source: AGHT+IE3MeNHT6IbSDqqyk8Nl5eb2ctbTeULDiqqa3ommVO1l1tS3oPic/2CvY1Vu23D69lNA0tN4EnrAVnFBs6yny0=
X-Received: by 2002:a05:6402:518f:b0:602:241c:345 with SMTP id
 4fb4d7f45d1cf-61797e1acaamr2302513a12.23.1754495480266; Wed, 06 Aug 2025
 08:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250806070005.1429-1-hujy652@gmail.com> <29ef8aab-06a3-48e2-a370-86b1b2107143@oss.qualcomm.com>
In-Reply-To: <29ef8aab-06a3-48e2-a370-86b1b2107143@oss.qualcomm.com>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Wed, 6 Aug 2025 23:51:09 +0800
X-Gm-Features: Ac12FXzWxzIOa51wZLvSPCSe3-7hewf18YP2hT4TEr_5gZ2RQVfpKsU2qB5skfI
Message-ID: <CAHGaMk_rMCoWDzKtxgsg9GkH0s-U540zYq_AOC9HpBo_JF7qJg@mail.gmail.com>
Subject: Re: [RFC PATCH] wifi: ath10k: support flush_sta method
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: jjohnson@kernel.org, Remi Pommarel <repk@triplefau.lt>, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_085122_212334_07344B97 
X-CRM114-Status: GOOD (  22.18  )
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

On Wed, Aug 6, 2025 at 10:23=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 8/6/2025 12:00 AM, Zhi-Jun You wrote:
> > When a STA is marked as no longer authorized, if the driver doesn't
> > implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> > flush hardware queues to avoid sending unencrypted frames.
> >
> > This has became a problem for ath10k because ieee80211_flush_queues()
> > will stop all traffic and call ath10k_flush, which waits until the
> > whole HW queue is empty. In a busy environment this will trigger a
> > timeout warning and stalls other STAs.
> >
> > Fix this by implementing flush_sta method using WMI command to flush
> > frames of a specific STA.
> > Flushed frames will be marked as discard in tx complete indication.
> >
> > ops->flush_sta will be set to NULL if htt.disable_tx_comp is set to
> > true.
> >
> > Tested-on: QCA9984 hw1.0 PCI 10.4-3.9.0.2-00157
> >
> > Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
> > ---
>
> There is already a patch from Remi pending for this, see:
> https://msgid.link/cover.1732293922.git.repk@triplefau.lt
>
> Please see if that series addresses your needs.
>
> First Kalle, and then I, held this back due to lack of internal validatio=
n
> across supported platforms, but it is actually still on my TODO list:
> https://patchwork.kernel.org/project/linux-wireless/list/?series=3D911851
>
> Let me make one more validation request internally since I know there is =
at
> least one ath10k-based project with active development.
>
> /jeff

Hi Jeff,

I am aware of the series and glad to know it's still on the list.
I did test with it but the warning can still be triggered easily with
the instructions in Remi's series.
And according to other people's reports it can still block sometimes. [0]

drv_flush_sta() is called before clearing the keys and Remi's approach
still waits for the frames to be sent which imo isn't enough in this
situation.

[0]: https://github.com/openwrt/openwrt/pull/19427#issuecomment-3102794793

Best regards,
Zhi-Jun You

