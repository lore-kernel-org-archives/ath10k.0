Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A11AC52D6F
	for <ath10k@archiver.kernel.org>; Thu,  8 Aug 2024 00:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D33cx3XCrLB+VT+exOdc1DZTElUFvm/vXNRQtYDViV4=; b=Y1hAWmiNkjwtrID6q2haiPSAD2
	vFvxkKix1mYnHNRzhnUg5LesWMNLmEKyFWoC1j0zy0TjfMWrBsNQeCWIB0Z9GOUEB1Mgc2NJLa6Sg
	/5PInDyXwmvB6U52n57xmCC5w+eOKkIhZjZ1UUoXQTCLAstn6BcJsxGEUWUMwr6oHJQFTMZfID/WE
	TkosqtOdltTQbAZag0+yDlNj7gps6qXsu53mA44HcsKxY+GNJweV7z2btyI5NwEdb2IbRAcUp+WKD
	M9MyV92S9HOMsTbB9gMFRen8phyhvwJ3Sf0LA2V+jHmzLzgTXgkvinSOBLwY1jzBB9IDvKVyX4RJm
	MXOgUrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbrG8-00000006g6U-27lf;
	Thu, 08 Aug 2024 00:44:04 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbrFx-00000006g2a-0Gog
	for ath10k@lists.infradead.org;
	Thu, 08 Aug 2024 00:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723077830;
	bh=D33cx3XCrLB+VT+exOdc1DZTElUFvm/vXNRQtYDViV4=;
	h=Date:From:To:Cc:Subject:From;
	b=V5IUzPoNgI6e9IewYkevntNhiw2IncSARxo4EkYhfNEKRVUQ/W25vQt4gyENhsJY1
	 zF0DMKq1fVGVpaw51rVEyQ+z+/0N4751o4DIHk5l+9AlrZnXJKu+AtOp4iGU6GxK5u
	 DvF1CRdvvsIxECgQgOnusew7vn98XZKfEFv8xRTfAwemcUcGEa5838bVDhc9mlpGWA
	 SeapHpQaMNGTJVLlXoYFqvfLpCfRQeR6qaZWVc4dm8mZ1nirjrEjaK42j2Pnx5wE5R
	 teiJ8SXnCz2z8xjcsjq7mP3uAFRg0tEDMe4gzGzeaJBHiPeewMdUii3yeKijn3QRUn
	 e9ggo1BeIBHRw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WfSw62jkjz4x42;
	Thu,  8 Aug 2024 10:43:50 +1000 (AEST)
Date: Thu, 8 Aug 2024 10:43:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Ath10k List <ath10k@lists.infradead.org>, Aditya Kumar Singh
 <quic_adisi@quicinc.com>, Baochen Qiang <quic_bqiang@quicinc.com>, Kalle
 Valo <quic_kvalo@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20240808104348.6846e064@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aVhgp843wQxgMkM6fC0wQpA";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_174353_412387_DDFD4BF0 
X-CRM114-Status: GOOD (  14.79  )
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

--Sig_/aVhgp843wQxgMkM6fC0wQpA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/hw.c

between commit:

  38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit path =
for WCN7850")

from the ath tree and commit:

  8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")

from the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/ath/ath12k/hw.c
index 7b0b6a7f4701,76c0e07a88de..000000000000
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@@ -925,7 -925,7 +925,9 @@@ static const struct ath12k_hw_params at
  		.acpi_guid =3D NULL,
  		.supports_dynamic_smps_6ghz =3D true,
 =20
 +		.iova_mask =3D 0,
++
+ 		.supports_aspm =3D false,
  	},
  	{
  		.name =3D "wcn7850 hw2.0",
@@@ -1003,7 -1003,7 +1005,9 @@@
  		.acpi_guid =3D &wcn7850_uuid,
  		.supports_dynamic_smps_6ghz =3D false,
 =20
 +		.iova_mask =3D ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
++
+ 		.supports_aspm =3D true,
  	},
  	{
  		.name =3D "qcn9274 hw2.0",
@@@ -1077,7 -1077,7 +1081,9 @@@
  		.acpi_guid =3D NULL,
  		.supports_dynamic_smps_6ghz =3D true,
 =20
 +		.iova_mask =3D 0,
++
+ 		.supports_aspm =3D false,
  	},
  };
 =20

--Sig_/aVhgp843wQxgMkM6fC0wQpA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma0FMQACgkQAVBC80lX
0GxNfwgAmvMublhZkhutZM2kgnrpMhJ1DZKtE9uXPXf9V40PUz6IvyG7Oa39+4jU
E3XkSTvGtwuy12vB1jPZ2QLp8LOlgEOl9Q7yIiuIzYBUIB6wN5PrGkpfopnc73nL
j52fW5k4PbSrk5OJIWRubGJV9SV0LfGJWqRqRFVq/TbbAkpWZ9PazTPEKDLuovCn
xo2LJmvgeDo9Rj3kDOjaO9CR1qUphGgLz2Xofn4G035396ydAnmtJtKpaq0pDJiM
lvfInH2V3ptpiHbRPgw/dUkscA3jh+FQFHoOzeariWDzRcxxEafrItaG1qx7BIwo
dWKdMSt52JI3VMWaQaAzC9s9/fj2dA==
=BkAT
-----END PGP SIGNATURE-----

--Sig_/aVhgp843wQxgMkM6fC0wQpA--

