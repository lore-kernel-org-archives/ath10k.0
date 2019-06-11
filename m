Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([216.205.24.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hafgD-0005Bx-P1
 for ath10k@lists.infradead.org; Tue, 11 Jun 2019 12:15:11 +0000
Received: by mail-qt1-f198.google.com with SMTP id 97so11611232qtb.16
 for <ath10k@lists.infradead.org>; Tue, 11 Jun 2019 05:15:06 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: Re: ath10k: TPC: Max antenna gain
Date: Tue, 11 Jun 2019 14:14:59 +0200
Message-ID: <1812561.GRj0lRSQoq@bentobox>
In-Reply-To: <17533428.x5EMhTv9h2@bentobox>
References: <17533428.x5EMhTv9h2@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7494281371158134109=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============7494281371158134109==
Content-Type: multipart/signed; boundary="nextPart3026271.I8CKX0oS5p"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3026271.I8CKX0oS5p
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 June 2019 12:59:25 CEST Sven Eckelmann wrote:
> Hi,
> 
> the firmware doesn't seem to parse the max_antenna gain from 
> ath10k_update_channel_list anymore. At least the 
> /sys/kernel/debug/ieee80211/phy0/ath10k/tpc_stats shows me max antenna gain 0 
> when I set it in ath10k_update_channel_list to 12.
[...]

Just checked the code a little bit more and there seem to be two problems. One 
is in ath10k and the other one is in my PoC change. The problem in the latter 
is the missing change in the vdev_restart.

But the problem in ath10k is more interesting. It seems to be that the 
firmware expects the max_antenna_gain in dBm but the ath10k driver sends it in 
twicepower (0.5 dBm steps). At least this is what I see in tpc_stats when 
setting all max_antenna_gain to 12.

And the funniest part is that the configured 9 dBm is shown as 12 twicepower 
(6 dB) in tpc_stats for 5GHz PHYs when using the US country code (but not when 
using Germany or checking 2.4GHz PHYs). Is there some hardcoded limiter in the 
firmware for FCC 5GHz?

Kind regards,
	Sven
--nextPart3026271.I8CKX0oS5p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlz/m0MACgkQXYcKB8Em
e0aM+xAAl4Za7SzWPTVW8KHfUUNcTBrMfotSO04J+C6kZUjraW1KDJrc+KVC2QiE
X/IjwOqMMtqD2bXvXPYihXDhv4hjCWlwGjqrG5MUBheS2g43Gq/W1CEAJtJPD5+V
aB9r2dkizEGdHDvxKgZabNO7kohPZOC6k5a7ykq6fvsg4MkgaL0cU4g4R6txQyoI
AEa9HGi1/KD67fC0tArd3gAFWktX0H1f3/vGZtEkLa2QA7uh3kaN+BA8Cf2vZOU7
BkGlEvlgf8QZUmZLoKI8vxe3HWhmO31zMnzmSefRDepOGRaCPBV2+giEbpqdtsfc
B1D9yFoKmhfexNQ11OqSlbkm1FwWUxQt4kdkTL/d9hnJ1Nw+/lzdV7fxPfTYxWwe
HCcfFpBtCb824V3sVG0p76eU8IsrSPH/Vya7LQmTEsBCrtJIn/TkoDjAiqC7bAH8
vaR/GcaGFVD4+jDcEsRaePNGjfXezE3G2M8XKGqyw90yZcQwcv8xSvRphU1MWe3U
CLRvrX5PYZ7UC2Wp+1i3SmZaj+Ha/98Pm82OVMMQOyb6h1o5/VkzfcTOUybW6oYc
g5MPeuESKUY59LLdch8kAp91MGgS3C0YvkG6LiHrmSILv5y+fGuw+5XKdPNeyKHu
sl/5V/y5Q9zUCAJDeyiluxqRjfSXrTVsFfJU5HbU0iI87/cnPq4=
=nns1
-----END PGP SIGNATURE-----

--nextPart3026271.I8CKX0oS5p--





--===============7494281371158134109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7494281371158134109==--
