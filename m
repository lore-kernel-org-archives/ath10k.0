Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f15jW-00079P-GR
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 07:43:00 +0000
Received: by mail-wr0-x234.google.com with SMTP id p53so1246846wrc.10
 for <ath10k@lists.infradead.org>; Wed, 28 Mar 2018 00:42:47 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL.iNet GL-B1300 specific BDFs
Date: Wed, 28 Mar 2018 09:42:40 +0200
Message-ID: <1847691.7UTcLHTNqf@bentobox>
In-Reply-To: <b0320000-ac88-0992-c4c8-e41a137a3249@dd-wrt.com>
References: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
 <2037513.gUX94vxXhd@bentobox>
 <b0320000-ac88-0992-c4c8-e41a137a3249@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8224837755926342138=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>

--===============8224837755926342138==
Content-Type: multipart/signed; boundary="nextPart2288193.2OEucnLpIm"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2288193.2OEucnLpIm
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mittwoch, 28. M=E4rz 2018 08:23:43 CEST Sebastian Gottschall wrote:
> correct me if i'm wrong. but isnt the board data stored in flash memory=20
> on these devices like on every other router i know using ath10k chipsets?
> this all sounds a little bit curious for me

The BDF is stored either in the board.bin or board-2.bin on routers which u=
se=20
ath10k. Similar files (raw BDFs with other names) exist on devices which us=
e=20
the QCA driver. These files don't contain the device specific information (=
see=20
my earlier mail for the things which seem to be device specific). So they a=
re=20
basically part of the rootfs.

The device specific information are stored somewhere else on the device. Th=
is=20
can for example be in the ART or on a dedicated EEPROM [1]. The OTP binary=
=20
(running on the wifi chip) is receiving both files from the driver, combini=
ng=20
them and adjusting some things here and there. The combined memory region i=
s=20
then given to the actual wifi firmware.

Yes, this all is rather complicated and I think was introduced with the QCA=
=20
802.11ac Wave2 chips. This especially ended up be a problem when QCA was on=
ly=20
providing board-ids for its own reference designs. Unfortunately, these boa=
rd=20
ids are used to identify the BDFs in the board-2.bin. So we had to introduc=
e=20
an additional, optional information that we can use to differentiate betwee=
n=20
different BDFs which have the same board-id - the so called (qcom,ath10k-
calibration-)variant.

It could now be that you're statement was actual suggesting something else:

* Why don't you just use the information from ART and load it as cal data=20
  instead of pre-cal data?

   - The firmware seems to behave differently when we do that. Maybe the
     "additional modifications" are not done by the OTP in that case.=20
     Maybe QCA can tell you more about that.
   - But there are also another things which we will discuss in the next
     point.

* Why don't you load the information from ART and use it as pre-cal and BDF?

  - The BDF can also contain other information than the pre-cal data in the=
=20
    sections which are not copied from the pre-cal data. This happens all
    the time during the development but can also happen later. Maybe this w=
as
    the reason why QCA implemented this mechanism. It is for example planne=
d=20
    to update the A42 BDFs in some weeks.


Small (cut-down) story at the end and why we need special BDFs. During the=
=20
initial development of the A42 OpenWrt support, the HW manufacturer told us=
=20
that we should use the official QCA BDFs with some QCA internal code (which=
=20
translate to bmi-board-id 16/17). We did that and noticed that the board wa=
s=20
consuming a sh*tload of power and performed worse than a dead horse. After=
=20
some attempts to communicate the problem and some first incorrect assumptio=
ns=20
from both sides (but with help from some brave OSS developers), the HW=20
manufacturer told us about his "official" BDFs which were actually not look=
ing=20
like the QCA files at all but had the same IDs. Reason for that was the=20
removal of the QCA reference design non-SoC radio components and the=20
replacement with their own design. This is where the story of the=20
(qcom,ath10k-calibration-)variant began (for me).

Kind regards,
	Sven

[1] I just use this here as placeholder for "any kind of non-volatile memory
    which is no the main storage"
--nextPart2288193.2OEucnLpIm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq7R3AACgkQXYcKB8Em
e0bWAA//emMjCEao83qsxWj2+EFjVaxH74jkyfETxUtoO8I0xgXFPUt+E2DhCZLW
jzXjAehi698CokjpX2C2V7e+xMQIkwaMupU3I215yvyJdMVZnZyimw5cGQxT/Iak
yLxq5FT0FALuHyFeitcPFA7FxQl7kCVhQLHWqGn0cPXxNw6mYuDNI6Bew+YkSe/D
IiKOquP/kOGYLizrYkTIvV2Fo14Lru6g1u4bu/OhIfamLbFnEc0PmQJOpp8K++GU
1xm2/kQsyaNO27x7mhJ4zzPjTXWpWCe3xS3fzwn6teAnm+sNu5940Z8Ve7ANcBmS
cUkhjlg94sW4dMQ3nk+ySpnEMW6/w55kNWyRsoiTfr/amcCSAtS1dhf6yAz1CKPU
x7JYi/ejU1hM5tBUUvq6gRgrEh7HDzbaGLOwS7di0xXbWrg4pi4lGFZrJKgY1OlU
40RJNFYVBHBUtGMCdqwS60K8OVUCaKKF+fExd3X8eZf03YjxOesZfKNetnbutrV5
o4lw4QSAWxgJMegOjq64fB9o9umjY1kdZ1bIfrA6j32hNCKZtYuWcB/q0CnRbBUV
NTLUJzmmdpkjQz22ZyHH1HG++G3CpWkhXCMDE2Cur38xo5eGKwaAEW2ahbOOVmpJ
OGj5wuN9/1cl1twrxZ4m2mB01bjqf0p7T/Dkaj28orJ4MoiP15U=
=Ia1l
-----END PGP SIGNATURE-----

--nextPart2288193.2OEucnLpIm--



--===============8224837755926342138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8224837755926342138==--
