Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45FAC5478C
	for <ath10k@archiver.kernel.org>; Mon,  4 Mar 2024 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdQuLhIT4gZ28jBk89LIuL/6A6yLLiL4IFmPPmPPgy8=; b=x6dnMWIx5fRRL3RnGAjsHzEiyQ
	a4tqtlqj/HuO1HurANK3Sj4hfovTIUtrdfSQvbJ8M5teSP6e5tOldhFcgcEVadtPLP26NmVWR+7Lc
	IAiRrqius+iJi3/CVvxzo98rjqO7UDHPAyahfW0YU8132tgzdBF+RjrAc9v4NI1Qfe3BNa+eVm+EX
	H+qvmi/ZtRqYI+gsWKakXghLtPaNPJLZDGk9dlNE23bhg2UJh5fvMfw0kUoxYfWOz49WnMiEHNDoq
	iZ10GRvzUQf2J6esVJqpfs/3fh4+YeipxBG63ITq7duoMJaTbGSy2nmFRw4w5HYGyvgvtLcuhm6zK
	/DHp3DtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEka-0000000AYmB-25uq;
	Mon, 04 Mar 2024 20:17:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEkX-0000000AYku-0lxO
	for ath10k@lists.infradead.org;
	Mon, 04 Mar 2024 20:17:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9FC4CE1704;
	Mon,  4 Mar 2024 20:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8EBCC43142;
	Mon,  4 Mar 2024 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709583442;
	bh=fdQuLhIT4gZ28jBk89LIuL/6A6yLLiL4IFmPPmPPgy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BX8BTR4DTDsIT9JEqzQ3a8nVPh9qHEAtk9n88T6ONvZp2rL3oR3SP+bZfgZ+wXC5J
	 AJX9ROfocBSqp1GQHXXjVq017arP5uRHkI9eQbouzmUWzms+0qVWEGhJbJgmca3n7S
	 Hgls2ricKb7Dk2B/GsREoeW9vuNJ30xUY6kUQR5FrVErvuHSqO6Of60nFAVZP8fL8t
	 C6tOLtGPXrPgogYREoW+2ACsXRRpKfKuITRe2my24xAs2lihTXGf1ciaeGTgYHtr5H
	 qBaPxPh5cuKimX2xb5gcFAlBFrmiWHxAWK7yJuwTdyMRfAH4yqG9p1Sd3UjexfOtM3
	 PKNietLUb60bQ==
Date: Mon, 4 Mar 2024 20:17:17 +0000
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
Message-ID: <20240304-privacy-registrar-93c48ab1b9c5@spud>
References: <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr>
 <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr>
 <87wmqoilzf.fsf@kernel.org>
 <20240229-ageless-primal-7a0544420949@spud>
 <68a49964-7c05-4575-a4f3-35848c08fefc@freebox.fr>
 <20240304-component-animator-e2ee0ab7574a@spud>
 <CAA8EJpq5HQaO2E2Pd7yqUTsWyQ_pLDdyoWng8QmWTzYn5fv3PQ@mail.gmail.com>
 <20240304-superior-vicinity-3dc6ca88141a@spud>
 <CAA8EJprMG=fY-G-X03bm7MMhcua9axjw5ULZz0efgHxwzgrdVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j2/bmFVB0jn7K/1X"
Content-Disposition: inline
In-Reply-To: <CAA8EJprMG=fY-G-X03bm7MMhcua9axjw5ULZz0efgHxwzgrdVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_121725_592031_D2C1E52F 
X-CRM114-Status: GOOD (  19.93  )
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


--j2/bmFVB0jn7K/1X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 04, 2024 at 09:59:13PM +0200, Dmitry Baryshkov wrote:
> On Mon, 4 Mar 2024 at 21:46, Conor Dooley <conor@kernel.org> wrote:
> > On Mon, Mar 04, 2024 at 09:37:00PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, 4 Mar 2024 at 21:34, Conor Dooley <conor@kernel.org> wrote:
> > > > On Mon, Mar 04, 2024 at 05:21:37PM +0100, Marc Gonzalez wrote:

> > > > > Thus, anyone porting an msm8998 board to mainline would automatic=
ally
> > > > > get the work-around, without having to hunt down the feature bit,
> > > > > and tweak the FW files.
> > > >
> > > > How come the root node comes into this, don't you have a soc-specif=
ic
> > > > compatible for the integration on this SoC?
> > >
> > > No. Ath10k uses WiFi SoC as an SoC designator rather than the main So=
C.
> >
> > Suitability of either fix aside, can you explain this to me? Is the "Wi=
Fi
> > SoC" accessible from the "main SoC" at a regular MMIO address? The
> > "ath10k" compatible says it is SDIO-based & the other two compatibles
> > seem to be MMIO.
>=20
> Yes, this is correct. MSM8996 uses PCI to access WiFi chip, MSM8998 uses =
MMIO.

Thanks.

A SoC-specific compatible sounds like it would be suitable in that case
then, to deal with integration quirks for that specific SoC? I usually
leave the ins and outs of these qcom SoCs to Krzysztof, but I can't help
but wanna know what the justification is here for not using one.

--j2/bmFVB0jn7K/1X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeYsTQAKCRB4tDGHoIJi
0iDsAQD8SiNyQlk9LJ1lpYenpBT32QnTIsXZ1iSWp5Vcc3GxugEAsv/DhNE2Uf80
4McH9vMHXRTxAwf9McX9vAtmpyNc1QM=
=c99j
-----END PGP SIGNATURE-----

--j2/bmFVB0jn7K/1X--

