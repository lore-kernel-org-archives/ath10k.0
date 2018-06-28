Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYQhU-0002Yf-Md
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 06:46:42 +0000
Received: by mail-qt0-x229.google.com with SMTP id c5-v6so3837349qth.5
 for <ath10k@lists.infradead.org>; Wed, 27 Jun 2018 23:46:29 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: 160 mhz crash
Date: Thu, 28 Jun 2018 08:46:21 +0200
Message-ID: <1788770.Stodcpyumm@bentobox>
In-Reply-To: <4e8058c7-6443-5b4c-3077-dd0325159854@dd-wrt.com>
References: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
 <4e8058c7-6443-5b4c-3077-dd0325159854@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5564471651006755599=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>

--===============5564471651006755599==
Content-Type: multipart/signed; boundary="nextPart6542457.LM2XNQaJRj"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6542457.LM2XNQaJRj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Samstag, 16. Juni 2018 10:11:27 CEST Sebastian Gottschall wrote:
> 
> this is normal. i already posted a patch on this mailinglist to resolve 
> this issue, but
> 
> but it hasnt found its way to the main source yes.

Problem seems to be that the patch [1] has obvious style problems and open 
questions.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/10372949/

--nextPart6542457.LM2XNQaJRj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAls0hD0ACgkQXYcKB8Em
e0ZUzQ//aeo7LfhJRQ4ziNUYSNPEN/hOwhrEq3I9yV43tSPDGHvruTBuVQJasSPu
moeR7r75XVp9/jpmYDi2OncDAT5xSFyrfb/2SkMnIY1jwjWrL7pvL0J4yJmwBdSP
FIM6huz7pXuZ5eVSsxtSm3ZzVnpASyO4X4k7m/ec4Q1rEJGcqG6ILS7oT1QMt1fV
j2SdgX2Bmba+IRndv+4thXTyw+zfmGVWzGwBJPxB4PG87vioszhrGZTh06BaCrQX
AUx7V+2KNXSUZOGvn+N0nqM1h5uY2JxoGxctM7X/XpEJhqDXPIA4COgP6SpZjjsS
uBH5pC0e8W23eC9yFRSl8kth+1ulUBl9YsKcJEImPd3Q8ngncg9P4q6TwytNbQZ+
66hlweg3Osq6l/IbZAdHH0TFzybq1M+ILNHY987qoiaMHzR3KlCAYQXNDWBkB+bW
cIjt3o7WWq2pCXwMZ4stJ4IUpfsOabpk6WqZMstw4dwVA7MTgcx4zwvEabtrE19/
NrfjkiG17ZANEjH26fwKHWZIlOvGzLlmrdLVM3QrxDWRq/mt2IY9GN0Gko2PqQq9
7QRuInnD8VDskkGFdYwF4mB9snxjzn26HzplEe21o+qQ2XnNKRRfq3oFwEzcpN06
QhZwYgJTXLmtWr6RjLCHED8oOrllEr1AcRJLRO8XMRPkvFMjJwE=
=sDwg
-----END PGP SIGNATURE-----

--nextPart6542457.LM2XNQaJRj--



--===============5564471651006755599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5564471651006755599==--
