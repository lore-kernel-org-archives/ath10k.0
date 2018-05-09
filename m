Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([79.140.41.39] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGIXR-0002Qb-Ab
 for ath10k@lists.infradead.org; Wed, 09 May 2018 06:25:23 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCH v2] ath10k: support for multicast rate control
Date: Wed, 09 May 2018 08:15:11 +0200
Message-ID: <17746151.BaBsPhhV2q@bentobox>
In-Reply-To: <1525743291-4306-1-git-send-email-pradeepc@codeaurora.org>
References: <1525743291-4306-1-git-send-email-pradeepc@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8724022391164883421=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

--===============8724022391164883421==
Content-Type: multipart/signed; boundary="nextPart3511443.Ictc7ZAxX3"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3511443.Ictc7ZAxX3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 7. Mai 2018 18:34:51 CEST Pradeep Kumar Chitrapu wrote:
> Issues wmi command to firmwre when multicast rate change is received
> with the new BSS_CHANGED_MCAST_RATE flag.
> Also fixes the incorrect fixed_rate setting for CCK rates which got
> introduced with addition of ath10k_rates_rev2 enum.
> 
> Tested on QCA9984 with firmware ver 10.4-3.6-00104
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
> ---
> v2:
>  - fixed the CCK rates setting for mcast_rate and fixed_rate paths.
>  - set broadcast rate along with multicast rate setting.

These things are only modified in ath10k_bss_info_changed and not saved/
restored. What happens when the HW needs to be reset (there are are couple of 
firmware crashes which can be seen in the wild and are handled by ath10k)? I 
would guess that not all of them automatically cause an .bss_info_changed.

Kind regards,
	Sven
--nextPart3511443.Ictc7ZAxX3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlryke8ACgkQXYcKB8Em
e0Z0IBAAwrjyrMgQ8aBMhdW+fhlIbV5/O4HB/n1JXE0mN2mToLYuWOY2mlamo4qn
9cPI+WY/B2jNDXqZ0FPk9pSO+stv8OQ6RX3OADQOC/X+5DLqCcaaHvK/vpTNb71w
vuf6KGzkSp6wu3hZ7oOKwJS/8sUsSzXoRP6bqg+wBBbovOzRc0f5z9W63jqawB5j
4+icWANeJueazBcnS9L6z/jlgogmi6fZ9/j/TJjewIl2NHmch4CYQ/RXiJYnFPL/
05G5p9fJqnJz6+A0ruK3FsENtcVhMhpozOkKqDy4qzCEjcX0G73ODG3EqcJ7Kbml
pN5Xn50xfpDoFZrawIIvxnAzpFvX3FV7wiyP3VQ0bIyzLuQjKLE0srPRe7fCtDgb
p51pRfP44E5cE54IR4fISgLYY00d1FtRZF7bTDJDiakI0aVtgVecugSBC4xKw01o
yVRwI5T+ry7hgRZq1kt6ffAHQgGKvjR+1c0bpyzEqEn2qw5GnKFLI9eV1gI7ALsG
bo4JNV5U4Bsz97NyOV2MWf0N8eaGT2fAcs4R24KiP05LQGu2aDu9bylYbFM+j00E
ihglGbLETBJUVqzkSt4V3MaCi3SlZAa95Wkg7FXufpeOmoldVYpT4PkCrXP4VdZj
b8g7NH47vUgN+yCNrTqPar9qbzpvxRhn0HCN6jq/PLAbf0DcBV8=
=FvG3
-----END PGP SIGNATURE-----

--nextPart3511443.Ictc7ZAxX3--



--===============8724022391164883421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8724022391164883421==--
