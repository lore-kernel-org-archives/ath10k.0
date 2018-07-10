Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcmW1-0006Wx-E5
 for ath10k@lists.infradead.org; Tue, 10 Jul 2018 06:52:50 +0000
Received: by mail-wr1-x435.google.com with SMTP id h10-v6so13313500wre.6
 for <ath10k@lists.infradead.org>; Mon, 09 Jul 2018 23:52:38 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k: tpc_stats(_final) odd twicepowers and 160Mhz not supported
Date: Tue, 10 Jul 2018 08:52:35 +0200
Message-ID: <5396695.eZ3m4tuIpz@bentobox>
In-Reply-To: <2557834.d2DaqBHz1S@bentobox>
References: <2557834.d2DaqBHz1S@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3086948997263767721=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath10k@lists.infradead.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============3086948997263767721==
Content-Type: multipart/signed; boundary="nextPart1967198.8xTxnFP6Wi"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1967198.8xTxnFP6Wi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 28. Juni 2018 12:05:18 CEST Sven Eckelmann wrote:
> Hi,
> 
> I have some small question regarding the debugging functionality introduced by 
> commit bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 
> variants") [1] and commit 295426669cd6 ("ath10k: implement debugfs interface 
> for Transmit Power Control stats") [2]. Goal of this is to find out whether 
> the VHT160 MHz CTLs are correctly applied.
[...]

ping?

Kind regards,
	Sven

--nextPart1967198.8xTxnFP6Wi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltEV7MACgkQXYcKB8Em
e0a6/g//YbStHZ/5ZCIthDJ2EJTy2w266bvh9ToYhRWvkg9KdoKlGBjCfB1jbqVo
nWyy8eD4nQK4M45rJdmLeT/76yAN3drZIBUwaCZhl7I9Ljf+xS3V+kJUrCvYyd9O
FHPrLQO2UxkckYiNJilTes8orsy6ssB9IwiWZFVPHyrOd/hUkaGFc0jwHWT59e0j
9ylHWpdn90ougVtRTciktnOMfsINLvTeAubRaTXZPMns+kLTr0GhOjlZUxBmSEKq
7nyi9pxNEQZcAMiMcgLVCtZobiQT9JXk2M1CFrmXlqsQZekOWttHPTQqK+qShdZ1
oUOLKqarTcSt6OHQOyRRr7in0ZX6vMjrLlxsIGhSr9kBMg6K3/X+Xaxo0QuT7+tk
BhnmAOnB1TpPowp2Hr77oHiLBgUGBu5HtOKsDKoHUok9RyhXhdKpc9A3fx9qsq7C
C2DbDZ7ieOl0K7x1WohqWtBqUtZC84a7192sSq38pxWscbCpiFUwg344MsUQcaNF
HkIfOK2OOktkyzhwqnrKe+BovlcaZCMWg8HcRXGvmP+dUG7KsrwEhlmv2oxAb2fi
6/SrsBYZ15UgmZbDnSvI9IITwVifL3SYW4Px0gTrZ7NY4p92WUgjyEaTfEb0/zfj
u4/sDIoSG8kukJIA8KSAhSkmlFFudyEwW+FGVAN4JPcfafzx6So=
=e/6a
-----END PGP SIGNATURE-----

--nextPart1967198.8xTxnFP6Wi--



--===============3086948997263767721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3086948997263767721==--
