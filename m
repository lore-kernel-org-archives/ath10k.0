Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a23cy-0003kW-7x
 for ath10k@lists.infradead.org; Thu, 26 Nov 2015 20:58:53 +0000
Date: Thu, 26 Nov 2015 20:58:21 +0000
From: Mark Brown <broonie@kernel.org>
Message-ID: <20151126205821.GI1929@sirena.org.uk>
References: <E1a1sVV-00079q-My@optimist> <20151126121551.GE1929@sirena.org.uk>
 <87y4dllysz.fsf@kamboji.qca.qualcomm.com>
 <20151126132228.GG1929@sirena.org.uk>
 <87lh9kn1dz.fsf@kamboji.qca.qualcomm.com>
 <20151126170300.GH1929@sirena.org.uk>
 <878u5kmwya.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <878u5kmwya.fsf@kamboji.qca.qualcomm.com>
Subject: Re: next-20151126 build: 3 failures 15 warnings (next-20151126)
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6629352862555470580=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, linux-next@vger.kernel.org


--===============6629352862555470580==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Yvzb+MHGXtbPBi5F"
Content-Disposition: inline


--Yvzb+MHGXtbPBi5F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2015 at 08:34:20PM +0200, Kalle Valo wrote:
> Mark Brown <broonie@kernel.org> writes:

> > It still ought to be fixed regardless of why it showed up - the
> > intention of the code is that we build the real thermal code regardless
> > of if that's modular or not but that's not what the code actually does.

> Like I said above Michal will apply a fix to his tree. Read the full
> discussion from patchwork:

> https://patchwork.kernel.org/patch/7707801/

Oh, right - a fix for this specific issue rather than a fix for whatever
change he made.

--Yvzb+MHGXtbPBi5F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWV3JsAAoJECTWi3JdVIfQaXkIAIT3D4HnY5I5amYE4qZOqzsm
466tTH6azFYF8jjum7ahnx0nOow+UEjW52wrXzzOdVkqvNt+n+7un4UF9nmZl5Cl
bkrb+1rf+jh2aXXC642TXhozo3Je4veT6Xj7fJOFjvT+WAWWdcC5n66MhJyee7nt
XQW9kTAW6mC+7IwtfoNC1cL3xjEKOb1nfaH2Bs12fjBM0noa4SxY5LLhRUbsDgCp
jg45W1sS53aRB7MtGhOdZpydglsC58ycJWph9uahuMcCkz1Rm+mUgsrDPdHb9spJ
QnleWMuoVbWP+E2YduLI5MeaFT6DyUtalBLBBf+jNttjkqW2kfqlkLZMDkCPouM=
=eK5Z
-----END PGP SIGNATURE-----

--Yvzb+MHGXtbPBi5F--


--===============6629352862555470580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6629352862555470580==--
