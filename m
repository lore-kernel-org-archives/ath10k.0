Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eFeTj-0005DN-5D
 for ath10k@lists.infradead.org; Fri, 17 Nov 2017 11:06:38 +0000
Received: by mail-qt0-x230.google.com with SMTP id 31so4977443qtz.9
 for <ath10k@lists.infradead.org>; Fri, 17 Nov 2017 03:06:14 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Fri, 17 Nov 2017 12:06:06 +0100
Message-ID: <2831996.nqnu04nqHR@bentobox>
In-Reply-To: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1152780237142065167=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: akolli@qti.qualcomm.com, akolli@codeaurora.org, linux-wireless@vger.kernel.org, Daniel Jeang <dyjeong@qti.qualcomm.com>, Yifeng Tu <yifeng@qti.qualcomm.com>

--===============1152780237142065167==
Content-Type: multipart/signed; boundary="nextPart2363371.yF4V3ScnNr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2363371.yF4V3ScnNr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 15. November 2016 22:07:29 CET akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
> 
> Per peer tx stats are part of 'HTT_10_4_T2H_MSG_TYPE_PEER_STATS'
> event, Firmware sends one HTT event for every four PPDUs.
> HTT payload has success pkts/bytes, failed pkts/bytes, retry
> pkts/bytes and rate info per ppdu.
> Peer stats are enabled through 'WMI_SERVICE_PEER_STATS',
> which are nowadays enabled by default.
> 
> Parse peer stats and update the tx rate information per STA.
> 
> tx rate, Peer stats are tested on QCA4019 with Firmware version
> 10.4-3.2.1-00028.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>

Why is the support for 10.2.4 firmware not upstreamed? I mean the one which is 
using pktlog to transfer the PEER_STATS information.

Kind regards,
	Sven
--nextPart2363371.yF4V3ScnNr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAloOwp4ACgkQXYcKB8Em
e0azeBAAgE5uOxsUvufaHlhEy4Jk2beEDBls2yGI4Yb5Lqq+kndb57atg16yBL/V
TLVOTUhPp2n09E9u9sUqnJls1k4iikGCrxPRjHKes/hkGtLLDBhlwqCVc5EhFJyS
IW111mYjrw9xT46unTPpJ6f30FVs5+AiGgBNjGMjXSDO6Xc8yCuKswB3WDdfLHvY
nMRk0KB2BxyMm+NjZv3Taoj6vtFTWhOz0+UNAuhUV0VUQSaSXdS0Lk04mzOIXbEo
L+yQXIBVKYvkjjM6z8gw0mp8tw1QTgRXD9Jfy/SiQUf3Llsq8dZY8w1GItQLWR6O
s6rndkuwmEsazW1f5rMe8YJ+QRQ6CD2KM3vDfStrmU1P5u0EGFY7dcKtwnF+AILc
kXVxwvU20OEmIkFgPp+XH7TD/Gdwg2jmBR/WuHwsodj/nPojM8la/3WpPilBhHJf
O7oXCuJaCLeLp0Gf6ZpbmfMUZZyDw780bZik6FrO5N7Ky5Gh5N+WzifWUsT3VOu3
MSJkKHmACa9GX5ubNH1920fbkePFXD0+/0tsFCQRJvorE4l8XsFSDElm4XUy3Ka/
bo+1yNnFc4Nt3mj2M0PCYXRML2x6Q8Mg8lc89pX4tC1/UadSTib6kKjJtfbdfJRx
x/KdBGWazUTfsJG3HK0Kcf/NSAfUdVOQZuCNQLztVAyoP6gEXBE=
=c+DJ
-----END PGP SIGNATURE-----

--nextPart2363371.yF4V3ScnNr--



--===============1152780237142065167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1152780237142065167==--
