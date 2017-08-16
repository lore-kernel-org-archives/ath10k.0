Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from turtle.smart-cactus.org ([163.172.166.228]
 helo=mail.smart-cactus.org)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhnkG-0000Lo-R6
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 02:07:46 +0000
From: Ben Gamari <ben@smart-cactus.org>
Subject: Re: QCA 9880 probe failure
In-Reply-To: <CAK3eJOBDNLw1oLZHLdBWKHe2KBRwOv3ZUHC8Sn1_v3a7w7uT6w@mail.gmail.com>
References: <87fuctfzqp.fsf@ben-laptop.smart-cactus.org>
 <CAK3eJOBDNLw1oLZHLdBWKHe2KBRwOv3ZUHC8Sn1_v3a7w7uT6w@mail.gmail.com>
Date: Tue, 15 Aug 2017 22:07:14 -0400
Message-ID: <87y3qke04t.fsf@ben-laptop.smart-cactus.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6078213902806890540=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Richard Toy <richard.toy@gmail.com>
Cc: ath10k@lists.infradead.org

--===============6078213902806890540==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Richard Toy <richard.toy@gmail.com> writes:

> Others also have issues with 10.2.4.70.63-2, see my post from last
> month and earlier this month.
>
> Try firmware-5.bin_10.2.4.70.61-2 or earlier.

Indeed that did the trick. Thanks!

Cheers,

- Ben

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEmwpsh4C13+CdDZRjcVB86Evun78FAlmTqNIACgkQcVB86Evu
n79ZfAgAlWFjCHYkDi6vI4IlukGyq9hjsfajRrd1+UkiXxIfNeRiorHnppuOGne1
jnd6fWpqVneOgusnBMYiYTiU4Zxlizt5qyG4skRhQ01cWQsFk07LmIwuzeilP32P
QRBDzEoKueYUnUyyWKFbLMu8yj86lTLx6pVAzQ8s5Ts+4oi/5rJyGhTa/KwEhr+z
yCWMHyoac7BXZyjQRSA364p3S33ios1mIfWp0EIq4KOwwN6cMuFSkHZb49dK1YuZ
m1RyVQftIS82e0AipJnIG/brpnvY6SA5veSFcnP8EFgJUM9qCFIs/wMmsw1DEkIl
ll4TbFdLakWPlTnNoX5AlR/jEGeuZw==
=oTnU
-----END PGP SIGNATURE-----
--=-=-=--


--===============6078213902806890540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6078213902806890540==--
