Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([213.160.73.56])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd9JN-0005JJ-Fo
 for ath10k@lists.infradead.org; Mon, 25 May 2020 09:22:28 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
Date: Mon, 25 May 2020 11:22:13 +0200
Message-ID: <3608947.bSrYYtX6KI@bentobox>
In-Reply-To: <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <2468724.JaAZLprVu6@bentobox>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8211223660415021630=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

--===============8211223660415021630==
Content-Type: multipart/signed; boundary="nextPart2460714.mtjQ6OgbZm"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2460714.mtjQ6OgbZm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 20 May 2020 09:39:45 CEST Sebastian Gottschall wrote:
[...]
> could somone clarify the state here and why it was dropped?
> the original patch i wrote does exclude the soc chipsets, but the patch 
> was later reorganized and some part have been rewritten
> so i'm not sure if it covers the scenario mentioned here, which i did 
[...]
> > This patch was imported to OpenWrt in commit 61d57a2f88b9 ("mac80211: ath10k
> > add leds support") and broke the 11s support for IPQ4019 and QCA4019 (5GHz)
> > firmware versions 10.4-3.5.3-00053, 10.4-3.5.3-00057, 10.4-3.6-00140:

Just noticed that there was a copy and paste error in my message. The 5GHz was 
an QCA9888 [1,2] and not an QCA4019. Otherwise the _pci error wouldn't have made 
any sense.

And I can only say at the moment (remember that this was observer 14 months 
ago), that it could be reproduced easily on IPQ40xx with an QCA9888 and the 
given config running OpenWrt reboot-9440-g0f89c17b57. The diffconfig (seed) of 
the installation was:

    CONFIG_TARGET_ipq40xx=y
    CONFIG_TARGET_ipq40xx_generic=y
    CONFIG_TARGET_ipq40xx_generic_DEVICE_openmesh_a62=y
    CONFIG_ATH10K_LEDS=y
    CONFIG_PACKAGE_ath10k-firmware-qca4019=y
    # CONFIG_PACKAGE_ath10k-firmware-qca4019-ct is not set
    CONFIG_PACKAGE_ath10k-firmware-qca9888=y
    # CONFIG_PACKAGE_ath10k-firmware-qca9888-ct is not set
    CONFIG_PACKAGE_kmod-ath10k=y
    # CONFIG_PACKAGE_kmod-ath10k-ct is not set
    # CONFIG_PACKAGE_kmod-hwmon-core is not set

And it still can with this OpenWrt version. But it doesn't seem to happen with 
the most recent OpenWrt reboot-13353-gb1604b744b. But there are nearly 4000 
commits inbetween. So no idea what changed (just a timing thing or an actual 
fix - no idea).

Btw. the wireless config was given in the original mail [2,3]

Kind regards,
	Sven

[1] https://openwrt.org/toh/hwdata/open-mesh/open-mesh_a62
[2] https://patchwork.kernel.org/patch/10723033/#22502191
[3] https://patchwork.kernel.org/patch/10327075/#22502179
--nextPart2460714.mtjQ6OgbZm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl7LjkUACgkQXYcKB8Em
e0YH8xAAg6aeHEscaqQ7cvLRA1v9ipqIz4bNIUte+dpOzinFIIAVW5bHwYVF0GZT
L2Ft9lIMLrSLuFZ/PKNlqnS2Ke+ReB2796DYGAY4rw2glSr3A4YH9/IsOwJgXHp3
tvS6sxdWDyBHXiYS+WkviGdwyyZX+GR3qgJLOagO8dbN/vEZARMTPmyKaP3YDOcC
RghlJq+1wJGaKdaOG9BE3s4bh5puSg/czAKtYKPgHXYJBJFWIziLuhUYYSAOhLy6
VbHr6d45nymssAQqtoUK0pnccLUI6V3JXGhmmH/yVs1aayE4txjvMPEj5aP3ZP6d
2WRa+812FKwLnXOpRIfFgpx6WSElAk+QShbAzqwJ9HFn/dYfm2HOjui6oqU8xD04
fHbMF4CA9p4zue4t4ClDYTKURqzutg7wLva/vKVN/ovyu0ZQKM+9o/nJu6wkth9g
hUQllRdH9nWJiJvGlzWzYVxrMmDDa4Gvi3socbZ6zuCbIWLFWNsNsU77WKf7Od+Q
dEPoRFEyyz7yeEQCWl+AMY20PjdGdWWG+JYHx89+/aIDyLhp3K1BHDpSToe86aCG
8PiGV48W6NI79IqEoVeyQtenTAmpj0bizdQw5frylK2XDA7ofnEhU4+W8V8Cv9QF
ARACuJMgtl1FbLS8jWOJP2KAFYOG8upZWbIu3bASQnJ5s9LWvYg=
=B32t
-----END PGP SIGNATURE-----

--nextPart2460714.mtjQ6OgbZm--





--===============8211223660415021630==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8211223660415021630==--
