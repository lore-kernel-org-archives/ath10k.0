Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk2Kh-0000yo-GD
 for ath10k@lists.infradead.org; Tue, 01 Dec 2020 09:52:28 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: ath10k: Missing airtime scheduler parts
Date: Tue, 01 Dec 2020 10:51:57 +0100
Message-ID: <2631481.BEx9A2HvPv@ripper>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8133276947582187670=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: linux-wireless@vger.kernel.org
Cc: Yibo Zhao <yiboz@codeaurora.org>, Toke =?ISO-8859-1?Q?H=F8iland=2DJ=F8rgensen?= <toke@redhat.com>, ath10k@lists.infradead.org

--===============8133276947582187670==
Content-Type: multipart/signed; boundary="nextPart14225578.tv2OnDr8pf"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14225578.tv2OnDr8pf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, Yibo Zhao <yiboz@codeaurora.org>, Toke =?ISO-8859-1?Q?H=F8iland=2DJ=F8rgensen?= <toke@redhat.com>
Subject: ath10k: Missing airtime scheduler parts
Date: Tue, 01 Dec 2020 10:51:57 +0100
Message-ID: <2631481.BEx9A2HvPv@ripper>

Hi,

I was asked what parts are currently missing for (a better) airtime fairness 
with ath10k. I know that the AQL were merged and enabled for ath10k (and 
mt76). But there was also the virtual time-based airtime scheduler [1] which 
was proposed. I think the development on that one didn't continue since last 
year.

Maybe someone else knows if there were some other parts worked on which I've 
am missed and which were not yet merged.

Kind regards,
	Sven

[1] https://patchwork.kernel.org/project/ath10k/cover/1576221593-1086-1-git-send-email-yiboz@codeaurora.org/
--nextPart14225578.tv2OnDr8pf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl/GEj0ACgkQXYcKB8Em
e0YKtQ/+MBMAucLKojyhktYQ/quKAlsSzjfUToMBqbOoK/oghEJ71h8SyGfRmefY
8w59lJDdZUN6p/3avtqLMD8wJqtzh4MBP2I3lfSw1E7Q9AdEczqwpB94wgJiSSwD
HAtcMpwWxtqbst6cXvF/zDGpSvuD4F1rrr5BqhvhXRysKNmP11TjXHwVCLYbr2n8
i8Y/+8UdF7aroSOsC7yG+lDHhvDl/BQ4sEAkJhbOfs9osLz8CDH9RQmp0+XV/GsM
ndc58/iSrngXXoNQFiyd42l2/kMBsdo2UvCtTYu5z7GKjczBjj3KWhp7eq/DUdKu
cN16YrRjg8pUXqdtTQE04J453B+/SlK060MC1FfizVYMvuLqRohmNurQZdcCnUB1
M3XbyvzFEuxiDHnscdAbkcED0vZ1x/LMsm0e/OfbPJltGmULNlHa59xW5jfZg8jD
TsjRynYnBgtglS/CiEducc/PBvQzLsDMssFVu0WVqJYt6aeKukO6ZXYUIy4NZ+Ee
zjWT5ibInLTLMyAGr/zmpUOOoeP6s8Pton+U8h3VBuBNhhf9TzXP3sD61Rntc++2
OmiXpLfA5MakelgWpbLU8f/H49PAEsnzdkzVW/vO3ZZYMh58LFFo3XwOlnrKd6Pg
ArUlv4LagXWZ+AodjrxU87azC30cflukIlVuRewHdzH0HlO/fgU=
=rVaC
-----END PGP SIGNATURE-----

--nextPart14225578.tv2OnDr8pf--





--===============8133276947582187670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8133276947582187670==--
