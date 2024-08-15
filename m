Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532F9C3DA7F
	for <ath10k@archiver.kernel.org>; Thu, 15 Aug 2024 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eVQ3U6jCrHLtgSLoUrYnv1NnnjjvT+BRAWf5W+WadB0=; b=BjLZe8AbW7FYIQlB0RPGQ6Dp84
	Cr4f9BV0NOoj0jVmCv0rxPX+9QsRy6CJACu/ukhZdJTrm+zhTNY2Vcib+FS6AVWZ6ytEpIy61WIt4
	LD7LC+7HFAOTNL/CKKf7KRB1qHrKnaObd3h8MeRI+5sLTC4NDi8x5FQw1uhAAkyffV0kxvCvuVNQH
	1GIon6wboHs7C1yIpyN25H539M/kKA79XgWo0uqyqtUf/MVOBC1LB7E/fT/6feivPPCKtBtLIOiLm
	CVDnN5w8Sok6VYsuvxJR33dsJ/r0RGf2o/OYS04uXY5Jer7Say2njbaxDNnFd6zKd0I4sKjkAIUy2
	QSeQ/oAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb4M-0000000A8Vf-3AM9;
	Thu, 15 Aug 2024 14:03:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seb4J-0000000A8UT-2j71
	for ath10k@lists.infradead.org;
	Thu, 15 Aug 2024 14:03:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDA8261D52;
	Thu, 15 Aug 2024 14:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054DFC4AF0D;
	Thu, 15 Aug 2024 14:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723730590;
	bh=eVQ3U6jCrHLtgSLoUrYnv1NnnjjvT+BRAWf5W+WadB0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WCCsjEMXgWyuqwIPm3s9cTc2MiTRR0Ie2+Bf4ZUvtQK7mp2yROBt9AYmrM5oG1UO6
	 5vzuLBztCfIDm8Zjq9owzEoz36NR+3vpTrU7KT+vkC/jaelMOitScxeJqStCIKGAb8
	 unMfPcHD2eP1OQojYEu3auq+FHxlIvYx+GgLjpOZfElHrJRe865ayO+GYLEHPKg5LF
	 xdTtHfZZmez1L5FdTPFtHPtzOvdOaQoMVoxEo6ZLNptiBR1iDMVFm0NDlD43JFTma1
	 cd3Zi+T3iZqKCylOCvQ3JHy0aElyqtAFoOCNQiVbmJGiOeW6GWqqAq3Mzy2yzWg0Cu
	 /kkfk+i2ilbBg==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: linux-wireless@vger.kernel.org,  ath10k@lists.infradead.org
Subject: Re: ath10k "failed to install key for vdev 0 peer <mac>: -110"
References: <e780560a-86eb-4189-ab5d-3bed3ee5825e@gmail.com>
	<c407064a-1c2f-46ec-ac57-32bf9cf6f5c6@gmail.com>
	<9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com>
Date: Thu, 15 Aug 2024 17:03:08 +0300
In-Reply-To: <9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com> (James
	Prestwood's message of "Mon, 12 Aug 2024 10:33:30 -0700")
Message-ID: <87r0apyjc3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_070311_780847_5DC7A1CF 
X-CRM114-Status: GOOD (  16.93  )
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

James Prestwood <prestwoj@gmail.com> writes:

> Hi,
>
> So I have no resolution to this (trying to get the AP vendor to chase
> it down), but I'm toying with the idea of trying to work around
> whatever issue the AP is having when this occurs. The only thing I can
> think of is that there is a 3 second delay between the authentication
> and reassociation, and perhaps this is causing some timeout in the AP
> and in turn the deauth.
>
> I'm wondering how long it should take to add/remove a key from the
> firmware? 3 seconds seems very long, and I question if this timeout is
> really necessary or was just chosen arbitrarily? Is this something
> that could be lowered down to e.g. 1 second without negative impacts?
> The code in question is in ath10k_install_key:
>
> ret =3D ath10k_send_key(arvif, key, cmd, macaddr, flags);
> if (ret)
> =C2=A0=C2=A0=C2=A0 return ret;
>
> time_left =3D wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
> if (time_left =3D=3D 0)
> =C2=A0=C2=A0=C2=A0 return -ETIMEDOUT;

I can't remember anymore but I'm guessing the 3s delay was chosen
arbitrarily just to be on the safe side and not get unnecessary
timeouts.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

