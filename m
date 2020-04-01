Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJXMv-00082r-IG
 for ath10k@lists.infradead.org; Wed, 01 Apr 2020 07:00:59 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath10k: increase rx buffer size to 2048
Date: Wed, 01 Apr 2020 09:00:49 +0200
Message-ID: <3300912.TRQvxCK2vZ@bentobox>
In-Reply-To: <20200205191043.21913-1-linus.luessing@c0d3.blue>
References: <20200205191043.21913-1-linus.luessing@c0d3.blue>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5620324936941332504=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Linus =?ISO-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Linus =?ISO-8859-1?Q?L=FCssing?= <ll@simonwunderlich.de>

--===============5620324936941332504==
Content-Type: multipart/signed; boundary="nextPart1800025.TbuEdfJRpj"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1800025.TbuEdfJRpj
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday, 5 February 2020 20:10:43 CEST Linus L=FCssing wrote:
> From: Linus L=FCssing <ll@simonwunderlich.de>
>=20
> Before, only frames with a maximum size of 1528 bytes could be
> transmitted between two 802.11s nodes.
>=20
> For batman-adv for instance, which adds its own header to each frame,
> we typically need an MTU of at least 1532 bytes to be able to transmit
> without fragmentation.
>=20
> This patch now increases the maxmimum frame size from 1528 to 1656
> bytes.
[...]

@Kalle, I saw that this patch was marked as deferred [1] but I couldn't fin=
d=20
any mail why it was done so. It seems like this currently creates real worl=
d=20
problems - so would be nice if you could explain shortly what is currently=
=20
blocking its acceptance.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/11367055/
--nextPart1800025.TbuEdfJRpj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6EPCEACgkQXYcKB8Em
e0YRxA//YxxFkrb3+3MfksBJzKvpwPudQje1PeGas/4ofeiU8BeEaEGPbE5psITT
FNUyVMxVf9VceV10aWdFwVNB4pr6BNhp8ENaZC1mM+ysv4qx2GGdFizlDSmctk6S
KUEeE7sGWPMF8GsVmKFOm91xDWZJPQkz39dYrrOF/n8z0A/PpSVVj9GU1+qWh1uY
wpTi1FBpQ22mt1+lLtkzd79iWR88tUEq6+kSb6c9iGRHwFzAKsWH2ztHiz1XJKUL
JuslEzrgknh22OKVuMDFeHERdTV20QxFouTv4jJNAT7++TWrOOscqLmyAHApkzxS
LUasYj1cIAUIOhiB26luknCi2nshgSqo3pX98brWOc5k7oOAip2dj3ZP7SKTTCDx
bm/oTQEjvH6tx/ejTssiObbCNE2eNVk2NKSiIPQ43f/7TUQLKOx0MwKZP0Oze1AO
nNPz04GP75RJManuczRyBRZ9RVHfS4V/yiD1EDvT3NQpmg9bJrfWyo7gpFAVL8mx
BXHiaDmaXbRAlK4DrBR/ozjYXlGddNVBJQ9JTdk1PM0BOoTnRjMj/Gs1ZIvtKb8R
mlfJYXEu4D9tIi1XlRAOmMZ/VYlE33T198Pb5ia6r6g4qlqiVpZc/h+ktfB/BkWH
SqRSuL6vw7oCbxefi5oF2T0HEVU3K3hvvATa0R6A2xQgtkz/pXQ=
=1DtW
-----END PGP SIGNATURE-----

--nextPart1800025.TbuEdfJRpj--





--===============5620324936941332504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5620324936941332504==--
