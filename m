Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f984y-0008Od-6J
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 11:50:22 +0000
Received: by mail-wr0-x22a.google.com with SMTP id u4-v6so13210759wrg.10
 for <ath10k@lists.infradead.org>; Thu, 19 Apr 2018 04:50:07 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add FRITZ!Box 4040 specific BDFs
Date: Thu, 19 Apr 2018 13:50:03 +0200
Message-ID: <6134582.leX8xKhRDT@bentobox>
In-Reply-To: <10659485.WSGLUWTQ6L@bentobox>
References: <10659485.WSGLUWTQ6L@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0368676685782041009=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>

--===============0368676685782041009==
Content-Type: multipart/signed; boundary="nextPart1591327.DhIaSnaoMx"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1591327.DhIaSnaoMx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 17. April 2018 10:15:42 CEST Sven Eckelmann wrote:
[...]
>   - QCA4019 hw1.0
> 
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=AVM-FRITZBox-4040
>       sha256sum:
>       eb866d036149fe4ba35f3f9d0d97e51969b1f1dbac6ea962daf9012ffa75427a
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=AVM-FRITZBox-4040
>       sha256sum:
>       f3dc3c2f10037722006e9e7e5173a7468649e9a554f564323f9580f4a8bba10a

Thanks,

looks like the boardata files were added in
https://github.com/kvalo/ath10k-firmware/commit/81a745e6a529565438ee4aea357a8a59e9564848

pending
=======

* Asus RT-AC58U

  - submitted before the guide was published
  - http://lists.infradead.org/pipermail/ath10k/2017-March/009454.html

* Netgear EX6100v2/EX6150v2

  - http://lists.infradead.org/pipermail/ath10k/2018-February/010845.html

* 8devices Jalapeno

  - http://lists.infradead.org/pipermail/ath10k/2018-March/010916.html

* GL.iNet GL-B1300

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011058.html

* OpenMesh A62

  - http://lists.infradead.org/pipermail/ath10k/2018-March/011081.html
  - QCA4019 files added in 
    https://github.com/kvalo/ath10k-firmware/commit/a262aac7cfe5ae5833378b4f1b0634f873a4df4d
  - "bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62" must still 
    be moved to QCA9888 hw 2.0 board-2.bin


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

Kind regards,
	Sven
--nextPart1591327.DhIaSnaoMx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrYgmsACgkQXYcKB8Em
e0ZwZg/9Engen5GAT6ZVXmSjUSfVqsJGeX6og6sooMRLH9QcMhwrjKoDQG2w5+gw
mCwXUC0I9ImNKWEji0XBTjv3Lu9xYyIr2RaJoQF86Q2BuGqzIe3O0wtTNrnbqpdF
YXIpn1gR7TEVxYCvO9u7GdDl4IJN48T3oWZNrEH3ZhUTY8tRG7m65WFfkOU304RB
yZkZ93ltTzH8YUIJwBKctyFguoC0sAJ7n44r9360ykBOcx/Z7iM78M7f+LkdCffi
y3mog12wdnzSoBtXGqsNDmmrINmmDhWaNhc5he+QN8667rIn/r/6fxilqj0VTxT0
CdN7LOa9mODIOUko8lVtDmcYca4sddHIowhg6rXzeOWuIp5u6wMzgJCRPGOWI8FM
iIa0KaDCOd2U5eTm4bzCdGO1aT71UqPsModiFBMNgbaE6VPwySRkO/j9xe74897j
oaLl9uSAjGOmgcfpq9xs2OFKb6+TfOJzOgG5AjizGZGQiCT0WQZTiEFJjqRk+ltd
RZuppzBK+9uwqzcHPuZbhBAu+/0DK1GI/ZopmwOCUC9IppBJILJjU+IaAsn2Zq5V
IK0TBcdLsVgYu2q8WtASGynl99by9nK6mZDrabJBScI54PmiDn6CZ7Eig+kjMi8/
LIsLeAHR99/Gv7AjlEfZ67cl0lEEMaEfK6GtOoZ3+8E72ypwmgQ=
=W/gY
-----END PGP SIGNATURE-----

--nextPart1591327.DhIaSnaoMx--



--===============0368676685782041009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0368676685782041009==--
