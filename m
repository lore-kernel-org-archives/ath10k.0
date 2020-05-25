Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdFbB-0002Vj-OP
 for ath10k@lists.infradead.org; Mon, 25 May 2020 16:05:12 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
Date: Mon, 25 May 2020 18:04:49 +0200
Message-ID: <3445075.COMLMNsY4U@bentobox>
In-Reply-To: <3608947.bSrYYtX6KI@bentobox>
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
 <b23e65cf-4be7-72db-7955-32eae196953e@dd-wrt.com>
 <3608947.bSrYYtX6KI@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3556680905596267618=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, openwrt-devel@lists.openwrt.org, Ansuel Smith <ansuelsmth@gmail.com>, Kalle Valo <kvalo@codeaurora.org>

--===============3556680905596267618==
Content-Type: multipart/signed; boundary="nextPart3096809.FUlXiXFBBX"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3096809.FUlXiXFBBX
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 25 May 2020 11:22:13 CEST Sven Eckelmann wrote:
[...]
> And it still can with this OpenWrt version. But it doesn't seem to happen with 
> the most recent OpenWrt reboot-13353-gb1604b744b. But there are nearly 4000 
> commits inbetween. So no idea what changed (just a timing thing or an actual 
> fix - no idea).

Seems like there is a fix which solves some lost interrupt problems for 
IPQ40xx. Without this change, I see the reported problem. And with the patch, 
it is gone. Or in commits:

* creates timeout problems: 46b949a067e5 ("ipq40xx: enlarge PCIe BAR size")
* works fine: 18e942b6c4e5 ("ipq40xx: fix pcie msi IRQ trigger level")

If you look in the git logs [1], you can see that the working commit is a 
child of the broken one. So at least from my point of view, my initial report 
is no blocker anymore for Sebastian's patch (or Kalle's version of it).

Btw. OpenWrt is automatically assigning a trigger (phy*tpt) for these LEDs.

Kind regards,
	Sven

[1] https://git.openwrt.org/?p=openwrt/openwrt.git;a=log;h=18e942b6c4e51a5a717a121697a63f3f98d93b19
--nextPart3096809.FUlXiXFBBX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl7L7KEACgkQXYcKB8Em
e0YDExAAvLYXS4zpbkE17T7xWf7LcteEbclolX0FYft3zOSe7xE0wjqT2N9n6yhk
F9WF/jJdWnGgxDHOqGUSbK3OYBGTzO5f4ZTRwIa1ag0gQtdqwshPPrkjU3L/0+DN
kCyNZ5qfvgAlwzEo8sfvNiorKi6GexqEDgy5AUDZYVmSIJ3kFtiM4Llovn/ouPj9
AEg/JwopaB/ZkhVTyzTtiRz4dJbMSEcWPn6f47SK2NMY4+GJLkg4bUJdSZ1NVmVT
W0VzRUdX3zYIx+HAdmtoTj2OO4PnWcdi4m94eRVnvjgOwaa2DTPx/Y7wH45zJGnP
IQdXGs8GuDHTKoJWtMGGPqmOt4mqc4amdOZb9Dq63c4IMKDrwwwSsGi8HaQQyjJq
ChI2EmDNuKIZ8mIwLxpTv3hAZaol/iCkvVPaLBVJc8wH9rdHO/O1G5CimoZqGu9d
3umD+laVmJvzZe1FzKLRGfa57w2W9BSnqq3WQM7/UQC03NZeQjuPEV7mY0VxyEQi
GNEsm3zU5IWwsQxSkNbSZC+KypHYhZL/sm/ES7ubhZkkMlJeFnOnFxjgavr1lNmq
GCUOFSeiklgfV3Sf2aPwFdxDRusACEaaVujFu4h6qzI+U5Ob66vsam0q+RW1XIpm
t82QMQhLTDK7zfZr9PQvFaFf4B/9vRpg3jxWmRPjDfwTb7b3Cwk=
=Ahpg
-----END PGP SIGNATURE-----

--nextPart3096809.FUlXiXFBBX--





--===============3556680905596267618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3556680905596267618==--
