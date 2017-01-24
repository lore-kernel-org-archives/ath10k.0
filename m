Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cW2lA-0006v2-Ou
 for ath10k@lists.infradead.org; Tue, 24 Jan 2017 15:11:50 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: ath9k/ath10k DFS testing / certification
Date: Tue, 24 Jan 2017 16:10:55 +0100
Message-ID: <9646101.djguVEVbIO@prime>
In-Reply-To: <CAJ-Vmo=WYvi5ZL_VDr623cFkp0oocDYkui346_mtb91cthsXMA@mail.gmail.com>
References: <CAJ-Vmo=_apPFE1LQmXj6pn9g1c0bvzAS-gk86Hi7-CX+KuZtrw@mail.gmail.com>
 <11515104.ikeaahra59@prime>
 <CAJ-Vmo=WYvi5ZL_VDr623cFkp0oocDYkui346_mtb91cthsXMA@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5008171394105126938=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: Jean-Pierre Tosoni <jp.tosoni@acksys.fr>, Cedric VONCKEN <cedric.voncken@acksys.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============5008171394105126938==
Content-Type: multipart/signed; boundary="nextPart8636781.TQkaop4sRV"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart8636781.TQkaop4sRV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Adrian,

On Tuesday, January 24, 2017 7:05:58 AM CET Adrian Chadd wrote:
> hi!
> 
> On 24 January 2017 at 03:16, Simon Wunderlich <sw@simonwunderlich.de> wrote:
> > Hi Adrian,
> > 
> > I've been doing DFS pre-tests back in December 2016. We did AP tests for a
> > 9880 based AP for ETSI and FCC region. We had two small patches for making
> > the> 
> > tests less painful (in hostapd and mac80211):
> >  * disable CSA on incoming radar, that is keep on staying on the operating
> > 
> > channels. That makes continouos testing of radar signals much easier
> > (usually you test like 10 radars in a row), since we don't had to reboot
> > the device all the time.
> > 
> >  * shorten CAC to 3 seconds, because waiting 60 seconds is also taking
> >  some
> > 
> > time
> 
> Do you have those patches available somewhere?
> 

not sure if I can release them, so no. :)

But both were rather trivial, the first one is a change in hostapd, the latter 
in mac80211.

> > All FCC tests pass, at least from the radar detection point. ETSI had a
> > problem with one of the patterns. We used iperf UDP tests to generate
> > load,
> > but will probably switch to another tool in the next round (or tune it),
> > since it seems to send packets too bursty, which could be the cause for
> > the failed ETSI test.
> 
> Ok. What are you using to generate radar patterns for testing?
> 

We used 300k+ EUR Rohde&Schwarz equipment of the certification lab. :)

I don't have a pattern generation available at my home, but I remember 
discussions that it's possible to get something useful and cheap using SDRs 
(with cheap I mean in the <5k$ range). I believe Zefir had tried this route 
...

> > Thanks for the info on the scan bug, we discovered that too, but thought
> > we
> > could fix it in mac80211 (but never really followed up). Please keep me in
> > the loop when this is fixed. :)
> :
> :) I'll punt this to QCA if/when the right time arises and see if
> 
> they'll fix ath10k firmware.

Excellent!

     Simon
--nextPart8636781.TQkaop4sRV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE1ilQI7G+y+fdhnrfoSvjmEKSnqEFAliHbn8ACgkQoSvjmEKS
nqFuSw//UegXSToUDhL8fl0555uJKxXaQfa6TKL7KK/Ip59zQdipQRW4GuVxskpf
C412fqcPVIygbsJZcaclVjmMbEbczQ3yHCLMtd5KPmSjr7IwVw0ktwXbvHnQXVfB
IRYmHAHzmQ5fb1Br6O8MmBBK60zOHETULdRyr1zvGo1QEExgPb68tkyBOslfgE7h
uhig8+3owDTQls/gwDpcU7aIY4aCX7HJWobR7dxqI5uDKFK5AG7jXO+dIxVtzSme
kURHZQauV8wdbGaLTnH1YoxwtswDll+JVZMoDbzxMhfQf/qR9MVxHsA6dRCWN3V2
zbUYFhyrbCLuF1ZWzrhrxgoia4jzkhWg1Tdqd0keA6mqdbdFcs8QWEJjc/fDRn+p
c2pS8Zmi+DDQdvl4AIuJq1DaAQyHEDp2S1rklls0lTGo7LMMOS2qkCVudXbmIdkW
9CHYoLj5vjF0NDCZh5Ilw9c6ND/IzCEadpP3wZ3fnyevf1gLQBsQhsPx4EVmwSKt
LhKOMqei/VgUuwelLPXkydn4uhlc0KXKvK/W7Ov2QyyChoJyYcInERcmytQANhap
Q6LO9p44H2vamYtez1jdpfoOTCTq22HrED1e4MJIkZybeA+ljw584Bw/vSy75FiQ
+QKiC0KtbuD9iNDXaN6dsb5jNGeH6U3L9eFaUvQ0GpFUvT/ucj0=
=MBCo
-----END PGP SIGNATURE-----

--nextPart8636781.TQkaop4sRV--



--===============5008171394105126938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5008171394105126938==--
