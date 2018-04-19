Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x231.google.com ([2a00:1450:400c:c0c::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f93FM-0006Pl-Br
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 06:40:46 +0000
Received: by mail-wr0-x231.google.com with SMTP id u11-v6so10775249wri.12
 for <ath10k@lists.infradead.org>; Wed, 18 Apr 2018 23:40:33 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Meraki MR33 specific BDFs
Date: Thu, 19 Apr 2018 08:40:30 +0200
Message-ID: <11559907.k6pzjtUMWa@bentobox>
In-Reply-To: <87o9igmp1l.fsf@kamboji.qca.qualcomm.com>
References: <1756157.Q00gyP1f8V@bentobox>
 <87o9igmp1l.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8350855830483755565=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Chris Blake <chrisrblake93@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============8350855830483755565==
Content-Type: multipart/signed; boundary="nextPart2000662.J9xSOKTJ66"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2000662.J9xSOKTJ66
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mittwoch, 18. April 2018 16:56:23 CEST Kalle Valo wrote:
[...]
> I added these now, please check that I did it correctly. It's very easy
> for me to make a mistake.
> 
> https://github.com/kvalo/ath10k-firmware/commit/66be3a48d9cf17ace8413cf478a5954483393af4

Thanks, this looks exactly like requested. The change looks good and I will 
prepare the OpenWrt change.

pending
=======

* Asus RT-AC58U

  - submitted before the guide was published
  - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html

* Netgear EX6100v2/EX6150v2

  - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html

* 8devices Jalapeno

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html

* Compex WLE1216V5-20 + Compex ?

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010998.html

* GL.iNet GL-B1300

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011058.html

* OpenMesh A62

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011081.html

* AVM FRITZ!Box 4040

  - http://lists.infradead.org/pipermail/ath10k/2018-April/011178.html



accepted
========

* OpenMesh A42

  - http://lists.infradead.org/pipermail/ath10k/2017-November/010470.html
  - http://lists.infradead.org/pipermail/ath10k/2017-December/010543.html
  - https://github.com/kvalo/ath10k-firmware/commit/5cd2bacd8e22217335e539b416d0cb8d59f8e312

* Meraki MR33
  - http://lists.infradead.org/pipermail/ath10k/2018-April/011179.html
  - https://github.com/kvalo/ath10k-firmware/commit/66be3a48d9cf17ace8413cf478a5954483393af4


Kind regards,
	Sven
--nextPart2000662.J9xSOKTJ66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrYOd4ACgkQXYcKB8Em
e0ZHUg//XgRBUANE+AxCnmzfbg5oiRsBhbD7P2LXZq4ks+RXqYH5K3GSpevMVMUX
++CSAHNpatSQ7qyq3FDRSFPGwvpbbg5WjHVtK/Bih+dR0aGpJHkeZzEMY3j2RTYh
4nmcRYrDiBVw56U/ppMQ9LyaFhE/XYGDmonhIVrslhBP0IuZsjYqHkBcaFJXAD1a
baDrRx97fN8byVevUI5ZduTIiFPhhM4fqyvpq3M22ZBd5z1J2icMmFilcbcMhJky
v9PYRMgcH4CeeoDYlLXy0DjpREA+8FRnEfiIOF08J19MryhFq8aUQQ78if0jLep+
t4yWGG1YPRrkPaVyF/S8lJ8nNXGRbgoKyNH4rNt0mAqFlwHGulympoOBG2t9uXmd
WUMA45TilXCmCVk5yi+qg6+fbgVJSnTlZ7E6Al5WqFmktg9L+U8r8dVAqTsvVfEa
W5AvjY1W5UifN5PHF+oVpR9E4hlq3pjUrnm5F7Ko5a1nSEHP1xMd5UPBwFQ6VnnN
5WzW6qR0LY5jI58ZLR9UDnJnvbN6UIdfFI9M9oFvTze8yGq9jaeudWdHmHle8HF+
j5PaWMuG+bUePqq2gNTiYw7lXuKHcS+Deh0Vu7208g6eA6Y2fBGFY8PQllGzlxL/
BOfJZQ+Qa5/N76A5Zphyiu2NgPpXgrEKyYR6+u55peTnRru7/iw=
=HjKA
-----END PGP SIGNATURE-----

--nextPart2000662.J9xSOKTJ66--



--===============8350855830483755565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8350855830483755565==--
