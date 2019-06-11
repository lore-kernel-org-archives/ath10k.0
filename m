Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-195.mimecast.com ([63.128.21.195])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haeVE-0003L7-6S
 for ath10k@lists.infradead.org; Tue, 11 Jun 2019 10:59:45 +0000
Received: by mail-qk1-f198.google.com with SMTP id c4so10580603qkd.16
 for <ath10k@lists.infradead.org>; Tue, 11 Jun 2019 03:59:38 -0700 (PDT)
From: Sven Eckelmann <seckelmann@datto.com>
Subject: ath10k: TPC: Max antenna gain
Date: Tue, 11 Jun 2019 12:59:25 +0200
Message-ID: <17533428.x5EMhTv9h2@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4035565249572160864=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Maharaja Kennadyrajan <mkenna@codeaurora.org>, Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>

--===============4035565249572160864==
Content-Type: multipart/signed; boundary="nextPart62412551.3YSEZU2eEr"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart62412551.3YSEZU2eEr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

the firmware doesn't seem to parse the max_antenna gain from 
ath10k_update_channel_list anymore. At least the 
/sys/kernel/debug/ieee80211/phy0/ath10k/tpc_stats shows me max antenna gain 0 
when I set it in ath10k_update_channel_list to 12.

    grep Gain /sys/kernel/debug/ieee80211/phy*/ath10k/tpc_stats
    /sys/kernel/debug/ieee80211/phy0/ath10k/tpc_stats:Antenna Gain  =  9 Reg. Max Antenna Gain      =   0
    /sys/kernel/debug/ieee80211/phy1/ath10k/tpc_stats:Antenna Gain  =  8 Reg. Max Antenna Gain      =   0
    /sys/kernel/debug/ieee80211/phy2/ath10k/tpc_stats:Antenna Gain  =  9 Reg. Max Antenna Gain      =   0

Just tested it here on QCA9888 and QCA4019 with 10.4-3.5.3-00057. Is there a 
version which is known to work?

Kind regards,
	Sven
--nextPart62412551.3YSEZU2eEr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlz/iY0ACgkQXYcKB8Em
e0an3g/9F6ErLA2Im+jiRNViy3FEAK//N7Mw2GhbNWoaInJRzgUTuLggpBARrNxZ
YnwXHUGc4vNrbBd9cMhDfKEkhdLn3B7O9a/yWzN9dTiP1Dd/aghJ+i+aprhxOhGJ
gkUScQk7pMMVzRH4JYtIJusD60h48Xbu8VkstmrgE3teWh/Dp9rob9qtIEhQk3EB
BkPHvjdWLA1I/QF5UK6bQFDbO2TeRq+1IvjdSttLoBQ5faSw463kZugf50U5FECU
G+DhVzpdcKUxp79BFz0v+85zT2yJ4ZLk5VdmF2UDSasTTidNHdMtEcu9tfDrvhFT
8g0HuFkxuMV7H94GenL6ZfEoau4wSyX7iV5N2fcxBm4RtHLxsLqaOU5DE5MH3BM8
AUwmZFQiq9BMXAZhaBbo9nXjAIzMdHkNKh9JFbA3t6LLfsMcjGLGfFs87eKNEKPw
JZ/OFmxv6dq8a2s5qEILZOoHDv+pVUkJm13WKR2cXPbMf2u2VPIxlJruUims6QNK
7kY7Qvetwsh6tZWgUKo+4vMHl0QWGYPtmR0NrOFZEOBReI3jEY+bbA/djaDr9rER
9oQyD3irgNqtwlY2nXFUSOJr/8g4J2LP8o/xA2BO8Q+bEJfnvqtL0wTX6o4We5bN
L08VzY1SfI56CNEH+zRcH6TtNJFEA3ELlUmTqHXZPsigKdUT5/U=
=jCCs
-----END PGP SIGNATURE-----

--nextPart62412551.3YSEZU2eEr--





--===============4035565249572160864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4035565249572160864==--
