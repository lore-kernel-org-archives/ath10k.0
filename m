Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAGMX-00073j-S1
 for ath10k@lists.infradead.org; Wed, 10 Oct 2018 15:25:30 +0000
Received: by mail-qt1-x834.google.com with SMTP id d8-v6so6069685qtk.13
 for <ath10k@lists.infradead.org>; Wed, 10 Oct 2018 08:25:14 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k: tpc_stats(_final) odd twicepowers and 160Mhz not supported
Date: Wed, 10 Oct 2018 17:25:09 +0200
Message-ID: <2105594.XRlnIHHpuj@bentobox>
In-Reply-To: <1555379.7kbm3L4fcB@bentobox>
References: <2557834.d2DaqBHz1S@bentobox> <5396695.eZ3m4tuIpz@bentobox>
 <1555379.7kbm3L4fcB@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5145411594941851806=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>
Cc: ath10k@lists.infradead.org, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============5145411594941851806==
Content-Type: multipart/signed; boundary="nextPart384799160.oLZQJtMuyW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart384799160.oLZQJtMuyW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 26. Juli 2018 15:03:54 CEST Sven Eckelmann wrote:
> On Dienstag, 10. Juli 2018 08:52:35 CEST Sven Eckelmann wrote:
> > On Donnerstag, 28. Juni 2018 12:05:18 CEST Sven Eckelmann wrote:
> > > Hi,
> > > 
> > > I have some small question regarding the debugging functionality introduced by 
> > > commit bc64d05220f3 ("ath10k: debugfs support to get final TPC stats for 10.4 
> > > variants") [1] and commit 295426669cd6 ("ath10k: implement debugfs interface 
> > > for Transmit Power Control stats") [2]. Goal of this is to find out whether 
> > > the VHT160 MHz CTLs are correctly applied.
> > [...]
> > 
> > ping?
> 
> ping?

Ping? I think we can already declaring you MIA.

Kind regards,
	Sven
--nextPart384799160.oLZQJtMuyW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlu+GdUACgkQXYcKB8Em
e0YSpQ//YM8r26/xPFiCBtNMGu5uxsopt9lHX+gdpjvrJFmmNw1WKsduVxSBNZo+
lSw8dB0riJCRvpDFq9IL+Bh0oFc9bpCXeLdjZMfFT4qv6R72ZLHWZgMOBG6PMwzl
ymBLtKh8eLA2NcORhEHNDJ88H8t27Ubg6c0VfMkMFviFtqqS4hhA701toXbLN3/U
+m4U/NLcKiU0iHxEMA/JRmhIoDMB0IP4IwGDCmTSMfIVdmfywdAz6VCjvIl4X3pC
olY9r4x1bEK+ra3KmKyNnRgXPHz547jKlijLkNOF0ipNoRgHR2KuMBNmc/3BZgXl
EiEz/hQL3cMh/Inshb0O6Z2GIMBi4vhiLOLHvOpGTuDtXEwmt9rPOwZ1erMnIjnH
KfATfQ0jLl++EGURQg+SwzqbM/maMxlKzSl6Db56KGVV/3MO+LujdFBY7Uu6EUca
Si3M7VxsN3hWMAjB7zOg1zpOe+nN5EIOKs80X9KzvuXsT0VM6CTUPvm5t75aUNSb
i7SzMDuEtM+Xb2cA5baEEmRox4vD8+k8R7V9jlSRqhqNX3jvXxeaE4WUdB6tfu4e
N9RB8U6fbqLJyCqp5ivCZUTNzPrakFj8+6FCxF2z4Az2lKXfA/kPTzxeBRZy5MTd
2vxzTigmrPxluLb+lgmeSUYVe0f2s+fjjIePwR/bZuKDslHWRm8=
=gTam
-----END PGP SIGNATURE-----

--nextPart384799160.oLZQJtMuyW--



--===============5145411594941851806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5145411594941851806==--
