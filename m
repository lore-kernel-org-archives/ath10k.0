Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dMr7l-0003J7-Iq
 for ath10k@lists.infradead.org; Mon, 19 Jun 2017 07:29:47 +0000
Received: by mail-wr0-x229.google.com with SMTP id 77so66506870wrb.1
 for <ath10k@lists.infradead.org>; Mon, 19 Jun 2017 00:29:04 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH v2 2/3] ath10k: Configure rxnss_override for 10.4 firmware.
Date: Mon, 19 Jun 2017 09:28:57 +0200
Message-ID: <1562286.k58vxRCSiz@bentobox>
In-Reply-To: <87o9toz58b.fsf@kamboji.qca.qualcomm.com>
References: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
 <20170609110750.14950-2-sven.eckelmann@openmesh.com>
 <87o9toz58b.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4527356311550130450=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

--===============4527356311550130450==
Content-Type: multipart/signed; boundary="nextPart1802327.RhgNRe3UZU"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1802327.RhgNRe3UZU
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 16. Juni 2017 08:50:13 CEST Kalle Valo wrote:
> We have hw_params for stuff like this so I changed this and the
> following patch to use that. Please review:

Looks good. Thanks for adjusting the patches.

Kind regards,
	Sven
--nextPart1802327.RhgNRe3UZU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAllHfTkACgkQXYcKB8Em
e0YxihAApNnt3WkMb8G9edRJ7N/bf+aCdcx1LZSQz9gDjbnooFfE6/t4CPAwj2+x
mOfwO0lyz01HnuqCVjRZSWfNcPrsEu5SXDb/W3EIegrDV4UxEGUOL3EQZGIOBw0G
VymkkidmM9FeFV9cxGL73j71mItUtlh540SM4Y+W+DD2lbptebaVO+geZDPKJKkk
Ws1KucK3Cs7DwzvnwgSQY326PcNz3wnb052oAg+BeEprmAqtY9XaRf+o4WBZOPva
fK/SvkSG+S+3MV0V4DDMSYkX+suNndkszKyJsw51A//QCV4rylMGovxg6WWzDTr1
bcrX7E2zmDAUJVLjVnu0RFs26WceLj+h1+45QqpMVg69XaK9LfGpJJYZ7vYjCZc9
mG8pibhfby2t7+coz5xInSrFRCD0DwcUO6YfINBfKD0l22ZqAGrGpyG+hIay2BmX
eGlCrHVAiXC3oSPi/qd+GnQ5v88UM71RHCO+6L0O8RSYkkBQr+H0yFv+v/lr3NN+
MsqVMTH08Mj3k0n1ZlEDnTVViAozoXur/FXgtQwMvFBOXPps5bFvZa430rmMt2OP
zN0Yw9TW7JsrFZ8MMP8vyW5hRxnGXaa2YzwcKFnuCHoEhzboGOJBKmP7Gg3ri7oi
mGAO2eqcpPr7D2Lh1HSICSyP24rGCCmJgHX5Eb2dCkveuOoWdzE=
=3NLy
-----END PGP SIGNATURE-----

--nextPart1802327.RhgNRe3UZU--



--===============4527356311550130450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4527356311550130450==--
