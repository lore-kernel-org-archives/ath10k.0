Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clxSg-0002NR-Fu
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 12:46:33 +0000
Received: by mail-wr0-x22b.google.com with SMTP id l37so44257392wrc.1
 for <ath10k@lists.infradead.org>; Thu, 09 Mar 2017 04:46:08 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Thu, 09 Mar 2017 13:46:00 +0100
Message-ID: <2093425.PaQnjOtWUV@bentobox>
In-Reply-To: <87shmm4qk9.fsf@kamboji.qca.qualcomm.com>
References: <1591748.RGYhBEn8I1@bentobox> <6104737.JakpnjT6P9@bentobox>
 <87shmm4qk9.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5457864705196307161=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "simon.wunderlich@openmesh.com" <simon.wunderlich@openmesh.com>

--===============5457864705196307161==
Content-Type: multipart/signed; boundary="nextPart3859721.HsRDY11ePa"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3859721.HsRDY11ePa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Donnerstag, 9. M=E4rz 2017 11:51:13 CET Valo, Kalle wrote:
[...]
> I haven't followed the discussion very closely, so I might be way off,
> but for laptop SMBIOS implementations Waldemar added a variant field to
> board-2.bin so that we can have multiple images for the same subsystem
> id. Could it help here also?
>=20
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/commit/
> ?h=3Dath-next&id=3D1657b8f84ed9fc1d2a100671f1d42d6286f20073

Thanks for the pointer.

I also saw this morning but haven't invested a lot of time when I saw it. B=
ut=20
let's play around with some ideas around "variant". Maybe someone else has=
=20
some better ideas or comments.

The information about the variant has to come from somewhere. Currently, th=
e=20
OTP binary is returning only the bmi-chip-id and bmi-board-id. There doesn'=
t=20
seem to be any "project"/"customer" id returned by it (even when it exists =
in=20
the EEPROM). And even when there would be, the already existing devices don=
't=20
seem to have it and i don't know if QCA actually allocates them for custome=
rs.=20
I would therefore postpone the use of pre-cal data to generate the the vari=
ant=20
string for now (but I will ask the ODM to get some info from QCA).

Let us see how the SMBIOS does it. dmi_walk is used to go through the entri=
es=20
and search for the entry. We don't have this here. So let's check what we h=
ave=20
with the QCA4019

This looks at least like a doable thing with the device tree. It must be a=
=20
string but this can easily be stored in the device tree itself.=20

The RT-AC58U  could therefore have following entries:

    		wifi@a000000 {
    			status =3D "okay";
    			qcom,ath10k-calibration-variant =3D "RT-AC58U";
    		};
   =20
    		wifi@a800000 {
    			status =3D "okay";
    			qcom,ath10k-calibration-variant =3D "RT-AC58U";
    		};

Some code has to be added to ath10k_core_probe_fw. I can prepare this later=
=20
(when I find the time).

The board-2.bin would then require entries for bus=3Dahb,bmi-chip-id=3D0,bm=
i-
board-id=3D16,variant=3DRT-AC58U and bus=3Dahb,bmi-chip-id=3D0,bmi-board-
id=3D17,variant=3DRT-AC58U.

Kind regards,
	Sven
--nextPart3859721.HsRDY11ePa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljBTogACgkQXYcKB8Em
e0Y7mg//SCDmqAJGnLpARB8Fm4+kUh3ZfzavW4pX9fWMf90wqSfowjfYGvHmraf/
cmb+4doIIs2Q8QIwC1ohlT9h/cKYh3/tXgeml64jCVtOQctavxaxgBjbGYi4+tgZ
7S7ejzR6fgvHDuPAbt9n1KZ/iwhQazJEw9t7MTAjXZWKOBRHaloqTVLP23+eivpa
PmfP/M/ZzMG68SSUDUa8IIYgYEic52ymOmGN5kzp9A7kdjWVYr5VRFhiPGwkyQga
v4DUqat3MbFbz6UWXIJtzJqDPlozccg6EaX7FiM1QKbqeqV1akQyartIaYI/WT1e
2+Trsy9d6+DZyeXuLHvoYNUFC06Yqj+wA/9iZyfZeV3cGDfqQWxvVDtECBAf6hZa
NOID4gbe3rmvyiVe40nc/8lsOMnnK0hvg6k/xK+nuSUB7CrTOzc/Gh9rVvi7m5lF
Wd8rF5K2tLFajaf5JxVEWm0qV3zvjG/vV3pSuilfLZinD3gYjAqD/g/aWNfmbuoq
jDLSpMCm0VviWiObcvX7fqxbYcMQaSt1i+XDT3cB3N86XI4PCquw9Q0/jTihTidJ
aClag0K57YskXUHSudtUQ7jP5ahRsrrar/slzS+6yrXLwSAtKOrbTOSrAXW+Ki78
2zpeTXLOHNEz1UtdRNFBv06rUEXR/32BmejFBe/Mu3ymQE3feIs=
=Dmtf
-----END PGP SIGNATURE-----

--nextPart3859721.HsRDY11ePa--



--===============5457864705196307161==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5457864705196307161==--
