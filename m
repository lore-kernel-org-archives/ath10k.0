Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E71DCCF9EE
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 00:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2WeXajEOg+HIBucEauDzL6tvQXFBWPQg9mkWjCQUjfc=; b=X2Ov+NHGucjeQeyW1Qa15s6m/b
	WbhWNp86zEN+HsR5m1xulsdsT2VxjcGvsU4EvocrV6Ynr7QIvVf9yRWD4KJUL57uVHhfBvBnNMBId
	5+BhFrT6At273+sbIOzTl6AcBl/hidMnaPlfbgdhhI2qfUNnffK6PXaCVv0Q+h8xjatRYa8v7u7/h
	M7ZUB35mYcicYMWmkC1Vss8GwBXw4+1R2oudJzyvMg39kS6imhK0uLY1lwHH8ZinCuSHNuslmeT6z
	y2hGdWHPL+NZhOYzBJanB4c/2Mw73bIwTegiq54l1+cPGMM5fngzDIFNsZNuq9t8PNObR9LI1KjCT
	VJn9xFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGYw-00000003I68-14Fm;
	Thu, 30 Oct 2025 00:30:46 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGYs-00000003I53-3Ei1
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 00:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761784238;
	bh=2WeXajEOg+HIBucEauDzL6tvQXFBWPQg9mkWjCQUjfc=;
	h=Date:From:To:Cc:Subject:From;
	b=IdLEkiY0cjzKQKrEi8Cm6UIa8sWDg4YBXsZj0sdfWjkh5JFcJSlr4XQgVzKOYl1vz
	 NQWoI6PY9bvUyFWi1W6ph5bwQfCmyLMmx5gHM8X0ZZEqkjxrpM9iZ3MFkrxHjQhg2o
	 +pZf8gMplWZqgA5LpEDdDePLvW6vsq1QBJPLLCPcrdWlJdRqzOwWBT640S/FOoPOh7
	 19XkUVuCkWm/TJ6H8k4Tvg/tl34liT2kUkXT9NCpXvJLBRi6gJRjQznHLuwYKLyyCi
	 HoH7BUaqt0PUx1+rNgzqS90g/IDP0VQhp1QfxNqly8QXjoHunWbzkOK87kj5RBTjJh
	 1k3VfU3/RD/uA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cxlQ600vPz4wMB;
	Thu, 30 Oct 2025 11:30:37 +1100 (AEDT)
Date: Thu, 30 Oct 2025 11:30:37 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Ath10k List <ath10k@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Maharaja Kennadyrajan
 <maharaja.kennadyrajan@oss.qualcomm.com>, Miaoqing Pan
 <miaoqing.pan@oss.qualcomm.com>
Subject: linux-next: manual merge of the ath-next tree with the ath tree
Message-ID: <20251030113037.1932c6d2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6.h=RHeyuNtqfndL6hyggW3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_173042_958111_4E8DFB8C 
X-CRM114-Status: GOOD (  14.45  )
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

--Sig_/6.h=RHeyuNtqfndL6hyggW3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mac.c

between commit:

  9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save confi=
guration"")

from the ath tree and commit:

  6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to av=
oid stale beacon")

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

diff --cc drivers/net/wireless/ath/ath12k/mac.c
index db351c922018,e79d457e3c03..000000000000
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@@ -4209,7 -4286,7 +4267,8 @@@ static void ath12k_mac_bss_info_changed
  {
  	struct ath12k_vif *ahvif =3D arvif->ahvif;
  	struct ieee80211_vif *vif =3D ath12k_ahvif_to_vif(ahvif);
 +	struct ieee80211_vif_cfg *vif_cfg =3D &vif->cfg;
+ 	struct ath12k_link_vif *tx_arvif;
  	struct cfg80211_chan_def def;
  	u32 param_id, param_value;
  	enum nl80211_band band;

--Sig_/6.h=RHeyuNtqfndL6hyggW3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkCsa0ACgkQAVBC80lX
0Gz9fwf9GUdRyyXnRqEaf8BfJNwgY3rYVLwA4zH6WV0jAKSwjaaptX2XRiSMKzJ7
ZWW+MCDS03Xxbkex1H2Boja2rDNDq+tXAdsMQMPKj8pTYnAdc6xxWDuPsuL3J1Y8
A1B/hLF24zy9HRWfpqNBXIKwrMF+jJ6Ff2iEnNJa2W+E5APVlNwo711gQbx9Opml
oNAx3ciJiEWDukO26VUFa0EXd/gLYDOxRdacuNtr+UL+ieiAZ3gdM0teFAYLno7L
lL6Uhc5MSdWxrkCUs9puwzdraY3c3jcDcMGum1UYetizLXQOhWJ6jbeCq9tZt//6
uDTJ9xvdfYeBF677VqYti1q8SuzaUw==
=3JsI
-----END PGP SIGNATURE-----

--Sig_/6.h=RHeyuNtqfndL6hyggW3--

