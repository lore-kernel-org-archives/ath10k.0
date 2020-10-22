Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from caillette.gueux.org ([2a0e:c400:ff:f010:ffff:ffff:ffff:ffff])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVeHP-0006v1-41
 for ath10k@lists.infradead.org; Thu, 22 Oct 2020 17:21:36 +0000
Received: from localhost (localhost [127.0.0.1])
 by caillette.gueux.org (Postfix) with ESMTP id B8A815E00A5
 for <ath10k@lists.infradead.org>; Thu, 22 Oct 2020 19:21:23 +0200 (CEST)
Received: from caillette.gueux.org ([127.0.0.1])
 by localhost (caillette.gueux.org [127.0.0.1]) (amavisd-new, port 10044)
 with LMTP id rF2gu_MvTi2r for <ath10k@lists.infradead.org>;
 Thu, 22 Oct 2020 19:21:16 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.5.148])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256 client-signature RSA-PSS (1024 bits) client-digest SHA256)
 (Client CN "F????lix Sipma", Issuer "F????lix Sipma" (not verified))
 (Authenticated sender: gueux)
 by caillette.gueux.org (Postfix) with ESMTPSA id 5843C5E00A4
 for <ath10k@lists.infradead.org>; Thu, 22 Oct 2020 19:21:16 +0200 (CEST)
Date: Thu, 22 Oct 2020 19:21:13 +0200
From: =?utf-8?B?RsOpbGl4?= Sipma <felix+kernel@gueux.org>
Subject: [PATCH] Revert "ath: add support for special 0x0 regulatory domain"
Message-ID: <20201022172113.GA1367233@capeo.gueux.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1764058202245037011=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org


--===============1764058202245037011==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Sorry if I break the thread, I'm not subscribed and do not have access=20
to the message-id.

I noticed the last message about this issue was on August:
https://lists.infradead.org/pipermail/ath10k/2020-August/011785.html

I got caught by this bug, too. I use a Compex wle900vx (qca988x).

Is there something preventing=20
https://patchwork.kernel.org/project/ath10k/patch/20200527165718.129307-1-b=
riannorris@chromium.org/
=66rom being merged?

Regards,

--=20
F=C3=A9lix

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR6zeIsS8L0XLQfqiQBpfxHUdFE8AUCX5G/hQAKCRABpfxHUdFE
8GMdAPoDbLpfPQlhHxGVEZEEE0Xj4WDsI9jf5BXBTSD13iTyYAEAg1iUHndAslec
82rc0H1ChSFawhRZBKqQcZSmUrs5Lwo=
=sVaG
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--


--===============1764058202245037011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1764058202245037011==--
