Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBECC2BA18
	for <ath10k@archiver.kernel.org>; Mon, 17 Jun 2024 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAuQxL+Gyhar/sH4cJ7Cd59za0aoyhBpuAptHSuFiLc=; b=oRA+rgjYlDArvufCuJA7IuRT8y
	8hlP1Q7IXJVdlGMC/ErBkAVtAqzOwZm1LrLmmPNPiruSe/0AccRGRoqs5RFsfiVgiQXTTyQPnlWhC
	Xhi3vWFwf0ZgygaR7qBqAzPwlkEQPduM+zD08t+2+9Xj7UOpZtGV4kfr2qvv/6A4z3QYArqt5RlmU
	kfODog8oK1KAzQ/64j33+yciOI+h1aMmsWXY6uKP1l4b9IJxtqcY44lqmIsBrKcmgIpgEfcI67Fcu
	XEvNj4HbtLFXT+IFh9pgRrtYB4c2R23HJbnVjLb9boFCFC8I57fLod1g3VAa5NuhjWcb8TevHMuvc
	xje42RDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEGO-0000000BSXv-3Hmp;
	Mon, 17 Jun 2024 15:27:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJEGK-0000000BSWX-2bD6
	for ath10k@lists.infradead.org;
	Mon, 17 Jun 2024 15:27:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7FEEBCE118C;
	Mon, 17 Jun 2024 15:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70332C4AF1D;
	Mon, 17 Jun 2024 15:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718638033;
	bh=n+wIBWJU1LXxzUpG+e2c5+QYPfK0ydEvJGGwWKE0jUc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JjdItWreMC/EPM8OeL2NH0i8TqCN+WOndTEB31FM1fm0300EaPp3d9sSRcTCdL/0t
	 UFcvrGp3opCkhtT/Rh4jAkNU+YwH0OaW+FqfUZlWNbwYWum6pTe0hZVac8TQe0BTxw
	 sILu9XDpvccwKGIa7R5XQ3wwDjR1SWXHZy5j7gWN4LwspNH7f5fUf9SyqHsEgUePzq
	 rQzEErBtnymU2sP6RAvhzj7pFWILURUtvCAIDH9MnGezMr+AsRkBg87aFE/5Pr46Px
	 o020GocXn7rtJDTO90E6cuWHjWaYriCRAaQitMuWiyNfotrYYRYZ8Z3d/EG/ZiG5zH
	 eZNqmhKUI0pZA==
From: Kalle Valo <kvalo@kernel.org>
To: James Prestwood <prestwoj@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,  linux-wireless@vger.kernel.org,
  ath10k@lists.infradead.org,  LKML <linux-kernel@vger.kernel.org>
Subject: Re: invalid vht params rate 1920 100kbps nss 2 mcs 9
References: <fba24cd3-4a1e-4072-8585-8402272788ff@molgen.mpg.de>
	<1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com>
Date: Mon, 17 Jun 2024 18:27:10 +0300
In-Reply-To: <1faa7eee-ed1e-477b-940d-a5cf4478cf73@gmail.com> (James
	Prestwood's message of "Mon, 17 Jun 2024 08:09:05 -0700")
Message-ID: <87iky7mvxt.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_082716_867267_6676E2F6 
X-CRM114-Status: GOOD (  13.45  )
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

> Hi Paul,
>
> On 6/16/24 6:10 AM, Paul Menzel wrote:
>> Dear Linux folks,
>>
>>
>> Linux 6.10-rc3 (commit a3e18a540541) logged the warning below when
>> connecting to a public WiFi:
>>
>> =C2=A0=C2=A0=C2=A0 ath10k_pci 0000:3a:00.0: invalid vht params rate 1920=
 100kbps
>> nss 2 mcs 9
>
> This has been reported/discussed [1]. It was hinted that there was a
> firmware fix for this, but none that I tried got rid of it. I got fed
> up enough with the logs filling up with this I patched our kernel to
> remove the warning. AFAICT it appears benign (?). Removing the warning
> was purely "cosmetic" so other devs stopped complaining about it :)
>
> [1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg13406.html

More reliable link to the discussion:

https://lore.kernel.org/ath10k/76a816d983e6c4d636311738396f97971b5523fb.161=
2915444.git.skhan@linuxfoundation.org/

I think we should add this workaround I mentioned in 2021:

   "If the firmware still keeps sending invalid rates we should add a
    specific check to ignore the known invalid values, but not all of
    them."

   https://lore.kernel.org/ath10k/87h7mktjgi.fsf@codeaurora.org/

I guess that would be mcs =3D=3D 7 and rate =3D=3D 1440?

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

