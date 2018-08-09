Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fntOd-0004Zw-V5
 for ath10k@lists.infradead.org; Thu, 09 Aug 2018 22:27:10 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCHv2] ath10k : Fix channel survey dump
Date: Fri, 10 Aug 2018 00:26:43 +0200
Message-ID: <11036966.yxZ1zVvfjs@sven-edge>
In-Reply-To: <619039a5-3b30-b49d-dc85-9ccfa4403251@bowerswilkins.com>
References: <d586156d3861a6cf0f479ff12ddd6544@codeaurora.org>
 <619039a5-3b30-b49d-dc85-9ccfa4403251@bowerswilkins.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1858416717738429041=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: Jasmine Strong <jas@eero.com>, Venkateswara Naralasetty <vnaralas@codeaurora.org>, linux-wireless@vger.kernel.org, Helmut Schaa <helmut.schaa@googlemail.com>, ath10k <ath10k@lists.infradead.org>, Johannes Berg <johannes@sipsolutions.net>, =?utf-8?B?TWljaGHFgg==?= Kazior <kazikcz@gmail.com>, Ben Greear <greearb@candelatech.com>, Felix Fietkau <nbd@nbd.name>

--===============1858416717738429041==
Content-Type: multipart/signed; boundary="nextPart1614932.M8rUiM9o42"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1614932.M8rUiM9o42
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 9. August 2018 20:46:26 CEST Peter Oh wrote:
> > In ath9k driver also survey data being accumulated in driver and send 
> > survey data to user space is accumulated one. same thing we are 
> > implementing in FW(with WMI request type WMI_BSS_SURVEY_REQ_TYPE_READ) 
> > instead of doing it in driver.
> It seems you're changing the behavior, not fixing a bug.
> WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR is handled differently from 
> WMI_BSS_SURVEY_REQ_TYPE_READ and as Jasmine addressed, userspace apps 
> that's counting on WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR behavior will be 
> broken their functions with your change.
> This means this patch will break backward compatibility.

Sounds to me like a bug when there is a driver independent API but two 
incompatible implementations:

* one driver using accumulated values over time
* one driver using non-accumulated values which are reset after each read to 0

Especially because there is already software which expects the accumulated 
values and which has no way to find out whether the just received data is now
accumulated or not. And it is also quite bad to have non-accumulated (ath10k's 
read+clear) data when multiple programs need to gather this data at the same 
time.

@Felix, @Johannes: Should &struct ieee80211_ops->get_survey/
NL80211_CMD_GET_SURVEY return "accumulated" channel utilizations values or 
clear the counters on each read? Might have missed the relevant phrase in 
include/uapi/linux/nl80211.h, include/net/cfg80211.h or
include/net/mac80211.h - so feel free to just point me to the already
existing documentation.


Btw. the same author also tried to implement the "accumulated data" behavior 
for get_survey in cfg80211 when a driver only supports read+clear:
https://patchwork.kernel.org/patch/10417673/

And here the earlier attempt (changing it from read_clear to read): 
https://patchwork.kernel.org/patch/9701459/ - the answer from Felix suggests 
that the accumulated values would be correct for the channel utilization 
related info in struct survey_info.

Kind regards,
	Sven


--nextPart1614932.M8rUiM9o42
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltsv6MACgkQXYcKB8Em
e0YfCBAAslGx9BTK0YtmKGa+ad8zi5E395a6/6L7CNyQ/5ZXfM4q55jfHZ8YM6Wn
kz4+113VbdLFlpQ5iKyA1GeJx5P8ofnFAHYmrSbg23xz1Z4G9SEwM++cO8v41Nvj
1+HvbmambzRXX6RuVTVyFXfjU7nEFL5+sc3bc0v9fAX0Ewf6JoDPofIBrg2uYSgq
5O+kw7EVRa6BsKnDq19JWZv11GA5EVF8NnSpUiGjKcnx7nCWgzXONE1SDXG7hrT4
PdII9iF8YJFDUIxm9skylVRWSDYEdlAEPdSvTcUuLHAHZmTS9316TqLRWECIy+Ty
2aQxi1ksdhE45rMWG33gIGlncl5tcBxPsyXYoYZC0QkdWdTuz+bFiO04doJQ5e53
8T8XWV6xlhr0KuC7P1465j+k7sCZA4U/LEF6Z6gWc0VdkN/q8NSZCg5KwT7zm3bD
7HXRDunpTJ4OVdWi6z6RotGBfjr2ukoGN90silrfa/R4LpRHw/Hc3Jsm7tZkRS6y
DH30Y8xJp+5TDLsnEj0G5e/TAAs3+c+zBBDd34kDne5Kw1NMvWaDEKK/dV/GWY45
0RF7cuoEIHJfgpHtRfydqFnM4SCHZT+Vswpss9OIftbPLfonN3xAvdzUz6hCk5C1
jdq/Kl1o6GLlqDxFNQabhiQaIfOJXj476fkmNyPFfYwffSINa8o=
=5TNR
-----END PGP SIGNATURE-----

--nextPart1614932.M8rUiM9o42--





--===============1858416717738429041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1858416717738429041==--
