Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b7L7r-0000D9-Hn
 for ath10k@lists.infradead.org; Mon, 30 May 2016 11:12:52 +0000
Received: by mail-wm0-x233.google.com with SMTP id s131so15417172wme.0
 for <ath10k@lists.infradead.org>; Mon, 30 May 2016 04:12:30 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: Re: [PATCH 0/2] ath10k: Add support for QCA9887
Date: Mon, 30 May 2016 13:12:27 +0200
Message-ID: <2262792.6VVL0Htyzj@bentobox>
In-Reply-To: <87wpmf4qm5.fsf@kamboji.qca.qualcomm.com>
References: <1568876.Six5hABE57@bentobox> <1505571.v1gM3hzMhG@bentobox>
 <87wpmf4qm5.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7341081721146294455=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============7341081721146294455==
Content-Type: multipart/signed; boundary="nextPart1861235.2O6iHXHWdx"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1861235.2O6iHXHWdx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 27 May 2016 12:44:52 Valo, Kalle wrote:
[...]
> > But maybe I should add that the results with the original AP147 firmware also
> > wasn't better.
> 
> That doesn't sound good. Maybe a calibration issue?

Maybe but I don't have a different card to compare it to.

[...]
> I pushed a new firmware image firmware-5.bin_10.2.3.31.7-2 with those
> enabled:
> 
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA9887

Thanks for the updated firmware file. I have done some basic tests and seems
to work fine. Bindiff also looks fine

Kind regards,
	Sven
--nextPart1861235.2O6iHXHWdx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXTCAbAAoJEF2HCgfBJntGa2cQAIo6Tri8GRwsBJY4wBNuFFdC
0q4Fi28nxINMPJpTnJ7m3d7YyOmfPlyQ84L+taj3Gf56HQu8NnvFRFPSYKWrOuJ6
DTeu0YH8OeZBOIDLrDJFT1jaMOZJ0RYdJ3NCrJeLfNDf9duFravc8xwqsZWWmA3B
Qp8lEDFCt9ObGq7fVAhUdioJ+g7zoVX7RJ/s4F69A+t61pqC4ok/tEhUnxhgNxVz
oUj5j+ml9QMXe3sbrpnnoyJC/0vqEG8uoEZjrwpLxHrsZk5S4V/AxD6VAUhvEgLh
bRiR0Kq07LDOtzwlphAjVALlpHve3kYigLSj8WZEAGKfIpG4XuaNT0MjQcFWN9DL
1uEiAlK3BEB5+VJPaeOiZ3wEpUOR22brg4HlKFETv3982PGegn7JdliEK1pUFFii
rmvCe+Sj0+THz9Dm78WBst5Rs2/8F52zY4aGS06Uy2gpLmBhWFKdKBBsKg2yUFXD
8BI4wmonQn/Gt48bwK4FtcKpCQkvP7SCYsPWEVcpocEjaxRL85ZvrNSN4MexLMQx
mtliLiyNPCtfDRR3zRhZCSMFarwQiPpAKw7cYaNALblQwim7dZRVeevwB7YUcrWF
oJTJ16sYpHqRbfK+7UexcygXCArfyl9pE9lqALcY5ZVHgo8728Rtd9NVOjb4KYTx
cg5sRXRj7NU/HVlH+I3e
=BUQl
-----END PGP SIGNATURE-----

--nextPart1861235.2O6iHXHWdx--



--===============7341081721146294455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7341081721146294455==--
