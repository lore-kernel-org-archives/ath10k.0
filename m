Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVa2d-0007Zh-IK
 for ath10k@lists.infradead.org; Mon, 23 Jan 2017 08:31:57 +0000
Received: by mail-wm0-f44.google.com with SMTP id c206so141982442wme.0
 for <ath10k@lists.infradead.org>; Mon, 23 Jan 2017 00:31:32 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Mon, 23 Jan 2017 09:30:29 +0100
Message-ID: <1619669.9tDARU0uNP@bentobox>
In-Reply-To: <1591748.RGYhBEn8I1@bentobox>
References: <1591748.RGYhBEn8I1@bentobox>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5002421727054157685=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Christian Lamparter <chunkeey@googlemail.com>, Michal Kazior <michal.kazior@tieto.com>

--===============5002421727054157685==
Content-Type: multipart/signed; boundary="nextPart3634695.5oNXNPy3nW"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3634695.5oNXNPy3nW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 17. Januar 2017 12:54:52 CET Sven Eckelmann wrote:
> Hi,
> 
> I've just	tested LEDE-IPQ40XX [1] after the official open QSDK 1.1.3 [2] was
> not able to boot on an ap.dk01.1-c1-like device. This seemed to work
> exceptionally well (the device basically worked after the first build) but I
> got a little suspicious when looking at the code which it uses for getting the
> wifi devices up and running.
> 
> Spoiler: My actual questions are at the end of the mail.
[...]
> Questions
> =========
> 
> Which therefore brings me back to the initial questions:
> 
>  * Is it known what was modified in the board data and why the board-2.bin
>    from ath10k/QSDK open don't "work"? At least there must be something
>    essential when each vendor ships completely different versions (according
>    to the LEDE-IPQ40xx package [3]).
>  * How were the board-2.bin files from Christian generated
>    (not the tool to generate the TLV sections of board-2.bin. But the input
>     files used for the actual board data sections).
>  * Is the QCA4019 ath10k board data + cal loading order really correct:
>    - load ART data as pre-cal-* to device
>    - execute BMI_PARAM_GET_EEPROM_BOARD_ID
>    - load correct board data from board-2.bin to device
>    - execute bmi_otp_exe_param

*bump*

Kind regards,
	Sven
--nextPart3634695.5oNXNPy3nW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAliFvyUACgkQXYcKB8Em
e0YOPA//QZ1Lb4bDbzF506pfvudARxejPhURq4zDgg/rO5h60+3RF2ERJZ/G7vVI
A9UNsM8btaZz9gATocNiNT5pGA5P2CVvWXS4WIL6CfxpE7zDZKlrXfBDMBFQWTlU
Dl4WPxUfQfnPHGVuX0ml/RIIibqZ3ri+odeO27q68FkHhO39CKhtFZfY3opHzgh3
oLs3CMyKi+de+PMkuu7A3zRwY3LU1Pxq33kxVSbb82vJ6C4WNAJNjlzDvsyEhoC7
P8zGX/cA39eZMYPS1w4AeiaVjX++OwUL4i1+D+40opaRf0wsqIBGVPKAO8PxUpZB
mQrK5UVUGj5QVQqMhgRhLYE2E7NH0ll3NIQGc1fX69zx4iMv5VrTeybY1MyH/AhP
n/dNRro6CmI771rpgeZcttjUzt9qOKAZJI0GR5y/syXnD6BgHzG2TT3fuU3AS+Cq
FiUpKDp6NB6hnQVdCCSxlBRZwLyl1Xg7PCk4J5QQ2C2gwn7c3Jk39JjroZv8P1Ax
9A6g06wrcF5GB5EbvHuscEK/Gcn3mk/Yjgu5trhN/uBihYWZegeYuXBJmGl6Ysky
EO3LhZC1aw52FNFGnQHXoO+6a86lt7cxG/odBCHHos7wyiHaVcfM5JR89us5+nFT
3alBI6mOH02dYN4DuLgoRISTlxevALx0z/j5pfmMNEYhtHd8Sr0=
=OgXp
-----END PGP SIGNATURE-----

--nextPart3634695.5oNXNPy3nW--



--===============5002421727054157685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============5002421727054157685==--
