Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6BAD7879C
	for <ath10k@archiver.kernel.org>; Fri, 19 Dec 2025 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snESyLRhb9BgqyB60EyDqIexGhSFyAaClXjAzVuRulQ=; b=dPPy8lzNMFd/IVYuEmRjzLGp2i
	1rhZSAkBqsr32IJFkXkMfchfSZbnP8IBiT9U6/Vc1OP6KJdW3/+69eP3N7QTBxL4QBvF5fUzWY6wx
	GRuySHDH2Hr0isRHa7ebQ2jdVC/durbmmOfS47jP2KQJFcPdwKBg+TsAV7mkJNY4xQqodjYcyNNXw
	/z6vNb3NLAV3uguaaBI5Gurds3oC9AygAyYXZ/8NWoODRaU09/0dboV79WJ3+QpAN3VcCkMju48RG
	kJw+NwXkX0LfRymBnqn8R5DzJroMmxZoPsvswnmjtxvMvCBCPkrS3W1jk6Wj+lZtXqM2RHAXUJtlT
	zgpuRgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe7x-0000000Ahi0-0B24;
	Fri, 19 Dec 2025 17:18:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWe7u-0000000Ahhe-12HL
	for ath10k@lists.infradead.org;
	Fri, 19 Dec 2025 17:18:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so14156705e9.2
        for <ath10k@lists.infradead.org>; Fri, 19 Dec 2025 09:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766164728; x=1766769528; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snESyLRhb9BgqyB60EyDqIexGhSFyAaClXjAzVuRulQ=;
        b=OgNRwWEtV7995DRuCsfw73VZOs4jKSvcsBOrXcZvfyZDfG5bj7RsQ2gmFJoPGcQaIO
         blejouhqdWKqLwr1jdc7dNF2PrsDf7Kn1qX8KnSNr37wvo/S6qLyDeqcBhacXNiVniSt
         U5NuvmzI3B9Q3SX+ic/VG6T9Wzm38bjYuT/QeHsulX1FYGxd2pVOqLo0thfb6xIusKlo
         ogh+Nk4xrJXChidDVCaV4GJMlR/UDYFUtBUZZMgPMX8O3uYdBW77iGjyW/b7JC2Ykvxf
         dEG9QFkqWgHXwgroEqLV7GgMpq6Uw2yykNKnVe8If3kYiNaGG6JcJZSwAoPPMp60sMke
         Zp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766164728; x=1766769528;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snESyLRhb9BgqyB60EyDqIexGhSFyAaClXjAzVuRulQ=;
        b=Vblsbn+4KhNEkmXU/TvYikar1KkdtU4TTXkUBVnWCdhadl4TqccuCwC3vhmJTx8vxX
         lOYWNjFqHPiDjkFx5PAKwwnM6PSLpE8ezVZtMbPUeidh+MViVqb+PuhQPYwUoMO9FvbP
         /4T4pzhr2WWm5ioXC/lxtusEpyh8uBC67jZ/Io56Yi7G+1JqOAF+QwfID8ikOL67IcSS
         DN0rbjc6vudFHBiw4fU62haNpL831C9qW2w13HlGYVVgU6sObOIBekjNjTsaHfUlXw2j
         5WK7GM3WNTThOFSFsWKPokeWgybRkRv8d6K+/eVL4Cj5vAN9uGhxEs0gYCfPH7OEgEoW
         mzgg==
X-Forwarded-Encrypted: i=1; AJvYcCUCf7iy1IIXdcqRQIGseqtz1spNrOx5UWhD9Zd9LLq8/rjgQGNYcusB94XQLD8G5r6MQXBEFHI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzhtdX/H6PkmF1gBZ/joOBFmNK1VPXiRdpglOJXAQI2ImiVAdRS
	xOPTqEYqtCxFrTynq5S9ECM7SwDrIzIESBlrczkgdfOQhLluIYE2XDvtO7YguTgNwSPAeyu1Atr
	v7svR
X-Gm-Gg: AY/fxX5u4kOvvs3hLElXYl7qnpA/Fa64WSlwuqUaz5w9wUfZT3wtgcVBiOJOVvUqboK
	g6oAj7o8ktwJwNIT95aI5excX4KSq63ByYtMOmn7ZT5zOJwnuOzA7630up6qaq1G+vD79IjiPin
	r57eWyxxSQ9esGaCf6txsFawD15IbbaMGocFvIaqYPyIJ8d1jp7+rf55D4X1o6oTGMu6OTDerx5
	h6fEtKa1hS3QS7XJGGLrda6s+/KVn0MSL51y5BTS7Mm5H2n/lJvZ+n/SA0flaWbdYYSqnsruSGN
	IjoHCP/oXaLvhh9BefY5tRIXRRGbT2FsctHdrmSdOjox0CWc2hrckPo3CcnxBaLe5V8JsO9D/WG
	dXwhcStRbWDnNDiXVrLa5y1Go47utCQyRALVFgH+n/C4JtRDFRPweCd7PQkxTWzUFiFQW728KNr
	u8W/0kTOj6c+b23DzmkpGd0bRz8v5F0CmSYbh4pK4aeKDgEbLI5/2hmwClcddjJGmbrvMCowjJ3
	2s=
X-Google-Smtp-Source: AGHT+IGw7Jg4BgHsr1dkCPhlhRBtoIzer1WmzRgNITRO9EqwkGKuN5VLLnDOwctsa4IAHoSzGXRzJw==
X-Received: by 2002:a05:600c:4fc6:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-47d1953bc3cmr30364955e9.5.1766164728314;
        Fri, 19 Dec 2025 09:18:48 -0800 (PST)
