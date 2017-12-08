Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNHWJ-0000yq-Qj
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 12:12:49 +0000
Received: by mail-qt0-x241.google.com with SMTP id e2so25444592qti.0
 for <ath10k@lists.infradead.org>; Fri, 08 Dec 2017 04:12:26 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH] ath10k: Add BMI parameters to fix calibration from
 DT/pre-cal
Date: Fri, 08 Dec 2017 13:12:22 +0100
Message-ID: <6476910.M9FJQ0px1r@bentobox>
In-Reply-To: <1495709483-29793-1-git-send-email-akolli@qti.qualcomm.com>
References: <1495709483-29793-1-git-send-email-akolli@qti.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2476943866832833073=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: akolli@qti.qualcomm.com
Cc: akolli@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

--===============2476943866832833073==
Content-Type: multipart/signed; boundary="nextPart4384296.kb4GpoEaxo"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4384296.kb4GpoEaxo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 25. Mai 2017 16:21:23 CET akolli@qti.qualcomm.com wrote:
> From: Anilkumar Kolli <akolli@qti.qualcomm.com>
> 
> QCA99X0, QCA9888, QCA9984 supports calibration data in
> either OTP or DT/pre-cal file. Current ath10k supports
> Calibration data from OTP only.
> 
> If caldata is loaded from DT/pre-cal file, fetching board id
> and applying calibration parameters like tx power gets failed.
> 
> error log:
> [   15.733663] ath10k_pci 0000:01:00.0: failed to fetch board file: -2
> [   15.741474] ath10k_pci 0000:01:00.0: could not probe fw (-2)
> 
> This patch adds calibration data support from DT/pre-cal
> file.  Below parameters are used to get board id and
> applying calibration parameters from cal data.
> 
> 		EEPROM[OTP]	FLASH[DT/pre-cal file]
> Cal param	0x700		0x10000
> Board id	0x10		0x8000
> 
> Tested on QCA9888 with pre-cal file.
> 
> Signed-off-by: Anilkumar Kolli <akolli@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/bmi.h  |    2 ++
>  drivers/net/wireless/ath/ath10k/core.c |   16 +++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)

Just tried this on an QCA9984 which doesn't seem to have the calibration data in the PCI EEPROM.

    [   71.728929] ath10k_pci 0000:01:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
    [   71.732926] ath10k_pci 0000:01:00.0: kconfig debug 1 debugfs 1 tracing 0 dfs 1 testmode 1
    [   71.752282] ath10k_pci 0000:01:00.0: firmware ver 10.4-ct-9984-fW-009-dfa0083 api 5 features peer-flow-ctrl crc32 7198d117
    [   73.805730] ath10k_pci 0000:01:00.0: unable to read from the device
    [   73.805769] ath10k_pci 0000:01:00.0: could not execute otp for board id check: -110

It works when I use the pre-cal data as calibration data. The checksum in the 
pre-cal seems to be correct. Also the pre-cal data from 0:ART for the 2.4GHz 
and 5GHz QCA4019 seem to work perfectly fine.

Anything which I could have missed or what I could test? Btw. I've also tested 
the non-ct firmware (aka the official one from QCA).

Kind
--nextPart4384296.kb4GpoEaxo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAloqgaYACgkQXYcKB8Em
e0a/pg/9EJ6/zaW0Ihn3tbmBwWvxxYiizBvkXYlQ6hpwIduX2Y++T2EeluHW91vL
9/NbMaPB0xrAwvMt4ywb4mf05JILAQHV5RyxEWnxznJp+mrw9xOAgDwH70anJFkb
XKKAMVWLS+BDQpCcUxWCImaZ3eAZzOllVQLHbD4+QTyiZSaSM20DMYWnnAoYtfkT
yorYZfxcQH3SzOGFJTjzFX/hOhF8cl4NQ9xg1evtxMQLapxXYEg5C5xlY9PDBsaw
RHexlOc37P1l4tpshjdfDNm1yqgTcrxjzOO93dcqr7WBr78sOzXEclsOMBDFA0of
IjK6QBJ3GQx3hYrPzk8gd3oqGgwob7K807V05LN39KzbZkde2QVkoKJZW5F4ZIpk
LoygMIBMjx1E0MYXPIalGhMIjZjdX00jU9kWJytoDIl0RK1XHHkDYsZv5yPx9dv3
mDj0rFz46iUBfThhmxLtL1lqi2e0mmtEZdFTRhF5Dl1JC2JJc1cVa4TMt7ZUsPc0
xxAPS3xDnmUoKbJ0naxQ6cGtshSbwF9LocvRo6MI1p/Z3+Yky1Z7HpBJgX61QSD8
0J0cLODv12OHBjhhtwovCBYYSauA3k8jWFYJh4R+ujv9DDrwVCB+12hbLnOpO29l
HHeIxs7chphk8Esg+1+p6hslURVSrGwMHjqT3rr5h+SZJssfjgw=
=jn8Z
-----END PGP SIGNATURE-----

--nextPart4384296.kb4GpoEaxo--



--===============2476943866832833073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2476943866832833073==--
