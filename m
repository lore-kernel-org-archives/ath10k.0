Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXpA3-0006hC-4A
 for ath10k@lists.infradead.org; Tue, 17 Mar 2015 10:55:48 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: Re: ath10k tx99-like test mode?
Date: Tue, 17 Mar 2015 11:55:20 +0100
Message-ID: <2304748.x6roc8kqQi@prime>
In-Reply-To: <55074946.2040200@candelatech.com>
References: <023401d0602b$0b3139a0$2193ace0$@tranzeo.com>
 <55074946.2040200@candelatech.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3942276126526667709=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: mrex@tranzeo.com, Ben Greear <greearb@candelatech.com>


--===============3942276126526667709==
Content-Type: multipart/signed; boundary="nextPart1443342.rreJWml4ht"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--nextPart1443342.rreJWml4ht
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"

On Monday 16 March 2015 14:21:10 Ben Greear wrote:
> On 03/16/2015 01:51 PM, mrex@tranzeo.com wrote:
> > Ben,
> >=20
> > The tx99 feature has the benefit of not needing any client or traff=
ic to
> > be
> > passed for a power meter to measure.  So it=92s incredibly fast to =
test
> > different rates and output power than having to wait for client to
> > re-associate, pass traffic and adjust power meter to duty cycle (de=
pending
> > on how fancy the meter is).  This is more applicable for calibratio=
n and
> > evaluation than for adaption or protocol testing.
> >=20
> > Tx99 is better suited for calibration and FCC certification testing=
 and
> > not
> > for testing things like adaptive modulation or what happens when mi=
xed
> > modulations are enabled.  It cuts down on lab certification test ti=
me and
> > complexity (lab engineers test a different wireless widget every da=
y and
> > not familiar with webGUI=92s and config settings, etc).  Tx99 often=
 was
> > more =91raw=92 and didn=92t behave the same as adaptive modulation =
algorithm,
> > probably more so with more streams than 1 and 11b/g/n.
> >=20
> > So having a feature that can just output raw frames at full duty cy=
cle at
> > a
> > specific rate and output power without client would be highly benef=
icial
> > for lab testing and reduce test time and complexity for radio valid=
ation.
> I tried to get ath10k firmware to send raw frames on a monitor interf=
ace,
> but it seems it requires a peer of some sort before it will send fram=
es,
> and I had no real luck.
>=20
> I'm imagine there is some way to make firmware able to do this, but I=
 don't
> know how to do that at this time.

Thanks for all the input so far!

It is probably not too hard to implement a packet generating logic like=
 in=20
ath9k/tx99 for ath10k to remove the dependency on an external tool.

However the firmware question is a more tricky one, and we can't easily=
 change=20
that - we will not operate with a peer in the lab after all. We can try=
 to go=20
with mcast frames and see what duty cycle we can achieve.

 Ben, your firmware allows to set HT and VHT rates on mcast frames too,=
 right?

Is the QCA driver supporting this test? I guess they could need it as w=
ell. :)

Thanks again,
    Simon

--nextPart1443342.rreJWml4ht
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEABECAAYFAlUICBgACgkQrzg/fFk7axboQwCg2Dq2vQzbsrghTpfIAxdtCXd+
k3cAoMuufjBYYzjSZ/V7zYXgboGq7h8Q
=zMOV
-----END PGP SIGNATURE-----

--nextPart1443342.rreJWml4ht--



--===============3942276126526667709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3942276126526667709==--
