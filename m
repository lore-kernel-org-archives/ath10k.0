Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22f.google.com ([2607:f8b0:400d:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Q77-0004Vd-P8
 for ath10k@lists.infradead.org; Fri, 20 Apr 2018 07:05:47 +0000
Received: by mail-qk0-x22f.google.com with SMTP id p186so5269180qkd.1
 for <ath10k@lists.infradead.org>; Fri, 20 Apr 2018 00:05:34 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Fri, 20 Apr 2018 09:05:30 +0200
Message-ID: <2127563.6Z1DauZ1yk@bentobox>
In-Reply-To: <87zi1zjko7.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox> <4212302.P7lZVe8mpY@bentobox>
 <87zi1zjko7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5524681400144283251=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Robert Marko <robimarko@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============5524681400144283251==
Content-Type: multipart/signed; boundary="nextPart25417009.XMM0EqTsnt"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart25417009.XMM0EqTsnt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 19. April 2018 15:11:21 CEST Kalle Valo wrote:
> Thanks for the list, it was really helpful. I think I have now added all
> pending board files, but please let me know if I missed anything.

Sorry about missing the Asus RT-AC58U BDF update.


I went through added files and at least the ones submitted by me look fine 
(and I couldn't find anything problematic in the other ones). Thanks for
going through all submissions and integrating them.

pending
=======

* Asus RT-AC58U

  - waiting for v2 of the BDFs to be integrated
  - http://lists.infradead.org/pipermail/ath10k/2018-January/010770.html
  - v1 files: https://github.com/kvalo/ath10k-firmware/commit/a47bcf1e58c4d8914af0951a80fd8861368b700d


accepted
========

* OpenMesh A42

  - http://lists.infradead.org/pipermail/ath10k/2017-November/010470.html
  - http://lists.infradead.org/pipermail/ath10k/2017-December/010543.html
  - https://github.com/kvalo/ath10k-firmware/commit/5cd2bacd8e22217335e539b416d0cb8d59f8e312

* Meraki MR33

  - http://lists.infradead.org/pipermail/ath10k/2018-April/011179.html
  - https://github.com/kvalo/ath10k-firmware/commit/66be3a48d9cf17ace8413cf478a5954483393af4

* Compex WLE1216V5-20 + Compex ?

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010998.html
  - https://github.com/kvalo/ath10k-firmware/commit/b1dd338046a385743c483a47e8eef276adaba0c0

* AVM FRITZ!Box 4040

  - http://lists.infradead.org/pipermail/ath10k/2018-April/011178.html
  - https://github.com/kvalo/ath10k-firmware/commit/81a745e6a529565438ee4aea357a8a59e9564848

* OpenMesh A62

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011081.html
  - https://github.com/kvalo/ath10k-firmware/commit/a262aac7cfe5ae5833378b4f1b0634f873a4df4d
  - https://github.com/kvalo/ath10k-firmware/commit/a315471a5f4c9890e2ed1bdb008b7aae5c885ae0
  - https://github.com/kvalo/ath10k-firmware/commit/c3604f7d3ff61d1905aac644c721372f3c2a9663

* GL.iNet GL-B1300

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011058.html
  - https://github.com/kvalo/ath10k-firmware/commit/c3604f7d3ff61d1905aac644c721372f3c2a9663

* 8devices Jalapeno

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html
  - https://github.com/kvalo/ath10k-firmware/commit/71e50312b54cc972657a7b08c470088447cb9676

* Netgear EX6100v2/EX6150v2

  - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html
  - https://github.com/kvalo/ath10k-firmware/commit/dfe4b7de42e1c40dfd03526ffe7955089c4eef63


Kind regards,
	Sven
--nextPart25417009.XMM0EqTsnt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrZkToACgkQXYcKB8Em
e0Y7/A//X4arpVsh4u55ohY+iodozy1A4QKmSExCCf0pTeAtFnF0ijW4H2dOGyiL
CkLouRb2rOrwjw1JmEenL4wWmCaZmaBTSTWXUsqWMixpSDX+pFaOgrizOzIhUYDD
231WT2ofrEAciMO10qJhJiWr8/BzD3b/ln92Cbnw1K+s9ORf7nCxWTi8pLr1cNex
BiWFAjgkSm3YGZfTff9v1v7kLtSswFzHLDqRfpxpSDXS8kLhQOHHBT5oweLBFnGu
N8Of6tG63jyjN9/hObY5gcRwXudqS8PWJoQZbEDNwTZfZsCMYL19qA906ci3IGGA
ev0MZc8S+00eFaYOKpDVRUv5l60iFibyhzSv9c4BE0RyT7BwChsL9WyTjPYMe+Xk
A7HEPNQu5GFMCVfpSXmd2vKbPLpeIdbclWSFpD7QuMO/CYNeWPbmgyq/WtnAe15A
bgtqoXChFpQiFw1AqX76+UNFvdGBg5g/Ep3P5dkGHUnb4/HqvvudQDH05Iy+0k80
P2Tg/OReuM6FgaAzydhXPgHUj5hMfHCmzk3huIPzdtDzB+jo0QNhs0LtzqUbMvhO
l15JZuNs42QN1dkbwqyUR7F2X1cLY8bBMMbo2GwJUGwiCkAsXfqHni5Ua+vBzYoU
NYqObJzF1QellJnuElceMlf/bg6lbDHHE0fUmkOo3YF8wc4cECs=
=mVGq
-----END PGP SIGNATURE-----

--nextPart25417009.XMM0EqTsnt--



--===============5524681400144283251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5524681400144283251==--
