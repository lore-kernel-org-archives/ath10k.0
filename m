Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4C0C77B7E
	for <ath10k@archiver.kernel.org>; Thu,  1 Jun 2023 09:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSIgEBtoaJKRXOcLMgpbBgwqDMzke2AsqVDzXXLpd/0=; b=fZlpbYpbiHKfYDGFe2Y2H30oKX
	SvwT8PCjUgncaHU2W+Jp/CRCVMx+jvo0fDzjBuH9tLTgA8ryY2s+0xa0bReOCo1RJ2vBN5U8wUE9Q
	dEGggV+/6CsizJrbT84PLj1bVf5EcQ18w1DSyT/bZbtZb4ge6eOUAXfYmPfflxCyCpV2Pt/glXxGl
	1KtnTJQX9t1wMemW7SnhSrXXCFY8tzs4OjrygmBKHHu2nRu0+LXbkLzHPtG4VSwGlllZb0feM+2M3
	SEUbR+b/gIA+5TfKohWWw9UKR1r/Fi/RsTsONU1TcQvCHmPfYWdtf4ri+ht6aUlqZVJc5ob5I5aGG
	rru1Jnow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ee8-002jha-0K;
	Thu, 01 Jun 2023 09:31:04 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ee5-002jh8-25
	for ath10k@lists.infradead.org;
	Thu, 01 Jun 2023 09:31:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ee1-0005e4-Ky; Thu, 01 Jun 2023 11:30:57 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4ee0-004Jx2-0m; Thu, 01 Jun 2023 11:30:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q4edz-00A78v-6b; Thu, 01 Jun 2023 11:30:55 +0200
Date: Thu, 1 Jun 2023 11:30:55 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org, Eric Dumazet <edumazet@google.com>,
	kernel@pengutronix.de, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH net-next 0/4] Convert to platform remove callback
 returning void
Message-ID: <20230601093055.ovmhypa5jw2bq32q@pengutronix.de>
References: <20230601082556.2738446-1-u.kleine-koenig@pengutronix.de>
 <87h6rrk0cn.fsf@kernel.org>
MIME-Version: 1.0
In-Reply-To: <87h6rrk0cn.fsf@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_023101_684172_F981F214 
X-CRM114-Status: GOOD (  20.26  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2010680794020129663=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============2010680794020129663==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="g4pasupk4odv3umz"
Content-Disposition: inline


--g4pasupk4odv3umz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Kalle,

On Thu, Jun 01, 2023 at 12:17:44PM +0300, Kalle Valo wrote:
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> writes:
>=20
> > the motivation for this series is patch #3, patch #2 is a preparation f=
or it
> > and patches #1 and #4 are just cleanups that I noticed en passant.
> >
> > Best regards
> > Uwe
> >
> > Uwe Kleine-K=F6nig (4):
> >   ath10k: Drop cleaning of driver data from probe error path and remove
> >   ath10k: Drop checks that are always false
> >   ath10k: Convert to platform remove callback returning void
> >   atk10k: Don't opencode ath10k_pci_priv() in ath10k_ahb_priv()
> >
> >  drivers/net/wireless/ath/ath10k/ahb.c  | 20 +++-----------------
> >  drivers/net/wireless/ath/ath10k/snoc.c |  8 +++-----
> >  2 files changed, 6 insertions(+), 22 deletions(-)
>=20
> ath10k patches go to my ath.git tree, not net-next.

This isn't obvious for outsiders. Not sure what can be improved to
make this easier to spot.

> Also "wifi:" is missing from the title but I can add that.

oops, I wondered about that, too, but was sure that I used the prefix
=66rom previous commits. Now that you said it, suddenly all previous
commits have this wifi prefix. Hmm, somebody must have tinkered with my
source tree :-)

Thanks for fixing my misdemeanors,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g4pasupk4odv3umz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmR4ZU4ACgkQj4D7WH0S
/k4Utwf/dhPpcpseS9x4rk209oXT1aUQ8EwAXqrNMqTSAUjG325bqhzAYUBeNqK2
nrHzvynSDmP9BEW8zD+dcOKLZesUPgBkIuxoAz9fR4ac+KktWdUBlIRQ40cYMcyq
hm6z9GthpphkyrEzDUv7LympX8CPnQlYBA/pTEXdtXSYMAQX4w5K3q4/rt2theCV
4U/FIiTNrC7GBNgncXsq8YuGfaLwoNpoAg8SLipvPhdhsFLyjm+flS3NeJrhf6Yf
h0HzJObYBEKMTmFLKhqf/LWa8DRXYiuEIk3eeTTh5NGsv9DUKx2Cd4XYq5vIB6Ro
DeHLYMNpWlkU2sEax8AAx8wLv01Qgw==
=gVBP
-----END PGP SIGNATURE-----

--g4pasupk4odv3umz--


--===============2010680794020129663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2010680794020129663==--

