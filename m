Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9rUY-0003I1-N7
 for ath10k@lists.infradead.org; Mon, 06 Jun 2016 10:10:43 +0000
Received: by mail-wm0-x232.google.com with SMTP id k204so19923262wmk.0
 for <ath10k@lists.infradead.org>; Mon, 06 Jun 2016 03:10:20 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Subject: Re: [PATCH 2/2] ath10k: Add board data download from target
Date: Mon, 06 Jun 2016 12:10:17 +0200
Message-ID: <3343488.td5VS5T2AQ@bentobox>
In-Reply-To: <87porxt78w.fsf@kamboji.qca.qualcomm.com>
References: <1568876.Six5hABE57@bentobox>
 <1463755272-12912-2-git-send-email-sven.eckelmann@open-mesh.com>
 <87porxt78w.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8160014861777481089=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============8160014861777481089==
Content-Type: multipart/signed; boundary="nextPart2361524.rvb1iTLHtp"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2361524.rvb1iTLHtp
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 04 June 2016 13:26:39 you wrote:
[...]
> Looking at this again I noticed that we issue this warning even if
> EEPROM is not supported, which I think is wrong. I fixed this in the
> pending branch, the diff is below.
> 
> I also renamed target_board_data to cal_eeprom because, at least to my
> understanding, the eeprom actually contains the real calibration data,
> not the board data file.
> 
> Please review so that I didn't break anything.

Thanks for the changes. Looks good to me.

Kind regards,
	Sven
--nextPart2361524.rvb1iTLHtp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXVUwJAAoJEF2HCgfBJntGSygP/R1wwTnPf9TzX0Xf6X3X04Sv
xfRCfNwwyMZUV9ahGW8EN1QtcahUJhr2NGfrwsJ6XcEK+AMcoxq3HsUlPfZ4xQrN
+yy5R1SXXUINtKgJjh3yuGBmQ+IbXc2TjzAn/R6nB7yDCaMM2A9lmUQkgvHRZrwK
0SnaxM1j6F793WJ3qZ/+Xcq7gbjK0mENwzOtL+47X15gvYU5XEuC+TbI9RiMuD8t
5DSqdUjOUHXU3vM2h8WK7m4z6kSIjKD1tx1YL5MJLNnmPUkpbjA5DA103fVc433G
G0s3CjeQzRSMvi3hQI3JkaxH48n28B1V2IFhdPw3hTKczwBzSOYX6i8bxdva2gT+
wz0Kk+jH5jBQQQoUgbzaBsfaE8POd3LF9W1q0TJi8PgphtR+HyogsmkvxdU78WjQ
5uuCifta2QEOEO/PvLXiUAUpk2fEL8ziDwG5XUs8LxrgpkE79tLfBpvQyoudg9GR
yfektx72fbntw4S9iRyXRjEORNiW6/2DA4cps9eVPO1Ts+lA/Xpph7TqVbErRjbs
wtuwKAvuEtPFDnniZ+M38sJ7cxxnogGcMwG84ZynUoQixX98dQn7BAc6udqpLUGO
Y1h1mDZJili1Mn7u2PBqBUWMzVwiGkIBKCICxi2m1jVZ/MkkjDafm3H4DqbrFhaY
gREg9y4rrPZB3YFlK8dB
=0vYh
-----END PGP SIGNATURE-----

--nextPart2361524.rvb1iTLHtp--



--===============8160014861777481089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8160014861777481089==--
