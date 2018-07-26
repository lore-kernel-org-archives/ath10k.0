Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fidmV-0000UY-Ju
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 10:46:05 +0000
Received: by mail-qt0-x244.google.com with SMTP id y19-v6so1028944qto.5
 for <ath10k@lists.infradead.org>; Thu, 26 Jul 2018 03:45:52 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: ath10k: 160MHz/80+80 radar detect with Wave2 cards
Date: Thu, 26 Jul 2018 12:45:47 +0200
Message-ID: <4178610.dnsFcfIAIc@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1766413615751079195=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: daniel.bailey@openmesh.com, simon.wunderlich@openmesh.com

--===============1766413615751079195==
Content-Type: multipart/signed; boundary="nextPart3462181.vz1O5Gvmfl"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3462181.vz1O5Gvmfl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

as we know, some wave2 cards support 160MHz (with some limitations). This also 
requires support for radar detection with 160MHz/80+80 or otherwise cfg80211 
will reject this setting. I would like to propose following change but I am 
unsure whether it actually works correctly on this hardware (QCA9888).

    diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
    index 2bea5e8..3b43759 100644
    --- a/drivers/net/wireless/ath/ath10k/mac.c
    +++ b/drivers/net/wireless/ath/ath10k/mac.c
    @@ -7951,7 +7951,9 @@ static const struct ieee80211_iface_combination ath10k_10_4_if_comb[] = {
     		.radar_detect_widths =	BIT(NL80211_CHAN_WIDTH_20_NOHT) |
     					BIT(NL80211_CHAN_WIDTH_20) |
     					BIT(NL80211_CHAN_WIDTH_40) |
    -					BIT(NL80211_CHAN_WIDTH_80),
    +					BIT(NL80211_CHAN_WIDTH_80) |
    +					BIT(NL80211_CHAN_WIDTH_80P80) |
    +					BIT(NL80211_CHAN_WIDTH_160)
     #endif
     	},
     };

Does anyone know whether radar detection is supported for these channel 
widths?

Kind regards,
	Sven
--nextPart3462181.vz1O5Gvmfl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltZplsACgkQXYcKB8Em
e0Za8hAAjY/++pljUm+JjTRJYaP/vkaij9NAN4Gw8rL3dEuU8VwZ6i1GdQbw5DZH
+4qJFdMgcCnEiF5fy+lccAz0F/h4rVpBIM0JeNfP3MO1i4/bciI0LQDHSj07g8VH
pIXVKLx7yJCxoROwq3PaPH0fMHqi3lT3XMtNtjWm/00mcz0zQKRXpBNWmfH4OpaU
jpEzTtQ7m62VLc/NfOPNonU9II7YHfuJI2dMxtU0R08ML4sO0YQQOLfeOuQIca85
Mwp8getoVTN5JfiE6DogUxJDWxZsnEt2DApMSg8p+015vjk0swEIr/0vFn7qcSi0
WWPl/pQynRrG+iahSh11BMNwiwffPXsl0DGTQ81wIKiZ6ur8b3QeJbeq3qf53Bzr
IQvpTlMoi0ddncYMSNliGHKZV3EIHZahPzSW9VZmhVifiOcyx5y8+vYq26L0GkC8
SLvw+LEEb5pYeDKHSTiaw5jctydIN3RMhNKDzzx3NZjgEbr1ZWhb0ddl4CQxOSMv
cmcqo+GRB0CzGtBObaWy0ic96P/MrH15iA1fxeMaDB2TA/6ABUi37DD+2+qJaEHn
v85bV/a2spbj16B888NMSAItauE5b8l2B9zdkNwXXsFaly9tH5l2FT7RW19zZNfI
7M3jFaYzT8Fahu2v/gPB1At4dsTcZLTxk/Hy3n2H0pvCGRmaVJ4=
=tR7z
-----END PGP SIGNATURE-----

--nextPart3462181.vz1O5Gvmfl--



--===============1766413615751079195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1766413615751079195==--
