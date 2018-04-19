Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f97Fy-0004Y8-Dt
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 10:57:40 +0000
Received: by mail-wr0-x230.google.com with SMTP id q3-v6so2786442wrj.6
 for <ath10k@lists.infradead.org>; Thu, 19 Apr 2018 03:57:26 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Thu, 19 Apr 2018 12:57:23 +0200
Message-ID: <7789745.NkZyeJEkZ5@bentobox>
In-Reply-To: <87zi1zlcp3.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox>
 <87zi1zlcp3.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0070801115980585948=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============0070801115980585948==
Content-Type: multipart/signed; boundary="nextPart4235525.14sL8MEvcW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4235525.14sL8MEvcW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 19. April 2018 10:20:41 CEST Kalle Valo wrote:
[...]
> >   - QCA4019 hw1.0
> >
> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
> >       sha256sum:
> >       df5dc5a55506e2a58dcb0b8542f40226d3bfd530a6fc0bc90c728ab18a57144c
> >     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
> >       sha256sum:
> >       96c3d044fe26522c75313c210ace6f85d5bdcdbce3350214d92467501a01fb88
> >
> >   - QCA9888 hw2.0
> >
> >     + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62
> >       sha256sum:
> >       c85b23763e748abeb7e8c42e243dab1fc58d1bff94111e4058bdf31ddb14cefa
[...]
> I added these now, please check the results:
> 
> https://github.com/kvalo/ath10k-firmware/commit/
a262aac7cfe5ae5833378b4f1b0634f873a4df4d
> 

Unfortunately, this is wrong. Please check the mail again. The 
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62 BDF is for the QCA9888 
hw2.0 board-2.bin and not the QCA4019 hw1.0.

Kind regards,
	Sven
--nextPart4235525.14sL8MEvcW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrYdhMACgkQXYcKB8Em
e0ZBLQ//VbwP+s+MNpHoicWkpG7pGT+xCc85WvxSw7L99vbt7RSlo2u3UPEVL22m
yDAgdOcPVPyKr+WAN03yD5qlKeNaBj6dyKUrI8Vb76z/qBpFQ6mX391+xGZXvz3J
PXjgajGiMnnjyKNL4qBBRld+RiDCP6TCFqp53lI+rUU3kWDsIgeq634uQV/ZcpNL
5CDgb22Os6DXgXQRu5mHdRNZ/v5jnkfoijMe1gTrCq2t524peM/oW24EmHG1X1lc
7P0sEp3aZr9RrwsEij8PahRRXB78c6k5Vn5iy3vckbNSveabMiTWMvfftS3kGMMs
eQ7xka7sO7rV2D9wEQ0CSBDXCOdsSlAHrBl908gl3oyd2hXnWyvxlxmsUabInHVa
aJrnLJbr/gOjtymmdSCFWXhxBytW6zJt0PX7zBvaQVFgzFpbT3968j5xuhdiPy3m
BSmvlQTc7pXMKPlu4VNcR/+eZ6AsE3EnAVISfpLSSTXoy93OiLZrYC+6KcH0fUB9
7puMLoadIvRwzNjOqhuSxPrj2cnsIIU2EzJzTbj0KyMc25raPzZH0jkUc67mKJ5J
uGU9602mri3NgFQwzR35Cb8nSGFxjENTpVQol+moeIGPQyNv5IMmsw3vFCzEblC/
NO4X2iaoyPqPQP1y4Y2G9c5WJe4nUnB7X9VSkknfwwFPQxyRahw=
=3ZPO
-----END PGP SIGNATURE-----

--nextPart4235525.14sL8MEvcW--



--===============0070801115980585948==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0070801115980585948==--
