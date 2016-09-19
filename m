Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bluy4-0004Eo-5Q
 for ath10k@lists.infradead.org; Mon, 19 Sep 2016 09:34:29 +0000
Received: by mail-wm0-x22a.google.com with SMTP id w84so65973289wmg.1
 for <ath10k@lists.infradead.org>; Mon, 19 Sep 2016 02:34:07 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: Re: [OpenWrt-Devel] ath10k mesh + ap + encryption?
Date: Mon, 19 Sep 2016 11:34:00 +0200
Message-ID: <2962659.7QzjSqzP6C@bentobox>
In-Reply-To: <5898628.mmcCycDigQ@prime>
References: <2661831.slnB0LOeVt@prime>
 <1473789271.27738.4.camel@qca.qualcomm.com> <5898628.mmcCycDigQ@prime>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5679434646477402595=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: openwrt-devel@lists.openwrt.org
Cc: "Pedersen, Thomas" <twp@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org, Simon Wunderlich <sw@simonwunderlich.de>

--===============5679434646477402595==
Content-Type: multipart/signed; boundary="nextPart3771332.eVX6l779bG"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3771332.eVX6l779bG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 19. September 2016 08:43:56 CEST Simon Wunderlich wrote:
[...]
> > We're testing encrypted AP + Mesh quite successfully right now with
> > this firmware: https://github.com/kvalo/ath10k-firmware/commit/307cb46b
> > 06661ebd3186723b5002de769c7add83, of course that is for a QCA4019 chip.
> > Which chip are you using? I can poke the firmware guys for possibility
> > of getting a 10.4.3.2 firmware build for it.
> 
> Hi Thomas,
> 
> thanks for the hint! We are using an older QCA9882. I assume your firmware
> will not work for this one? If you can poke the firmware guys, that would
> be great.
> :)
> 
> We also want to test the 70.52 firmware version next, maybe there were some
> changes since the .42 we used.

I have just checked it with 10.2.4.70.54:

               | 802.11s encrypted | 802.11s unencrypted
---------------+-------------------+--------------------
AP encrypted   | AP doesn't beacon | works
AP unencrypted | AP doesn't beacon | works

I've also checked 10.2.4.70.12-2 (doesn't seem to support encrypted mesh at 
all) and with rawmode=1 (makes no difference).

Kind regards,
	Sven
--nextPart3771332.eVX6l779bG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJX37EIAAoJEF2HCgfBJntG3TsP/iK+ihmJmg964hTzpSi44jr1
1ibMKEgHyWbdSxdOSr0088lIOe/9qeAUVABcIjNqHgBq+Bn94DvdiM3INZEeybw1
6mjnZM8XmrpwkMAfFnKqlRHhZDZ3wXBQOpa8KQPljf2lytDuUaYM+RfO7nA75piU
PTN1UCEoRCPWI7LXe0bQbQc3wkwKAhaD2OjJaQVDYn4XXqGiuAoq5Gu586fbLeKY
Cqs8uAIiNFtf6ZHFWlJGFGNOsbzTOhGDrK+oNcGbEvP++wuuqrzGrQ9XNcZcNuDr
GPSiuFhQ6rqWeEj8+dnxSFRqlwDMlFFALdUtdgvE+qK4l7DTMetmzE25FgFvZHei
ZfLs5GLSHhQHUK7nu5/MY39AjJGLIDOxEc/LAGSKsjZ9D4ZfjVo0KxZfKx2P21J4
1S0u2PP/O82JISRuQNQkIRM4rGZU7QaRVUfMLURTNB+uCukOlTok0BlnhHhq7Pdz
2pOOFLxTEuucmnomEhlNnUkzhLMtg+8y6tN0iGSuQgDDKbK4AHB1m6CH0Xyn6poH
Paku3bdtAbm/9OokYM8VhLBp192aqlEoeeeogocGPCPUiOb9mLT2P8d2lcmsUkFG
QFZUqm6pjnYd6mhY1wXE/tkhqSHER0n1CGktwsK0S3stSKiPsXif13Reb9rEvNV2
Xp8ecWiLT8naxgOjKlNB
=c/e7
-----END PGP SIGNATURE-----

--nextPart3771332.eVX6l779bG--



--===============5679434646477402595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5679434646477402595==--
