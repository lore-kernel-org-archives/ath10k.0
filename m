Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0MTI-0001lQ-7E
 for ath10k@lists.infradead.org; Mon, 26 Mar 2018 07:23:13 +0000
Received: by mail-qk0-x242.google.com with SMTP id o205so7458311qke.3
 for <ath10k@lists.infradead.org>; Mon, 26 Mar 2018 00:23:01 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH v2] ath10k: Implement get_expected_throughput callback
Date: Mon, 26 Mar 2018 09:22:54 +0200
Message-ID: <2322769.sx4MhzsvNg@bentobox>
In-Reply-To: <1521814034-17880-1-git-send-email-akolli@codeaurora.org>
References: <1521814034-17880-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6810644378158861807=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Marek Lindner <mareklindner@neomailbox.ch>, Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, Antonio Quartulli <a@unstable.cc>, Felix Fietkau <nbd@nbd.name>

--===============6810644378158861807==
Content-Type: multipart/signed; boundary="nextPart1630432.z5t82OcykK"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1630432.z5t82OcykK
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Freitag, 23. M=E4rz 2018 19:37:14 CEST Anilkumar Kolli wrote:
> +static u32 ath10k_get_expected_throughput(struct ieee80211_hw *hw,
> +                                         struct ieee80211_sta *sta)
> +{
> +       struct ath10k_sta *arsta =3D (struct ath10k_sta *)sta->drv_priv;
> +
> +       return ewma_sta_txrate_read(&arsta->ave_sta_txrate);
> +}

On Freitag, 23. M=E4rz 2018 19:11:48 CEST akolli@codeaurora.org wrote:
> > Antonio and Felix, please correct me when this statement is incorrect.
> >
> > The expected_throughput as initially implemented for minstrel(_ht) is=20
> > not
> > about the raw physical bitrate but about the throughput which is=20
> > expected for
> > things running on top of the wifi link. See
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Dcca674d47e59665630f3005291b61bb883015fc5
> > for more details
> >
> > when I interpret your change correctly then your it doesn't get the
> > information about packet loss or aggregation and doesn't do anything=20
> > convert
> > from raw physical rate to something the user could get see. It will=20
> > just
> > overestimate the throughput for ath10k links and thus give wrong=20
> > information
> > to routing algorithms. This could for example cause them to prefer=20
> > links over
> > ath10k based hw when mt76 would actually provide a significant better
> > throughput.
> >
> > Beside that - why is the ave_sta_txrate only filled when with new=20
> > information
> > when someone requests the current expected_throughput via
> > get_expected_throughput. I would have expected that it is filled=20
> > everytime you
> > get new information about the current rate from the firmware
> > (ath10k_sta_statistics).
> >
> Yes. ideally it should be doing the rate avg. of all the sent packets.

No, not the PHY rate average - but the "throughput avg". And the "ideally"=
=20
here sounds a little bit like in "Our medical doctor would ideally not=20
decapitate each patient but we have at least an MD".

Kind regards,
	Sven
--nextPart1630432.z5t82OcykK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq4n84ACgkQXYcKB8Em
e0YMvA/+OxKTpxS8nz8W+shQ2++sLaGLLahuxYB9oiIYqwgdpt2py5fjyp10drDP
PxOPRxHLpvyPjjTws1kMtfndwtHWRqq0Armn4gEiejzyFW6oKabgatA9pT4TcFk7
/pq/padnukosGX9BlkeqJZ+sxjjQm2fSLxDUAyKMGj/or5a8GFX3FGi2+J8VrnsB
PrcTKJEv9IWshNs9FpIUGOGoP7PXFmG4gItfmGjgylnlH+zQqC3sLpQtKOmfdUOt
HW6OGWslzXVDilDvLnrTWZMPEzdhH4BMqldVA0rK3/k7jsiBXoB4btYv5aN3D8Zt
FTTZyHhwMoYb+yHOlJcF30id0Qw4tqX4mWcPaSHZj0uyd7bLDDCQe3KHgQUxI/Do
GT9p817NCcLUMvOg792AovV34LgTnN+N8gox4OjSYD7cyXA65OYK2Io9jqOSYRGr
mytI3tcLvF7eTX14wkPXPAB32/rIh8gefN14wST0mcWPnk5eEd8Vujz4qDtscCIy
gtL0yjsg4o6Koklb9oqYCg9KLV6xOW+ZryKYYgNi/+WIQmd7TMwM+F9Vy3dpm+Nc
lx4ZbwOy48tiiKRJGfxyrSm8TP/BfkSXexAVdA4dyWTAagMngSATCsDASvCkYYIg
iUCm4EloXSD8TbzD7oE/9WfxcpNcwZAOOX0IrRSYO9cuHNvSFRM=
=vYH3
-----END PGP SIGNATURE-----

--nextPart1630432.z5t82OcykK--



--===============6810644378158861807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6810644378158861807==--
