Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from packetmixer.de ([2001:4d88:2000:24::c0de]
 helo=mail.mail.packetmixer.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQsXo-0002go-Rx
 for ath10k@lists.infradead.org; Fri, 30 Jun 2017 09:48:59 +0000
From: Simon Wunderlich <sw@simonwunderlich.de>
Subject: Re: Is using 802.11s with DFS possible?
Date: Fri, 30 Jun 2017 11:48:29 +0200
Message-ID: <2614300.ercbpO68rJ@prime>
In-Reply-To: <CAEFj986gxesLcSaeVH9Yfwre7cTB0uqSzHBMpZKSNbmgQFcmhA@mail.gmail.com>
References: <CAOiRWuXVO5ACHCX6ZHy_rP1oA7+sgnnvtOTydHqUJWHjpBZTZw@mail.gmail.com>
 <d4a7c59c-85f0-bbfb-84ce-ce0a6c7bf483@bowerswilkins.com>
 <CAEFj986gxesLcSaeVH9Yfwre7cTB0uqSzHBMpZKSNbmgQFcmhA@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4297851611517292067=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: Zach Sherin <zach@netblazr.com>, benjamin@sipsolutions.net, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <peter.oh@bowerswilkins.com>

--===============4297851611517292067==
Content-Type: multipart/signed; boundary="nextPart2977437.IJzX4yts1A"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2977437.IJzX4yts1A
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, June 30, 2017 12:08:51 PM CEST Chun-Yeow Yeoh wrote:
> On Fri, Jun 30, 2017 at 1:53 AM, Peter Oh <peter.oh@bowerswilkins.com> 
wrote:
> > On 06/28/2017 06:54 PM, Zach Sherin wrote:
> >> Hi all,
> >> 
> >> I've been running some experiments in LEDE thanks to your help many
> >> months ago, and I want to use DFS frequencies with my mesh network.
> >> Does ath10k currently support this or am I up a creek? My tests show
> >> that I can use DFS frequencies with AP mode but have always failed
> >> when I use them in a mesh, such that the interface won't even start.
> >> 
> >> Any suggestions?
> > 
> > As far as I know, no DFS channels enabled in mesh mode at this moment.
> > To support DFS channels in mesh mode, wpa_supplicant and mac80211 changes
> > are required.
> 
> https://www.spinics.net/lists/linux-wireless/msg162307.html
> Simon and Benjamin have submitted the above patches and some of them
> has upstream to mac80211-next.
> 
> Perhaps, Simon and Benjamin can comment on this.

Our mac80211 patches have been upstreamed. However, the (experimental) 
wpa_supplicant patches have not been adopted and I've reworked them a little 
but they are not in a state to resubmit yet. So I don't expect the 
wpa_supplicant portion to work yet, and you also may need to think of a good 
way to have the mesh peers on a channel succession order.

Cheers,
     Simon
--nextPart2977437.IJzX4yts1A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE1ilQI7G+y+fdhnrfoSvjmEKSnqEFAllWHm0ACgkQoSvjmEKS
nqGdeQ/+MCNEB6Z5yXEEIZlE7eECmJuIBwtLCU+zc0mlKXmiVocOATym+BInO2wl
mnHp7amlHO2eSt8/VV6yTEi25ULwmT78+9OfpGSFnFLFKstLhjcCcew5/qGnAId8
Vp7ExsBpcpXJLV3q2r0MkfPtOn02koiyUV1Km68Beh03R6Y4CZxErKI8rGhwZPon
XqgCowNk8TaOmC2R5OOQbLsux3hIMUmPUigixLK0diyRoVFSw3YBDCALXq/EyO7P
Uy68ZluKLDw+s73AoigD5BMCvOS/pCd/CNYGO3X+emOdoMNWhnlha8OVOfxFH+Sh
0Cdhh5tu7o7zdkUGu6RkgaBNltxM2vYDS+Dt3Te41ZcxoE5xd7Ee27gAJ05Xn63Q
84K26HBzSX4C904TcoDiWXL1l/cdUvjdizxUl+UHu/2nid3tNFefbOqojLBLnYiB
7wGevxr8dY4cETOvOGHDFhSNoFoy+bUfU9JpeUAv4Gb8kVn7h1kBVG0F9MD1C1Oi
PLkQz3imBjTTmED7vqCNKxYANsen5uCkuBzy8Rayhw+97cSjyIQWKbb/SbXZ9c1+
DvTKZNe1xEflgBv9yV4Ex5IU7ToXdD+k6Jt9T5sMiqHNj7J6Eofzp1/Dp0ZaC8YT
a9U6jcTA7jm1pfQk9vtdj/jQK1S1vIBFI9CXQpHE0pxOAX0vU18=
=//CR
-----END PGP SIGNATURE-----

--nextPart2977437.IJzX4yts1A--



--===============4297851611517292067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4297851611517292067==--
