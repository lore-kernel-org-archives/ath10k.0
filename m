Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8B9C48BF6
	for <ath10k@archiver.kernel.org>; Thu, 29 Feb 2024 18:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LARb1VnKollaflu2liRF7rfiohyzuPezMY1NfHktn9o=; b=RvgMDYMjzkfVGK4ugHQY2I/kdC
	8mP6PFVxcJYV96OjZ7EWmf/vi0Sp8660JveoYjkKrrss0VVC+DO61ATlGlA3MRgp2FbdftZim36U5
	IYnaUVIWwqK6o1KfCwHJn13dFqGc/JVDTvJQqEVFhIQzrvg/ya5tK9DvD7GJeo7e6vG6uqeenNJwn
	GpTxo/nF0CTJa7YlGayIOUxOlv+6mOvfgrjvVainfKiEh5loWEPd8Bz3TLRpdxIIx1uuBtdSgUWIv
	GGLoXqw67iCdgBx8dLIMsnD+DHX1vySFxe25GIXwtaVNztO0rnczKLiUGIiPertAWX5GzvdDSEZcD
	UaRUTgMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflL7-0000000ElNk-2SrH;
	Thu, 29 Feb 2024 18:41:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rflL5-0000000ElN9-0cyH
	for ath10k@lists.infradead.org;
	Thu, 29 Feb 2024 18:41:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8776612F3;
	Thu, 29 Feb 2024 18:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3AACC43399;
	Thu, 29 Feb 2024 18:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709232062;
	bh=LARb1VnKollaflu2liRF7rfiohyzuPezMY1NfHktn9o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vg2Fz+I5TerXTTbwh614asxfjIwLDnuMiI//Pf81lDHGE6i0k+kBn81rPpBVMhZWe
	 8KvlrkmG7pARys1jzfNZOL7TT/tRbIrtgoCns+X8gB+C3bdDuejTqop08XdG+w9crs
	 1BrHXWnwxc2404cM2ly43GVEksMY+T2BG8PPeIa21Wl4X6KrOnHWHH/lC3xc3+TMQF
	 YAnuNG/fU6ow+e83kikS4F4c6OyQr72bM10jOucmLUZ1+TUhmikHAmQTqdu+b1HvW6
	 CmYww/qlo9sm6ZQtWtbWIChNXSWaa5p9PKQU46/ad9pMLL806rlINmxVu0PWN59+/T
	 6esQmqFi2sGPA==
Date: Thu, 29 Feb 2024 18:40:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k <ath10k@lists.infradead.org>,
	wireless <linux-wireless@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Message-ID: <20240229-ageless-primal-7a0544420949@spud>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cEg17b20MxyCi/dL"
Content-Disposition: inline
In-Reply-To: <87wmqoilzf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_104103_257878_24A9A20F 
X-CRM114-Status: GOOD (  16.97  )
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


--cEg17b20MxyCi/dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
> Marc Gonzalez <mgonzalez@freebox.fr> writes:

> > As mentioned in my other reply, there are several msm8998-based
> > devices affected by this issue. Is it not appropriate to consider
> > a kernel-based work-around?
>=20
> Sorry, not following you here. But I'll try to answer anyway:
>=20
> I have understood that Device Tree is supposed to describe hardware, not
> software. This is why having this property in DT does not look right
> place for this. For example, if the ath10k firmware is fixed then DT
> would have to be changed even though nothing changed in hardware. But of
> course DT maintainers have the final say.

I dunno, if the firmware affects the functionality of the hardware in a
way that cannot be detected from the operating system at runtime how
else is it supposed to deal with that?
The devicetree is supposed to describe hardware, yes, but at a certain
point the line between firmware and hardware is invisible :)
Not describing software is mostly about not using it to determine
software policy in the operating system.

--cEg17b20MxyCi/dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeDPuQAKCRB4tDGHoIJi
0oklAQCb9liXgCtU0yqoCxGYrPtfMDdWh7iUxPWsScbIPS343AD/c6Wr2hVOtmtB
qj/WEDA/Sdh/5pt/pXxfhjnLYJ4shA4=
=+qJ3
-----END PGP SIGNATURE-----

--cEg17b20MxyCi/dL--

