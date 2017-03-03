Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjjR5-00083Z-5j
 for ath10k@lists.infradead.org; Fri, 03 Mar 2017 09:23:40 +0000
Received: by mail-wr0-x236.google.com with SMTP id u108so69498201wrb.3
 for <ath10k@lists.infradead.org>; Fri, 03 Mar 2017 01:23:18 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019 firmware: wrong numChain setting for bmi-board 16+17
Date: Fri, 03 Mar 2017 10:05:32 +0100
Message-ID: <3324801.qozNz1vNlM@bentobox>
In-Reply-To: <3636841.TTvBqzp5DH@bentobox>
References: <3636841.TTvBqzp5DH@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0340557925974028082=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>, shashidhar.lakkavalli@openmesh.com

--===============0340557925974028082==
Content-Type: multipart/signed; boundary="nextPart4882618.sPTuLDh1fy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4882618.sPTuLDh1fy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mittwoch, 8. Februar 2017 11:40:07 CET Sven Eckelmann wrote:
> Hi,
> 
> I've just noticed that the numChain in (ath10k/)QCA4019/hw1.0/board-2.bin is
> wrong in the bus=ahb,bmi-chip-id=0,bmi-board-id=16 and
> bus=ahb,bmi-chip-id=0,bmi-board-id=17 from the linux-firmware and
> ath10k-firmware repository. It is 0x4 for a 2x2 device. This was fixed in
> the QSDK by commit 171b9607fb8cc694ed469a4e29c91af9d92f2971 [1]. It is not
> known to me whether this has an effect when the pre-cal data says that the
> device should use numChain 2.

I was informed that the numChain information is part of the pre-calibration
data. So it is most likely only relevant when you calibrate your board or
don't have pre-calibration data.

Kind regards,
	Sven
--nextPart4882618.sPTuLDh1fy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAli5MdwACgkQXYcKB8Em
e0ZTZA/+OgIn58plu6sv6cK197ZFXtMmvkZ/DuMM59jf8RWk9ctV+8JFwSh6kIEO
7Je4Ihr+Lduy5yAi9QSQARbt76Dcus/vAUFijv5Tlv7q+9vh1GrXfMFBmM4yXRst
UhjT3WOT8nMs3NCs3xYBnzWhlKwgjuAAJ7OgUZM/D9lIKgoUUsNaEZdc0w6FNQ3Q
Bz6U32vPk8XkF828nZ/tr8JWWHTjynlSuhx0Op9KCEdbXEnhdR1ft79Auz+BzIEE
g3wUMsnom1ROwgW7PYdIpbaFG9wgCRHWtM9F+xTQv46ifWG31NVkPcV6qFhEj774
FvBXEFZIjb4Ju7QK2ipUak24KJlxzUFKsWPbSB7ultwKG7zVFVBJh08nsSDtlgT5
oNWPjWw6KIGl5Sk9FbuABydMSy1z67RKTW2pvBnv1UWHfXSsHwEuDvoSb2PRuJ0r
24If54e3YOj8Cy9nPiUkGnNkZQnlcnr4rMIPK9/UdtRhQv/pCLKzZzIC7KTt9Mt8
gG23FMd1DchphxQ7J43jEZkHrsCiW6wxLL3RoJIF3PD7xS55AJtQxvsSqRYaRXfL
kGQzSEas6uBc96GGtJeNPRD1xWq2d++8R5fGFkoysWuu9KF79BYZFLkaXrHvkWhm
G38zizpPbhueM/Uo76OV0HOyu95pKZ5MYIZuf0ywiRgTy9lMMvs=
=UVsP
-----END PGP SIGNATURE-----

--nextPart4882618.sPTuLDh1fy--



--===============0340557925974028082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0340557925974028082==--
