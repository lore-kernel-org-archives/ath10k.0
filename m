Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fafib-0001LV-NG
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 11:13:07 +0000
Received: by mail-wm0-x244.google.com with SMTP id i139-v6so5375124wmf.4
 for <ath10k@lists.infradead.org>; Wed, 04 Jul 2018 04:12:52 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH v8] ath10k: fix crash in recent 3.5.3 9984 firmware due
 wrong handling of peer_bw_rxnss_override parameter
Date: Wed, 04 Jul 2018 13:12:47 +0200
Message-ID: <4756311.uatpdkZPGZ@bentobox>
In-Reply-To: <0cff058a-3c4b-6617-a034-3df706ba3a32@dd-wrt.com>
References: <20180704092953.32572-1-s.gottschall@dd-wrt.com>
 <5630152.jDWN9V3RzB@bentobox>
 <0cff058a-3c4b-6617-a034-3df706ba3a32@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3523066309986548320=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: linux-wireless@vger.kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org

--===============3523066309986548320==
Content-Type: multipart/signed; boundary="nextPart4613126.Xrykp8NhWn"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4613126.Xrykp8NhWn
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mittwoch, 4. Juli 2018 12:48:06 CEST Sebastian Gottschall wrote:
[...]
> can you explain your request? the macros are unchanged and just 
> reformated for maximum line length restriction. the values have been 
> taken from QCA's wmi header

You use long shift and mask statements in your patch. But you didn't use the 
macros which are there to shorten them. So please check the macros SM and MS 
from core.h and adjust your code accordingly. The code which I've pasted does 
this (with an unintentionally added a copy and paste error).

Kind regards,
	Sven
--nextPart4613126.Xrykp8NhWn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAls8q68ACgkQXYcKB8Em
e0bf/g//fxPfMA/832a0efxxrOMpj4CKzfuYK7nE0hNB8BmwxptLxbf+IHO2IuYB
QX4+dPcSf/kJcjPCtg7tv0FaV+BOfQdPfl+O52qclTaiL2IjzNXEyB0pLcXAwk8u
FtLUj9XSI0+vxhrqJTM2RR7ce1BqZp0cFH39zjxFeJhklE7qGBd0CxvllcWBdl0h
oOBTFPIcXsp5W2MZ/6U+K/8yHXLgdOVw2A5MUVy+2wvVJgIegfBm7/17jhMZWBUQ
yO0TBvBTT/CgoEGrSL8wtYHiT0t2c8bX30hKyZ6Ryn7HDB6z1nTLAMSEGqbAXEXj
3+hQUCtEY0mF4nuXpUQyUpGISrXMtRiH10AuBpsxyUZ+fxxUVWXX9KKrbZtl2XD+
+at1p/YIcR7HfAB/hVrR1RUQa+FJ2yqUpp5EHSjWNFuEICOfKDyTnV/8hKgnDU0g
/qOQq2Saaqvq+wzqQ6kOX8gFa/bLcSSMlhDIyiSlCua3eaYdja/Ogjq2RCtS73BY
sdccmOHzhEfC/2FgZZNRTeuUm/JB2MOxU7VPSBiZzftjqu69QwM8N/fzS1DwyVoj
yl2Y3W8QCJCnBirc5rEhOitgM9vzXB70805dq6AmOowCLbhPUPcdndYyAfdA/wof
0iPB68l11/8ufvUCNnzh7pYwM57KM89+1KW7A05/DOZWXHjuM1Q=
=jIJr
-----END PGP SIGNATURE-----

--nextPart4613126.Xrykp8NhWn--



--===============3523066309986548320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3523066309986548320==--
