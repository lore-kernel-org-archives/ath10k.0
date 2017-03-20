Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cq0Ap-0005MW-0b
 for ath10k@lists.infradead.org; Mon, 20 Mar 2017 16:28:49 +0000
Received: by mail-wm0-x236.google.com with SMTP id u132so67970845wmg.0
 for <ath10k@lists.infradead.org>; Mon, 20 Mar 2017 09:28:26 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry for ath10k calibration
 variant
Date: Mon, 20 Mar 2017 17:28:21 +0100
Message-ID: <1919994.musG4GLznX@bentobox>
In-Reply-To: <20170320150733.25bufnzrhh7xabml@rob-hp-laptop>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <20170320150733.25bufnzrhh7xabml@rob-hp-laptop>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1991192174359854270=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, ext.waldemar.rymarkiewicz@tieto.com, kvalo@codeaurora.org

--===============1991192174359854270==
Content-Type: multipart/signed; boundary="nextPart1747089.KH7Jk6BZzg"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1747089.KH7Jk6BZzg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Montag, 20. M=E4rz 2017 10:07:33 CET Rob Herring wrote:
> On Fri, Mar 10, 2017 at 09:06:14AM +0100, Sven Eckelmann wrote:
> > The bus + bmi-chip-id + bmi-board-id is not enough to identify the corr=
ect
> > board data file on QCA4019 based devices. Multiple different boards sha=
re
> > the same values. Only the original reference designs can currently be
> > identified and loaded from the board-2.bin. But these will not result in
> > the correct calibration data when combined with the pre-calibration data
> > from the device.
> >=20
> > An additional "variant" information has to be provided (via SMBIOS or D=
T)
> > to select the correct board data for a design which was modified by an =
ODM.
> >=20
> > Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> > ---
> > Since RFC:
> >=20
> >  - Split patch in DT doc and ath10k part (thanks Christian Lamparter)
> >  - Remove the words "bmi-chip-id" and "bmi-board-id" and replace them w=
ith
> >    more generic "device specific ids"
> > ---
> >  Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k=
=2Etxt b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > index 74d7f0af209c..3d2a031217da 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > +++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
> > @@ -41,6 +41,9 @@ Optional properties:
> >  - qcom,msi_addr: MSI interrupt address.
> >  - qcom,msi_base: Base value to add before writing MSI data into
> >  		MSI address register.
> > +- qcom,ath10k-calibration-variant: string to search for in the board-2=
=2Ebin
> > +				   variant list with the same bus and device
> > +				   specific ids
>=20
> Sounds like you should use a more specific compatible string.

Hm, this would require that each calibration data has an own compatibility
string - which then has to be supported by ath10k, right? Doesn't sound like
it would work well when each vendor (with an own calibration variant) would
have to modify ath10k to get it working. This sounds especially odd because
nothing else in ath10k has to be changed. Only the board data files which w=
ill
be selected by ath10k are different on these devices.

It would then up with something like this as compatibility string:

 * qcom,ipq4019-wifi-asus-rt-ac58u
 * qcom,ipq4019-wifi-fritzbox-4040
 * qcom,ipq4019-wifi-netgear-whatever
 * qcom,ipq4019-wifi-openmesh-i-have-no-idea
 * ...

But maybe I misunderstood what you've said.

Kind regards,
	Sven
--nextPart1747089.KH7Jk6BZzg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljQAyUACgkQXYcKB8Em
e0aEaBAAuZXbcHfv2BRSu08zarjuMlRqEi3DV8ivP46AFnLdt8deKF84vfyNGse5
XyKXZYXHMdfJ3DNljS0Eg39QpdAzmOpNVi2eqqS0Ij3hu69arEBKL4nqBZwaBEMx
7gdLMP0G0xi4UjRY5gpqZF2znPxqUuKwXvChCj1B36z74wejiTLWIyxfigTVvg3q
zILWpzopXiUReGOzKWuQu5tCazBOBjo+nVEbOPMEc96hz1Yepove2uW75hWFnl3k
PUgrG9FR8bLkUVkP4PHikprgHVF5xI46TmYD0lNfp8iXVJ31w9scnmPiSIC11gxJ
J1mdCaKuLeDTGRB2gLjd2FUgICVcdZX2kK6Cn5S/WUg9vdLGwyqhYRwEjHKY8b9i
PPGGtY7qtCoUeD5OZSCrBc64qj9/8jWVOVNpQpnY5zXf6csNVX1czt3FJmgCzqHN
Vr5GpAYyeDUR3W8RwL35jEjreiWKSgr7AfdN6ZPOY07XyGQ9OiyeBAgYEVbG9QYL
ZBeLpwHPnEHOd2S2GfBWBEw6izNLURbbWeGVqPHK6xDZpK+JuwcExGOor9NISTTh
zBeq2pDBFWjwMMflleL7NOqI8iUfTnxb5ezj8fBOLQumgTIZDkVA5OlyiOEALPMQ
pFjbRgevm8qt3BLxnxAcW3P8Br7E8qEbkrocfR9yVPEoRdB41ws=
=zeH3
-----END PGP SIGNATURE-----

--nextPart1747089.KH7Jk6BZzg--



--===============1991192174359854270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1991192174359854270==--
