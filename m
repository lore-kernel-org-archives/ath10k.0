Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0C6C48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0dPGFoolNvP0d01erHaO1Wbz4zvjisdPYRNvTzcAqg=; b=fvuWi4XQ37MjzDRaSq2sclXwvZ
	kBtISxSYwOR77DpK65wZowDHnybQG+dzcq7XSueDthq1tllxHcmJIII0OVFb3HOELjqAUUfaSX2Yu
	2C9QOvuVf8efP0lNHyk6nLSkhe8y+g3pQjyQo37iP+PK66T9ZApkUdiTnb6MKEFYmf9Vl8L5KdXZr
	E/syp//1N+11EOX520Qmqa3Y0+vrLUDNNODH4Qc8lNopCvAAVQ7p4Cg1K+NG6Ovx7RrWKMMsYr8Fw
	mEmBAiMzlWUCeo9dqEQ+ofEKSpZMi8zWGpT7Acbse1B6VbkNtsAs9nP/0CEXEq0ZqbBHngJ+8zcf3
	OZ7oazLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEGK-0000000AU05-3u0k;
	Mon, 04 Mar 2024 19:46:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEGD-0000000ATyp-1iQc
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 19:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 34EE9CE169E;
	Mon,  4 Mar 2024 19:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F8EC433C7;
	Mon,  4 Mar 2024 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709581562;
	bh=/na7WEDTqbrrPLUSeebOS56+PR8+1l0yqJy14F4XQB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOz4Lfo2GqFYe4VT6KfpdU8Ptl34mhm3G/feNyyc3raVGdIACu/37hz7dNKedSv2V
	 7uGDcYwHEYKvYYrtNI4YUi8rKXZMntCegrcAdsMvz1XD99sztroSckd/H9EX0CwkXZ
	 xjTd39t2zfjefzf0GXn2lq6JCa1VIuFY742G/sipfZ3MBFBzMpf6J/ZuKMulGoPOk7
	 7JPq7dkzFa/NHiXy+pb+q9jbb69T7TdCCnpoQB94wFFImYACE5F1ub2QxafltZGjlr
	 2qoLlIS8YQhih1MH7LgXVV3WkqA08SD0VsKBUetxROqWm8XyyHINaW0/ohLsxtZvMy
	 Gy0vyQfiQCvxg==
Date: Mon, 4 Mar 2024 19:45:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
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
Message-ID: <20240304-superior-vicinity-3dc6ca88141a@spud>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud>
 <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wojNABL86L/ImB3a"
Content-Disposition: inline
In-Reply-To: <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_114609_412924_44D34F72 
X-CRM114-Status: GOOD (  37.19  )
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


--wojNABL86L/ImB3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 09:37:00PM +0200, Dmitry Baryshkov wrote:
> On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
> >
> > On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
> > > On 29/02/2024 19:40, Conor Dooley wrote:
> > >
> > > > On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
> > > >
> > > >> Marc Gonzalez wrote:
> > > >>
> > > >>> As mentioned in my other reply, there are several msm8998-based
> > > >>> devices affected by this issue. Is it not appropriate to consider
> > > >>> a kernel-based work-around?
> > > >>
> > > >> Sorry, not following you here. But I'll try to answer anyway:
> > > >>
> > > >> I have understood that Device Tree is supposed to describe hardwar=
e, not
> > > >> software. This is why having this property in DT does not look rig=
ht
> > > >> place for this. For example, if the ath10k firmware is fixed then =
DT
> > > >> would have to be changed even though nothing changed in hardware. =
But of
> > > >> course DT maintainers have the final say.
> > > >
> > > > I dunno, if the firmware affects the functionality of the hardware =
in a
> > > > way that cannot be detected from the operating system at runtime how
> > > > else is it supposed to deal with that?
> > > > The devicetree is supposed to describe hardware, yes, but at a cert=
ain
> > > > point the line between firmware and hardware is invisible :)
> > > > Not describing software is mostly about not using it to determine
> > > > software policy in the operating system.
> > >
> > > Recording here what was discussed a few days ago on IRC:
> > >
> > > If all msm8998 boards are affected, then it /might/ make sense
> > > to work around the issue for ALL msm8998 boards:
> > >
> > > diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wire=
less/ath/ath10k/qmi.c
> > > index 0776e79b25f3a..9da06da518fb6 100644
> > > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > > @@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_=
size)
> > >       qmi->ar =3D ar;
> > >       ar_snoc->qmi =3D qmi;
> > >
> > > +     if (of_device_is_compatible(of_root, "qcom,msm8998")
> > > +             qmi->no_point_in_waiting_for_msa_ready_indicator =3D tr=
ue;
> > > +
> > >       if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
> > >               qmi->msa_fixed_perm =3D true;
> > >
> > >
> > > Thus, anyone porting an msm8998 board to mainline would automatically
> > > get the work-around, without having to hunt down the feature bit,
> > > and tweak the FW files.
> >
> > How come the root node comes into this, don't you have a soc-specific
> > compatible for the integration on this SoC?
>=20
> No. Ath10k uses WiFi SoC as an SoC designator rather than the main SoC.

Suitability of either fix aside, can you explain this to me? Is the "WiFi
SoC" accessible from the "main SoC" at a regular MMIO address? The
"ath10k" compatible says it is SDIO-based & the other two compatibles
seem to be MMIO.

--wojNABL86L/ImB3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYk9QAKCRB4tDGHoIJi
0kaaAQDnE4MEozONllZ+Q/SJg4H13bE1VgsWK3RoMjw0F+WHYQEAvEapGyAe9GIz
HA9NkpMj89CoBgLGj94SaMDYp4oFfgo=
=fxeV
-----END PGP SIGNATURE-----

--wojNABL86L/ImB3a--

