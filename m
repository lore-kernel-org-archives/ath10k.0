Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyMRo-00060K-Rn
 for ath10k@lists.infradead.org; Mon, 25 Feb 2019 20:02:07 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
Date: Mon, 25 Feb 2019 21:00:38 +0100
Message-ID: <2172036.sbaLp6LFFn@bentobox>
In-Reply-To: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0968015016762318932=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, Zhi Chen <zhichen@codeaurora.org>, linux-wireless@vger.kernel.org

--===============0968015016762318932==
Content-Type: multipart/signed; boundary="nextPart1608350.tWY5D5mM8n"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1608350.tWY5D5mM8n
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 11 December 2018 05:56:11 CET Pradeep Kumar Chitrapu wrote:
> From: Pradeep kumar Chitrapu <pradeepc@codeaurora.org>
> 
> Invalid rate code is sent to firmware when multicast rate value of 0 is
> sent to driver indicating disabled case, causing broken mesh path.
> so fix that.
> 
> Tested on QCA9984 with firmware 10.4-3.6.1-00827
> 
> Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")
> Co-developed-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Tested-by: Sven Eckelmann <sven@narfation.org>

Was tested on QCA988X with 10.2.4-1.0-00041

Kind regards,
	Sven

--nextPart1608350.tWY5D5mM8n
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlx0SWYACgkQXYcKB8Em
e0YnWQ/+P/Haq1uzyOVtvM0YlanARqSIj8TUYC6IDGZm+XA2hHb8O5oYZgvb7vMV
uviv4QKs5HGfK252jmjdUAHbMiMBMU84YIzIyeEFZq0DB3InZequMFB9RpOfo20a
CeJTyfPwqrYeSAebTsEXi1TKvHI7AFdD7Sv7flQODMVyBDWJcNXLRDa5G557qxy9
9GuPX8kwGQ7mMTxQcDQbBZYtwrN4O22UK7AZao/Vy0q7TaTecfJ832nVTHELLVC8
FsJQthU7jxXu48BQ1MRzeMaAdlZJNcWYKYxz4WIY3XbBmq7QTJoyMcrKftGRqxPm
HCJipsb4kcNgV8geOXPG/PYWdV0bz2mzf248ofM5byEWY8UbDZCHWhLhbZJI83iG
VEghE+Dq8J6RzQqvRG3lav8gAaF+BYfFO+lZ9K3j4+97PNosstPB06Jxb+/fZBWI
sEDBHkqlY/w7iW85MpqCxYsWQYXfpokTVz9zqX5DCHnbo83K17OjSq1qzaqrcVNC
Zk2DRQJwHcnmWQtzVom0957j3dPNA3Vihp8iFxOzINbOP8OC0hCPjUTddpn9KHXr
OVd1nHXym+RcowTnpWrwgFo/47DRFoXYNMvlpsw7Y9m2kPKfosWJtSjCu66/0tcu
oIiunrUnrgnXn4gQzZYYgf6T1jjouqAUBlp9VcFLV8c+2p5LnGE=
=fqSU
-----END PGP SIGNATURE-----

--nextPart1608350.tWY5D5mM8n--





--===============0968015016762318932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0968015016762318932==--
