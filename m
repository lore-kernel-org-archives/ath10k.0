Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37324CDC19C
	for <ath10k@archiver.kernel.org>; Tue,  6 Jan 2026 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5GBjzPKN0+BwzaSKcOsnRgIWAdGRqYK34S053ES/sM=; b=X4TR+O9RjqHOOSf8+uXDapNUpv
	IAA9+KuSB1BVlPoYAVt/RC3nVpPkW92iPbm4gtc5KOXnfkv6MrFOtdK+naBLKESpJVNXEEw4CH6br
	bHUWDyHEx3ftYqJuQRUHQ5bvLfOvUKB+8EEbHlsfkTtoX2apJeZA1IHsr2CrYIT/1WL/USUxbu4Os
	LnMrV6Hsq2h/USKUC0USA5cPfwHtyXSjOpY9Yth7JcZv5oVaY7QAkx0UMmbh73tRiTgd9frHWmyRa
	NlGe+jOGQ/hwQs7ihVUbfLa8w4g7jaN3pftMTaNngTjhooMvyERxh05slNsCQ4RUxSycL5e3b6TeI
	UG5ixcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd75n-0000000D6Bj-349U;
	Tue, 06 Jan 2026 13:27:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd75l-0000000D6BV-3osl
	for ath10k@lists.infradead.org;
	Tue, 06 Jan 2026 13:27:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 04B7060144;
	Tue,  6 Jan 2026 13:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A45C116C6;
	Tue,  6 Jan 2026 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767706040;
	bh=P5GBjzPKN0+BwzaSKcOsnRgIWAdGRqYK34S053ES/sM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckf4SgKa1ru14R7kxRE1uOsG3FPfR3xJCFWZ9f+InvnJ+wh57pS0GcldaMwskVhY2
	 +Qxow6CDs4fsww/jMHuQMjC48qJlxvUMXrCA0o/FHGJ4CiPEMZv4n7Qwwxb2VjRBGU
	 VVHDhe2bHwkhHfvLIMdS9+HGqkxel5jB45DjAdaKd8HUUqKy2r1RC/GWo5sZAoFe+P
	 wOewdJphgODxZm4DwSEpAOM5ij573EevnOSL5UR+21r8mNl+9Tq8tnNeSVbbM9qIWR
	 BSct1JqmRlDuUuzixOuR9CpC5KiANiDi4W21s4P6HdKQgHRug0Vq6HKe76zm1f+xqg
	 WcvGAklpkNO6A==
Date: Tue, 6 Jan 2026 13:27:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
	Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 01/14] regulator: dt-bindings: qcom,wcn3990-pmu:
 describe PMUs on WCN39xx
Message-ID: <e5c70879-dcea-40ea-98ab-454a774e3543@sirena.org.uk>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SNU7rx7CNqi3LNfR"
Content-Disposition: inline
In-Reply-To: <20260106-wcn3990-pwrctl-v2-1-0386204328be@oss.qualcomm.com>
X-Cookie: People respond to people who respond.
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


--SNU7rx7CNqi3LNfR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 06, 2026 at 03:01:11AM +0200, Dmitry Baryshkov wrote:
> WCN3990 and other similar WiFi/BT chips incorporate a simple on-chip PMU
> (clearly described as such in the documentation). Provide DT schema
> covering other Qualcomm WiFi/BT chips to cover these devices too.

Acked-by: Mark Brown <broonie@kernel.org>

--SNU7rx7CNqi3LNfR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmldDbAACgkQJNaLcl1U
h9AZAgf/XiipI3+F+QTxwrwQRzlh0LdMCBZcR45yuHFhsU41dnP8c8jxSyBi4jha
zisYjRUaX/If0siDIbV8OcUmr3IZGW8heg5lQ9+pKZSqDLSqHik9RbaR04VV3r6N
urE8Y6dC0cfFvwQdxZxkRegQvagVL553Xq+kGNpRUGJEB6iX/8C9ulJwb4BiswHp
v8U8MxtFyxfDSNWWJ93VpoasUNKyUex+Pztdflr5sPM0yLqK0bDXWqHtOc5ymacL
zQ0tLxLeKBZaTAeSXQkvvzyYEFux+y6HaGOoz7MbJOkuxZjz10a6kRBcRwPHAci2
czf2UsuEVlaLh3bDn6IYpJ9kaukVtw==
=KbP6
-----END PGP SIGNATURE-----

--SNU7rx7CNqi3LNfR--

