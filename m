Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C46C48BF6
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 19:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d24xKCsbJNW5wQGM7bixqOzcT0K7DhmJFs+hSZ90oKQ=; b=OKUx2MB9qjubzNxVypLIaEBhQj
	A0re9rAb+poomvO6VsIe5HnGfXjrzZAQYW+0lnH0xhbl+lzzNtDIM2g8OzLSx0ICmTkvicAY+qhJW
	doN/z2bfqpmSJBDKuEg6BOhDV/WjpODAftuc5hCjhGg1k9kw9u0UceyLLl2sGCdT0BgZ6fH3JsTSq
	EW/NlXKCkWW20uTOIOYHOeWfqNNFG8Tay0UHnu6PWzRSFhrmOozdnZRbnRxTxBXltN3DTQ4k8sBou
	DaxraqPQHyWIomu2qOWz7kGLRAknOBwwKDGCTR1tkcp2HfWCFh8HO7Qkje9gy7mfCdoulCKSBh8dX
	I2K383Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhE56-0000000ASW5-0L10;
	Mon, 04 Mar 2024 19:34:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhE52-0000000ASV0-2PHg
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 19:34:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5D430CE13A0;
	Mon,  4 Mar 2024 19:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06443C433F1;
	Mon,  4 Mar 2024 19:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709580869;
	bh=hfPu6EysdEbjriYSDjgUpEYkvags1PNmUGb2z5pWclw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/6bN++KlvhxwGzW8fk9o6qDNjmeFkSZIuwI+dSb0H8FKkH/2Gk+XknF5dHn8clxI
	 v9Vo2AdMK9uu5/Juq87GzpxCFlUhTLjJvn6Ql9HY3YhQ6/xclXTPPSKhHR6yhCR/bV
	 kSN4tD5uWhSqqLJhs2+GwF+IoVavhPYOafTiVFMPxH7W7Um7TZNH3e01UWVbdH5Q4T
	 GkLwoIybbltYihMGQa7Gmfqap08PwBWJlgGyQuOUe4+ppvPzUjfjDjzShTDXVMz4E4
	 p2Zco/h4/LTDXalQ1nnrAiQ0FQ9fDqk8UuBPpZ6ak74mLYUxnTaTF/N99GXYUKZpmp
	 rcV/h1uJQ9Pmw==
Date: Mon, 4 Mar 2024 19:34:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k <ath10k@lists.infradead.org>,
	wireless <linux-wireless@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Message-ID: <20240304-component-animator-e2ee0ab7574a@spud>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bhDdbVFfGqGZqHQo"
Content-Disposition: inline
In-Reply-To: <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_113432_995524_A36FBB32 
X-CRM114-Status: GOOD (  31.04  )
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


--bhDdbVFfGqGZqHQo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:
> On 29/02/2024 19:40, Conor Dooley wrote:
>=20
> > On Wed, Feb 28, 2024 at 06:37:08PM +0200, Kalle Valo wrote:
> >
> >> Marc Gonzalez wrote:
> >>=20
> >>> As mentioned in my other reply, there are several msm8998-based
> >>> devices affected by this issue. Is it not appropriate to consider
> >>> a kernel-based work-around?
> >>
> >> Sorry, not following you here. But I'll try to answer anyway:
> >>
> >> I have understood that Device Tree is supposed to describe hardware, n=
ot
> >> software. This is why having this property in DT does not look right
> >> place for this. For example, if the ath10k firmware is fixed then DT
> >> would have to be changed even though nothing changed in hardware. But =
of
> >> course DT maintainers have the final say.
> >=20
> > I dunno, if the firmware affects the functionality of the hardware in a
> > way that cannot be detected from the operating system at runtime how
> > else is it supposed to deal with that?
> > The devicetree is supposed to describe hardware, yes, but at a certain
> > point the line between firmware and hardware is invisible :)
> > Not describing software is mostly about not using it to determine
> > software policy in the operating system.
>=20
> Recording here what was discussed a few days ago on IRC:
>=20
> If all msm8998 boards are affected, then it /might/ make sense
> to work around the issue for ALL msm8998 boards:
>=20
> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless=
/ath/ath10k/qmi.c
> index 0776e79b25f3a..9da06da518fb6 100644
> --- a/drivers/net/wireless/ath/ath10k/qmi.c
> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> @@ -1076,6 +1076,9 @@ int ath10k_qmi_init(struct ath10k *ar, u32 msa_size)
>  	qmi->ar =3D ar;
>  	ar_snoc->qmi =3D qmi;
> =20
> +	if (of_device_is_compatible(of_root, "qcom,msm8998")
> +		qmi->no_point_in_waiting_for_msa_ready_indicator =3D true;
> +
>  	if (of_property_read_bool(dev->of_node, "qcom,msa-fixed-perm"))
>  		qmi->msa_fixed_perm =3D true;
> =20
>=20
> Thus, anyone porting an msm8998 board to mainline would automatically
> get the work-around, without having to hunt down the feature bit,
> and tweak the FW files.

How come the root node comes into this, don't you have a soc-specific
compatible for the integration on this SoC?
(I am assuming that this is not the SDIO variant, given then it'd not be
fixed to this particular implementation)

--bhDdbVFfGqGZqHQo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYiQAAKCRB4tDGHoIJi
0gLiAP9ae+USWPlOTK3qJiAXdwckG5buGi5gBreOCjcOL9NtDQD/Uvk0cIeTq05/
61GvL37kjGGBqpiFoPi5PQwgR+EUHAE=
=rob9
-----END PGP SIGNATURE-----

--bhDdbVFfGqGZqHQo--

