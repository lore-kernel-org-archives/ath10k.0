Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-f46.google.com ([74.125.82.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAveD-0004hJ-TH
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 07:12:18 +0000
Received: by mail-wg0-f46.google.com with SMTP id x13so1135131wgg.5
 for <ath10k@lists.infradead.org>; Mon, 12 Jan 2015 23:11:54 -0800 (PST)
Message-ID: <54B4C507.1030102@open-mesh.com>
Date: Tue, 13 Jan 2015 08:11:03 +0100
From: Antonio Quartulli <antonio@open-mesh.com>
MIME-Version: 1.0
Subject: Re: ath10k: fw_stats not reporting peer_stats with 10.2
References: <5492CFF5.9060107@open-mesh.com>
 <CA+BoTQm1H9jAszUH_gQCjcEk-GCQG0r9r7Jb2VdpM1CQF7jXeg@mail.gmail.com>
In-Reply-To: <CA+BoTQm1H9jAszUH_gQCjcEk-GCQG0r9r7Jb2VdpM1CQF7jXeg@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8569573581219072698=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8569573581219072698==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SfPJnV8AxjQwDn3ub0C0L3GhEPo05FrbC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SfPJnV8AxjQwDn3ub0C0L3GhEPo05FrbC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/01/15 12:54, Michal Kazior wrote:
> On 18 December 2014 at 14:00, Antonio Quartulli <antonio@open-mesh.com>=
 wrote:
>> I tried printing some debug messages here and there and the only usefu=
l
>> information I got is that in "ath10k_wmi_10x_pull_fw_stats()" the valu=
e
>> of "ev->num_peer_stats" is always 0.
>>
>> Is this yet another fw limitation?
>=20
> Firmware stats has a very fragile ABI. Apparently 10.2 changed it
> again and thus is broken. I'll try to look into it more if time
> permits.

Thank Micha=C5=82!
I will be happy to test any change you might be able to provide.

Cheers,


--=20
Antonio Quartulli


--SfPJnV8AxjQwDn3ub0C0L3GhEPo05FrbC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJUtMUOAAoJEJgn97Bh2u9epwsQAKoKbrBq3FgmGy35F45JqCSh
KZ/pYNx0ilflVMAUDr6v0SDYoYcGEHZcW+gliLtagbjx8H6lgqCl6tB4uGSHNyUQ
fYPtzx32mMEQB4f2VjXAONvdb8DzQHXzqd6wUDRHBHOgYL65TSLSG8qzvkQixwwU
KxOM3rAq8hYlt8kgFTiczyIpLdxoo6LIo0wXko+erYTY9wRIQTVLyYbhf8Mct/cH
MjDjmX31AlmtbigBwOZLbNIbjIkwG8oJfzRycGb24pwZya5XOLDOBoDLaKRyOSHl
Lp/oSz6IqyoBSh+Kr6NwiWVHLBIW05LT9g+klIadE4VK8S6OoZxvIitDn1QWHgt/
77KRwFzyj6v+eCJbe5XGlGUNfoYJ+UeK/rxCLHdZtxDx/d4LB1SHxoaHH6tfPcUF
YOIDUUL+Eq1IUeIh6WRzD2ryL3861Pc/9DDo/CWgohUl8+Jp8VV1bTe2Dc1bxGGh
OuyIrgy6r1Kf0zyM343j8zgO5HNpFyXndAzyPtn5jSuGONlWLYqCTgQqtT5BwQSL
XWyQS5+Q62B53ek9RvJQN4FMJMmbfFVR1B+faByv1orBXNxqKSOplMf8rnGMCmKW
QY0Mk8w2OIPOmx91IkI3X7/uF/GkobwWwQ34ZdR+n15RnZlZF/earz3kj6VPykIS
O5z7QlxaTi/aT5oleHwd
=fb4b
-----END PGP SIGNATURE-----

--SfPJnV8AxjQwDn3ub0C0L3GhEPo05FrbC--


--===============8569573581219072698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8569573581219072698==--
