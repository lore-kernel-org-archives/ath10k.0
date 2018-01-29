Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eg4LX-0002FO-8V
 for ath10k@lists.infradead.org; Mon, 29 Jan 2018 07:59:21 +0000
Received: by mail-wr0-x22e.google.com with SMTP id w50so6090235wrc.2
 for <ath10k@lists.infradead.org>; Sun, 28 Jan 2018 23:59:08 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add OpenMesh A42 specific BDFs
Date: Mon, 29 Jan 2018 08:59:04 +0100
Message-ID: <1728597.VOqZ93QOv6@bentobox>
In-Reply-To: <874ln8txhu.fsf@kamboji.qca.qualcomm.com>
References: <6906010.WJMafUttCS@bentobox>
 <874ln8txhu.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8317587632263526096=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Christian Lamparter <chunkeey@gmail.com>

--===============8317587632263526096==
Content-Type: multipart/signed; boundary="nextPart1666141.N8MMVgmz6O"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1666141.N8MMVgmz6O
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 26. Januar 2018 16:07:10 CET Kalle Valo wrote:
[...]
> > * bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42
> >   - sha256sum: 
> >     10700a7ac636d57fe055e5bb4bd5f7bb3f1c282a7f25a8bb2204fc36e8c317bf
> > * bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42
> >   - sha256sum:
> >     b3d9556894e509ac608b2e27c9169da12c63634670bb69c5ef21fb31583e7998
> 
> I added these now:
> 
> https://github.com/kvalo/ath10k-firmware/commit/5cd2bacd8e22217335e539b416d0cb8d59f8e312
>
> To make this easier I did some bigger changes in ath10k-bdencoder,
> please check carefully that I didn't break anything.

Tested it by extracting the files using the ath10k-bdencoder d278f25bc977 
(from 2017-02-10) and then calculating the sha256sum's using

    $ sha256sum bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42.bin bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42.bin 
    10700a7ac636d57fe055e5bb4bd5f7bb3f1c282a7f25a8bb2204fc36e8c317bf  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=OM-A42.bin
    b3d9556894e509ac608b2e27c9169da12c63634670bb69c5ef21fb31583e7998  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=OM-A42.bin

It was also checked that the board-2.json only had these names attached to the 
.bin files.

I did the same with my reference files and came to the same results. I am
assuming that the files must have been added correctly when the names are 
correct and the content is correct.

I have then extracted the version prior to the OM-A42 change and compared it 
to the one with OM-A42. The only difference I could find are related to the 
OM-A42. I must therefore also assume that only the relevant parts were changed 
and the other BDFs were not touched.

Thanks,
	Sven
--nextPart1666141.N8MMVgmz6O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlpu1EgACgkQXYcKB8Em
e0YGcA//XVWIy3KKxnqaVt1LdtrEKdsaCyLaHmVOCgQGmnsaygczVTov//Q82S/r
d7jPgoOAg6O2LYM4VZF3RTFjya50mSDBD0zQMtB1QCxRvBZjrPgoLTKDTPYBsAvo
k36Z9mF5/g4xYbRh6fx8C035h0hZGVV8KKOBPzMaUA/7R2kWH5Jv46qQDDKOJHa4
hiylaaVL+5Q12GCII00cWFrPFkiMZ+nkZIaXLGZmDe8/mYzgqVVIc79mOuj90u5c
h7C1tdd8+6LjIsFAUPkFATScy1QJzWT8hKuVQJuuv0t0Ot8y0MkudVqU/AJPelTR
q7qf5u6RQY3ZnaiO2cw8ALsxltjZqrpqkY3yyOPyrixm10X4ZK5tKc5VihPIPZCQ
PNwP/RBB/28IzcyeNF6IjUNvr8vw5ZTE2iH5cbEbZtIo3ot1JRfhAxNC5w+BH/cV
m7ezhAfWwdGFqnL1oQj3aYq7r/lxUrYFdoEx70lR2uPJHuJnzhJdL0Xbn0+RPbrF
pPkePQ20jny7hoFkjpz8G3kyBCCWeafCC+H1FIXmDE/KKegEVvVkoutGahvMAFOh
Xt4Vz4i4P6nPmak/wTHgZVYJwgFfyMiKfF3H56W7L7Azdh/aUsOgfc1fntEgTNFe
HMhSTn8kzI7T1LRa8eNIRLiWFPg9Vk0flOglAoj2pIZuBv8Yyt4=
=+24v
-----END PGP SIGNATURE-----

--nextPart1666141.N8MMVgmz6O--



--===============8317587632263526096==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8317587632263526096==--
