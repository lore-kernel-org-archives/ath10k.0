Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAZg5-0000JN-CM
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 13:07:27 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
Date: Wed, 18 Sep 2019 15:07:11 +0200
Message-ID: <9396620.6V9WzEIOqW@bentobox>
In-Reply-To: <b24ec622-8510-d8e4-bbc4-86a34c1dd32b@candelatech.com>
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <18458963.ukFM9YuvQx@bentobox>
 <b24ec622-8510-d8e4-bbc4-86a34c1dd32b@candelatech.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0746079279454281683=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: sw@simonwunderlich.de, vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, slakkavalli@datto.com, Johannes Berg <johannes@sipsolutions.net>

--===============0746079279454281683==
Content-Type: multipart/signed; boundary="nextPart32686119.arC66jU3Z4"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart32686119.arC66jU3Z4
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 18 September 2019 14:58:46 CEST Ben Greear wrote:
[...]
> > So as Ben Greear said, the 10.4 firmware version is fixed and 10.2.* (for
> > the wave-1 cards) is still broken and we need a QCA firmware engineer to
> > fix it. Or to work around it by polling every couple of seconds and
> > manually do the cleanup of the values from the firmware.
> 
> Have you tried probing very fast, like every 100ms, to see if returned values
> look sane?  I seem to recall that there was some firmware issue with this, like
> it only updates internal counters every second or so.
> 
> Polling slow would have the same off-by-a-second's-worth-of-data, but you would not
> easily notice it at slower polling intervals.

Yes, I've polled at ~100ms intervals at some point. And it looked like I get 
most of the time only 0 values (for everything - including noisefloor) from 
the firmware when I do this. And the actual values are only send every second 
or so (I didn't actual make precise calculations here).

I have now prepared a test patch [1] to get the data every 10 seconds. This 
was a compromise between having useful information over time and the 
overflowing problem. While it is not the perfect solution (QCA *cough*), it is 
at least more bearable for me.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/11150289/
--nextPart32686119.arC66jU3Z4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2CK/8ACgkQXYcKB8Em
e0Y94hAA0/ROFoGwOKnIIlCRxVRpa4GmCdYUKUYB32Dk1Pnm4atB6xdzT4bTk9+Y
TY/0AcQ0ycYSgw/T52kiyfGS79WSsUzce6oHpy7LD/fBr9QF2WBp66N5Ydw+VpK6
egcp31kHvTznCasXUbIejdlRBgEXyDPfpWuhobGrcRLjg8AZNsj/4fFtWdTCEeJn
u/2o+AAtK2CkSH5cyWf6oDF1f3essL2GiOl2/6fbo7dfvbGYhQ8BtKrPzWyiNVDs
Saxym1JX4lI0thTa/NB6g+UZzDeEpR6Kvcj0X2M9aqH69bckgxQoakRo245Z5/TH
UYO9b6OtM52ZP93s6AXd/grSi14EbrY92Yap4LQT1Rf7ldOJnPlS8ugPKKEuUZu+
CcsPfQHB8CHLe0Zi8mmkS91/ox7TUyPxtC/uXrb8L5Hesj5BiLL2rF26HQnzGWvI
E7qF48nx2Q4xNpe5nhhD8wv3KuJwkG1T0iXxBf9UNdlCqnNsWBwxHYiX835RH/MO
tj28Kn5yd00lSin2Yf8A7V6EDShmb8OSdVrHdYV9MqPnNnvp8qXBITPnMW1l1gzh
VOVqYDUxdaa/DZUnVtlFzsmzNWGhFlS1jtOrPZcGzkYmkLvw48PO48OBct8j1EpR
IbJCYGMSFNbkvCJblMrcjX+c6ZVJbP6ckYyt0GJJkjnMDofOGSc=
=SJ3l
-----END PGP SIGNATURE-----

--nextPart32686119.arC66jU3Z4--





--===============0746079279454281683==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0746079279454281683==--
