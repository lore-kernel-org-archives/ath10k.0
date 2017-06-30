Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:190:3424::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQu1g-0002Ge-6M
 for ath10k@lists.infradead.org; Fri, 30 Jun 2017 11:23:54 +0000
Message-ID: <1498821800.4798.2.camel@sipsolutions.net>
Subject: Re: Is using 802.11s with DFS possible?
From: Benjamin Berg <benjamin@sipsolutions.net>
Date: Fri, 30 Jun 2017 13:23:20 +0200
In-Reply-To: <2614300.ercbpO68rJ@prime>
References: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
 <d4a7c59c-85f0-bbfb-84ce-ce0a6c7bf483@bowerswilkins.com>
 <CAEFj986gxesLcSaeVH9Yfwre7cTB0uqSzHBMpZKSNbmgQFcmhA@mail.gmail.com>
 <2614300.ercbpO68rJ@prime>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0349979449486369319=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Simon Wunderlich <sw@simonwunderlich.de>, Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: Zach Sherin <zach@netblazr.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <peter.oh@bowerswilkins.com>


--===============0349979449486369319==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LsVjtFstg+JI5LX37SjT"


--=-LsVjtFstg+JI5LX37SjT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-06-30 at 11:48 +0200, Simon Wunderlich wrote:
> Our mac80211 patches have been upstreamed. However, the (experimental)=C2=
=A0
> wpa_supplicant patches have not been adopted and I've reworked them a lit=
tle=C2=A0
> but they are not in a state to resubmit yet. So I don't expect the=C2=A0
> wpa_supplicant portion to work yet, and you also may need to think of a g=
ood=C2=A0
> way to have the mesh peers on a channel succession order.

For reference, an earlier version of the patchset was submitted as an
RFC in November with a bit of follow up discussion later:
 http://lists.infradead.org/pipermail/hostap/2016-November/036726.html
 http://lists.infradead.org/pipermail/hostap/2016-December/036741.html

There have been improvements since (e.g. solving the use after free
issue) that are not yet submitted. I cannot comment on the current
state of the patches though.

In general a major issue is making sure that all stations switch to the
same channel when a radar is detected. There is a simple mechanism in
the standard for this which to my knowledge is not implemented in
mac80211 at this point. But even with this in place you will likely
want a versatile mechanism in hostap for stations to switch to a common
channel should they end up on differing ones.

Regards,
Benjamin
--=-LsVjtFstg+JI5LX37SjT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQI3BAABCAAhBQJZVjSoGhxiZW5qYW1pbkBzaXBzb2x1dGlvbnMubmV0AAoJENEj
aKZhhWwg2MQP/iemhZ+hGVu3kVdDyDApIs8//jfYJc0d2DUmOWE7tkAEp+WEAK6C
MlAcR76q06zPn8LVGZ43y1D6gPXa2MOM/Pqz69qSgnd0XikNBTfrhhL1pnlXM4za
A1pYZGS5STvhw8kbgozKoJcKctBpGVzknIKj6BB9zXUbiX9jqkQsZxMdeb7o3hNB
yH8CbieTpQnL2Qc1idMMfw/yR9ND30cIJ2EnBQ90zZkU3q0o7pK/ZpRZ27QrPaBX
xZGpfKqlprvndwPCein7i59AA4BJEM3l3zTtzq16spw/U35MXOC2Q9uUc1h+ohOi
ZGBx5w0Z/g8PUobsbRUGV04dqklo+x1Q45+0rso0UuRG3sz9pQfdIvRv4dI6VUjW
NYc2N8NgmfFyp+06w5tjSbXSZZvG3WdwA+3gIF2JB96DzgyoQ7oP6MClsPgimlgW
LyCFFrYVATtuNDPdrcbJTgpIgwHGg+av+QoIQgQ6YoiyZd73zl+dNwp7ElMnjc/R
3ckXyUcNvUiqUKIW/4chdtRLX7JU7zJN67rgAL0wV2WmTg/rS5nojqLCcdbI5lAq
dao+HsltOOl8Mg4D+xqUhtE/0ztK3zQlYriDhItncTiUkaRuVZkEw8YXfA5nHffY
E1WaKI/25SszkqtZK91GkfTIHyLjXPi8MJzdN+JchhrcEy59uFlzOnzt
=IhB2
-----END PGP SIGNATURE-----

--=-LsVjtFstg+JI5LX37SjT--



--===============0349979449486369319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0349979449486369319==--
