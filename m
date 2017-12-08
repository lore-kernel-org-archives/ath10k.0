Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNFcH-0004B5-9m
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 10:10:51 +0000
Received: by mail-qt0-x235.google.com with SMTP id e2so24779811qti.0
 for <ath10k@lists.infradead.org>; Fri, 08 Dec 2017 02:10:27 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add OpenMesh A42 specific BDFs
Date: Fri, 08 Dec 2017 11:10:23 +0100
Message-ID: <2034593.ZGk7hIU2tC@bentobox>
In-Reply-To: <6906010.WJMafUttCS@bentobox>
References: <6906010.WJMafUttCS@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7360957920808614609=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Christian Lamparter <chunkeey@gmail.com>

--===============7360957920808614609==
Content-Type: multipart/signed; boundary="nextPart2463976.vNN4RK8BL5"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2463976.vNN4RK8BL5
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 28. November 2017 15:45:52 CET Sven Eckelmann wrote:
[....]
> I think that Christian Lamparter also has some BDFs for Asus RT-AC58U, 
> FRITZ!Box 4040 and Zyxel NBG6617 [3] which could be upstreamed in a similar 
> way. So please tell us when you want to have these things submitted in a 
> slightly different way.

There is now a wiki page under https://wireless.wiki.kernel.org/en/users/
drivers/ath10k/boardfiles which describes the required information. Here are 
the answers to the questions:

* description for what hardware this is:
  - it is a QCA401x based board (based on qcom-ipq4019-ap.dk01.1)
  - the 5GHz and 2.4GHz radio components were drastically changed by ODM
  - it is sold as OpenMesh A42

* origin of the board file (did you create it yourself or where you downloaded)
  - it was created by the ODM and QCA for the OpenMesh A42
  - was provided by the ODM to OpenMesh for this product (this includes
    distribution)
  - it is the latest release from 2017-05-29

* ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
  - OM-A42 is the variant string
  - complete strings are listed in original mail

* attach the actual board file (board.bin)
  - See original mail

Kind regards,
	Sven
--nextPart2463976.vNN4RK8BL5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAloqZQ8ACgkQXYcKB8Em
e0Ypgg/7BhBIG7bZnUyTh0vsxJZSULzxvJL/wzG1nI4Y7oEAIpSKAWJVrI13ElMD
U96Fi9pu1UDiwrTE9fzxjYzSiGTpWmCOTDbVV1C16LEZqhyQ+La/29aA2LxhoX8T
hz8G+n7ECztmivdPM0PXM0WuB+PnobpvoVrT41e8NV0ZKkB8QqXYblA2iEZBMd+5
M3Yq8jaMCaCVvuMjgH191ImOV6PGn/+JE5IMAJjPcIUIwTgKBDKnhp2nWMEvY+Bq
18sX5JS6Wpf/UWM4iu+R3lFTKIze/+5VZffpLxN5SckU+cz9jxKU1JXwPCxYiCkA
9OZvf+iR4kO+//729VKUNh6gW8Fv1dLsEqYZtyNr5dhGdFaASDTurg46Mpa6yKUd
QXPYU2UNiSjgrS7ex6THMxwr6fwLIfDwd4almhPRZ86d7hshygRCIxD3dqvSFcGV
BhF8UsYjhHBpwi73ul564sKLmsLMNqYctfTxQ8eKJIJKxI2/knqXzMjuB64fJQ8P
y/lzz8rUjZlYexVy88F7oMFUqDN6OxEgVCHWfjvjiDFeBtaS5AijYyf+YzsIRAwQ
JXmeBgb68kCxWP0auAnObGZjhBLtUK2LfqeDiLhRgcSsPsuNATUm4Ha0XsMttpTg
PIshrx0WQfAy2MuQeKJtsp2io1+ScfXWg5piWCo2h7JfESbmkBs=
=4X+2
-----END PGP SIGNATURE-----

--nextPart2463976.vNN4RK8BL5--



--===============7360957920808614609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7360957920808614609==--
