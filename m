Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([79.140.41.39] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBfYz-0001WG-VQ
 for ath10k@lists.infradead.org; Wed, 03 Apr 2019 13:04:23 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
Date: Wed, 03 Apr 2019 15:04:10 +0200
Message-ID: <5618478.dNoBKn3uCK@bentobox>
In-Reply-To: <8736mzuvbz.fsf@kamboji.qca.qualcomm.com>
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
 <3062143.B1lnfLpWcE@bentobox> <8736mzuvbz.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6000915723815268336=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Steve deRosier <derosier@cal-sierra.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, Ansuel Smith <ansuelsmth@gmail.com>

--===============6000915723815268336==
Content-Type: multipart/signed; boundary="nextPart19681940.3Wz5n8HyCO"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart19681940.3Wz5n8HyCO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 3 April 2019 14:28:16 CEST Kalle Valo wrote:
[...]
> I'm planning to apply this. I was not sure what you wanted to add to the
> commit log but I changed to now what's below. Please let me know if you
> want to change it.
> 
>     ath10k: fix incorrect multicast/broadcast rate setting
>     
>     Invalid rate code is sent to firmware when multicast rate value of 0 is
>     sent to driver indicating disabled case, causing broken mesh path.
>     so fix that.
>     
>     Tested on QCA9984 with firmware 10.4-3.6.1-00827
>     
>     Sven tested on IPQ4019 with 10.4-3.5.3-00057 and QCA9888 with 10.4-3.5.3-00053
>     (ath10k-firmware) and 10.4-3.6-00140 (linux-firmware 2018-12-16-211de167).
>     
>     Fixes: cd93b83ad92 ("ath10k: support for multicast rate control")
>     Co-developed-by: Zhi Chen <zhichen@codeaurora.org>
>     Signed-off-by: Zhi Chen <zhichen@codeaurora.org>
>     Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
>     Tested-by: Sven Eckelmann <sven@narfation.org>
>     Patchwork-Id: 10723033
>     Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

I thought you just wanted to have this information added to the "Tested on " 
line by him. So I didn't really invest time to propose a new paragraph.

The new paragraph is fine for me.

Kind regards,
	Sven
--nextPart19681940.3Wz5n8HyCO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlykr0oACgkQXYcKB8Em
e0ZRhxAAlXhcJ7j0AhFzo7pr/CS7CL4iXNb1RfKULViEtQfp61yN0A2+c7M6fYql
VbIgjwtqI0hvGO2yFM98Q3ur00tlouCd1XbRWzozOp26wCbZDKkvHTzctS2szMKl
qr+8VGHeL+E7eQBjdSi6aaV+TzoStLDaMgtm6R4wuiK4Ul3/yCKCNfghV72VW81J
edwcQ3DsYLoZAWbN6/51m4hfNAfRzvvfGoyrjIBPDLNiq9EIr/K4ro2sBCxQCFt0
uSBRRA3kjbIUdVPyHljDeYal46uB0gMx+UhiCvYeQ+KejyyU2I/uZh5aDaHjgMla
s3gQP4x4ovsoccTNVhfo1X1a/gtGW7x6i2rDOieQ90Pd+ph1O6w25p4XZN6Lo72o
f4RPyZZPrTjlP2kAaWd88EiloInxC92ALQz9ZdpoibaWqrX45DVuhXMQMK+8QNLd
j61SmZe43URH41Wdmt248/3aT5/ZSvyTh3nm0JUcf+eodxRxJZJIstfFEorv6G3F
MMwnIzMPNIxl8RUCd3hR+CBN+OCRI6u/3qnlKXYmnI9MfLgqggEncJCwK5HR0pl0
BL4cy2LY1tTqlR/6SKwnSvw0lXCkqEXVHK3YFhEK6f9Cs1xrMTF/0U8+iYoGJFqM
pHvTnKNgyVo5p866DQUQtqJt9WidG5HtaqKxCsCBB6c9Qh9XEV4=
=K1c3
-----END PGP SIGNATURE-----

--nextPart19681940.3Wz5n8HyCO--





--===============6000915723815268336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6000915723815268336==--
