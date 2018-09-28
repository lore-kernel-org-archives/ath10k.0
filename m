Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.mailbox.org ([80.241.60.212])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5yRj-00061o-2A
 for ath10k@lists.infradead.org; Fri, 28 Sep 2018 19:29:05 +0000
Received: from smtp1.mailbox.org (unknown [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 4EB824974A
 for <ath10k@lists.infradead.org>; Fri, 28 Sep 2018 21:28:49 +0200 (CEST)
Received: from smtp1.mailbox.org ([80.241.60.240])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id 14t4v-EzfVts for <ath10k@lists.infradead.org>;
 Fri, 28 Sep 2018 21:28:48 +0200 (CEST)
From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Update board-2.bin files in linux-firmware
Message-ID: <9f53fa8a-89cf-2736-7832-5e4707e25c75@hauke-m.de>
Date: Fri, 28 Sep 2018 21:28:44 +0200
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9126863824080454936=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9126863824080454936==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GPv5qHZEIku52HHAMlKTBzwEuHVy3q1lh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GPv5qHZEIku52HHAMlKTBzwEuHVy3q1lh
Content-Type: multipart/mixed; boundary="uVHzyzXSOVfPMaqORjTWexngvEbqBTdae";
 protected-headers="v1"
From: Hauke Mehrtens <hauke@hauke-m.de>
To: ath10k@lists.infradead.org
Message-ID: <9f53fa8a-89cf-2736-7832-5e4707e25c75@hauke-m.de>
Subject: Update board-2.bin files in linux-firmware

--uVHzyzXSOVfPMaqORjTWexngvEbqBTdae
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

the ath10k-firmware repository already contains updated board-2.bin
files with support for more devices. Please also update the board-2.bin
files shipped in the linux-firmware repository as they are normally
taken by distributions.

Hauke


--uVHzyzXSOVfPMaqORjTWexngvEbqBTdae--

--GPv5qHZEIku52HHAMlKTBzwEuHVy3q1lh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEyz0/uAcd+JwXmwtD8bdnhZyy68cFAluugO8ACgkQ8bdnhZyy
68dXeQf/RKiI9tc5vEz8xgTJnuJV7F22k71ELm1E+s2rOwCCOtEVnlLO1i4B3oQU
UPNkMzqIg1oVpazS/SNRqIKWIUvv+YXEQEZkS3ZS72NwK4OoeydNwzeIeQyJTZrt
YbQ/RZI8hmJWwLivhYMgc0uEI12euK4fqWnsdIZBuK3TmF/b+7HiQWt99H1+3S7f
xIM9Cx/IZcNOGUpskHTXCRpBDZItl9vu87HlhDkrwdsdh5V5iYWXIR9Z8arw0yoH
FU2LAbKYdiwhd0SKOI2MhCUNxc/Qvj0aeL1HThlk+qPU+vNaZwpsfCYC5bYfDp4e
LT6YEW5Wl7iX1Jmn6X43yVvUoOLv5w==
=ruvH
-----END PGP SIGNATURE-----

--GPv5qHZEIku52HHAMlKTBzwEuHVy3q1lh--


--===============9126863824080454936==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============9126863824080454936==--
