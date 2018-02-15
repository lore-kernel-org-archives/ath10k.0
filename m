Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1emKqa-0004ve-SO
 for ath10k@lists.infradead.org; Thu, 15 Feb 2018 14:49:18 +0000
Received: by mail-qt0-x244.google.com with SMTP id d8so12174860qtm.0
 for <ath10k@lists.infradead.org>; Thu, 15 Feb 2018 06:49:03 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH 1/1] ath10k: add LED and GPIO controlling support for
 various chipsets
Date: Thu, 15 Feb 2018 15:48:58 +0100
Message-ID: <189869316.iC7P1rB6Jj@bentobox>
In-Reply-To: <ea35ce69-a016-2475-6c17-eba396827147@dd-wrt.com>
References: <1518684977-14607-1-git-send-email-govinds@codeaurora.org>
 <ea35ce69-a016-2475-6c17-eba396827147@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2838164537233193876=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Cc: Sebastian Gottschall <s.gottschall@dd-wrt.com>

--===============2838164537233193876==
Content-Type: multipart/signed; boundary="nextPart2077822.vL5tvGmtBe"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2077822.vL5tvGmtBe
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 15. Februar 2018 15:31:04 CET Sebastian Gottschall wrote:
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 and 
> ipq4019 based chipsets with on chipset connected led's
> using WMI Firmware API.
> The LED device will get available named as "ath10k-phyX" at sysfs and 
> can be controlled with various triggers.
> adds also debugfs interface for gpio control.
> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> 
>   drivers/net/wireless/ath/ath10k/core.c    | 168 
> +++++++++++++++++++++++++++++-
>   drivers/net/wireless/ath/ath10k/core.h    |  15 +++
>   drivers/net/wireless/ath/ath10k/debug.c   | 140 +++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath10k/hw.h      |   1 +
>   drivers/net/wireless/ath/ath10k/wmi-ops.h |  36 ++++++-
>   drivers/net/wireless/ath/ath10k/wmi.c     |  43 ++++++++
>   drivers/net/wireless/ath/ath10k/wmi.h     |  36 +++++++
>   7 files changed, 436 insertions(+), 3 deletions(-)

Looks like your mail program has eaten the patch [1]. It is also not clear why 
it was posted as reply to the "dt: bindings: add bindings for wcn3990 wifi 
block" patch. :)

Kind regards,
	Sven

[1] https://www.kernel.org/doc/html/v4.15/process/email-clients.html

--nextPart2077822.vL5tvGmtBe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlqFndsACgkQXYcKB8Em
e0Ya2xAAg3lTZtlofKBD56cgDJR4aCXa2+zeFZb0NVpVswJqgKvHOeM6Rvn56JIN
Usyft2WyeDjO1x+plAqmD8EZhcE7cK7vp1nHvPcf7UshaBxNRCLCKgq9OLbwaG68
+xFEO3ntT0484Y6B3iORCi5HTID4e5/1D35i2yf1G+hMYM7DVzDhmX4PxkfvSHz6
8y7jYxI242Vukl/t9QjaTzgsoDgMqkWvLZVAFDDhJm2PX5njLbtt/gu9+5yBd0Hl
/nLOCxXp9bSvNfM/4DRNGekI9Wsl7CU6A1QlTpMzUbkIVk3RWkqmXyBrse67eVNU
qk2EmbPg4rKS4KGLSd7Cw3mzUlTtjpuWrFjrV+zkKzyRUtxw3U8815vQ9CWQBlqF
kwvSZCpO41Oh8eWlsPfXYPGCTmwIlUB7HQ8I7shLtnF8tgEYo4p5Ci/uVS1nRUZ3
9XMikjfm40JTqQy0wNQ+a/ZAWMDfF/+mojHZpUKVz9JZDREpTSqkoH0iFhBPf/Ud
fRs8UJ5Qd3D9qV3mkNXoYfMIc1YNuPnFJklwAEcAldR+K2Eyt3/Xb645Je8zBF0e
PewvJXW54Ipy8fwc56yYtFEoAsEDJX26SI/Vt5a+MPNEWcoSBUx5agBjOp5CJCP0
MVKL3ys1GDu1ROplSPWlysZwDlNsCQpR+NEmcahwN3DjOgH3dgE=
=M8uX
-----END PGP SIGNATURE-----

--nextPart2077822.vL5tvGmtBe--



--===============2838164537233193876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2838164537233193876==--
