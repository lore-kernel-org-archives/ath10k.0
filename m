Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F90CA0EE9
	for <ath10k@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRxQ1/CDtECtJO0YvGSZjNXb6lpF9CLCjzuN6DRYqKM=; b=KhDlgjoQ2cW0yjgwDEpxhhj3+a
	fwPyRWc4lMazsNUpqUk6EEFcfKJNjrKc3P01TeN+iCRCUS3F2yVaEwNsZlc6gDxw43d88RHLmmamF
	YVUPCqQUeiowrRsftyo6mGijCBoQAAey1kl32Ip8MVWFGGmsXwKMT9r52SyO9Fjtan624vi9GY07B
	LkPfIgkc1Om6K4n/M1jZbQp9toR1IB0uepboPyGcP9eR6HqLIPnRezhKro7MXJnvPKGWm5raXtKez
	+75RXgsxd+Z7sVrXcuB9Ew93y6tvEFAep5wWwjs64M4pbwyh0iRB6uWaMndUy1X86kFHLkqVb0I0h
	pahYHF/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O1-00000008i94-05rh;
	Mon, 18 Aug 2025 21:27:25 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5fv-00000008XYC-1dnR
	for ath10k@lists.infradead.org;
	Mon, 18 Aug 2025 19:37:48 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e9455cfb9d1so1382148276.0
        for <ath10k@lists.infradead.org>; Mon, 18 Aug 2025 12:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755545866; x=1756150666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRxQ1/CDtECtJO0YvGSZjNXb6lpF9CLCjzuN6DRYqKM=;
        b=MmAy4AgbSTRF9KFefuR2d28VeFfxjdGPsXYnXJNov03MGlJDYK/NyP6bcL0maDuTUD
         vKZrf8sFv53leT6nIk6gcdfICbLMnmjh8wecmyVhHlyFqyOGC2QBwWXjHvYyNeC35l/c
         GR2FhtnlOdVRmmnRd7co4onFXugojxTc6caLPGStu9R7ZLrrQC5290mfRzbhrjW6ySO1
         GyZAsgrgaw0+WgGcfSdPYEuuq8jYHvEZge6bbdY8M4vUSoP0NtI11hPyI8dlZgPa8fM+
         h78xa9OftCr5Wp8vZFtGVNckKwxXDZwMTOBXI+EQ1cMIlb0wr9m7AQvTQSU578ERTM7A
         /8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755545866; x=1756150666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRxQ1/CDtECtJO0YvGSZjNXb6lpF9CLCjzuN6DRYqKM=;
        b=kg/uxMLKHwPiGH+LpyBJrYZqwDC/B4BCLFrPasxcqzKcILymRgy2wdEX8V8DQSb+0u
         SPXv/PdxDwskKGdts/G5CyJx3W/S2Sp/eRrVN7XI8jl3/3c/p1hc3AEkTKLVKzRfgDwx
         7xhFtIRt+S+3NksrxV8Pw/hMrb2t2nGcmcB3lt+dnv9wNvKYC9hW5fqJAonPZXyTpGwC
         0izbSlkYPwWfYc9q59sF9bNpqSVl228cWZpA4sybNB1v0TYBRrbGVISUTBtaXS/72Loh
         Y0N9LxZD6fs4CjDCaTgTrCtnlSZlwFHl4h0K/J+f6q9J+3rSSHVFz3bwsw39IeoV0VTZ
         QVdA==
X-Forwarded-Encrypted: i=1; AJvYcCVd11KwXR5zRFg85fjlOffHkgMGdT/ZE0/Th/aTmHAioM4wlIjFLHswxRgnM+GzPiTlnpgaIXA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaHHs+VDJIevYGH22rvsnM2LXfKk9FfapXY3iAni3IvC15WDV
	w3GAZT3xVsF6iVIeNsfrm1yc/kdT8GZsAkRJDmumTregIsV/sAlmCicmsWTINKNBg0aQTi61nsk
	wgUA9rto+JYXrSG7yjgwV/BXgz0i/dBM=
X-Gm-Gg: ASbGncsN8w6b3ZtIHBYfuEexVstxP89rbWP0IeCH2xF/mxgM8pOHC8ss5mzJ9aoevyg
	uvsZ9exeOrdx0uq/mDxeFRZCyD6Ekoq+V1WuQu/qjXl7LtIvvzKHpaTRZPNWAQFyUG5/2iiL31h
	FrW/oK2D5JrZLNztWQsQ0VmbD7qvGtRGgaLj5+zthkbSX3GpeMcWvzA+zV3hKRi3ZAYtIMNZGfD
	Ae45qPE+5nIK1RKlai+
X-Google-Smtp-Source: AGHT+IFNd7VbHgSP40jC4g66ujH/qNSd8MS2y9wOHpdY850RLVLYxKsxREchSBRe+HKck66t1xqpLic7wRbyMZr5HpY=
X-Received: by 2002:a25:d38c:0:b0:e90:69d8:ca5d with SMTP id
 3f1490d57ef6-e94e3b4949amr753135276.19.1755545865965; Mon, 18 Aug 2025
 12:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250811203451.3763-1-rosenp@gmail.com> <87tt2512nn.fsf@bootlin.com>
In-Reply-To: <87tt2512nn.fsf@bootlin.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 18 Aug 2025 12:37:35 -0700
X-Gm-Features: Ac12FXwZZyyUDn8oKNNWYN6q0laLklRESzEvvBU_ig6gkBOpa6H22KVKeJSdOXY
Message-ID: <CAKxU2N-5gFSHsyO-1UJ-6TPbn1YZ-zPU3yry9ZNcwYeOrEvZHg@mail.gmail.com>
Subject: Re: [PATCHv2 ath-next] wifi: ath10k: add nvmem support for mac address
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER" <ath10k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_123747_436924_F006FD53 
X-CRM114-Status: GOOD (  16.65  )
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

On Mon, Aug 18, 2025 at 12:59=E2=80=AFAM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
>
> Hi Rosen,
>
> On 11/08/2025 at 13:34:51 -07, Rosen Penev <rosenp@gmail.com> wrote:
>
> > device_get_mac_address is a generic way to get the MAC address which
> > lacks NVMEM support, which tends to be used on embedded platforms.
> >
> > In case device_get_mac_address fails, try of_get_mac_address_nvmem and
> > handle EPROBE_DEFER to wait for the nvmem driver to initialize.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  v2: keep device_get_mac_address and use of_get_mac_address_nvmem
> >  added Miquel to CC. Maybe he has insight.
>
> LGTM. I guess it is not possible to make this fallback "the default" in
> device_get_mac_address()? In this case doing it in your driver seems
> fine if it's used on embedded systems with NVMEM cells described to
> store MAC addresses.
In retrospect, it probably makes sense to just switch to of_get_mac_address=
.

The prior assertion that this could break ACPI embedded systems seems
false. ath10k is too new for that.
>
> Cheers,
> Miqu=C3=A8l

