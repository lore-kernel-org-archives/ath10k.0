Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B4CC4345F
	for <ath10k@archiver.kernel.org>; Thu, 25 Apr 2024 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4x4Lmt+cQRG94onurPrKbBq2z3g90UEAceM4vYt2Vk=; b=SwN0LmNJEiPl/VCHMoTXl+fv7J
	MOlLZod+nHwIxaBzoxAoRGyWY8eSVUGl1jsjjbuck7kui81SmdNMs1YKJkknDOw7oLgilXPSMcIgR
	g4ttQgskqQDV2mKWFjp4D1CQ0i7q+bMc6udG0PKqZMhCusetx6Ce8EYt5+zVUNPdP87+2YH2DQUyr
	ZeIC/uMYopAJI/rpg/cbrxaO56gcx2C5BNFqBqw/kxAbk5H7Dgu/0TvG6/8ISF2tGWCP26qi0uOsA
	WamQbqtgoYsf9kWYszOVxM0SUnToJuoEZJaRSwhrQCbfCB4ud3EXqWUBrJg2MnBJYDMlkXePiJNA+
	WqEgoC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Yx-00000009HV5-3WZS;
	Thu, 25 Apr 2024 16:03:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01Yu-00000009HUI-0id8
	for ath10k@lists.infradead.org;
	Thu, 25 Apr 2024 16:03:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEB2F61E7E;
	Thu, 25 Apr 2024 16:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF513C113CC;
	Thu, 25 Apr 2024 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714060982;
	bh=F4x4Lmt+cQRG94onurPrKbBq2z3g90UEAceM4vYt2Vk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLKO3pOkjaMo3fAat8eU382biRncn++pQr4l1+5HlIi6MXlTJmnW1AxW6Yg02ox3W
	 HuM4YCE4jQIf+OVbZXvbGqkUaFJg8m43F+6D2Bxe2nvDcRpOZN+346vY1JhyVaOkrk
	 Nbt+nIvILJwR3TzhhD0tnE28iyucWIHJUVF0B6iWgplVHMB51dZnTSrZjujS0nYYYp
	 8Bkzbncn3Ml0uuM78m2ExhGe2rjj2ep4e0z4f01hnA+pSeqT9lSDukD2awhSV75CjF
	 sUBoBM5FHC9TahI+oeFZ6mFXTH9/Rz7p2tQ1NxRj/+XAtbcntfz8ThbFUI3XQB33c5
	 KbPItXBjw46ZQ==
Date: Thu, 25 Apr 2024 17:02:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k <ath10k@lists.infradead.org>,
	wireless <linux-wireless@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>,
	MSM <linux-arm-msm@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Arnaud Vrac <avrac@freebox.fr>,
	Bjorn Andersson <andersson@kernel.org>,
	Jami Kettunen <jamipkettunen@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
Message-ID: <20240425-monopoly-barn-45608dae0996@spud>
References: <502322f1-4f66-4922-bc4e-46bacac23410@linaro.org>
 <0ca1221b-b707-450f-877d-ca07a601624d@freebox.fr>
 <CAA8EJppeREj-0g9oGCzzKx5ywhg1mgmJR1q8yvXKN7N45do1Xg@mail.gmail.com>
 <87ttkh49xi.fsf@kernel.org>
 <e804b257-4dc0-45f1-a5c5-66bda51cf296@freebox.fr>
 <87h6gh406w.fsf@kernel.org>
 <ad5e178b-cd64-4a87-8994-f917993f3bbb@freebox.fr>
 <871q6tu6bn.fsf@kernel.org>
 <de65290c-0f67-4499-ba28-a460e6d6e419@freebox.fr>
 <87msphsb3b.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tiPZAU7Mew+vAoOh"
Content-Disposition: inline
In-Reply-To: <87msphsb3b.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_090304_399973_E05347FA 
X-CRM114-Status: GOOD (  17.81  )
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


--tiPZAU7Mew+vAoOh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2024 at 06:42:16PM +0300, Kalle Valo wrote:
> Marc Gonzalez <mgonzalez@freebox.fr> writes:
>=20
> > On 25/04/2024 11:42, Kalle Valo wrote:
> >
> >> Marc Gonzalez wrote:
> >>=20
> >>> Do you prefer:
> >>>
> >>> Option A =3D never waiting for the MSA_READY indicator for ANYONE
> >>> Option B =3D not waiting for the MSA_READY indicator when
> >>> qcom,no-msa-ready-indicator is defined
> >>> Option C =3D not waiting for the MSA_READY indicator for certain
> >>> platforms (based on root compatible)
> >>> Option D =3D some other solution not yet discussed
> >>=20
> >> After firmware-N.bin solution didn't work (sorry about that!) my
> >> preference is option B.
> >
> > Actually, Option B is this patch series.
> > Could you formally review it?
>=20
> I'm happy with this series and would take it to ath.git, just need an
> ack from DT maintainers:

As far as I can tell, Krzysztof wanted a commit message update for 1/3.
Usually this dts patch would go via the qcom dts tree, so presumably
there's a need for an Ack from Bjorn or Konrad?

>=20
> https://patchwork.kernel.org/project/linux-wireless/patch/84f20fb5-5d48-4=
19c-8eff-d7044afb81c0@freebox.fr/
>=20
> > Perhaps one thing I could do slightly differently is to NOT call
> > ath10k_qmi_event_msa_ready() a second time if we DO receive the
> > indicator later.
>=20
> Good point. And maybe add an ath10k_warn() message so that we notice if
> there's a mismatch.
>=20
> --=20
> https://patchwork.kernel.org/project/linux-wireless/list/
>=20
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

--tiPZAU7Mew+vAoOh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZip+sAAKCRB4tDGHoIJi
0o+YAQCCZYEZ2U1aVxSGNQuMVNcvcuOmlw4+qtZjc2LH2bDn7wEA0lVi4wIeNh+F
ZbiMp3gzzAKwmfNX3gcOma5h23G0Rgs=
=DCf+
-----END PGP SIGNATURE-----

--tiPZAU7Mew+vAoOh--

