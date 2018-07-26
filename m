Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fifw8-0000kI-1d
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 13:04:14 +0000
Received: by mail-wm0-x234.google.com with SMTP id o11-v6so1888362wmh.2
 for <ath10k@lists.infradead.org>; Thu, 26 Jul 2018 06:03:57 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k: tpc_stats(_final) odd twicepowers and 160Mhz not supported
Date: Thu, 26 Jul 2018 15:03:54 +0200
Message-ID: <1555379.7kbm3L4fcB@bentobox>
In-Reply-To: <5396695.eZ3m4tuIpz@bentobox>
References: <2557834.d2DaqBHz1S@bentobox> <5396695.eZ3m4tuIpz@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2613002719912287050=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath10k@lists.infradead.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============2613002719912287050==
Content-Type: multipart/signed; boundary="nextPart1862546.doUUUh9gg4"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1862546.doUUUh9gg4
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 10. Juli 2018 08:52:35 CEST Sven Eckelmann wrote:
> On Donnerstag, 28. Juni 2018 12:05:18 CEST Sven Eckelmann wrote:
> > Hi,
> > 
> > I have some small question regarding the debugging functionality introduced by 
> > commit bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 
> > variants") [1] and commit 295426669cd6 ("ath10k: implement debugfs interface 
> > for Transmit Power Control stats") [2]. Goal of this is to find out whether 
> > the VHT160 MHz CTLs are correctly applied.
> [...]
> 
> ping?

ping?

Kind regards,
	Sven
--nextPart1862546.doUUUh9gg4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltZxroACgkQXYcKB8Em
e0ZinQ/9FMHE3MvZdftOs+MU3o+x6zfcn6gcch7gMPRARRblXxFyiITGxp9KH7BV
LAzEQYgkgmEkp8iEWz1/2mRURsP4gYQ1VKZsD9ZIu94b4eitKv0p3J2pQhC8aX7p
lUwqICu96lF12/9i69cVq7tQzGFChQGkj2kDJqsOz37PL4HaSSbG0MDpaMCPgE4H
UfHtd1c24KOc76XBEC9OF5Bfa7+Sl0O6W3CXruEgbTiVZ2sayR5m3acIo18lFOMy
jS4ylAVN2vizj33ujlUcODGSvZ2zFQ1wei95RQkwQVWbHAf8nCmDezPiDrdujyxc
jqRMhvsnLpSJRCHk+Ywzw1B4YhZb3tYOKZpTCnVgK62zpO64VTkNOg8GvJ7bhHKk
uf1Ou41tz1M98ULz6HBUrYrOxkz1CYZs/2jT+KGcTdhldKH0ccJgCWb5SzlFCp5u
a4mVdS5r81pCuCVGTON6fl5KEZdWr3GzWBPkdpChM3nN4j1Ad2QzMoKUsOm2Jrv8
2WUXr19kJcqXTLWEuERwtq/DIl88wUGPPFn73WrcUsfe7pliCdKnVWNqcu3osEx5
gPIh4J372woNH/7fd67Km73CQGZsFAdftbjw3/ItXBMoOldHcJ+NxtOxvpo9PsZJ
uDYnfgrMRr2ev2+P2JSyGRQsRL7aWJl+KZDdnGo+g+t/qrah8Ck=
=LDWy
-----END PGP SIGNATURE-----

--nextPart1862546.doUUUh9gg4--



--===============2613002719912287050==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2613002719912287050==--
