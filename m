Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f48.google.com ([74.125.82.48])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbPgr-0000DS-Q4
 for ath10k@lists.infradead.org; Wed, 08 Feb 2017 10:41:35 +0000
Received: by mail-wm0-f48.google.com with SMTP id c85so191851046wmi.1
 for <ath10k@lists.infradead.org>; Wed, 08 Feb 2017 02:41:11 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: QCA4019 firmware: wrong numChain setting for bmi-board 16+17
Date: Wed, 08 Feb 2017 11:40:07 +0100
Message-ID: <3636841.TTvBqzp5DH@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0962467237280832525=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>, shashidhar.lakkavalli@openmesh.com

--===============0962467237280832525==
Content-Type: multipart/signed; boundary="nextPart4751606.S3aPsx0Kzq"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4751606.S3aPsx0Kzq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I've just noticed that the numChain in (ath10k/)QCA4019/hw1.0/board-2.bin is
wrong in the bus=ahb,bmi-chip-id=0,bmi-board-id=16 and
bus=ahb,bmi-chip-id=0,bmi-board-id=17 from the linux-firmware and
ath10k-firmware repository. It is 0x4 for a 2x2 device. This was fixed in
the QSDK by commit 171b9607fb8cc694ed469a4e29c91af9d92f2971 [1]. It is not
known to me whether this has an effect when the pre-cal data says that the
device should use numChain 2.

It is also currently unknown if this is actually the correct fieldname
(it is just called numChain_A_0_0 [2] in some text files we got from the
netgear GPL drop [2]). But I am talking about the byte at offset 0x2771.
The only other change in these two boarddata sections is the CRC.

Kind regards,
	Sven

[1] https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/commit/ath10k/QCA40XX/hw1.0/board-2.bin?id=171b9607fb8cc694ed469a4e29c91af9d92f2971
[2] https://github.com/paul-chambers/netgear-r7800/blob/master/git_home/madwifi-11n.git/halphy_tools/host/eepromUtil/release_ipq4019/boardData_1_0_IPQ4019_Y9803_wifi1.txt
--nextPart4751606.S3aPsx0Kzq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlia9YcACgkQXYcKB8Em
e0atmQ//c66dLH27pkyZtx92ye8EDVEbB4e+pA6QlzlMooxTQeoDxu3d+1jW6Ivp
t6Sp2eGVWMV0LiZNx9RKokjYOeUA2i2xh9a3oBW2GxvUTcXD3WqacGZpy0mU+4oZ
+s0/WgD0hHLISEUCSj18UVq1hvSUGtQ0uwqlfe407IM61fH3HF5k3aYpmralnkHb
BjkFq3VbC7mFlmXoIUL4yJwiF1fQSY65IQWdC1WXDwT7Fv3kVW4480NzI0gk8Qp+
a9UGB8f9VQvegJv88DwswLgm+fZ5B5MI220NqOrmuDQ03hw71oXRommRITP7q7IT
UWL/6TRyuQqRIhC8ejUuWmNpTdv5c+Rso7LD5H4OparR0Iw5x+hCel/87ZYf7ICm
2BmBcV6nt/8BopMYnqEQQWe0/GPH6YRunbc9mrQjkC18xDUt6l4K9cLmYa4CBaWr
XFqFkJZaThBLXmkc7tSog32/VDYadD+TO+sRyW7SjvbjX0dCF2FuvOXvCt8yr4oO
WxAwZmzZ0GqGoczYIpQmgH+G56v0zXgG1D5EkSMp/G8aF5c67WB+liedf8IW1s5G
efMPU2b9Y8pcdVqmLkrAx1RLG2+anqUaRqJz1MmBq8vcHlwxavBotyEk0XcEV1cl
SKObQDCuhS151vQ1cdsKWwqzIa8oJ7BIKMzoFX+yh8bWIttsk6k=
=YEec
-----END PGP SIGNATURE-----

--nextPart4751606.S3aPsx0Kzq--



--===============0962467237280832525==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0962467237280832525==--
