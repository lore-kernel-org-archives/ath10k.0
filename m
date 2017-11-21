Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH3nj-0005fD-NN
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 08:21:07 +0000
Received: by mail-qt0-x22a.google.com with SMTP id r39so18025020qtr.13
 for <ath10k@lists.infradead.org>; Tue, 21 Nov 2017 00:20:40 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Tue, 21 Nov 2017 09:20:32 +0100
Message-ID: <4295821.C9ZrSID8fs@bentobox>
In-Reply-To: <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <87tvxocbcn.fsf@kamboji.qca.qualcomm.com>
 <9ab6ffcf-0131-1fb1-13ef-076ec54bd582@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7429736957498168326=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>

--===============7429736957498168326==
Content-Type: multipart/signed; boundary="nextPart4460462.TFUWLD2ugq"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4460462.TFUWLD2ugq
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 21. November 2017 09:00:54 CET Sebastian Gottschall wrote:
[...]
> >> Why is the support for 10.2.4 firmware not upstreamed? I mean the one which is
> >> using pktlog to transfer the PEER_STATS information.
> > I'm not sure what you are asking. If you are asking the firmware release
> > mentioned in the commit log that's in ath10k-firmware:
> >
> > https://github.com/kvalo/ath10k-firmware/tree/master/QCA4019/hw1.0/3.2.1
> >
> > But I'm sure you know that already.
> 
> i believe he is just talking about a patch which allows to get station 
> statistics like rx and tx rate on the firmare 10.2 series which is 
> qca988x mainly
> 
> this patch was posted here months ago but never got upstream

Yes, I was talking about that patch (which I didn't find on the mailing list - 
so a link would be helpful). QCA is gathering a lot of patches (a00-*) at 
https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches?h=coconut
which are often not upstreamed. The patch 
a00-0075-ath10k-Add-support-to-parse-per-station-tx-stats-for.patch is the one 
which is receiving the TX statistics stuff from 10.2.

I had a discussion with some QCA employee (or actually OpenMesh had it and I 
joined the discussion rather late) where the QCA employee was very confident 
that ath10k supports ATH10K_PKTLOG_PEER_STATS (not the fw_stats stuff in 
debugfs). But I couldn't find the code for that in ath10k. Only after some 
guesswork, I was able to find the patch mentioned above and was able to test 
it (after hacking the smart antenna patch dependency away).

Kind regards,
	Sven
--nextPart4460462.TFUWLD2ugq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAloT4dAACgkQXYcKB8Em
e0airhAAzdqcAtRNR4athon8PTLNmyeEXvalCklHSS69zQLOTKAwQ82gs8zJUfnT
xuJbEl+OudzMprG0YJ7IhjDhWQQtnCtppLvBrJpq2A3z5AO6sXygdAYXIq6tIHZ2
koXyWJ+TK0K9dTSq9krxBwSg1mxtQpxJMBogI9hX/zNOLrKZ/wbjip//zxArK11r
6EwxRUypOjsdOXYcxgs0gFfqJccOB3X6HZqwxmDVo+H2mg+RFWaAKUyPJ2hK9wZb
SsETQNXNmZucJ/kjDLUC7uaoIFhaFm3hlYVd68TgBcdf2Fk8GacBygyFZhifRtqL
M3DSe0fa6WxapO11jTnRLkBq8tMMXVb2B//qIZXTuhj2OFThm9Ip3jiVBBHfEv81
DsBj2oLzlZfkhZifSHsuNxYHK9ACIZHSuGYE7Ij2lG9KQLDnjjv/kYsVFUYPdeb2
s8TKkPTqik2Maw7TAhNi2MuejwDeLdMbTuSAWdqlQEfbWZRUHxcF0R408bqcPiIw
nhgrGzYe6oe7o1nfkodamkI+K2QWFvdET59jNuSls8vVQPeWMW6oVUWtb1a77oLV
gAN/I9v4B1vvb24PtXocSgbqJ8qGinVKMhtnVYHxd4sjqECtteDzrfijBTuoh7+G
Mt+Eqqh1hIMyYupeVDgMYB+zTjLRhKd47JTkEv9r4morTGFJBBY=
=kS6G
-----END PGP SIGNATURE-----

--nextPart4460462.TFUWLD2ugq--



--===============7429736957498168326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7429736957498168326==--
