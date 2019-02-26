Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([2001:4d88:2000:7::2] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gyYxb-0006nT-US
 for ath10k@lists.infradead.org; Tue, 26 Feb 2019 09:23:37 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] ath10k: fix incorrect multicast/broadcast rate setting
Date: Tue, 26 Feb 2019 10:23:30 +0100
Message-ID: <3062143.B1lnfLpWcE@bentobox>
In-Reply-To: <2172036.sbaLp6LFFn@bentobox>
References: <1544504171-19810-1-git-send-email-pradeepc@codeaurora.org>
 <2172036.sbaLp6LFFn@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6605506175473657364=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>, Ansuel Smith <ansuelsmth@gmail.com>
Cc: Steve deRosier <derosier@cal-sierra.com>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Zhi Chen <zhichen@codeaurora.org>, John Crispin <john@phrozen.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>

--===============6605506175473657364==
Content-Type: multipart/signed; boundary="nextPart2093160.Su1pxlAiQj"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2093160.Su1pxlAiQj
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 25 February 2019 21:00:38 CET Sven Eckelmann wrote:
[...]
> Tested-by: Sven Eckelmann <sven@narfation.org>
> 
> Was tested on QCA988X with 10.2.4-1.0-00041

I just wanted to test it with 802.11s setup on IPQ4019 with 10.4-3.5.3-00057 
and QCA9888 with 10.4-3.5.3-00053 (ath10k-firmware) and 10.4-3.6-00140
(linux-firmware 2018-12-16-211de167) for both. But it looks like the firmware 
always crashes with and without this patch and 11s.

    [  221.620803] ath10k_pci 0000:01:00.0: wmi command 36967 timeout, restarting hardware
    [  221.744056] ieee80211 phy0: Hardware restart was requested
    [  225.130829] ath10k_pci 0000:01:00.0: failed to receive control response completion, polling..
    [  226.170824] ath10k_pci 0000:01:00.0: Service connect timeout
    [  226.170871] ath10k_pci 0000:01:00.0: failed to connect htt (-110)
    [  226.252248] ath10k_pci 0000:01:00.0: Could not init core: -110

If i count correctly, this is WMI_10_4_GPIO_CONFIG_CMDID. Not really supported 
by upstream but it looks like there is an Openwrt private patch (not yet
accepted upstream [1])

  package/kernel/mac80211/patches/ath/974-ath10k_add-LED-and-GPIO-controlling-support-for-various-chipsets.patch 

which I have now removed to fix this problem for me.

The tests with 10.4-3.6-00140 and 10.4-3.5.3-* worked fine without this patch.

@Kalle are you expecting that he resents the patch again or can you just 
append this information to the commit message? At least it looks at the moment 
like there will be no new patch in the near future. But the 
commit cd93b83ad92 ("ath10k: support for multicast rate control") is breaking 
real world setups.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/patch/10327075/
--nextPart2093160.Su1pxlAiQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlx1BZIACgkQXYcKB8Em
e0YvKhAAnyguDTsGDYi5g7x5U4XjIbo0doEW7Gqmb4KvMTsUvdSMjhCh9ckvGdkp
1j6js0WN+f1lZ8Ob6qMEtySjABZ7r9KZs0QlWC1QUoZtesO4aJpzBbRK8vQwi1aw
ytzu2lP/NvHsMIY7VT4xX/6THGeV/yNZmudT4dj3KvzM4vnSrtoeR7FD/jv+AmxG
GWtNjgsNZfApqTrRef5j9F8Nl118GMVwpqpluAQL8w0f6h/mQA+6ZdyNAKJlWt/p
3ZMRV/1d8KUpwIb8QhNCsGnV7oAh+xJQhat6UqMa7Wsiz/ahVHlvweYUIc0Rm43u
By5aYj6Bi0amJLkAZpHI8xyyhQK5UVFv6pwJi4PEs4pY7dUfnAjXGY9SeqMqmPWH
WNGhQRJn/E+M1Y9NAYzaNyrsFMgWtb7D7QiI7F2te+DZnoXjjRD2nLzX9UcEWNpO
Yp2BuddecxVij8lId0tN7qDUua4CrAEJrRdUH7iDGkR+fIPqQ9ftS+jqESOSpB9T
p2VLoRiqiIs7eSiW5qZvx93xKFtkaK9E10vAkd/oV2KE1ds/Ct0Dn4uyfxN3Bu+1
ThieigxlY4Af317nXwAat8X01SUSHWf1iGWB8XA2q4Yvklpx3V4CdVCgWwzZcsix
Cn/4fanEatPLvTI8Ef8Vz526puDSLsntmb9YTtkBNvBevQtiVI4=
=1miS
-----END PGP SIGNATURE-----

--nextPart2093160.Su1pxlAiQj--





--===============6605506175473657364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6605506175473657364==--
