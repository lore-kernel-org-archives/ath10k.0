Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1wVm-0004TC-Jd
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 13:22:59 +0000
Date: Thu, 26 Nov 2015 13:22:28 +0000
From: Mark Brown <broonie@kernel.org>
Message-ID: <20151126132228.GG1929@sirena.org.uk>
References: <E1a1sVV-00079q-My@optimist> <20151126121551.GE1929@sirena.org.uk>
 <87y4dllysz.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <87y4dllysz.fsf@kamboji.qca.qualcomm.com>
Subject: Re: next-20151126 build: 3 failures 15 warnings (next-20151126)
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7932092006684580858=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-next@vger.kernel.org


--===============7932092006684580858==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZOBTspFzEMOlPevk"
Content-Disposition: inline


--ZOBTspFzEMOlPevk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2015 at 02:39:40PM +0200, Kalle Valo wrote:
> Mark Brown <broonie@kernel.org> writes:

> > It looks like this was somehow triggered as part of the reorganisation
> > of the WiFi directory structure.

> This is surprising and also worrying, any ideas why? It would be good to
> understand the root cause in case there's a bug in wireless drivers
> directory reorganisation.

No, I didn't make much effort to check though since the use of ifdef was
clearly a bug waiting to happen anyway, I was more surprised it worked
at all than anything.

--ZOBTspFzEMOlPevk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWVweTAAoJECTWi3JdVIfQ1KgH/RBdqvEUc+9LSwYI0LHtPzfW
BxmFqs8xqr81JBpmBXi3u8Pqog+0xWrLZefsIssfDRfO3t1IcA0tkk9SuSDkjCsv
sKe960Bxa/1yBPnP67/GuNWNc5iOkE1y5BVTa10PKxs9Be77oZAZEANCMwaxwWeo
FpUaSbH8UcZ+lx5yT10mqAIEK1HWlXiRuZNrM/AxV9/0Y2lmjNBM8CEY9wMfBn+E
vEszFh9SAAbUMczh6j3O0xM9OF+qnZVfTnrPEcE7a4l1Y2IzKBaU/sRJZ644fYnJ
T469/8UtKr1/2kTGFil1s7j2kJ9rr0chMdipGP6bqiE8pUtFVAsGuj8mIX34090=
=+mvw
-----END PGP SIGNATURE-----

--ZOBTspFzEMOlPevk--


--===============7932092006684580858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7932092006684580858==--
