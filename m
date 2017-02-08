Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbQ3G-0001Ds-PM
 for ath10k@lists.infradead.org; Wed, 08 Feb 2017 11:04:44 +0000
Received: by mail-wm0-f50.google.com with SMTP id 196so49438620wmm.1
 for <ath10k@lists.infradead.org>; Wed, 08 Feb 2017 03:04:22 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Wed, 08 Feb 2017 12:03:19 +0100
Message-ID: <4082394.QILMJyBdPS@bentobox>
In-Reply-To: <1591748.RGYhBEn8I1@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4608268555321193139=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: shashidhar.lakkavalli@openmesh.com
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath10k@lists.infradead.org

--===============4608268555321193139==
Content-Type: multipart/signed; boundary="nextPart2380546.FYaB2626QZ"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2380546.FYaB2626QZ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Anilkumar Kolli,

we've noticed that your change in QSDK [1] removed the call to
ath10k_download_and_run_otp in ath10k_download_cal_data after the call to
ath10k_core_get_board_id_from_otp. We reported [2] this to ath10k when we
asked for some clarifications regarding the loading process of the pre-cal +
board-2.bin data.

It was also told us by QCA (private mail) and by Adrian Chadd [3] that the
ath10k_download_and_run_otp step should have been done.

The used release were we noticed this was
caf_AU_LINUX_QSDK_RELEASE_DATE_R1_TARGET_ALL.5.0.639.021.

Will this be fixed in the QSDK? Why is a different implementation used than in
the official ath10k version [4]?

Kind regards,
	Sven


[1] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/commit/?id=cd78cb8fcbc28af3e538743177f106ec8c5fe295
[2] http://lists.infradead.org/pipermail/ath10k/2017-January/009025.html
[3] http://lists.infradead.org/pipermail/ath10k/2017-January/009104.html
[4] https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3d9195ea19e4854d7daa11688b01905e244aead9

--nextPart2380546.FYaB2626QZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlia+vcACgkQXYcKB8Em
e0a0vw//ZJeoSkdQhBOAkkA+3vSAIdmCo7SGe8rKtN0tmLR0mnrIA6ovfut+k+uk
RMtl0TediRYwP4Ta9JqVZAmHVHeoyZKSZLlFjcdw/yfin3L72YotUDF3mCrLtHs3
oatzsnv1YdTT9hsR4OGddoBv9X0CwUl8oGiekeyrMdEXcGFcCZtZz0B6JtaBa7mw
AiQvPIjfB5beUylY60wFLZ5fY+c6DOnjABUXp3LuQLZAv5xFo6CUNY+fTCPkOi2G
9hh5pB7YYftke1G6IRdJtbRpRh4b9W6IiIOmRNQYa1XcLWtZEVOBk+rsLGTToSNW
sek02uTllfpV2844rh2m9AXFzHrmOfx+y9ioZz7NSTOMDAvCptnVon3hQcyjyBE2
SUEWeLglK4q21VFDqJ7BV+dIhiptmucIQwVHK5EkqBlQol0NiNI7WNns4I6xGVHQ
4Z2Bk12mFF73F4LJHn4yepHIiYQWNFlPYqYrJuz0gXyMOpahISCX77CY3exksc9d
SlgyoMr4ixmmgDWR6znBReP5O9Ak9N7yV0yFgpfnmZURpyP3WOs5e/wfDf9udyTu
1gtv3rroFsYjzr60O6vohbcrYHX9kb9+/ysZU41DJnh7LkrnmiEzIG8uNJxZxFl7
OPNPPWTMCJXifryF5OWYwZ3L7c9U0S20HtbkqPwEjD/xWmpF+uQ=
=WDrG
-----END PGP SIGNATURE-----

--nextPart2380546.FYaB2626QZ--



--===============4608268555321193139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4608268555321193139==--
