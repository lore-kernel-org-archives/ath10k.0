Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9AqW-0008EQ-Pn
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 14:47:54 +0000
Received: by mail-wr0-x229.google.com with SMTP id q13-v6so14817984wre.3
 for <ath10k@lists.infradead.org>; Thu, 19 Apr 2018 07:47:26 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Thu, 19 Apr 2018 16:47:22 +0200
Message-ID: <4212302.P7lZVe8mpY@bentobox>
In-Reply-To: <87muxzl10g.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox>
 <87r2nbl1k8.fsf@kamboji.qca.qualcomm.com>
 <87muxzl10g.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5495528052598501547=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Robert Marko <robimarko@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============5495528052598501547==
Content-Type: multipart/signed; boundary="nextPart1575172.scLUc5INHy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1575172.scLUc5INHy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 19. April 2018 14:33:04 CEST Kalle Valo wrote:
> >> Unfortunately, this is wrong. Please check the mail again. The 
> >> bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62 BDF is for the QCA9888 
> >> hw2.0 board-2.bin and not the QCA4019 hw1.0.
> >
> > Thanks for noticing, I'll fix that. But please separate different hw to
> > different mails, this way I can process them one hw version at the time.
> 
> Fixed now, please double check:
> 
> https://github.com/kvalo/ath10k-firmware/commit/a315471a5f4c9890e2ed1bdb008b7aae5c885ae0
> 
> https://github.com/kvalo/ath10k-firmware/commit/c3604f7d3ff61d1905aac644c721372f3c2a9663


Ok, will use md5sum and split my submission based on the wifi hw.

The board-2.bin's look fine now.

pending
=======

* Asus RT-AC58U

  - submitted before the guide was published
  - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html

* Netgear EX6100v2/EX6150v2

  - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html

* 8devices Jalapeno

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html


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

Kind regards,
	Sven
--nextPart1575172.scLUc5INHy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrYq/oACgkQXYcKB8Em
e0aHzRAAliof+rJnK0vIrilGFLmesgic+Qz3JbcgUuOf/6R6s0P0V+/kySwidQHT
oDX/euzyKYi2YVWcxyF+uh2Zu7CQFIcRoTrUEE/cBrTunlsXipaOqJtDuZ/PJR56
4fsHbzNwF5JzfQP1TgX+DQEWTfnYwstJ8onMak2Wox3mhEH3OJpdjRMS3yGlgkaY
if0SFweyFU8/Ynx1FQQ4kMfrIupkBmSotzaIArf1gHPtuOxT8Bhjn66GZ2q6sZVk
lvBmCoRJI48agaUX5i2/r+WDZ4nL1Ae8l3/sjJp3GbuOsWq21RBB1cWfnBSi7gKH
axwfVg3KsNr8iAIey4fEWrFYzyS9rrIN96FAN8acexyVUAErFmMlYWlZCbWCGFtw
74nFzSmdPHK+WRLfUa6gltpIi9AdG8ljJVbLLAYbjO8bkUmZd6PS/vOjLgZew7Vt
FwQlHppFLEUDnJFob5RgaUp2GpAUuPxrBsmtPn0MreY4gRtzKPCpn+Cbm4NT2Irp
AAEwpuXr+Lz+klXF75G3ootF6HalwNCGYMJeVO4GPwk5mUUeWGhGakJaBHBGthA7
ljHuIy9hartwqnE1BjoEx1a9OGWLN8O7j4ebSyy5c4Y4b3c/YM9oVzOB+Bx03rkP
jSNnRzBiXTBptM0FPgLoAk6RmUAybj5o4XFLykEIBxZk+gS51jw=
=dNsP
-----END PGP SIGNATURE-----

--nextPart1575172.scLUc5INHy--



--===============5495528052598501547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5495528052598501547==--
