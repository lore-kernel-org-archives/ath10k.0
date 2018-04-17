Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8KBF-0007av-J8
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 06:33:31 +0000
Received: by mail-wr0-x22b.google.com with SMTP id z73so32107136wrb.0
 for <ath10k@lists.infradead.org>; Mon, 16 Apr 2018 23:33:19 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH] ath10k:add support for multicast rate control
Date: Tue, 17 Apr 2018 08:33:12 +0200
Message-ID: <8422067.oV49EfR4qE@bentobox>
In-Reply-To: <fe1af65b1042bc3c2b551dcbe7d53f3c@codeaurora.org>
References: <fe1af65b1042bc3c2b551dcbe7d53f3c@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6928806707037224415=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: pradeepc@codeaurora.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

--===============6928806707037224415==
Content-Type: multipart/signed; boundary="nextPart4779734.HQabqmaVvQ"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4779734.HQabqmaVvQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Montag, 16. April 2018 22:10:50 CEST pradeepc@codeaurora.org wrote:
[...]
> > I see two major problems here without checking the actual 
> > implementation
> > details:
> > 
> > * hw_value is incorrect for a couple of devices. Some devices use a 
> > different
> >   mapping when they receive rates inforamtion (hw_value) then the ones 
> > you use
> >   for the mcast/bcast/beacon rate setting. I've handled in my POC patch 
> > like
[...]
> Isn't this already fixed in https://patchwork.kernel.org/patch/9150145/ 
> ?

No, this is exactly the patch which causes the problem for you. The parameter 
for these settings stayed the same but this patch changes the order in 
ieee80211_rate to make it easier for the driver to parse the (reordered) rx 
status information for CCK rates (maybe also tx - not sure about that right 
now).

> > * bcast + mcast (+ mgmt) have to be set separately
> 
> Can you please let me know why this would be necessary?
> Although I see minstrel rate control is currently seems using the 
> mcast_rate
> setting to set MGMT/BCAST/MCAST rates, will this not be misleading to 
> user
> passed value with 'iw set mcast_rate' for MGMT traffic as well?

What about broadcast? MGMT was only mentioned here because it is the third 
item which can be manipulated the same way. But yes, it would be good to get 
the mgmt rates in sync with the non-hw-rate-control drivers.

Kind regards,
	Sven
--nextPart4779734.HQabqmaVvQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlrVlSgACgkQXYcKB8Em
e0YLWBAAmfnmrJgumArkUs0UCtPepXD7kU8lvjkyKxCFWPduV7h2RnGlg7ewQB8l
x64Q622sOMj5q3AEEQ92aMpBygiD7WmqOKdc8vT2ppEKqAUELzXmWu/SzgtZkzDU
rxfi2rrPu1WxH/gyg4Gf8NvFf/w4585SMNwA0U/PLQsgSqqA6H2a45ZAWdGp9ZXe
Ttq2dVklkWzlyVDqYaRcACsM0Jl1ZiQpg7xIgeN2L6cTBkW0+LjlB1cDf0LBEJLY
CLPSR3Eddgdt4aoZ3QMly7VAXN5Nevc3EFKtiGPqG3k/EXYgk+UdZyPrDl+bDGJX
nvhvKWChyld/WaKioBaQ/MDjxwfXDElG3wMszCFB/HdbdR4D12ggAWI1M/kkBvXU
eYJLP3bn/BfKjm6xSzOy3wu5l5kZigWzehkIQKPGS9g+0yg/0UmDPfr4F8U+ZaAb
V84L4G6dVIYEU1Bf7Z0jEieIwl9dxeOZYdyHiruwlydqsf6UY8PLHUsXLt3RHgVn
1rsyVXBdqtS3dgqfPUon2FSzgVrdvTNErbKnJ1ypoISNrqkp1i454j8dweZzzIZl
t3bMsQIu464DOk8onxE7zlevkQpHfQwBWYiEe94XLCa5FNynL4fjP6NIihby4oay
rEqjbam4YeqzOnf1IDFfOA870zY4QbMWH0MbjjN2pBkMtL6C9z8=
=2FLg
-----END PGP SIGNATURE-----

--nextPart4779734.HQabqmaVvQ--



--===============6928806707037224415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6928806707037224415==--
