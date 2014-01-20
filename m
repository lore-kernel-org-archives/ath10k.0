Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dev-nolb.cloudtrax.com ([54.203.245.161])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5C7V-0000Rq-RQ
 for ath10k@lists.infradead.org; Mon, 20 Jan 2014 10:30:18 +0000
From: Sven Eckelmann <sven@open-mesh.com>
Subject: Re: [PATCH 0/2] Initial 11ac support using ath10k
Date: Mon, 20 Jan 2014 11:29:26 +0100
Message-ID: <2241060.ARHWKI05xP@bentobox>
In-Reply-To: <878uudps7f.fsf@kamboji.qca.qualcomm.com>
References: <1513091.zjVOOQ7NvD@bentobox>
 <87mwitpsmn.fsf@kamboji.qca.qualcomm.com>
 <878uudps7f.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7622804427486776950=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Simon Wunderlich <simon@open-mesh.com>, "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>


--===============7622804427486776950==
Content-Type: multipart/signed; boundary="nextPart2167833.AYiT05pXtr"; micalg="pgp-sha512"; protocol="application/pgp-signature"


--nextPart2167833.AYiT05pXtr
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 18 January 2014 01:14:28 Kalle Valo wrote:
> > I've picked up the patches and rebased them on top of the current master
> > branch/trunk.
> 
> Where did you take the ath10k patches? ath10k is under heavy
> development, so I strongly recommend taking patches directly from
> ath-next branch of my ath.git. That way you would be using the latest
> and greatest.

They were taken from the wireless-testing repo. But it seems that (for obvious 
reasons) the OpenWrt maintainers doesn't want so apply so many patches. But it 
is a good source [1] for future tests.

> > Just as general information to the state of ath10k, my current test showed
> > 
> > some problems with it:
> >  * Samsung GT-I9300 only got horrible slow connections to an QCA9880 but
> >  
> >    an Intel N6205 (using iwlwifi from v3.12) or Samsung S4 worked
> >    "fine"
> 
> Could you report the I9300 issue to the ath10k list with more details,
> please? We can try to investigate it.

This is a little bit problematic. I could reproduce this problem quite well on 
a specific date and when I tried some other day it worked fine. So it is hard 
to report anything. The only thing I could report would be the "Failed to add 
peer" problem which seemed to happen at the same time.

Maybe I find a way to reproduce it reliable but I don't know how at the 
moment.

> >  * Adhoc mode doesn't work at all
> 
> That was with 10.1 firmware? AFAIK it doesn't support adhoc at all. I
> think we need to add a firmware feature flag to disable adhoc with that
> firmware.

It used the latest and greatest, stable(?) version of the firmware when the 
patchset was generated: ap/firmware-2.bin_10.1.467-1

The statement "doesn't support adhoc at all" makes me a little bit nervous. 
Would you say that it is better to completely ignore the "ap" directory of the 
firmware repo [2]? Which benefits does the ap firmware has over the ath10k 
firmware?

At the end I would most likely run something like this:

 * 1 AP dev with WPA (1/2, TKIP and/or CCMP, PSK or Enterprise)
 * 1 AP dev without WPA
 * 1 adhoc dev with IBSS RSN (running something like batman-adv over
   infrastructure mode is a little bit lame ;) )

But it also has to be able to use a dev in managed mode.

This worked quite well in the past with ath9k and thus I was checking ath10k 
to decide if it is an interesting platform/driver for the future.

> >  * Sometimes adding of station seems to fail:
> >    ath10k: Failed to add peer 5c:0a:5b:4e:6a:c4 for vdev 1 when adding a
> >    new
> >    sta: -145
> 
> This is new to me. Can you report this to the ath10k list, please?

I will try to reproduce it and report it in a separate thread when I have more 
useful information.

> >  * Adhoc interface +  "iw dev wlan0 scan trigger" just crashes the 
firmware:
> >    [ 296.160000] ath10k: firmware crashed!
> >    [ 296.170000] ath10k: hardware name qca988x hw2.0 version 0x4100016c
> >    [ 296.170000] ath10k: firmware version: 65.467.0.0
> 
> What firmware version was this? The version printed here seems to be
> corrupted.

ap/firmware-2.bin_10.1.467-1

Kind regards,
	Sven

[1] https://github.com/kvalo/ath
[2] https://github.com/kvalo/ath10k-firmware
--nextPart2167833.AYiT05pXtr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCgAGBQJS3PqGAAoJEF2HCgfBJntGu9sQANjqi9JuI68klfhK4Wta98Yh
zS7Ob4cBS4n9PG6QjGvXHL6bNyQZwGVODwqhDwrJKm2Tc3l8qGXyHxOvsHF0qWel
s1XlY3p8OIVIFbhLKzweumMObhQmM0UE6XrsW218xlmlvrBDFx6OsWvpbMgHweZS
/S3+f9YrPEbY5g9+jEBM8IK/VBq/50kn1E8TGibf05VM0n3k8XQWErjJ+BeSBQuq
UVJc1OcFp0rO+p2RA7XePHSwROXGqAqpe490bfNM5ksQ7Z8PIbXwZ/d8mBw5kBk7
4gzoUaf5NIwuAEsfB1/FJ/z6C3xPwrEcsyqeKwolBygqGJJtU0IfBbZ0G/T2/PDj
cDtstS9WZZxud0UxqiVI3C4YhUr+Y5nQlgqi8+uEoYmjp9WhLq6ix1YwwMlu/k2e
EGM8GE4BbCMeDeig+1qBMfFGdfxtBqaXr+TxE+1PsY9X87WU7pLX/qqPkUQcfxnK
FhU9pS4eTDy4D/KoWjB4+tZWyS0Mf27a81fNIccPtsQPJjHCkuLhsXMnwX4nGS46
XuZa465QTV4mrNi5HlzrNJPxrd1CcHEB7UscMiWBZ0wmtmJXQ9MacZsgT3T93Anr
BFSvRSYkECoX2GqimXo7EzbghDkqP1vmz4AE9p3OxGFpRPRYI5SvRQlmKNzgzsAf
yOlajbzV9yfjEeMst6SY
=6LQo
-----END PGP SIGNATURE-----

--nextPart2167833.AYiT05pXtr--



--===============7622804427486776950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7622804427486776950==--
