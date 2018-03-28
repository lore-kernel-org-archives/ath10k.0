Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f14iw-0000h6-9X
 for ath10k@lists.infradead.org; Wed, 28 Mar 2018 06:38:19 +0000
Received: by mail-wr0-x22d.google.com with SMTP id z73so1106385wrb.0
 for <ath10k@lists.infradead.org>; Tue, 27 Mar 2018 23:38:07 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH v2] ath10k: Implement get_expected_throughput callback
Date: Wed, 28 Mar 2018 08:37:57 +0200
Message-ID: <1580002.5HauTVtcdp@bentobox>
In-Reply-To: <7428dc3685e146dca147805b6a1bc5d2@codeaurora.org>
References: <1521814034-17880-1-git-send-email-akolli@codeaurora.org>
 <2322769.sx4MhzsvNg@bentobox>
 <7428dc3685e146dca147805b6a1bc5d2@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5080759949198679259=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: akolli@codeaurora.org
Cc: Marek Lindner <mareklindner@neomailbox.ch>, Johannes Berg <johannes.berg@intel.com>, linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, Antonio Quartulli <a@unstable.cc>, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

--===============5080759949198679259==
Content-Type: multipart/signed; boundary="nextPart9457349.u0DxnthKuk"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart9457349.u0DxnthKuk
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mittwoch, 28. M=E4rz 2018 11:41:51 CEST akolli@codeaurora.org wrote:
[...]
> The rate average and throughput are relative. no?

In the sense that rate has a tendency to affect the expected throughput - y=
es.=20
But it is not like the expected throughput perfectly correlates with the ra=
te=20
and you only have to multiply with a factor X (which seems to be missing in=
=20
your code) to get from rate to expected throughput. The average packet loss=
=20
for this selected rate, interframe spacing and the aggregation are importan=
t=20
factors here too.

But of course, I cannot say much about how the rate control from QCA works =
and=20
in which form these information are already available.

If you want to know the average PHY rate then wouldn't it be better to repo=
rt=20
the rates to one of the upper layers and let them to the averaging? Similar=
 to=20
what there already is for NL80211_STA_INFO_CHAIN_SIGNAL=20
(NL80211_STA_INFO_CHAIN_SIGNAL_AVG) just for NL80211_STA_INFO_TX_BITRATE/
NL80211_STA_INFO_RX_BITRATE. Not sure whether this makes sense or whether=20
someone has an use-case for it.

Kind regards,
	Sven
--nextPart9457349.u0DxnthKuk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq7OEUACgkQXYcKB8Em
e0b6BQ//bOXdeGgcadXWMaSHmjv2+T2i/WDBpGpkkNs3c13tOzemhTidGn0yrYEa
oOOXYrE6FjSFTxMGqIqzwIsXdLVUUe+P8tbW6DMWU95lquVtTJuy1FVY6ptn33Fg
45PS3+2PXgDR6oqEwpQRBheb52npX1scDdposUqr1CerWwm/ySr8Yc8NwlrWEMK7
b6YfE9ljNtiYpCmG2ojGkbr6U7BX5GLHiutzdhDur8CFtV+rtos4jUDuIbANqJOh
VXMCruHwL/yTLSTZgQ8ZjfRJJtcgcpwulFrWyJ7xCJcZo+eehXTqoJY1i53L/QUS
FbbzU6fuP0oTlTUcsL4uudItFUch0qixLXaqWjeeU7rb06t024ouuhNh0SQRaxbg
gz0bXTYg5Mb8G5M5WWo28WAS3Lc3kCdey8NVS4Ha4Sy8Gk7jvxa50assfVBbCYf4
/WzHU+RYYOoQG3DIbzoJ2biu0dNZZALxAOf2pTv+1eruG1yHdBCaqzysJjmJ4wNA
s4M1lN+4dWtkJeS5ynu03iIqgmgrc/HC5Zh2X9nYwos5fNaxeGjlBsbX55yXmLZJ
n3DwayQxHPDzRqbpdm/1INIcLeH6uNSKBw2Ber8Uz9tzKNlhlCe4NJ9w209SPSSl
sKJ+qb6tQRRhQ5rKbRtwYB9VrRyNUoKIdaoKLVJrQEPnb2SO0Dc=
=sFZl
-----END PGP SIGNATURE-----

--nextPart9457349.u0DxnthKuk--



--===============5080759949198679259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5080759949198679259==--
