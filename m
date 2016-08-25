Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcvjB-0004YU-FH
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 14:33:58 +0000
Message-ID: <1472135606.16921.74.camel@sipsolutions.net>
Subject: Re: [PATCHv3 2/2] ath10k: Allow setting coverage class
From: Benjamin Berg <benjamin@sipsolutions.net>
Date: Thu, 25 Aug 2016 16:33:26 +0200
In-Reply-To: <57BF009B.4030008@candelatech.com>
References: <20160825132522.30994-1-benjamin@sipsolutions.net>
 <20160825132522.30994-3-benjamin@sipsolutions.net>
 <57BF009B.4030008@candelatech.com>
Mime-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3017594595294300864=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Michal Kazior <michal.kazior@tieto.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Simon Wunderlich <sw@simonwunderlich.de>


--===============3017594595294300864==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-IddRDNqpZX6prtz1SO8w"


--=-IddRDNqpZX6prtz1SO8w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Do, 2016-08-25 at 07:28 -0700, Ben Greear wrote:
>=20
> On 08/25/2016 06:25 AM, Benjamin Berg wrote:
> >=20
> > Unfortunately ath10k does not generally allow modifying the
> > coverage class
> > with the stock firmware and Qualcomm has so far refused to
> > implement this
> > feature so that it can be properly supported in ath10k. If we
> > however know
> > the registers that need to be modified for proper operation with a
> > higher
> > coverage class, then we can do these modifications from the driver.
> >=20
> > This patch implements this hack for first generation cards which
> > are based
> > on a core that is similar to ath9k. The registers are modified in
> > place and
> > need to be re-written every time the firmware sets them. To achieve
> > this
> > the register status is verified after certain WMI events from the
> > firmware.
> >=20
> > The coverage class may not be modified temporarily right after the
> > card
> > re-initializes the registers. This is for example the case during
> > scanning.
> >=20
> > Thanks to Sebastian Gottschall <s.gottschall@dd-wrt.com> for
> > initially
> > working on a userspace support for this. This patch wouldn't have
> > been
> > possible without this documentation.
>=20
>=20
>=20
> >=20
> > diff --git a/drivers/net/wireless/ath/ath10k/wmi.c
> > b/drivers/net/wireless/ath/ath10k/wmi.c
> > index d246288..8ccc8cf 100644
> > --- a/drivers/net/wireless/ath/ath10k/wmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> > @@ -4879,6 +4879,12 @@ exit:
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> >=20
> > +static inline void ath10k_wmi_queue_set_coverage_class_work(struct
> > ath10k *ar)
> > +{
> > +	if (ar->hw_params.hw_ops->set_coverage_class)
> > +		queue_work(ar->workqueue, &ar-
> > >set_coverage_class_work);
> > +}
>=20
> Maybe this should first check to see if the user has specified a
> coverage class
> before it attempts to do any work at all?
>=20
> That way, if user does not set anything, then the behaviour does not
> change
> in any significant way?

Hm, yes, adding a check there looks simple and I don't see any reason
why it wouldn't work.

Benjamin
--=-IddRDNqpZX6prtz1SO8w
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJXvwG3AAoJENEjaKZhhWwg/uAP/2h+q4++nUP4VgWedMDvF5/m
2ruBb0W9Qtd2R1ifSKFvk75VItnayNbKn/2+3/fh1fQy692EMaBUoq7n+Rb7yb+p
mE/UTjEoZlyN1psK+44XTbhi/qhoMxj4TfoUHpMMridXO3FEO/VYIoUxvgP+7vK4
mC5zESVRklZAIdS/6x3+xG/emLOJknawofGPGwD6+fLwMde2g1jprUItfIv/cWV5
Wk0SgXxTSWIDL+kRl32UahsJa+C+x3zkUeIeVfmAhFVVsEdMHKocUAadyR9P2aCJ
5id36eqvbGfmpnbY7XO0tdB72swmZ2eTzS92Ts7Tv2HHO3QkW7owS1sPfuz4ubR1
C23jfUiF4S07dKC7nzUPK7U0fQMuBDnA5oTAKjm8R0ScI6sWerdNrlfYJP+7LG5e
wea+21yVjRy1wKIMrQCcSCuhePQukkKh+NfnaFDP7oHdK8HzLr76OfNCG5Nsf6+W
pVTDOxE0beI+NWN4O9uzWkwheIR03T3X6GDaupg0QWcbNn6GO/vOw1udWLLq/C1N
8t11Mi4iZDaK1/hkt0gG4s+THEAIFzRy7ezAinJUyueyvYbjap7SUZdV7rbuVK7Z
Hnpq0yBoV60/za7LYXNEiGrf8uaxj428h1mCVz0qEsliCpy6fZzYt/C3LG3rlua0
CDukd7VBzPUeQaSDAt/K
=yJ5l
-----END PGP SIGNATURE-----

--=-IddRDNqpZX6prtz1SO8w--



--===============3017594595294300864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3017594595294300864==--
