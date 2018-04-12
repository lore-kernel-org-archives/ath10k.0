Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6WeR-0006FL-MX
 for ath10k@lists.infradead.org; Thu, 12 Apr 2018 07:28:13 +0000
Received: by mail-qt0-x232.google.com with SMTP id s48so5130843qtb.10
 for <ath10k@lists.infradead.org>; Thu, 12 Apr 2018 00:28:00 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: Please add new board files for WLE1216V5-20 and another Compex
 NIC.
Date: Thu, 12 Apr 2018 09:27:55 +0200
Message-ID: <2080980.pDnGlZTBzu@bentobox>
In-Reply-To: <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>
References: <044ffe4d-4c50-4aeb-392c-aea9a813ebb4@candelatech.com>
 <CAJ+vNU1MSa3iR7dAW6M+TiKutzyYSeT3p4H0J8L_W3mTTEtyzQ@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5674442245498433809=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, Tim Harvey <tharvey@gateworks.com>, Chris Blake <chrisrblake93@gmail.com>, Ben Greear <greearb@candelatech.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>

--===============5674442245498433809==
Content-Type: multipart/signed; boundary="nextPart3801807.kgBBa08rLl"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3801807.kgBBa08rLl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mittwoch, 11. April 2018 08:18:15 CEST Tim Harvey wrote:
> It's not clear what the process is for getting new board id's
> supported in the board.bin files.

The reaction of QCA when asking for new IDs was mostly "please go away, we 
will not talk to you about it". But with the help of Kalle Valo, a new 
mechanism called "qcom,ath10k-calibration-variant" was added (for embedded 
boards which include QCA 11ac wave2 radios). There are a couple of mails 
about it on this list - a general overview about BDFs, variant strings and 
why we need them can be found at 
http://lists.infradead.org/pipermail/ath10k/2018-March/011066.html.

But it looks like you really got the IDs 30+31 (maybe because you are selling 
the, as separate PCIe modules?). Then I would guess that you can still use the 
same process as we use for the accesspoint specific BDFs (just without the 
variant= part).

The description of the general upstreaming process can be found at 
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles - but it 
seems like Kalle Valo doesn't have much time for it at the moment for it (or
there might be other problems which we don't see from our perspective - for 
example legal departments).

Maybe you or Ben Greear can enhance the submission for the BDFs to better 
answer the questions from the "Submitting board files" guide. 


Examples for such submission
============================

* OpenMesh A42

  - applied
  - http://lists.infradead.org/pipermail/ath10k/2017-November/010470.html
  - http://lists.infradead.org/pipermail/ath10k/2017-December/010543.html

* Asus RT-AC58U

  - not yet accepted
  - submitted before the guide was published
  - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html

* Netgear EX6100v2/EX6150v2

  - not yet accepted
  - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html

* 8devices Jalapeno

  - not yet accepted
  - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html

* GL.iNet GL-B1300

  - not yet accepted
  - http://lists.infradead.org/pipermail/ath10k/2018-March/011058.html

* OpenMesh A62

  - not yet accepted
  - http://lists.infradead.org/pipermail/ath10k/2018-March/011081.html



Still waiting for send BDFs to upstream
=======================================

* Meraki MR33

  - Chris Blake?
  - https://github.com/openwrt/openwrt/blob/master/package/firmware/ipq-wifi/board-meraki_mr33.bin

* Fritzbox 4040

  - Christian Lamparter?
  - https://github.com/openwrt/openwrt/blob/master/package/firmware/ipq-wifi/board-avm_fritzbox-4040.bin

* maybe more which I missed


Kind regards,
	Sven
--nextPart3801807.kgBBa08rLl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrPCnsACgkQXYcKB8Em
e0YUrA/7BT/K2OFZDL2LIWa+Y4CcueAz9+Amaiuaz4ktwvKrj2FHNsnCibP2PtV7
IBsRuve+/pWwjFq5sFKCn6auEbRRqBzAZlKKxK5vFLAc3G2PYlFloWO3vvs0Fi+B
eZePxQRIpCQ8tBo+sYvu/Sx4hRU7YRwfhoFm+m9oMwl53OqdlKl5qJkKWdgrsLlj
kKgRlk+ADtP2oehdHzk2jKBjo23HWKdKa/jc4gULO1j4FsK1yCMvMeIdYeKYfr14
aM/6SfhY7MlmIUr6jfoiKoq0/MeFUP1hfaSPwWo2BZih+Cqzw8NMaexsyB1b/F5H
NzEpilZvmyluFPP1bNPCN6C7D120toeNjJiJqDF32lXZUjav/2aDzkF6XvQeEmuK
e9Y7xest9xvQI75jHsR14qnVc2WX/37W0f9nadYWL72eNkrUcODiIwtHyRgN7Ngf
GFCwfWGWnICTVcsYyBQHnkOWCkb4N0Eyuk0gCXhN1bIvitZi53dnQSj8xZvaxVHO
RM3Y8wc7fbp5qgTUpLV4Oc4XXi95sAsO5/g/TggjCqXzaTTJpFloyuzGRrflOi8o
nWl3u4kPVr+sVjn1XasE1WKVKMaOsJizhoHA94NrQQ9yjffKlnIrH3Ls0CBmzT3D
HBVzY9JSnRl6TQs0hmP2lIseBXJzmYoMK5qbHeb7HucFg/m06RQ=
=Z2f+
-----END PGP SIGNATURE-----

--nextPart3801807.kgBBa08rLl--



--===============5674442245498433809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5674442245498433809==--
