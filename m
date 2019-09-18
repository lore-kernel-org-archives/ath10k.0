Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAVbT-0005cS-Pf
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 08:46:25 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH] cfg80211: Add cumulative channel survey dump support.
Date: Wed, 18 Sep 2019 10:46:08 +0200
Message-ID: <18458963.ukFM9YuvQx@bentobox>
In-Reply-To: <2083094.mFhUXK7yzB@bentobox>
References: <1526980556-26707-1-git-send-email-vnaralas@codeaurora.org>
 <ebf1c95acb34649b3d2a5435142dc06a@codeaurora.org>
 <2083094.mFhUXK7yzB@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1751419843022066408=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org, sw@simonwunderlich.de
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, slakkavalli@datto.com

--===============1751419843022066408==
Content-Type: multipart/signed; boundary="nextPart3954164.CNjgTPF8Pu"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3954164.CNjgTPF8Pu
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 17 September 2019 19:27:50 CEST Sven Eckelmann wrote:
[...]
> So whatever the firmware does when it gets a 
> WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR -  it is not a CLEAR after read. And they 
> also don't simply wrap around but there all values have to get some kind of 
> "fix" like the active time one shown in ath10k_hw_fill_survey_time.
> Just that the actual "fixes" for them are unknown. To me it looks like
> firmware ATH10K_HW_CC_WRAP_SHIFTED_ALL have busy and rx interlinked with
> the overflow of total. But the tx and rx_bss are actually cleared.
> 
> Other than that, the counters are wrapping every ~14-30 seconds. So we
> also need also some worker for ath10k which every couple of seconds
> requests new values for all the channel from the firmware. Which already
> sounds problematic because I get
> "ath10k_pci 0000:00:00.0: bss channelsurvey timed out" all the time
> when requesting surveys manually.

I've just tested it on 10.4 (wave-2) cards and it seems like it is cleared as 
expected on them. So the change I posted earlier (with a minor fix for 
ath10k_hw_fill_survey_time) returns now useful (accumulated) values. This can 
be seen in 
https://stats.freifunk-vogtland.net/d/ffv_node/nodeinfo?orgId=1&var-node=ac86749f4d60&fullscreen&panelId=5&from=1568782046974&to=1568807068706 
(after the reboot at 10:15 UTC+2)

So as Ben Greear said, the 10.4 firmware version is fixed and 10.2.* (for
the wave-1 cards) is still broken and we need a QCA firmware engineer to
fix it. Or to work around it by polling every couple of seconds and 
manually do the cleanup of the values from the firmware.

Kind regards,
	Sven
--nextPart3954164.CNjgTPF8Pu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2B7tAACgkQXYcKB8Em
e0aTpA/+Mw2cCvo49jZ32Ctihgqw3ZkWKxTaizRZzAKNDnCArDWWs3wER2zw1BPm
2Y4S9Nj0fq4fju1W+JRG/gX9gDFGJEhuCwG695aCofby6a9cXerq/3dzz3ciiJlh
EJnkQOIgf4zHTGDhbzdca+2NxXWvxwXOhWZ+jehFrBux8P6oi/UafWpXVEALTsUV
Byj4lW7/5rmJ99xDGXzeQF1S1MWw4q7clMKYGvlJl6yurbiHQpSqc859dDRsVhDw
00mfmhCu4aEIJl9MlVMWY4HLpmW7S1sl1Y+dFR9ioDLgChWUQzq//EihpWwtYJUD
Sjnvfpa77OZ9HO52bdWH2Epi45YoLdSV3jSoY2OSw0cQmYZMPiPod2C+tctfeg6U
9Ky4MZ0ELXvzmrlYHE3p0QVu1IOQywCIzkjwDjHQuFsOam7KcpL1D2Nt/etnKN0D
O+bVWoe0FEZ1ZDVnyjrX+bYcth7LH42LJrSIbBL+deAdO/6EIxrfTcibk6iYKJhq
0uProQ4J4DtcqBvhI+zw1O1lGViIZ+csmODioRGPvSjMJ2zXwkLJRKZQAqz8i+QJ
QRWFdi0oEsQyCGI4bg0i7p+6VzeFfc2dh6z95HdbfOKDzwaLYjuZkuCJBPVAB0fQ
ql6U6cyZccZARNAVSAhG6/hq8NpWJmMmwB93Vt2NgKNWfmriMgY=
=GhvJ
-----END PGP SIGNATURE-----

--nextPart3954164.CNjgTPF8Pu--





--===============1751419843022066408==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1751419843022066408==--
