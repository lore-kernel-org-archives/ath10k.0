Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr2oz-0003pX-OQ
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 11:53:46 +0000
Message-ID: <562F65AF.8020905@gmx.net>
Date: Tue, 27 Oct 2015 12:53:19 +0100
From: Michael Krupp <michaelkrupp@gmx.net>
MIME-Version: 1.0
Subject: Re: QCA6174 bringup
References: <1445926088032-08658f66-eef54963-c02dda7f@gmail.com>
In-Reply-To: <1445926088032-08658f66-eef54963-c02dda7f@gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6351504203306437615=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ganesh GR <ganeshgr6@gmail.com>
Cc: ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6351504203306437615==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5AVmF9TNOgXj75cGAhNGOos5iXSjPgdSr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5AVmF9TNOgXj75cGAhNGOos5iXSjPgdSr
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Ganesh,


I downloaded the official Windows 10 driver from acer.com and extracted t=
he
setup file using InstallShield [1] Cab Viewer [2]. The 30-day trial versi=
on
is sufficient to do this.

Inside the "main" setup file, there was another setup.exe for the atheros=

driver itself. I extracted it using UniExtract [3].

The inner setup file contained a couple of eeprom_* files inside the "dri=
vers"
directory. I then copied the one matching my device to "board.bin".

In my case: /lib/firmware/ath10k/QCA6174/hw3.0/board.bin


Michael

[1] http://learn.flexerasoftware.com/IS-EVAL-InstallShield-Professional-D=
E
[2] http://helpnet.installshield.com/installshield22helplib/helplibrary/I=
sCabView.htm
[3] http://legroom.net/software/uniextract

On 10/27/2015 07:07 AM, Ganesh GR wrote:
> Hi Michael,
>=20
> I am very excited to know how did you you extract board binary from win=
dows driver, do you have windows driver source ?.
>=20
> Regards
> Ganesh
>=20
> Sent using CloudMagic <https://cloudmagic.com/k/d/mailapp?ct=3Dpi&cv=3D=
6.0.64&pv=3D7.1.2>
>=20


--5AVmF9TNOgXj75cGAhNGOos5iXSjPgdSr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL2WyAAoJEEI+U8JQBNx3eoUP/A20eRlsHIYCD/Wz12OOHr+O
h8ADvUHV5h6ti9zlju/OYgfcbqt0CEiCCkEi9oY9RzkqrpsehZR1IdOAsL5+wzTI
EFQ6IboOoDfQYvRitMJ9AcfB2XdH3/GCMnH2xExIDQdO+4fR3SkyAJDJM6QdMSBG
N1zW0xbgunxDjKlPojtGC2Xazntp5WpntU8kYI6RRhLPSZdxtciYEpnNZzuinq8m
6BG/wabjqMtw3nQNryAEpgirsmGQ1RUMLYywA5TJvC3lEBKYKP9DHcRvSsiZvotO
VhAkJGORh/bdeKbDEneJPaAc6ObGuOJ1dfRf0Sri1/gCpILEObzX+c2eV0AJ+fP/
ou/T7tyrDct0pMUeBJU3XN1NaafepkI1QWacgaoxCs+toJAisuN2reeT9pr/RJsU
MNETWOYV43WtI86FWJmYfgRtvHmQm5UE3c4h7EkC/39sKqW/FOntoDd8hP5HGAQ6
Jw17jqsp1ouWFgS9xKE2IpV5usQpJjtWdjxSH3uWPD0j9BuFQzquJSKwFmt5I4wb
5CSLu75CG9DxTBwloD6SZlxu25zhifdZDeftbiV/qXrRPGC9h3OtcokbOyc5Pu3L
LPZz2BPY8IyAY40zayfjbR4b7VSokHfbjqbvkDV1Ec0x7J+38wacN6IHgq+Vnb80
jP5Yh+zcV5U81on155TV
=C49m
-----END PGP SIGNATURE-----

--5AVmF9TNOgXj75cGAhNGOos5iXSjPgdSr--


--===============6351504203306437615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6351504203306437615==--
