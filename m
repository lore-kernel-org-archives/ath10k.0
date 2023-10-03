Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE372E7544F
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 12:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4L/XSyoEW6+dnSzqLkeLcyhfYWNdj0dKxKx6Uh6RT40=; b=RffRy7AK4x0YcHPWEopNsXTP5O
	1JSaLCx2mrvRSpgL9edYcuH8r2AAnS/rQN58uE3lqT3YXjDA+qLVboK4DwIHkjlTaoMpmxhmpVTzM
	PhZ1wziCv9fkVZRixCzhJe2pbYpwgsrbncqT7BQ7yAUQZCGD9+FlK4p0tkMJI21FlqTEbg+Q3NjAB
	auTcAc78OxD1ss0BwzlIEmCtAzv3CZmL8idtOqSKBXy+e3dl7nmDj2IJag858PZ2JHEqVVxM+zmXw
	BUPRPF13iOA5fVez5pxZM0DqIA3wz8Aj9r38MpHL+J9xh4H3jQ29GMifCEJ+TebLshIy8glQ1pvUu
	t3j5pTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qneE8-00EaZl-2g;
	Tue, 03 Oct 2023 12:10:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qneE4-00EaWP-2R
	for ath10k@lists.infradead.org;
	Tue, 03 Oct 2023 12:10:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qneCk-0007eI-DF; Tue, 03 Oct 2023 14:08:46 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1qneCb-00Al6E-S0; Tue, 03 Oct 2023 14:08:37 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id D0B6422CC33;
	Tue,  3 Oct 2023 11:26:49 +0000 (UTC)
Date: Tue, 3 Oct 2023 13:26:49 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>, Wei Fang <wei.fang@nxp.com>,
	Alex Elder <elder@linaro.org>, Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>, Bailey Forrest <bcf@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Junfeng Guo <junfeng.guo@intel.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rushil Gupta <rushilg@google.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lee Jones <lee@kernel.org>, Dawei Li <set_pte_at@outlook.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [net-next PATCH 3/4] netdev: replace napi_reschedule with
 napi_schedule
Message-ID: <20231003-struggle-lung-3d7c89eab00b-mkl@pengutronix.de>
References: <20231002151023.4054-1-ansuelsmth@gmail.com>
 <20231002151023.4054-3-ansuelsmth@gmail.com>
 <20231003-living-seltzer-172ea6aec629-mkl@pengutronix.de>
 <651bf88c.050a0220.3a982.31fc@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <651bf88c.050a0220.3a982.31fc@mx.google.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath10k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_051008_794254_F865813E 
X-CRM114-Status: GOOD (  19.10  )
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
Content-Type: multipart/mixed; boundary="===============3516315917083606084=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============3516315917083606084==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zbzdaj4jqyp54e52"
Content-Disposition: inline


--zbzdaj4jqyp54e52
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03.10.2023 13:18:33, Christian Marangi wrote:
> On Tue, Oct 03, 2023 at 09:16:33AM +0200, Marc Kleine-Budde wrote:
> > On 02.10.2023 17:10:22, Christian Marangi wrote:
> > > Now that napi_schedule return a bool, we can drop napi_reschedule that
> > > does the same exact function. The function comes from a very old comm=
it
> > > bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of st=
ruct
> > > net_device") and the purpose is actually deprecated in favour of
> > > different logic.
> > >=20
> > > Convert every user of napi_reschedule to napi_schedule.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >  drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
> > >  drivers/net/can/dev/rx-offload.c                       |  2 +-
> >=20
> > Acked-by: Marc Kleine-Budde # for can/dev/rx-offload.c
>=20
> Just to make sure can I use the correct tag: (you didn't include the
> mail)

Doh! Sure.

> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload=
=2Ec

Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--zbzdaj4jqyp54e52
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmUb+nYACgkQvlAcSiqK
BOgAwwf9HSZX1sxRgnOHWLXSBACCTpqNm26rDzNrIqPlybJQVie8rNauFCEQbSz+
cKDZD68pDokwEv+8WajpOBW0d/Zc27B2d7EZtYhlopNFjo0XIPYoYfA6QTXfZ6Qs
vi22lC87vHoyEwEi37X3yTPapJVY2GDgyGSD+8FsdOliNE679gautzYvZSWLPiRF
stXo71bRBm15AbVKwCuOqymieHGxKbooQ09lRIYUXdK6oF671CJLKUia6m9Qg42f
6Itf4TBPlF4XdxS0vqKrvTsg78XduHN1FmuI+RJIPdzULMx9CoUlr8BOSfGomsN3
eoH9v4s8IDrkLGQifa7oRIgxg9EkFw==
=72hV
-----END PGP SIGNATURE-----

--zbzdaj4jqyp54e52--


--===============3516315917083606084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3516315917083606084==--

