Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyY2T-0007sv-6T
 for ath10k@lists.infradead.org; Wed, 21 Mar 2018 07:20:03 +0000
Received: by mail-wr0-x22e.google.com with SMTP id 80so2993437wrb.2
 for <ath10k@lists.infradead.org>; Wed, 21 Mar 2018 00:19:49 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: Spectral Scan - Received power computation
Date: Wed, 21 Mar 2018 08:19:46 +0100
Message-ID: <9595518.JBY7pXbR5H@bentobox>
In-Reply-To: <CAD-aHNOV1D_npuP_gzQoFYR+5E9fnnbfERTonoiBV74_QfGOeg@mail.gmail.com>
References: <CAD-aHNOV1D_npuP_gzQoFYR+5E9fnnbfERTonoiBV74_QfGOeg@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3572477750222483263=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: sandip sitapara <s13884neo@gmail.com>

--===============3572477750222483263==
Content-Type: multipart/signed; boundary="nextPart2582941.gmMSmIMiZu"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2582941.gmMSmIMiZu
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Dienstag, 20. M=E4rz 2018 21:02:18 CET sandip sitapara wrote:
> I have been trying to calculate power computation from the spectral scan =
data.
[...]
> So is there any way to calculate the power computation for ath10k samples?

Have a look at=20
https://github.com/simonwunderlich/FFT_eval/blob/3cc175570379da172b0b2bcdbb=
8d2a42f83dad88/fft_eval.c#L505=20
together with=20
https://github.com/simonwunderlich/FFT_eval/blob/3cc175570379da172b0b2bcdbb=
8d2a42f83dad88/fft_eval.c#L337

Kind regards,
	Sven
--nextPart2582941.gmMSmIMiZu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlqyB5IACgkQXYcKB8Em
e0bmMRAAviKl9kZmLB0DkIasQQl4xqO0zhVm5AC604xOm8s3uapKh5FuHXtntRaO
4y+4ZwTEBxD7vhHlSjpBvkhAza2+sLaC46mMvR3UlGVIyCVZdeH1uTQ3lrMD4UsL
7hU7GcEEz3gycUFXYwhPesou8jm+QhdPwkt3VCa6VNaRGxwParwXPO7l7Kl5ZwEL
VBI8ODgmGVm+DctnZVtaeFovmYIWcx23ViZDwPMAtJebh4VtZw2hbh/7Yh0BV2D4
Tja9CtPfc+isZ4fUHTllE9qIBrwLwbAam35f2kOxeEG2nWYO3yxjmr0Y16ab2Yrp
4He/LwiR7/EFpAh3teXH+2GyMwjnkwBXo/4dqfTNx/FU8hPLXNpdlMtsfB60zhqG
u4PoiUItVDVjO5hBxpI6z65moobzYm7Xt6rRXcnNufzpUR6gbjUD+DbpeEUNTU/Q
w+8w9epkYqLxUz43W2YPy45a2mfBsYe5zJyQTiy/c7eAStYxhWWWgqlvJ9TSSAjs
s7rY8UHYwNx68TWXZ4x2vh20erPyM+k7KyN0WSR+hGxmXOZXilLLmBkFgYqSoEON
7uixnjyHg5sna/uwA4baqLy7op8GFiN7CzBH+2SiczrRCGzN8jIvF1gzJU+6pC7+
712ICnW+LPqGOywKSFddR+ioluioivhSqlkvgm5DdTqZZdSeKK0=
=2VU1
-----END PGP SIGNATURE-----

--nextPart2582941.gmMSmIMiZu--



--===============3572477750222483263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3572477750222483263==--
