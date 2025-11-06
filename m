Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897C7CCF9F8
	for <ath10k@archiver.kernel.org>; Thu,  6 Nov 2025 00:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vmvg9PQucrM9XxyCcYL1ru8Zcq3bHljcwVp773OjC68=; b=TwjSIvjLGh7/88h0rLDsFmwKQJ
	9qWj9m0dGiDydKh2VcafMUoWoVjFM6d3H4LupNHGG/3xFOEm5XmNjrbKM0MQr89cZeWpN2XOu8g9H
	4+rdPTqdXwXFvYTvEweU4AHd0PFBqTA+JGaGlb8WRPiq3BCpw4tF6AMjvePZkbuBX97qXGDTPwH5y
	DhavCIPLOpTlGdF0fAv6M5SDBGUWRx8yDUSobOLsSM4a68ucdFujcFdqQnZFMIbV5uMA3gIxEYXgu
	gRARpRUNbQxORWxSfmtyYYPwBuGwaUMR3YmiH5xUPVrEaTJyZDD61U3wTJaF86ew861MKy3WFDqtv
	PujjusRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoIu-0000000EfS7-2bld;
	Thu, 06 Nov 2025 00:56:44 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoIr-0000000EfQj-3NP1
	for ath10k@lists.infradead.org;
	Thu, 06 Nov 2025 00:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762390597;
	bh=Vmvg9PQucrM9XxyCcYL1ru8Zcq3bHljcwVp773OjC68=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SYeTmXSO4Jihd8mmRX6XpxoQiMhI+p60/y9ve/mTwdmT6Au/J/3v/bqr46TPio/FZ
	 WUYXmPGM27qcGMHdLMGHnVOzLp4VdQQwcEcOtXmF6LO7/ebkPxc56tVpAn1juy2rbD
	 bPnroJbfyDppcVAvqyqikjFUmlcZWY9PDA6R+XUbth/iL57jdZpmCMMbeoOnIYtuBF
	 A5oIDS39GDRzxeIIU1caOg25n8BQkei3+cYGIJYUf8lXOX9AxdLv6WKhzA+XdLoI0E
	 eDTRbUEAii78SNY1X1yyJdRv+efofmgs6TMCKsOaXj12yvOtPh19O+1NEiVZ/J9oHG
	 ckwYRpe25ZluQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d23fr4Y9zz4w9q;
	Thu, 06 Nov 2025 11:56:36 +1100 (AEDT)
Date: Thu, 6 Nov 2025 11:56:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Ath10k List <ath10k@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Maharaja Kennadyrajan
 <maharaja.kennadyrajan@oss.qualcomm.com>, Miaoqing Pan
 <miaoqing.pan@oss.qualcomm.com>, Wireless <linux-wireless@vger.kernel.org>
Subject: Re: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20251106115636.7ab861b3@canb.auug.org.au>
In-Reply-To: <20251030113037.1932c6d2@canb.auug.org.au>
References: <20251030113037.1932c6d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2l67aILM2GZVGRsolWjDVnl";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_165642_258150_C905B7E5 
X-CRM114-Status: GOOD (  19.92  )
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

--Sig_/2l67aILM2GZVGRsolWjDVnl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 30 Oct 2025 11:30:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the ath-next tree got a conflict in:
>=20
>   drivers/net/wireless/ath/ath12k/mac.c
>=20
> between commit:
>=20
>   9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save con=
figuration"")
>=20
> from the ath tree and commit:
>=20
>   6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to =
avoid stale beacon")
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
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/net/wireless/ath/ath12k/mac.c
> index db351c922018,e79d457e3c03..000000000000
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@@ -4209,7 -4286,7 +4267,8 @@@ static void ath12k_mac_bss_info_changed
>   {
>   	struct ath12k_vif *ahvif =3D arvif->ahvif;
>   	struct ieee80211_vif *vif =3D ath12k_ahvif_to_vif(ahvif);
>  +	struct ieee80211_vif_cfg *vif_cfg =3D &vif->cfg;
> + 	struct ath12k_link_vif *tx_arvif;
>   	struct cfg80211_chan_def def;
>   	u32 param_id, param_value;
>   	enum nl80211_band band;

This is now a conflict between the wireless-next tree and the wireless
tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2l67aILM2GZVGRsolWjDVnl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkL8kQACgkQAVBC80lX
0GyvVQf+NOSIdJpJoqqqMOPrC3ImZTPukpFKJir+EkjlJ03KVa5kXIFB3E+05KI+
vr9VI65YX+MVbxmnAjDljyiEp1RY02rn2DOJCOOR4bp4ImP0nent3QbazODcguea
/EKTLPqMh2NX4fjwcptG2Xyf7iga8Or1WnJWHSDoCWWqlyo4YLNTpQm/OaM35Evg
eJ2vCXWkP+1QaLa8O7w7ogGQ6O9bizTYXN7CSHwl3IBK1Tn6XcM/T7Iftlz0oiZ9
Taj82PcPsUNbDjp58ZX9SL7WPNjvaxeE7aWOS4TisVhh3vwrkVEx2TW+DJrrnEdL
gEDzD9FN4FJAEm7kd/HEYK/dPPQCOg==
=d+pj
-----END PGP SIGNATURE-----

--Sig_/2l67aILM2GZVGRsolWjDVnl--

