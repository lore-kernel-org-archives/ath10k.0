Return-Path: <SRS0=Z+PP=NS=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07F86C432BE
	for <ath10k@archiver.kernel.org>; Fri, 27 Aug 2021 17:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE89460EE9
	for <ath10k@archiver.kernel.org>; Fri, 27 Aug 2021 17:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE89460EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t4/v7GSeNvWYXRVhkP3EFtLoJ67wV6rcqnevolZzidI=; b=A59E8xxuhEXL78AWMmz6BmzZ59
	U6FoIgkYPFTVbAtb/puPBzvSpu7uYmfiWS7A7Wwkil2oHpFE5v1tKG7qm0cgVn40EcB8tpt1mXTpc
	LQGrhctac8gWDl94Fwi+3w4vLT4q4P1rKUbJU+GlBbuuxmh+IMEUykFfV3DK9xLcvoRcf8cUWhOtq
	CP0x3YTzl/mjXQo0bFvy3kCW7knyUo2BqYoTULSpdEAuOJwd7wqX4eCzyUerjBdjKlXaAGmaG60d/
	K41d8s2GchufQfWhjsD8DOZpgKVYhFtE+p+G/fJwiR8VWQeuIdU06RLcDzkvnXZum8jijteZjIn+8
	AJ/y6WDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJfMS-00CpE8-40; Fri, 27 Aug 2021 17:09:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJfMN-00CpDV-Ir
 for ath10k@lists.infradead.org; Fri, 27 Aug 2021 17:09:47 +0000
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=bjornoya.blackshift.org)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1mJfLX-00064y-Ny; Fri, 27 Aug 2021 19:08:51 +0200
Received: from pengutronix.de
 (2a03-f580-87bc-d400-4ac6-d86b-e43f-77c5.ip6.dokom21.de
 [IPv6:2a03:f580:87bc:d400:4ac6:d86b:e43f:77c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id A327F670F04;
 Fri, 27 Aug 2021 17:08:38 +0000 (UTC)
Date: Fri, 27 Aug 2021 19:08:37 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Rohit Maheshwari <rohitm@chelsio.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Kalle Valo <kvalo@codeaurora.org>, Jakub Kicinski <kuba@kernel.org>,
 Stanislaw Gruszka <stf_xl@wp.pl>, Luca Coelho <luciano.coelho@intel.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Johannes Berg <johannes.berg@intel.com>,
 Mordechay Goodstein <mordechay.goodstein@intel.com>,
 Lee Jones <lee.jones@linaro.org>, Wolfgang Grandegger <wg@grandegger.com>,
 Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 linux-crypto@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-can@vger.kernel.org,
 bpf@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Keith Packard <keithp@keithp.com>, Dan Williams <dan.j.williams@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 2/5] treewide: Replace open-coded flex arrays in unions
Message-ID: <20210827170837.mu4hql5bev2f5x2o@pengutronix.de>
References: <20210826050458.1540622-1-keescook@chromium.org>
 <20210826050458.1540622-3-keescook@chromium.org>
 <20210826062452.jekmoo43f4xu5jxk@pengutronix.de>
 <202108270906.7C85982525@keescook>
MIME-Version: 1.0
In-Reply-To: <202108270906.7C85982525@keescook>
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_100943_666636_189C1D47 
X-CRM114-Status: GOOD (  15.77  )
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
Content-Type: multipart/mixed; boundary="===============1674182670997862036=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============1674182670997862036==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkkaemaf4slct3pn"
Content-Disposition: inline


--gkkaemaf4slct3pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 27.08.2021 09:08:19, Kees Cook wrote:
> > BTW: Is there opportunity for conversion, too?
> >=20
> > | drivers/net/can/peak_canfd/peak_pciefd_main.c:146:32: warning: array =
of flexible structures
>=20
> Oh, hrmpf. This isn't a sane use of flex arrays:
>=20
> struct __packed pucan_rx_msg {
> 	...
> 	__le32	can_id;
> 	u8	d[];
> };
>=20
> struct pciefd_rx_dma {
>         __le32 irq_status;
>         __le32 sys_time_low;
>         __le32 sys_time_high;
>         struct pucan_rx_msg msg[];
> } __packed __aligned(4);
>=20
> I think that needs to be handled separately. How are you building to get
> that warning, by the way? I haven't seen that in my builds...

If compiling with C=3D1, sparse will complain about this.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde           |
Embedded Linux                   | https://www.pengutronix.de  |
Vertretung West/Dortmund         | Phone: +49-231-2826-924     |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-5555 |

--gkkaemaf4slct3pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEK3kIWJt9yTYMP3ehqclaivrt76kFAmEpHBEACgkQqclaivrt
76nZyQf/cQC8nVICmegw2Xx7F4e9MRmYJPNlM4CBOw9lsPVBDSn9GON+JkvMIfWI
gzsHT/fSQfAerrBnUGqaLqbI/HjEa1cgkevLmMY6SnSYZN1tYmiYUhhirVAUN07C
QchAwrLEtdk4fwE/PMvjCcsmw1BrM85bW5B9h/Ug5xhhZZGJu+0I1DSR9s4ERi1M
SGHegQvm8xGiPYDiYOOmXX75G9X4rtVGcpNWj9Iu9hscU0F2exWZz5wB1cZQSK4s
Ka+x3qrkGo4rP+qNov0TlUZEwY3YSmZWx4slMWhR53Shdzpo7H3aylw8JLIra1/i
YPgsmxiUEP6P9DiHmH2O5IVgUsy9kg==
=L8Rq
-----END PGP SIGNATURE-----

--gkkaemaf4slct3pn--


--===============1674182670997862036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1674182670997862036==--

