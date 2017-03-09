Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1clxao-0005kZ-Rm
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 12:54:56 +0000
Received: by mail-wm0-x235.google.com with SMTP id t189so55212998wmt.1
 for <ath10k@lists.infradead.org>; Thu, 09 Mar 2017 04:54:34 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Thu, 09 Mar 2017 13:54:30 +0100
Message-ID: <1647418.NlD0ilV4fH@bentobox>
In-Reply-To: <2093425.PaQnjOtWUV@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
 <87shmm4qk9.fsf@kamboji.qca.qualcomm.com> <2093425.PaQnjOtWUV@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2911930605549535318=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "simon.wunderlich@openmesh.com" <simon.wunderlich@openmesh.com>

--===============2911930605549535318==
Content-Type: multipart/signed; boundary="nextPart6561797.rgSCLr9Vuy"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6561797.rgSCLr9Vuy
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Donnerstag, 9. M=E4rz 2017 13:46:00 CET Sven Eckelmann wrote:
> The board-2.bin would then require entries for bus=3Dahb,bmi-chip-id=3D0,=
bmi-
> board-id=3D16,variant=3DRT-AC58U and bus=3Dahb,bmi-chip-id=3D0,bmi-board-
> id=3D17,variant=3DRT-AC58U.

Small remark: I know the SMBIOS format would be "BDF_<Customer ID>_<Extensi=
on>
\0" and the variant string would usually end up as something like=20
"variant=3DDE_1AB". But we usually don't seem to have the customer ids +=20
extension(?) for these boards.

Kind regards,
	Sven
--nextPart6561797.rgSCLr9Vuy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljBUIYACgkQXYcKB8Em
e0buew//Xp+onj6djpt7RPdAOcIUNaU5BwHhdZqKPA5DHHXhK/YmNHttiyxUFJVy
c6pdYrsgOquN/P1qW0E486rJbh/Dbhlw420CVTTuprf2FUF7M5gwnLsCMa14z9Bj
tubFdtTFqUsBqL6Ks6mkl9YWRqTbXPseoAJXLRFa2o/6TDuvknvT2MBtnSBu5xh7
PzJkFNp6yJ9+DK99pq8k5wlVu7Y+fpO1TSh78BQ8y/fYNZHw31Cuhg3rzup9TCyB
WkuB0rXzoZm0XxCXKCiKJAiwZMUInKa3Y4AjvmQ7M0aq9875WGK5Q05huFeQDbs7
MPj3YQ+th7QhEfF+689xTr7JUSpJEEFzes+rfj+H/nTdCZKvfyeN0BZGnnCwC2P7
5Oi1IZh9eXfk4rJgyYpMXeHBpPFbQuIZAeidcMDofgBrgE1nP1YLBeQz884KnQyi
62cE8TGpyGHCWIj1LdEwME2zjNP4zMk1zQ3LooW0slq8bp3BRwZwDuVabbPh5dHn
e60erVRgUE8uV7ht1BaeWZGqE7GNOJGh5ZWQxR+Esvvr8FT+ndFUBeoeibuaEuRr
HafwhPuMoKvzWx+0dbD7A1C9B0khXSfhKlj8AImpDM718jZyxUS/D/178N9CmPAK
oTw5W1clAHhDVAAVwbqPEGUsuEtD76LjgfprdOauA9ZxsG+T9N8=
=D+9i
-----END PGP SIGNATURE-----

--nextPart6561797.rgSCLr9Vuy--



--===============2911930605549535318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2911930605549535318==--
