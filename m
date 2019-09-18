Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAZmN-0002WC-0W
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 13:13:57 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
Date: Wed, 18 Sep 2019 15:13:50 +0200
Message-ID: <1915721.epgQvm9qp9@bentobox>
In-Reply-To: <9396620.6V9WzEIOqW@bentobox>
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <b24ec622-8510-d8e4-bbc4-86a34c1dd32b@candelatech.com>
 <9396620.6V9WzEIOqW@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7519398677582963616=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Ben Greear <greearb@candelatech.com>
Cc: sw@simonwunderlich.de, vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, slakkavalli@datto.com, Johannes Berg <johannes@sipsolutions.net>

--===============7519398677582963616==
Content-Type: multipart/signed; boundary="nextPart3096840.zzhJXNy4Gy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3096840.zzhJXNy4Gy
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 18 September 2019 15:07:11 CEST Sven Eckelmann wrote:
[...]
> I have now prepared a test patch [1] to get the data every 10 seconds. This 
> was a compromise between having useful information over time and the 
> overflowing problem. 

...over time without too many "bss channel survey timed out" errors and...

Kind regards,
	Sven
--nextPart3096840.zzhJXNy4Gy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2CLY8ACgkQXYcKB8Em
e0b1SxAAtEDe5QoD4u5/aCttIe1q0DlYYCSY1cIBm7fIp8VuQsZYr5zL7lI/NEEv
ISZmqrQ5Ml4fjKPZ8P0lV1mHGvKrdAS82gk+f/QmAE5IpMeOZ2UsYN8h4BY3aH5+
tXAG+6/Dwy3hnFP4TluS4zdIhN30tSXxbafV0LL7im25GDHTwYWczQ38Y38xko62
974A6iwfavwuUSuN9L8wwee1EHPsueh7dclPoGkeLfBtMxD/vr7EE3GAffGvnYSk
FpiGZotSulIEWg7oLkZoF2QUFxZ9GaN5uVY+t2WWF+cC2xpTtjS6CfDXHRKVq9B4
Slw2+EyFe0X5u6P7cimmwR9FRSGmJYi7pFdU6wt698Oc+1/+tHGXMVnuViIMrVgT
LHt+POqDyrB8+dilI2UQKKXaK/0NdfboB2PlIZxta6CVTf93N0E9xVxmIW2IbVIi
UkBHmGjmz5C70Z1Z3MuYs+0iyMmBov0Lhr23+3t85SK8M7Hdk6DNrs9W43r7VcwE
ZSgwAF5OfNeTsWvbJWFRTOr7bVaFju8EhY/zQOgXWCWmrS3BTYvGhfL2tl9PtyWy
ELrflQVZWNbYy1ECF4ZDFAh1UBaBo4l9vhft7OeB36cFVMPAypX+ZR3wNI8uHxay
LAfGb5aSMfNj4U+1g3zuZ+7WZhC6C/tOJttV7ljFCH9fAqN4YHo=
=vMka
-----END PGP SIGNATURE-----

--nextPart3096840.zzhJXNy4Gy--





--===============7519398677582963616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7519398677582963616==--
