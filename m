Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clvnC-0005JK-RA
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 10:59:36 +0000
Received: by mail-wr0-x22b.google.com with SMTP id g10so42393760wrg.2
 for <ath10k@lists.infradead.org>; Thu, 09 Mar 2017 02:59:14 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Thu, 09 Mar 2017 11:59:08 +0100
Message-ID: <6104737.JakpnjT6P9@bentobox>
In-Reply-To: <CAJ-Vmom6_-PAnwSjuA5t3a1AKrLhi58ufkLYAjJZkkD5nneusQ@mail.gmail.com>
References: <1591748.RGYhBEn8I1@bentobox> <30387745.tG59X1cezt@bentobox>
 <CAJ-Vmom6_-PAnwSjuA5t3a1AKrLhi58ufkLYAjJZkkD5nneusQ@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8259627727659044300=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, simon.wunderlich@openmesh.com, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============8259627727659044300==
Content-Type: multipart/signed; boundary="nextPart4244372.W4pXrPEJiB"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4244372.W4pXrPEJiB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Dienstag, 7. M=E4rz 2017 08:30:54 CET Adrian Chadd wrote:
> "use your own bmi ids". :-)
>=20
> (yeah, this is going to make open source firmware for these things
> more painful than it should be. :( )

Thanks for the reply. I was just informed that the firmware binary will beh=
ave=20
differently depending on the bmi-board-id (even when the rest of the conten=
t=20
is the same).

The selection of an own bmi id is therefore also not an actual option. Ok,=
=20
maybe in some cases but not in general.

The method to have a single board-2.bin for QCA4019 and to let ath10k selec=
t=20
the right one using bmi-board-id, bmi-chip-id and bus is simply not working.

Either the board-2.bin is simply not used and only the pre-cal data is used=
=20
(as seen in Christian Lamparter's/Michal Kazior's patch [1]) or each board =
has=20
to come with its own board-2.bin. The latter brings up the license problem=
=20
mentioned by Christian [2]. Both have the problem that QCA (for some reason=
)=20
wants that always the board-2.bin is used which comes with the "ath10k"=20
firmware binary [3].

Kind regards,
	Sven

[1] https://www.mail-archive.com/ath10k@lists.infradead.org/msg05911.html
[2] https://www.mail-archive.com/ath10k@lists.infradead.org/msg06509.html
[3] btw. this QCA seems to contradict itself here by helping ODMs to
    create their own boardata files
--nextPart4244372.W4pXrPEJiB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljBNXwACgkQXYcKB8Em
e0ajlw//cz1R21JvksE7p5RnTMWca/1jJm9hzxIdZJ8GNHzcrxoMNuTibbOAC6UQ
me2x33SvyY+Y1C9H+NCiRCGM0H13459KOO9lUCT5Zt85ANX2upT7VoUsM0hSmcHU
GU9W4mDW48UHPSlKJqfgMOEMCx4vjiY3Q7XgbX1WjUrjVKEnHGWlQTY2MUHbTqW1
d+Rdjgq3E/AUrm0lY0JOlvN5AbZIWhn99LThx//pxd3D6Pzz91yAxv6V89LEKETg
hlWBTalU5Rjdp46FIxhj3MUq0kNkEyr+m8mqaIk3vRRFSBqMS1hLLcSmVbb908ws
Aio9VdzAbNBGSdBlqUs9ScUvKHpewYcM1ZE2B6yBZCkILhYjxrXeK4JKnG/t3i+1
q1ZREG1SV5q0qr7brM7ukEGycTk7KrGde4Btr0m7/BYQcJow8J9tlUPmdewOgJJV
UP0M6CJYyxVzcnb/JGvOhgBQ1XEk968sIWgHlRZ2+Y3WjaBMbtzo0M3QzEfCqS9c
zM698WeiwCVSTp+Bvcs1OBvX/5nhlnTWnl9DB9jiubtZFq4fi8hYu3yftBNWptTG
oiVUEMwm5yiSoJGA0wuCyenJwZIkrQhO3fPbDUAsoqVPANwfC9WN7EKc4yzUQ3YU
stZJQGwMwAlBDSV9aEmuewzCL/0gkMF67fInExkA0cBCU17/ZSY=
=Vj+1
-----END PGP SIGNATURE-----

--nextPart4244372.W4pXrPEJiB--



--===============8259627727659044300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8259627727659044300==--
