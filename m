Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSIlu-0004H1-1q
 for ath10k@lists.infradead.org; Sat, 25 Apr 2020 11:15:00 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath10k: increase rx buffer size to 2048
Date: Sat, 25 Apr 2020 13:14:42 +0200
Message-ID: <3097447.aZuNXRJysd@sven-edge>
In-Reply-To: <3300912.TRQvxCK2vZ@bentobox>
References: <20200205191043.21913-1-linus.luessing@c0d3.blue>
 <3300912.TRQvxCK2vZ@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6648046091867572953=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Linus =?ISO-8859-1?Q?L=FCssing?= <linus.luessing@c0d3.blue>, Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, mail@adrianschmutzler.de, Ben Greear <greearb@candelatech.com>, "David S . Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Linus =?ISO-8859-1?Q?L=FCssing?= <ll@simonwunderlich.de>

--===============6648046091867572953==
Content-Type: multipart/signed; boundary="nextPart9684083.LlcNlZrpYr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9684083.LlcNlZrpYr
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Wednesday, 1 April 2020 09:00:49 CEST Sven Eckelmann wrote:
> On Wednesday, 5 February 2020 20:10:43 CEST Linus L=FCssing wrote:
> > From: Linus L=FCssing <ll@simonwunderlich.de>
> >=20
> > Before, only frames with a maximum size of 1528 bytes could be
> > transmitted between two 802.11s nodes.
> >=20
> > For batman-adv for instance, which adds its own header to each frame,
> > we typically need an MTU of at least 1532 bytes to be able to transmit
> > without fragmentation.
> >=20
> > This patch now increases the maxmimum frame size from 1528 to 1656
> > bytes.
> [...]
>=20
> @Kalle, I saw that this patch was marked as deferred [1] but I couldn't f=
ind=20
> any mail why it was done so. It seems like this currently creates real wo=
rld=20
> problems - so would be nice if you could explain shortly what is currentl=
y=20
> blocking its acceptance.

Ping?

Kind regards,
	Sven

> [1] https://patchwork.kernel.org/patch/11367055/
--nextPart9684083.LlcNlZrpYr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl6kG6IACgkQXYcKB8Em
e0blZhAAtUz1zZuJUiX3gvEu7u03vcUEh+9wxlrnYwC+XmWyXWZ0lswqB5egTyd0
2XbsmAXldRfVz6HV/Gly3WGR2QBxVCkQPhEhDuUBDuNFnp/QL2+qnriubgRlDYSp
lIVP1REqUJcADEM92Bec8vWub35lxIwMj3j/DpR9gQ/toJu9C/1Gnuw9i40WTF3i
K+BMaPwR33aGAdTRDh1fK0zWcpuzRIOMGJf4HhoOgm3HU0K07P64UXC4x40uU1zi
G7Tn6SekHgtio5DmRRualgp28QE69XK66W25mbLxaZQcvnUHuNEoMZC+bJh+kYkN
pZiVdlUx6CM+CqSuztHCYT7Dgl3hC8KbTRAfVSY1M44NChglAIO3WXuHasyeqJHn
n9BJ+q9+AcemX1whESG16iA10KMK/8PsRF9ynzM05W+JiwvDiTB0JbEfS0h4eur0
dwiavSaAvnhoXV2bra4XxuqDxQWjagq11FCIpMg1U4WpuZSKit2K6hL31wHChsK7
O03j+un9EU/UHlDRb4G2EM1UU3t6JngjUDlzPr1lNkVFCwiFO4wh4e8nm+GiRmuc
yj1Wq7FREyBhhDbktr56SFLHoAluhshb2QRE+8yNAELZEi+mKS08kY/c6FVxPo63
elfS4ktzDlNtkQO4agAAPAmIOijysXjj7mG8a+5A8vhX4Y+s6Ck=
=2W59
-----END PGP SIGNATURE-----

--nextPart9684083.LlcNlZrpYr--





--===============6648046091867572953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6648046091867572953==--
