Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0VNv-00082G-89
 for ath10k@lists.infradead.org; Tue, 18 Apr 2017 15:49:46 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: How can I use the ath10k 4.9GHz band?
Date: Tue, 18 Apr 2017 17:49:19 +0200
Message-ID: <5948146.VDxszqfsK7@prime>
In-Reply-To: <894a88a7c45afe22b31aa419df683576@cvweb06.wmail.nhnsystem.com>
References: <894a88a7c45afe22b31aa419df683576@cvweb06.wmail.nhnsystem.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5147146807917668154=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, Kwang Min Kim <gwondori@nimbus.kr>
Cc: =?utf-8?B?6rCV6rK97JmE?= <bigskang@nimbus.kr>

--===============5147146807917668154==
Content-Type: multipart/signed; boundary="nextPart8939118.Iah7FIpKaF"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8939118.Iah7FIpKaF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Kim,

I've posted some patches recently here:

https://patchwork.kernel.org/patch/9641113/

Not sure if those channels match those which you have a license for, though. 
And they are for a more recent kernel (i.e. not 4.4)

Cheers,
     Simon

On Monday, April 17, 2017 7:47:18 PM CEST Kwang Min Kim wrote:
> Hi,
> 
> How can I use the ath10k 4.9GHz band?
> 
> I have modified "core.h" and "mac.c" but 4.9 GHz band does not work.
> 
> The chipset I am using is QCA9890 and the model name is WLE900VX-7BA.
> 
> And driver version uses backports-4.4.2 stable, and the firmware version of
> ath10k uses "10.2.4.70.63-2".
> 
> Thanks.
> 
> ---
> 
> Kim Kwang Min
> 
> Mobile +82 010-5521-6393
> Mail gwondori@nimbus.kr


--nextPart8939118.Iah7FIpKaF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE1ilQI7G+y+fdhnrfoSvjmEKSnqEFAlj2NX8ACgkQoSvjmEKS
nqEjsg//WvIiqTYAcSBMkOZsjOi9WGssPDNlQKqv4g8uAEKokp1Skcylm2kkGhCP
aQ7V9bwowWnvNOteAtE3xC539t46oerU71ZzCHGUm+OuVzkQWfG3IbD6eJ5j0xf3
u1KWFqpDT8fH4lN46HlMdYaDllcDiTDXaMzRPwfomR8UVEOI47JJJ4wuoCvHLois
RczG7TXdCF6KPgRQ1BvEmQuu+52g4d9ixroOxkv0IoW30ULYPxWm/9IegCn979SI
d6qK8PC6xXOg4qoGCSuZ70qqFZ1UU74z9CzacfOK2Aq1m6kicJs7fC+QwJQgiZ4k
Vxa+Zg8NBzWugX8ctAIpgSNZb0ov5zBQvk1baYkFnCFMdyhvqLlUS61dD6sa1oMa
Y8ppyQWKiJsf09vQuD/0tTcencmrNLuflfWOPsAskVkg8PcLhnPmkybOnL100DNO
98RbS5wLGakGDf++OKv0A4ekSbINSc9k6MOWROy+82pZw+MqjhFNyfMcx9Z7rUIj
N6IG6iAiehanfmbPrjYDY1ziIZ9x0Dx4oKeh8kMMZtGbZoks/Hd4tODvgqObuoWB
e9o/ZPY9yhVDLgu6J1N7Y2lBO3gjZCG0T7AeSy4i9JhkRckytWSc3tGUU+Xwcm1l
1lp8h/ljv3WtY54YKipj5kHN6o6RQczq9an0gQ+uO6Zaea6/WPM=
=aRjd
-----END PGP SIGNATURE-----

--nextPart8939118.Iah7FIpKaF--



--===============5147146807917668154==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5147146807917668154==--
