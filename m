Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.gmx.net ([212.227.17.20])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zr2Kq-0001Y0-4t
 for ath10k@lists.infradead.org; Tue, 27 Oct 2015 11:22:37 +0000
Message-ID: <562F5E5D.5090205@gmx.net>
Date: Tue, 27 Oct 2015 12:22:05 +0100
From: Michael Krupp <michaelkrupp@gmx.net>
MIME-Version: 1.0
Subject: Re: Support for QCA6174 [168c:003e]
References: <562C5328.4060002@gmx.net>
 <CA+BoTQ=BXTSB0ZMJ9v4kBoGN1MC3TjZvjkqx2ndn0hjbPM7z3A@mail.gmail.com>
 <562E98AC.9010208@gmx.net>
 <CA+BoTQm59x1KZGrkqXZAMfqoe5=Z03wszvWiNw+feqNinsa9Hw@mail.gmail.com>
In-Reply-To: <CA+BoTQm59x1KZGrkqXZAMfqoe5=Z03wszvWiNw+feqNinsa9Hw@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2746687557985449245=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: michal.kazior@tieto.com
Cc: ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2746687557985449245==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kut6G4UTTVTBRC0cWTc8f2Mnu8EFp1IDG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kut6G4UTTVTBRC0cWTc8f2Mnu8EFp1IDG
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Micha=C5=82


yes, I checked the actual performance via netcat, scp and rsync. I'll rep=
ort
back once I have tested against another AP.


Michael


On 10/27/2015 07:22 AM, Michal Kazior wrote:
> On 26 October 2015 at 22:18, Michael Krupp <michaelkrupp@gmx.net> wrote=
:
>> Hello,
>>
>>
>> I managed to get it (sort of) working with the eeprom extracted from t=
he
>> windows
>> driversand thefirmware from kvalo's ath10k-repo on GitHub.See more det=
ails
>> below.
>>
>> Unfortunately I only get a bandwidth of about 2Mb/s connected to a 54M=
b/s
>> AP.Is
>> this a known limitation to ath10k right now, or may there be a way to =
get it
>> working at full speed?
>>
>>
>> Also, thank You Micha=C5=82 for pointing me the right direction and he=
lping make
>> it
>> usable, at least.
>>
>> --
> [...]
>> # iwconfig wlp7s0:
>>
>> wlp7s0    IEEE 802.11abgn  ESSID:"[REMOVED]"
>>           Mode:Managed  Frequency:2.457 GHz  Access Point: 00:24:FE:A8=
:2C:55
>>           Bit Rate=3D1 Mb/s   Tx-Power=3D20 dBm
>>           Retry short limit:7   RTS thr:off   Fragment thr:off
>>           Encryption key:off
>>           Power Management:on
>>           Link Quality=3D69/70  Signal level=3D-41 dBm
>>           Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
>>           Tx excessive retries:0  Invalid misc:32 Missed beacon:0
>=20
> Did you actually check the performance? The driver doesn't report tx
> rate properly due to firmware limitation so it always reports 1mbps or
> 6mbps to userspace tools.
>=20
> Sidenote: `iwconfig` is deprecated. `iw` is the go-to wireless tool now=
=2E
>=20
>=20
> Micha=C5=82
>=20
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>=20


--kut6G4UTTVTBRC0cWTc8f2Mnu8EFp1IDG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL15hAAoJEEI+U8JQBNx3fbwQAI1G7nXhE46CBsDiMKRNUfzE
FO+yZWabk+60H/BfjBiE0TeS1gM9Q9c8+ghfCYUktQI1sHLtr1Cjr5jDTjHBep7G
dL+IPtPOwrsO1302uV3bJJQVIuEKUATBMqqv+fiB6Veq8+jS4gSKo28sVXNsdO2y
OQLeuKN95WqFdI/dMmHACrtQYeHI88v1LoVp+zsHBZxsXap0l1bdXTVy6ZfXyKSC
y7brUJukeToYXo4vMwBLMQrdlkALWLFRJ1aR5y0UofYavj7X2K0pjiJJFGjhE5Up
G0sWuK187BET62TWUzWmoauv2KvYDQKTjmy1v7gkUNyUoWg72CpBcZPTHKIiCH4K
BCEGj5SgCmb3TvMabUdS2G5Dk173U5Btep+wSvx2SsZh/+pSnT0opeRhzCpj1vnE
O1vbqRwPZy5jChhv9DUtUvsqOBJbwTwtPcBVRZ7qn7mk21BzBBVTLwEvKVmxSL68
CYKyz0a/FSvWKOOH8Nty6nOFSl0/HrT36MbhYi07k12Oi8ankkSxzfahCpnhFiv3
En4E4VUmXzm3Omlo0/BpnrsGBErOiiNgKPacjAxOt1nrMALoWIX8No0cUn5USLMD
qmfvPnAgpRRIKiACSsbroWUMwC5K2aOR5hZzVF+aGvy+KSK2i/BISQPdItIJJpoV
VF2GPJ+HhZ4hPHNyubmv
=a5HO
-----END PGP SIGNATURE-----

--kut6G4UTTVTBRC0cWTc8f2Mnu8EFp1IDG--


--===============2746687557985449245==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2746687557985449245==--
