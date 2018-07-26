Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fignS-0005Nu-85
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 13:59:15 +0000
Received: by mail-wm0-x243.google.com with SMTP id f21-v6so2080845wmc.5
 for <ath10k@lists.infradead.org>; Thu, 26 Jul 2018 06:59:03 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH] ath10k: Prevent active scans on potential unusable
 channels
Date: Thu, 26 Jul 2018 15:59:00 +0200
Message-ID: <17418645.RrWdIiVe0m@bentobox>
In-Reply-To: <87r2jqt8h7.fsf@kamboji.qca.qualcomm.com>
References: <20180710094448.13201-1-sven.eckelmann@openmesh.com>
 <87r2jqt8h7.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6052432036205718007=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, Simon Wunderlich <simon.wunderlich@openmesh.com>, ath10k@lists.infradead.org

--===============6052432036205718007==
Content-Type: multipart/signed; boundary="nextPart1648784.yBHtZBPXxC"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1648784.yBHtZBPXxC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 26. Juli 2018 16:47:00 CEST Kalle Valo wrote:
[...]
> > Fixes: e8a50f8ba44b ("ath10k: introduce DFS implementation")
> > Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> 
> You didn't CC linux-wireless so I don't see this in patchwork. Can you
> resend, please?

In that case, you should maybe think about stopping the ath10k patchwork: 
https://patchwork.kernel.org/patch/10516691/

Kind regards,
	Sven
--nextPart1648784.yBHtZBPXxC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltZ06QACgkQXYcKB8Em
e0Z3VQ/+L1ZHVmLQNE4V9/cRMXcV2uefVboTwa/H09JGSg3Mrg1o4bNY6729L/90
NN2KhOSc/rmVwRcM3+XyDrZRHIc1jJntyFJsn42En9nw3dF2+QRyblOrsnX0lCMK
fWqZabRFE/Ysq8Mer2oHA+0SUQf22SlR4B7nuASy/LJ8p0LGN+QrxCGoGd6TnyWF
RNNbbyTXb4XWsgWugcOn88TQqIexABNRJ4PI/oBGKtc5g9EpgD0HuVnLEcSAPfBm
aWG3rN0n+8TFPvSuJpvEVD+sglYeqLKWJvVR1LqOP2k3k8ZqB7tBI+/WQl+1NNf8
O1s3UaiUNbAgUrhMaNwjit+P2c53dkAyZ/bHkTZs2aSJXVjsScCiIh56doR8f5lq
fXKu4WLrS2h6snNfgqD3HtEjJOeO504p6fL7IcK+slxhxHWHkUtU1+B6o38sCsha
2H6BB7Q4e87GmJexxtxNbNGCE4a60AiGyI47UfsoAANG5vOfNtQIDkjJAO6AzZgo
f3kfIwz9LZLNLgqiRhMAxujhphXbl/G87IUhhv7aMIan11W60JBjd682kjj8ImQL
AJfIGYLUgHJtFpATNBNwtS9hn96ewMfN3KaSxiiw+4MHPLbPm945SgwratDTWnyK
KXNSk1k20MNzEG3R1+xxsGa0dxuOyX7T500Dd323DBjdblqhiaQ=
=+iuN
-----END PGP SIGNATURE-----

--nextPart1648784.yBHtZBPXxC--



--===============6052432036205718007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6052432036205718007==--
