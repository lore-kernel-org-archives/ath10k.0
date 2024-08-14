Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF723C52D7C
	for <ath10k@archiver.kernel.org>; Wed, 14 Aug 2024 01:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxBR2JKtbxevnnw9USR6AjGTYuarhQrbk0EjhnncH00=; b=nwKrqau8ReMjatCXTV8O1Z4SSW
	5XlQgGzLVAwBRi+sci0Cs0QxMmdq4doRb2biyKemNFOLG/C4GI9IERxUD4rZL+7ugiGD/h469e3G/
	JqgcTj89sLrbzIrYYiwDYcanKVIY93w/2JY3dKQJmwgzx13RrgFAkqcXOLd9WWdwPgBquSDwuMmMc
	H9dra+L3ba2dKlrYHIksux89H3pWG2Okg/h1Z39DQRUvaGaQFSmoRzQdqXlIIP/xgOk0DjZioWice
	QiOYIySAr5mZqvJXEpjVUFlz3amtmfi7O67AMrChvyvur6TaEoCwCLYt9O5UG9v1KN2HqKWRI8FIA
	FjAPCbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2NU-00000005K1V-3JQ5;
	Wed, 14 Aug 2024 01:00:40 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se2NR-00000005K0t-2gYV
	for ath10k@lists.infradead.org;
	Wed, 14 Aug 2024 01:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1723597231;
	bh=hxBR2JKtbxevnnw9USR6AjGTYuarhQrbk0EjhnncH00=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P1aWuNG/WVcKA6KguPTWjJoM4DHtqO4fa9ZBUKUBhGGk9WbLnL3MIEAh2KFTtDGnS
	 a9yGCewD3nEqvZYHNh6PBvKuij6LTaRz8H1nbAnoaA1X9av0Pnayu3g7b8ej+m4Ehd
	 LxfRMmL9X8X/G3rOa10xIYhcabf06uPSpHRfyPCn2cHqCmwI32MmHZfNOMOhkxaV9p
	 zxDVRHw43FKe9p5dStvaFHWxGdDXWQADbr529hGP1YfPabK0FhMAoVowbYJmDZS6d+
	 la/I33a/W3AphcMe51DuLEFTcXdi3mm0MvKQuozWZFtTGVDORK0pdk5nDLuK1L2o8f
	 HeCeZbs9Ug4Ug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wk90N03WYz4x2J;
	Wed, 14 Aug 2024 11:00:19 +1000 (AEST)
Date: Wed, 14 Aug 2024 11:00:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Ath10k List <ath10k@lists.infradead.org>, Aditya Kumar Singh
 <quic_adisi@quicinc.com>, Baochen Qiang <quic_bqiang@quicinc.com>, Kalle
 Valo <quic_kvalo@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Wireless <linux-wireless@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20240814110019.6be39d14@canb.auug.org.au>
In-Reply-To: <20240808104348.6846e064@canb.auug.org.au>
References: <20240808104348.6846e064@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c825WGxscMug2D7jB7kHQCF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_180037_990613_1F9CF139 
X-CRM114-Status: GOOD (  19.95  )
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

--Sig_/c825WGxscMug2D7jB7kHQCF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Aug 2024 10:43:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the ath-next tree got a conflict in:
>=20
>   drivers/net/wireless/ath/ath12k/hw.c
>=20
> between commit:
>=20
>   38055789d151 ("wifi: ath12k: use 128 bytes aligned iova in transmit pat=
h for WCN7850")
>=20
> from the ath tree and commit:
>=20
>   8be12629b428 ("wifi: ath12k: restore ASPM for supported hardwares only")
>=20
> from the ath-next tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc drivers/net/wireless/ath/ath12k/hw.c
> index 7b0b6a7f4701,76c0e07a88de..000000000000
> --- a/drivers/net/wireless/ath/ath12k/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/hw.c
> @@@ -925,7 -925,7 +925,9 @@@ static const struct ath12k_hw_params at
>   		.acpi_guid =3D NULL,
>   		.supports_dynamic_smps_6ghz =3D true,
>  =20
>  +		.iova_mask =3D 0,
> ++
> + 		.supports_aspm =3D false,
>   	},
>   	{
>   		.name =3D "wcn7850 hw2.0",
> @@@ -1003,7 -1003,7 +1005,9 @@@
>   		.acpi_guid =3D &wcn7850_uuid,
>   		.supports_dynamic_smps_6ghz =3D false,
>  =20
>  +		.iova_mask =3D ATH12K_PCIE_MAX_PAYLOAD_SIZE - 1,
> ++
> + 		.supports_aspm =3D true,
>   	},
>   	{
>   		.name =3D "qcn9274 hw2.0",
> @@@ -1077,7 -1077,7 +1081,9 @@@
>   		.acpi_guid =3D NULL,
>   		.supports_dynamic_smps_6ghz =3D true,
>  =20
>  +		.iova_mask =3D 0,
> ++
> + 		.supports_aspm =3D false,
>   	},
>   };
>  =20

This is now a conflict between the wireless-next tree and the ath tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/c825WGxscMug2D7jB7kHQCF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAma8AaMACgkQAVBC80lX
0GzgsQf8CVhJeXJ3Fb5qihfwfTMiMiPTEAec9mao3QEzcMpSj2k4Cx80BPSR4xzc
9NffwOXVpbfK5lQOlKO5DAL4SHXwjLHJIX2gc4pOy0WmjAygFCY3fpC6i3ivCDv/
Joy5V1yPBEUXxNKJioQOpK4T1vJsTck7YaYGEdCCOxESEwDo15ebeQBm/155Te+p
c8llPlZhi9I03Vpc+jE8rpmJRpEzH+sIq4dOUNyhmUga0WV7B/p+CV5Yg+8liKB4
wRqepGWe2JEWx5SkJqESxGmbTyjdc0TwdTeddtXQcf50fyEV/ODNheI2mJmYQx3w
hQL2b4cEirIu8JR/TWC1aTVSes6NUA==
=VV+7
-----END PGP SIGNATURE-----

--Sig_/c825WGxscMug2D7jB7kHQCF--

