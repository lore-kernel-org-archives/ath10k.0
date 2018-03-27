Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f0itN-0001qU-0U
 for ath10k@lists.infradead.org; Tue, 27 Mar 2018 07:19:38 +0000
Received: by mail-qt0-x235.google.com with SMTP id w12so14951588qti.4
 for <ath10k@lists.infradead.org>; Tue, 27 Mar 2018 00:19:26 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL.iNet GL-B1300 specific BDFs
Date: Tue, 27 Mar 2018 09:19:19 +0200
Message-ID: <2037513.gUX94vxXhd@bentobox>
In-Reply-To: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
References: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1639130926511559653=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Dongming Han <workspace4hdm@gmail.com>

--===============1639130926511559653==
Content-Type: multipart/signed; boundary="nextPart13124427.648ebSZofq"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart13124427.648ebSZofq
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Dienstag, 27. M=E4rz 2018 14:48:05 CEST Dongming Han wrote:
> I think the ART data is made based on BDF. Maybe the antCtrlCommon logic
> and target power parameter is passed to driver by ART but not BDF?
> That way we're all happier no need to mantain these change. Please advise.

The antCtrlCommon is part of biModalHeader and this one is taken from the B=
DF=20
and not from the pre-cal data (ART). Same is true for the target power limi=
ts.

I am only aware of following things which are taken from the pre-cal data=20
(ART):

* mac
* hal_cal version info
* custData
* regDmn
* txrxMask
* calFreqPier*
* calPierData*
* rxGainCalTbl
* param_for_tuning_caps*

Of course, also the bmi ids are taken from the ART before you load the corr=
ect=20
BDF from the board-2.bin (otherwise, the chip would not know what it actual=
ly=20
is).

Kind regards,
	Sven
--nextPart13124427.648ebSZofq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlq58HcACgkQXYcKB8Em
e0Zc4hAAt1huGy58Zje29Lt+Gseadvycr4Q/z896UE2FZHZ6p8DjmkeaDaWWW23n
iBxLfBW55I1C5Z8yxV2SIBkvSjWH+dxFk0/wbhzW5IZkqe2HH1BWU96r8akJsg7F
3Cs2Alxl+plG2GuRXDpXbz1/mQKPK3RpsY3mAsjBUqIYE4R2OQbk1Z9pRFfB/Lmu
wvffSGv76T1bVPStC4HyKpLNDAnpgPuX/N1eXbU1vGQZW8Sy6DCh2GZxOb6h3pfK
v0HbK+hBbVJ0suQq5qmOtOHGEGmq7M0p9N2IY788q6t1qqAOmJDZpPmp85q8pK0O
k5OlIsxB7FQHFQ+GqETlpmx0CygBb/SSTkbwIk7XkrDmkH1DsujpgK0uVBWZ2J4g
RCIL3NdL72eUZKvGPfs79pFlHLr64IKtiLU8wZSlSNvI2K41wEZhHimjAOZyAORq
76JPnd4A8/KcnFmTZ8gNiK9lo3oo5xWyG6WqHii0Qf2DsPuKjK9jvDw40Rzzh4qN
/y2VrJ29hoVwUGHSVDg+oXsGjlnRTi+E9kEominqR+2sj1xsLVkE+0Lkmh41SBZy
AiscCDzC+b7Jw525xAhF//HPPYfQgTO5EfKvTG/Y1oU+0d9I9tDYPwUdTzjqKHQB
45CeJmJ1yLkiPrieROfEZq6kTiyCobDxdwUQDfe4mPfdaDqBfxA=
=wa30
-----END PGP SIGNATURE-----

--nextPart13124427.648ebSZofq--



--===============1639130926511559653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1639130926511559653==--
