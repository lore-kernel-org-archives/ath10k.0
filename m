Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clBpO-0005FE-R5
 for ath10k@lists.infradead.org; Tue, 07 Mar 2017 09:54:48 +0000
Received: by mail-wm0-x232.google.com with SMTP id v186so84965032wmd.0
 for <ath10k@lists.infradead.org>; Tue, 07 Mar 2017 01:54:25 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Tue, 07 Mar 2017 10:54:19 +0100
Message-ID: <30387745.tG59X1cezt@bentobox>
In-Reply-To: <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
References: <1591748.RGYhBEn8I1@bentobox>
 <CAJ-Vmom3g+cbNG7hXjUB=Rnh9S_rHmr7hS2Z6H+m=LQCfezBAg@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1525094093382085482=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Adrian Chadd <adrian@freebsd.org>
Cc: Christian Lamparter <chunkeey@googlemail.com>, simon.wunderlich@openmesh.com, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============1525094093382085482==
Content-Type: multipart/signed; boundary="nextPart1638562.zoNo2GFmKA"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1638562.zoNo2GFmKA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Adrian,

On Montag, 30. Januar 2017 08:36:19 CET Adrian Chadd wrote:
> If people aren't using unique BMI IDs (which is another question we
> have for QCA) then it's possible you don't have enough information to
> "know" which board data to use, so it has to be overridden by a custom
> package. We do this at work for our own boards as well - they're
> sufficiently different to a reference board that indeed we need to
> "know".

Did you get any feedback from QCA? Our requests regarding registration of two 
own bmi-board-ids for our product were always answered (slightly simplified) 
with "don't change the BDF files", "always use board-2.bin from driver/
firmware" and "ask your ODM". This basically didn't help us and didn't answer 
the question and creates quite a big problem for us because the ODM insists 
that we should use his BDF [1] files with modifications [tm]. We just found 
out that the ODM used a modified version of the DK04.1 BDF files but used the 
bmi-board-id's for the AP-DK01.1-C1 - so we still have a long road ahead.

We are still trying to get more information. But I though that I could ask you 
in the meantime whether you had more success and have a status update.

Kind regards,
	Sven

[1] According to QCA, the BDF files are just the single board files inside
    the board-2.bin
--nextPart1638562.zoNo2GFmKA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAli+g0sACgkQXYcKB8Em
e0aKtw/+P17/3IVMWCUx9edX8+6UGIjZPSLgiFRCtN5NzgWH7BChjDa+sE7jVHhA
jq1xPcHIN8wfDS5FMn1UaIZiQPr7CCUzrny27TD2f+mY4mfuSpJomHjObOf0UbEA
CD6LY0uHzmalQH4cJEQv70p3FeGqjR2+QqbmqCYleCVk+hLvXiZYMhvo9cHwOcHt
Ac8fq7wDrGf4nt415w+uFfp0lmsdkEzY/Dd4SWcUsiYYgI4YOXxdQLqPXKz4gkxt
wIJh3OmN+rka4EXTXEuiepE5tfmboj6Lm8VtA2t7r4mOtg14d4cEsY545C70HDSn
2XYpcuIwCvf7ZkOUQVEJ8EPe2Rp65zZF6zMELvBkAX9lNwC7NNn4kabMOjKpX9VJ
J70ZQi1+seC/QoERhpoiCEv3m1K9ENjn4Ctk8+BUhvdRiFuWxzquQCHWUFs8qaIf
O8geMIDv/atJP/5+QV45XUcHy+DMTpXRoFimWncwnFZ99Cj4Y3rwHmdyvsMPu9y3
Wv9mO6fJ/ezESA4OHp/Dx4HIbP5KYK4qnpYFW7M/G+wrCd+m+ujvDKdwrHM2cNtz
2c2E5q4SHUGS+ATbbVo8sASarQA6TmtuzuedRUMqJG2+d4oWeSUS6Khtgdx464Nn
ubI7C+7UygM0hTISo0RW/rb6O2m5897WkljHBMIiev2V2xEsRZ8=
=iUvy
-----END PGP SIGNATURE-----

--nextPart1638562.zoNo2GFmKA--



--===============1525094093382085482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1525094093382085482==--