Received: from localhost (p200300f65f006608b2d9668c60491dc9.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b2d9:668c:6049:1dc9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47d193621c8sm51604205e9.7.2025.12.19.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 09:18:47 -0800 (PST)
Date: Fri, 19 Dec 2025 18:18:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead
 of #ifdef CONFIG_PM_SLEEP
Message-ID: <gz2ch5zl6mp67ia3dimuyrcga6nctcjlrzdbbsdr66uaab47jx@iesjlbi2yuzk>
References: <20251217111951.3309170-4-u.kleine-koenig@baylibre.com>
 <dcd0c9e1-66ae-473b-ad37-5d028dc1bc16@oss.qualcomm.com>
 <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pcnb4zwv5xdxpoiv"
Content-Disposition: inline
In-Reply-To: <72d6e9fa-fa28-4079-851e-00905a7b0dda@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091850_561661_65E1ECE3 
X-CRM114-Status: GOOD (  21.69  )
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


--pcnb4zwv5xdxpoiv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH wifi-next] wifi: ath10k: sdio: Use pm_sleep_ptr instead
 of #ifdef CONFIG_PM_SLEEP
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 07:12:30AM -0800, Jeff Johnson wrote:
> On 12/19/2025 2:32 AM, Baochen Qiang wrote:
> >=20
> >=20
> > On 12/17/2025 7:19 PM, Uwe Kleine-K=F6nig wrote:
> >> This increases build coverage and removes an ugly #ifdef block.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >> ---
> >> Hello,
> >>
> >> I found the patch opportunity while looking in this driver for a diffe=
rent
> >> reason.
> >>
> >> Best regards
> >> Uwe
> >>
> >>  drivers/net/wireless/ath/ath10k/sdio.c | 12 +-----------
> >>  1 file changed, 1 insertion(+), 11 deletions(-)
> >>
> >> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wire=
less/ath/ath10k/sdio.c
> >> index c06d50db40b8..3efe744c0c96 100644
> >> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> >> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> >> @@ -2136,8 +2136,6 @@ static const struct ath10k_hif_ops ath10k_sdio_h=
if_ops =3D {
> >>  #endif
> >>  };
> >> =20
> >> -#ifdef CONFIG_PM_SLEEP
> >> -
> >>  /* Empty handlers so that mmc subsystem doesn't remove us entirely du=
ring
> >>   * suspend. We instead follow cfg80211 suspend/resume handlers.
> >>   */
> >> @@ -2175,14 +2173,6 @@ static int ath10k_sdio_pm_resume(struct device =
*device)
> >>  static SIMPLE_DEV_PM_OPS(ath10k_sdio_pm_ops, ath10k_sdio_pm_suspend,
> >>  			 ath10k_sdio_pm_resume);
> >> =20
> >> -#define ATH10K_SDIO_PM_OPS (&ath10k_sdio_pm_ops)
> >> -
> >> -#else
> >> -
> >> -#define ATH10K_SDIO_PM_OPS NULL
> >> -
> >> -#endif /* CONFIG_PM_SLEEP */
> >> -
> >>  static int ath10k_sdio_napi_poll(struct napi_struct *ctx, int budget)
> >>  {
> >>  	struct ath10k *ar =3D container_of(ctx, struct ath10k, napi);
> >> @@ -2668,7 +2658,7 @@ static struct sdio_driver ath10k_sdio_driver =3D=
 {
> >>  	.probe =3D ath10k_sdio_probe,
> >>  	.remove =3D ath10k_sdio_remove,
> >>  	.drv =3D {
> >> -		.pm =3D ATH10K_SDIO_PM_OPS,
> >> +		.pm =3D pm_sleep_ptr(&ath10k_sdio_pm_ops),
> >>  	},
> >>  };
> >>  module_sdio_driver(ath10k_sdio_driver);
> >>
> >=20
> > won't this cause defined-but-not-used warnings if CONFIG_PM_SLEEP not e=
nabled?
>=20
> no because SIMPLE_DEV_PM_OPS() adds __maybe_unused to the dev_pm_ops

I would have claimed no because

	pm_sleep_ptr(&ath10k_sdio_pm_ops)

expands to

	0 ? &ath10k_sdio_pm_ops : NULL

if CONFIG_PM_SLEEP is disabled which the compiler counts as usage and
thus doesn't throw that warning.

Best regards
Uwe

--pcnb4zwv5xdxpoiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlFiPMACgkQj4D7WH0S
/k6wvgf+O9Myi+jHDgXNxLqCnodEuyQ3U6kbc03BR7vz8OrsGQfNCLZkU8v//z1t
1ZTqZSY7Vr92YG1ZROluzRNn2e8cuzAsoLOuNj056C8Elit84OP4i56e7lyX8q4v
cqxTNgmDsjyDx1OVsNo+TUmqDXtxqgJn+8PAgBhCfpzeRSsV6ETuDMHuucXF9Ytl
ZSwZ2iaxDdcgIeVI4GT0aZA16vHJPKTMbVZTe1f8xxKqeQMINUirrIqCHkiys5Cj
7OnsXzDK0lv90JwrE9bQjtgCim1XSbC5pcyn/3AS9ifv0cizgixjWJeHnSuwJgJo
ivnCnskCm1sy8S0TpiGJ2zCeSHI6Fw==
=WMX5
-----END PGP SIGNATURE-----

--pcnb4zwv5xdxpoiv--

