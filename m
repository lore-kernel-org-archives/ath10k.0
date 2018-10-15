Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga18.intel.com ([134.134.136.126])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCB1O-0001pS-LI
 for ath10k@lists.infradead.org; Mon, 15 Oct 2018 22:07:31 +0000
Message-ID: <d0a66e5c6c5cb385c07588859bac6a1d715bb435.camel@intel.com>
Subject: ath10k: Kconfig build warnings
From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Mon, 15 Oct 2018 15:07:18 -0700
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1339901798996170896=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org


--===============1339901798996170896==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-AKYUPrnecH9NpVx6UY5r"


--=-AKYUPrnecH9NpVx6UY5r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure if you aware, with David Miller's latest net-next tree, doing a
'make allmodconfig' produces the following Kconfig errors:

[15:06:06]$ make allmodconfig
scripts/kconfig/conf  --allmodconfig Kconfig

WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
  Depends on [n]: ARCH_QCOM && NET [=3Dy]
  Selected by [m]:
  - ATH10K_SNOC [=3Dm] && NETDEVICES [=3Dy] && WLAN [=3Dy] && WLAN_VENDOR_A=
TH
[=3Dy] && ATH10K [=3Dm] && (ARCH_QCOM || COMPILE_TEST [=3Dy])
#
# configuration written to .config
#

--=-AKYUPrnecH9NpVx6UY5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiTyZWz+nnTrOJ1LZ5W/vlVpL7c4FAlvFD5YACgkQ5W/vlVpL
7c58xw/+M7m13hD8WB9g1RCmTaP4qIzLku9+RUuQeH8Xyw5Af1IcEY4rRaUc8Z59
/1r9q3IgpVXwoGGfRRmCvlZpAftWnBxLMq2v+P+LJIwqSpfpGSrHcYqybcapZxd9
900c1PyWmSAXbeekc6sEDEYjnrKm/Zx7NuRMzo3o7SEYMQ5bRJVbMTn2mxaUfqI0
SBcL1EkGzxHv4JJ7qZqy7jbrs1h+0tEH/EicJeJ6uyx+YxEWJZKhG3ATvFc2+TT9
MCCrPvnKlhVeP2Bn3JYxWtObt90sRb6xf2f1dsbwDdPYktAs4LJO+EvnatUuqP2u
UMaZkW3MPd1GFjk7FSMZ/j09kOOjfWxTL18pSpbfs93/6fpZcDL/aIXghPJ9BTbM
poCOHDO1jC2uVyoAR0x+xLTy8erE3VGQI0X0QDtMSh8XuMi5BSBsLj+ZMhiRAADb
mdxzOfR5OJnKYjQsF8+VjJDWcsABoUNnuYKsn3I4AmLsEN0ZAuZQJYIRDxNAVqPp
JZNfIbM9p7eSgasHyQsresKRKAW5iGK08VH6/aKcMjxY+dn4NsGRvw/cnQub/tyF
iwp+LaQjpHPTmiCZJUnH4sdrS3fHFmj6qFaUQe9wT58K0Rgtneg4x201TXljVDPs
yt0MGWWBFFedP5Rs2jMDHtJ7ib/zMfM9JAClMbnWbCl+N5rb3bY=
=h8dT
-----END PGP SIGNATURE-----

--=-AKYUPrnecH9NpVx6UY5r--



--===============1339901798996170896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1339901798996170896==--
