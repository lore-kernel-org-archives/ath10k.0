Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ezHm4-0002v4-9h
 for ath10k@lists.infradead.org; Fri, 23 Mar 2018 08:10:11 +0000
Received: by mail-qk0-x242.google.com with SMTP id o205so410431qke.3
 for <ath10k@lists.infradead.org>; Fri, 23 Mar 2018 01:09:55 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH] ath10k: Implement get_expected_throughput callback
Date: Fri, 23 Mar 2018 09:09:48 +0100
Message-ID: <2667699.TbZPxW0hJB@bentobox>
In-Reply-To: <1521790620-12267-1-git-send-email-akolli@codeaurora.org>
References: <1521790620-12267-1-git-send-email-akolli@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3489057286029197751=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Johannes Berg <johannes.berg@intel.com>, linux-wireless@vger.kernel.org, Anilkumar Kolli <akolli@codeaurora.org>, Antonio Quartulli <a@unstable.cc>, Tamizh chelvam <tamizhr@codeaurora.org>, Felix Fietkau <nbd@nbd.name>

--===============3489057286029197751==
Content-Type: multipart/signed; boundary="nextPart4071528.lBNJH1k9ki"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4071528.lBNJH1k9ki
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Freitag, 23. M=E4rz 2018 13:07:00 CET Anilkumar Kolli wrote:
[...]
> +static u32 ath10k_get_expected_throughput(struct ieee80211_hw *hw,
> +                                         struct ieee80211_sta *sta)
> +{
> +       struct ath10k_sta *arsta =3D (struct ath10k_sta *)sta->drv_priv;
> +       u32 tx_bitrate;
> +
> +       tx_bitrate =3D cfg80211_calculate_bitrate(&arsta->txrate);
> +       ewma_sta_txrate_add(&arsta->ave_sta_txrate, tx_bitrate);
> +
> +       return ewma_sta_txrate_read(&arsta->ave_sta_txrate);
>  }

Antonio and Felix, please correct me when this statement is incorrect.

The expected_throughput as initially implemented for minstrel(_ht) is not=20
about the raw physical bitrate but about the throughput which is expected f=
or=20
things running on top of the wifi link. See=20
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dcca674d47e59665630f3005291b61bb883015fc5=20
for more details

when I interpret your change correctly then your it doesn't get the=20
information about packet loss or aggregation and doesn't do anything convert
from=20raw physical rate to something the user could get see. It will just=20
overestimate the throughput for ath10k links and thus give wrong informatio=
n=20
to routing algorithms. This could for example cause them to prefer links ov=
er=20
ath10k based hw when mt76 would actually provide a significant better=20
throughput.

Beside that - why is the ave_sta_txrate only filled when with new informati=
on=20
when someone requests the current expected_throughput via=20
get_expected_throughput. I would have expected that it is filled everytime =
you=20
get new information about the current rate from the firmware=20
(ath10k_sta_statistics).

> @@ -7686,6 +7686,22 @@ static void ath10k_sta_statistics(struct ieee80211=
_hw *hw,
>         }
>         sinfo->txrate.flags =3D arsta->txrate.flags;
>         sinfo->filled |=3D 1ULL << NL80211_STA_INFO_TX_BITRATE;
> +
> +       sinfo->expected_throughput =3D
> +                               ewma_sta_txrate_read(&arsta->ave_sta_txra=
te);
> +       sinfo->filled |=3D BIT(NL80211_STA_INFO_EXPECTED_THROUGHPUT);
> +}

This brings me directly to the next point. Why are you changing these value=
s=20
here? Isn't sta_set_sinfo is expected to do that? This is at least what we
expect how it works when we call cfg80211_get_station() in batman-adv.

Kind regards,
	Sven
--nextPart4071528.lBNJH1k9ki
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq0tkwACgkQXYcKB8Em
e0YCuA//fyJqSprnik/Qx0+tw1M7r6+FCWVM0yUT8m8tw3JOZH/C9I8mavQ+72lk
evs+2gDjPAKfXBUc/gDOfFcaFRn6sLzwBcd8+Yw2JNQDxjNH2mEZVAccrH1wVUTX
4UIZaInz9vsNwSzUZE0vtfKKithWJSkYQ2Q3VlEYqo7rMddsGNEJNKPsf8iYd92S
aJp+eYEonyGxKOKiDcs8Vi0itGQSFQ+/TAfxJY0NiXrwyJUBH4mM1jfouTS7qM+j
i0eGudiRbYkxlrsmSELmM+PQJu+HaxVjLkb/iHsUQt8DoZzxOPRpwikLwSe7GILr
xThSgm1PNy/3wMFG8FlYfGdJPRrTYb6V5CxUvdtVyV+j8CV4gcDWI5GEBRyDF6IJ
XSUhZ26Wa4xounu1U8ELCNmL9k5VpxHpLP0SsBkdy2ONmTuke/HTxLvnvnKple0I
AP4XAS+X0JrwwxVvmwVL0eZkXLAMXCVvd0mZ0ytuKSdskIixgeJ/TNsy00qF29hW
MeYU6AN+DNjOxFgrL3nDuyCVD0LLvHTKyGyt8xMafW2v2k/riof23UjzevKxQLq8
pX5VM6tjB1OeT1xRhR5HQUXd6ei+7k/N1SktvWZI9M2KCRUtJtRVbAwnqNPs501o
MpBulnmHn+wdKaisWAy4zF5AkD5PoqB4kZPA8mFDXFMThOxb3gY=
=cHjY
-----END PGP SIGNATURE-----

--nextPart4071528.lBNJH1k9ki--



--===============3489057286029197751==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3489057286029197751==--
