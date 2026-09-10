Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B512AC79F9F
	for <ath10k@archiver.kernel.org>; Thu, 10 Sep 2026 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EmN0YUs0zg3/eR5WqsbGvMfqkpFUal7coFDJ8WpI/ic=; b=flr70upb+rCfRfpIQWbiBDl1je
	9UmWTITvft5QB8lon+MyIrw5RDE+0EBVPVNQCHnoHp9GObidugbQwUNjUlaXo7B+jdHU+OwkxZcG5
	rXlVklN/xKv4dL3PvW+ecACVICEUXl39k501LtFUXFicRj+s4dnxnsBGBfgOihjeXEwenI3drXoFF
	vkFZVVmuEHk4hNJATQOS4MPgO8lx3FewsWNDUWGiV6aSMDvH1OH2/+W84P7SbeojGqciZeyof5jlP
	X7TDB+Mx+BHTKBuMZqyOV51YncdfOvFZBVuAYfhsadHSVsOeN8Mce2oSAp+RqKkHM1YcCOzQmfDr4
	7yj9ftyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4egZ-0000000ESBP-3z7s;
	Thu, 10 Sep 2026 13:19:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4egY-0000000ESBH-334L
	for ath10k@lists.infradead.org;
	Thu, 10 Sep 2026 13:19:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 484E540F5F
	for <ath10k@lists.infradead.org>; Thu, 10 Sep 2026 13:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312781F000FF;
	Thu, 10 Sep 2026 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789046366;
	bh=EmN0YUs0zg3/eR5WqsbGvMfqkpFUal7coFDJ8WpI/ic=;
	h=Date:From:To:Cc:Subject;
	b=M0lofyxX3ia8+tA4nKTdop8wrI9i5dSk5dTQbiB2SuzERdVUicqHB2mwIA5DpTRMm
	 DUHmFGGR3ZH1Q5EWvFOTLys6ZDTOF9sWDw2dN5RwCLf3UFfrdC0m7EPEObVVNGO09c
	 pk0NXRvXXlAxHrvw976hX4BxYHIN/uH0s/Ay47AU4lnCN5UNYIewFSw5RfUUOVTc0n
	 04MoSYJswy2pif8PraqK9UnQacCZ6rDIJllSvgMVbhOQtUBgRUGyR+OtmQldodiWn5
	 A5OomxmeuZcaVN81ecBWii7mQl2Za/Nk5RpgXV7+FQcw4YrmJieBVaQu/aXTnjjuvh
	 zZSG96d1vT1Zw==
Date: Thu, 10 Sep 2026 14:19:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the ath tree
Message-ID: <aqKuWv0oUjGHSMIV@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aDFfQRaCh0DaRwIg"
Content-Disposition: inline
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


--aDFfQRaCh0DaRwIg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  bea22601ee301 ("wifi: cfg80211: don't free driver-owned scan requests")

Fixes tag

  Fixes: 4a58e7c38443 ("cfg80211: don't 'leak' uncompleted scans")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--aDFfQRaCh0DaRwIg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqirloACgkQJNaLcl1U
h9A1jQf8CO7N0SEODx9gQ+e9UFkQd2Tb82JAEKDSZh0xlMxQYRe9lWCf1TmqMKey
cmTQgbc5b15JF++dIexZTfJR7YW7oCv69zdTUMs0CIz3dreuXVwNKPSJXP6Ycw1Q
LWxM4FN+V5fQ8OmCQ3edJxpVZYXNCtZjLnPN/cH/d1+4xt7qvniJKwahUOnZB56y
xFmuTRUZBL0NnKAMexB666SlRb8afpPVJpMTI6C32s4NczDfYFt9kIKyrrKMt3Zj
RTxwe/R1D0+SFFkvFV98p7eLyTK3NI9aAq5Pw7NSH67dpPsMKSEkFKo6qjAtngfp
prcOVf5z1uaUlkQCx4lL5PR+/byYUQ==
=lLQZ
-----END PGP SIGNATURE-----

--aDFfQRaCh0DaRwIg--

