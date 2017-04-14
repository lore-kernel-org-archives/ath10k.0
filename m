Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-proxyout-mua-31.websupport.sk ([37.9.172.181]
 helo=mail-proxyout-31.websupport.sk)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cz1Be-00011l-Cr
 for ath10k@lists.infradead.org; Fri, 14 Apr 2017 13:22:57 +0000
Received: from mail-proxyout-31.websupport.sk (localhost [127.0.0.1])
 by mua-smtp-cf.websupport.sk (Postfix) with ESMTP id AE1D7BDFC2
 for <ath10k@lists.infradead.org>; Fri, 14 Apr 2017 15:22:27 +0200 (CEST)
Received: from lb-proxy-22.websupport.sk (unknown [10.10.2.22])
 by mail-proxyout-31.websupport.sk (Postfix) with ESMTP id 9C1D7BDFC1
 for <ath10k@lists.infradead.org>; Fri, 14 Apr 2017 15:22:27 +0200 (CEST)
Received: from lb-proxy-22 (localhost [127.0.0.1])
 by smtp-cf.websupport.sk (Postfix) with ESMTP id 3w4JH73vrBz6FyL
 for <ath10k@lists.infradead.org>; Fri, 14 Apr 2017 15:22:27 +0200 (CEST)
Received: from localhost (otava-0439.koleje.cuni.cz [78.128.181.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: kabel@blackhole.sk)
 by lb-proxy-22.websupport.sk (Postfix) with ESMTPSA
 for <ath10k@lists.infradead.org>; Fri, 14 Apr 2017 15:22:27 +0200 (CEST)
Date: Fri, 14 Apr 2017 15:22:24 +0200
From: Marek Behun <kabel@blackhole.sk>
Subject: ThinkPad X201/X230 and COMPEX WLE900VX-7A wifi module
Message-ID: <20170414152224.5880713a@blackhole.sk>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8587680436553221773=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

--===============8587680436553221773==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZCTf4O.yc6.7tJxEI8M3h.K"; protocol="application/pgp-signature"

--Sig_/ZCTf4O.yc6.7tJxEI8M3h.K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello,
I have a question about the MiniPCI-e wifi module COMPEX WLE900VX-7A.
This module can be found in, for example, the Turris Omnia router, or
can be bought from CompexShop
http://www.compexshop.com/product_info.php/cPath/104_105/products_id/452

On the webpage you can find this text:
  Attention : Atheros 11ac radio can't be used in PC or laptop, as BIOS
  do not detects it, as Atheros do not release such driver. Pls read
  reviews for more details about supported PC boards

  We found that with our Linux PC the WLE600VX card radio (using
  miniPCIe to PCIe adapter card) is working well.

So apparently somehow this module work on some machines and on others
don't. I have tried in Lenovo 3000 N200 notebook, and lspci sees the
device. But when I tried on ThinkPad X201/X230 (flashed with coreboot,
so the wifi-card whitelist in original BIOS cannot be the problem
here), the card won't show on lspci. I have a different ath10k card
(half sized, from another notebook), and this card works.

Is it really possible that some support needs to be directly in BIOS
(coreboot in this case) for this card to appear on lspci on X230? Or
can the reason be that, for example, the MiniPCI-e WLAN slot on
X201/X230 is somehow special and cannot handle this module?

I am perplexed a little as to what should there be in the bios, since
there is nothing special in u-boot nor in Linux kernel of the Turris
Omnia router.

I have also been thinking about creating a ExpressCard-to-MiniPCI-e
reduction (this can be totally passive, I found out). Is it possible
that the card will be recognized through such a reduction in the
ExpressCard slot on the ThinkPads?

Thank you.

Marek

--Sig_/ZCTf4O.yc6.7tJxEI8M3h.K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIvBAEBCAAdFiEElcYtIkjuDYpEw9O0Jrz6Bfz2DkwFAljwzRAACgkQJrz6Bfz2
DkwN0g/ZAfazXAdUFCRg51vYz4Ot5rJ4wZ5Di1B/IXbhaJorwFOsb7YYWEbMB4+t
9rsDZX6YrQiCVqJTN9McdG6CM7orI/CRdpkSkTbA02klN1RPSn4S1AdSV64o1pyt
JNVOcwlpm2dyaVwltRQhYNBak7Yc2nM8SecflnuOid3zF+oJ+zM0mNbPmglsD8XJ
PLvCYsOCky0Bp5EqdxdnqCZyTrer7KNMAIvayZ5IsDZKAbN00OSxkuRwfJ/owgTy
za5lPeq7VvBL+R+hdwjnTq7n8y3i9LoET87Wq7JuPIYZMFIwkPuOPI+QWItYDDnO
nKN4Kixu7OxCu4JnWBqiVpWjIJG8VA45jmMuDCJqriXoZJRd+0/A3sNGdunQD8LH
oWkL0YHF+Sni9JfUp9rtOzoFlHD9wny+AQBLk3Vsp6DSPGqGpvB4NcGmPJ5xjh+q
vxpM6IsNaEliDk9NT5JZVZ4l5xAAQfA353MnlhNbzAXt6T2/JROx5dLbQgQea7MR
RjiyWUcB2dQwLPnS4zlBTEtz8GFXXuukZJ0R6VEO9h1JshsXOa4oMb12Lg6HsRut
9RKgO++Rw4rlZATHarLsqtf7lqwa5yFFH13kUiQalAGrx5cuRsSp2kq4DzN2+sLJ
7zDKO/zLD7+UUGuC7zk5HBZ9o4d3IJ5BRe65w0msZuBk7Q==
=6XlT
-----END PGP SIGNATURE-----

--Sig_/ZCTf4O.yc6.7tJxEI8M3h.K--


--===============8587680436553221773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8587680436553221773==--
