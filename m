Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B59C2A072
	for <ath10k@archiver.kernel.org>; Mon,  5 Jan 2026 04:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KM0IYgL+E+rOotctSZrIyDzov9FtwrXaHMIOytlyfwo=; b=kIft04InpSxotXqHHmxwdtN0Zb
	6j4SF4ZXcWF7mBM4cjHHmu+B8ah744BYyo1sOg4NgSQ9AmuxH1YcRB7i7x12IPIlAtgN0zzebcuE3
	YQ6P+DGoWH4Tc8qeKiqS2+/1NHBbrffXB8uge4+noiYfW5qbJhKRVaR9jXtVBwRdhNIZ8o8a6OFtj
	7FXaeEmrEU1nuiCI6HT+66PDj/apRCQP6DGAL+sHAqEPDoNQCLCxbGxBsAf5pNwkq9VQRVp5xav/P
	3d0bwOtd6SeZf52DNGu15gANO3A8DzZ8gnX9NUVIOJD+ci+jAVfUopNqFlo6pkKQOQBQNGPNRKT74
	hqT7fqng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccQd-0000000Ai3v-0WTM;
	Mon, 05 Jan 2026 04:42:51 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccQZ-0000000Ai3I-2gF7
	for ath10k@lists.infradead.org;
	Mon, 05 Jan 2026 04:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767588164;
	bh=KM0IYgL+E+rOotctSZrIyDzov9FtwrXaHMIOytlyfwo=;
	h=Date:From:To:Cc:Subject:From;
	b=SThXviUy1WMW6dHa7UqioOgKAqA4Co4/PZAra/oBJ7wTzFZrbYzgfTr0KqMtmuxOE
	 IoOgLXc9QjxuiktvZjSzQNXdot6xHUtToykROln7dNVO/KyV5B4EMqYQG91xvt8Zjh
	 2dw+okgK7rH0A6aDQHCmZerFHckmJBMR7lA2/peH4ZPz21sM7+ZqBTz877Vr4o/rKZ
	 Wmdya3WE+xd/Odn93PIuwLcP0yvs2vAZk/4RlPZlGxKznvs7UTAmkrn9CjCUx3/X3e
	 tjZfWZaDerGXwtuD7xwefVH6BL1O5Kt0doF7Qev/qQRvZSuML+LpABlF85MmlQfO3f
	 8Ff0CH3HakN1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl1r35CpGz4w26;
	Mon, 05 Jan 2026 15:42:43 +1100 (AEDT)
Date: Mon, 5 Jan 2026 15:42:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Ath10k List <ath10k@lists.infradead.org>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Kiran Venkatappa
 <quic_kiranv@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>
Subject: linux-next: manual merge of the mhi tree with the ath-next tree
Message-ID: <20260105154243.7cd5d049@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dwyl=qoOBjFf8weXgWQttsc";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_204248_089910_D2257109 
X-CRM114-Status: GOOD (  20.49  )
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

--Sig_/dwyl=qoOBjFf8weXgWQttsc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mhi tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mhi.c

between commits:

  7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated =
file")
  a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 sp=
ecific components")
  bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* fo=
r clarity")

from the ath-next tree and commit:

  51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL cha=
nnels")

from the mhi tree.

I fixed it up (I used the former version of this file and then
applied the following merge resolution patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

=46rom 667166ff448d06ed3ef9671bf6c8fe7337b71b0a Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Jan 2026 15:39:19 +1100
Subject: [PATCH] fix up for "net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels"

interacting with commits

  7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated =
file"
)
  a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 sp=
ecifi
c components")
  bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* fo=
r clarity")

from the ath-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wire=
less/ath/ath12k/wifi7/mhi.c
index b8d972659314..988affafcfd1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_qcn9274[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D false,
 	},
 	{
 		.num =3D 21,
@@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_qcn9274[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D true,
 	},
 };
=20
@@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_wcn7850[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D false,
 	},
 	{
 		.num =3D 21,
@@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_wcn7850[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D true,
 	},
 };
=20
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/dwyl=qoOBjFf8weXgWQttsc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbQUMACgkQAVBC80lX
0GxBUggAmkD+perai2g191EGYlpdqfBI+KTIVetnYPkdDxV/L+PS9ahK1RGvM63N
eSG7s3ciyg3XJifzAaQTxH9MtvEVE/HdyKF9Xn0iG8QNAvTFVmdJxRY6FwS02Y3P
i4II+iBDNi/3IQfxPFQcH/13Zp8YnnBMqXa2cgZtNXt6PaWd8LKRDMSMhsEn0rM0
0wjm8TRNoiInCNJu3p06Zn8dxP2yAubnPrAhMlLR6EGoi6LjyC4wN+dV/pg1V3UM
RcqaX88f76VIxwra5Xv71gp4dixhLgdC0C5Gem3hp5xcMN6YqQzNeprZfuzbqmzW
s4VgYVbGZ9YZMaA+gA82IZ3j2Z3e4w==
=blP5
-----END PGP SIGNATURE-----

--Sig_/dwyl=qoOBjFf8weXgWQttsc--

