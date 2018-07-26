Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fihLD-0003os-4f
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 14:34:08 +0000
Received: by mail-wr1-x443.google.com with SMTP id q10-v6so1950691wrd.4
 for <ath10k@lists.infradead.org>; Thu, 26 Jul 2018 07:33:56 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH] ath10k: Prevent active scans on potential unusable
 channels
Date: Thu, 26 Jul 2018 16:33:53 +0200
Message-ID: <1871626.GMOhCLPeXl@bentobox>
In-Reply-To: <87muuet6u0.fsf@kamboji.qca.qualcomm.com>
References: <20180710094448.13201-1-sven.eckelmann@openmesh.com>
 <17418645.RrWdIiVe0m@bentobox> <87muuet6u0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5267367931144512666=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Simon Wunderlich <simon.wunderlich@openmesh.com>, ath10k@lists.infradead.org

--===============5267367931144512666==
Content-Type: multipart/signed; boundary="nextPart2090615.9ffy5U2N1s"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2090615.9ffy5U2N1s
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 26. Juli 2018 17:22:31 CEST Kalle Valo wrote:
> Sven Eckelmann <sven.eckelmann@openmesh.com> writes:
> 
> > On Donnerstag, 26. Juli 2018 16:47:00 CEST Kalle Valo wrote:
> > [...]
> >> > Fixes: e8a50f8ba44b ("ath10k: introduce DFS implementation")
> >> > Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> >> 
> >> You didn't CC linux-wireless so I don't see this in patchwork. Can you
> >> resend, please?
> >
> > In that case, you should maybe think about stopping the ath10k patchwork: 
> > https://patchwork.kernel.org/patch/10516691/
> 
> Sure, but how to do that? I can't find any functionality from the UI.
> And I don't want to fully delete it as lots of old emails refer to it.

Yes, this is a problem.

Kind regards,
	Sven
--nextPart2090615.9ffy5U2N1s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAltZ29EACgkQXYcKB8Em
e0bXoBAAswcCc2guMLryE4LeHyZ7eN+ZJofuiOoaDOzJxwOsj3zV/YAhmcjjJ4+3
PU0ehUvnQ8KF+pGaLK2WDkGyR7byNRqgnFhk/BhsnOwB4NKMdOlqladbM18Ttc94
a8n/nOpCgknngEGOvAEERG0Nq8wW+Cb99uIigi+pdJUrNwUlyiKrxTICw+KGxKU+
T6yvEc0+3d7rFYMaAjDS03YOyWe9Iz1HJqoNxReG8CL3Lz/auNtpWn1UGyT22MGW
40ZKha6XQB9rax0rzH5k8gidiEjbZi60P3Zlk0LO3taQH3whCtykPpVm5ws+obKS
PJbhvLkWfFUDINNaeuv5z8EmdLqLZJP02Makd4SNXv6mESHfqtUnFFh6fPYPc78t
E2kqzBdfEHZwg8Js7s65hVKFl3QZmuqzxu9zngjS+3lXuETEfxis3sHfAYXDLt39
DSkkc67y1lis/td8butBCaB4lkVej2qBz3hWRJC5yYWWWaXEJiTlfNSKhTAHle1E
hdvufFEcCoZn8JY2ni3qGmpFbuBQzJTWLxMq6e9P3Pk4aNRflDZBmzSWaeHEu5FS
UTSAtNiUevqBvnLMxS1w15PmiHET+hWRtV3qCzIZC7G/hgHzpMheDMt+RNmUEoXb
cCnaLGUhAHQ0+51JvD565y5M4VZLqyummDGR88kWOMt190/gCCM=
=b49Q
-----END PGP SIGNATURE-----

--nextPart2090615.9ffy5U2N1s--



--===============5267367931144512666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5267367931144512666==--
