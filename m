Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE8BC433FE
	for <ath10k@archiver.kernel.org>; Tue, 18 Oct 2022 09:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCc9IWsUGxFY6zgUeCeYItvb9anQ7HLwIHY1p9v8JGE=; b=sVvcWEj7xXFgw3GdS3OkgaotvL
	AQ2kxdtFLhixULyN10rlFlA2WRqpp09hFfq1+sU7zeKpu2c3qxbGQwUkIVftxNo+Mm528LvAF/FTN
	lsX2/xVY43d+P5zMbBLsfX+5dr+UOEfvQsZq2XI1P/AwX8AHJA/05qAvQTwbDaHJLyZ+LquinFh2K
	7XOxWDmtFJ9rOG0jVVfqfX3xcRWo31AVpMvGQIUvMPT5gm+oSWrtHC3cj1V9Nq+cV4Jv6hbv70dZ0
	hdLi/wg+R2P7h1JbkwzUgFCkqnbnWi+L0jt5V1rmhAtqoUNL7Req0zEso89hNcq5pIfZmTKjAYhVY
	Q8jkXUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjIS-005Lhi-9r; Tue, 18 Oct 2022 09:54:04 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjIM-005Lf5-VH
	for ath10k@lists.infradead.org; Tue, 18 Oct 2022 09:54:02 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 5C8491C09D8; Tue, 18 Oct 2022 11:53:57 +0200 (CEST)
Date: Tue, 18 Oct 2022 11:53:56 +0200
From: Pavel Machek <pavel@denx.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Wen Gong <quic_wgong@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>, kvalo@kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 4.19 16/25] wifi: ath10k: reset pointer after
 memory free to avoid potential use-after-free
Message-ID: <20221018095356.GH1264@duo.ucw.cz>
References: <20221009222436.1219411-1-sashal@kernel.org>
 <20221009222436.1219411-16-sashal@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221009222436.1219411-16-sashal@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025359_170764_AEBADF29 
X-CRM114-Status: GOOD (  16.66  )
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
Content-Type: multipart/mixed; boundary="===============9158322431917060728=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============9158322431917060728==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0Ed1hDcWxc3B7cn"
Content-Disposition: inline


--y0Ed1hDcWxc3B7cn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Wen Gong <quic_wgong@quicinc.com>
>=20
> [ Upstream commit 1e1cb8e0b73e6f39a9d4a7a15d940b1265387eb5 ]
>=20
> When running suspend test, kernel crash happened in ath10k, and it is
> fixed by commit b72a4aff947b ("ath10k: skip ath10k_halt during suspend
> for driver state RESTARTING").
>=20
> Currently the crash is fixed, but as a common code style, it is better
> to set the pointer to NULL after memory is free.
>=20
> This is to address the code style and it will avoid potential bug of
> use-after-free.

We don't have this patch in 4.19:

b72a4aff947b ("ath10k: skip ath10k_halt during suspend for driver state RES=
TARTING").

We probably should take that one, as this may depend on it. On the
other hand, we don't need this one as it is just a cleanup...

Best regards,
								Pavel
							=09
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -302,12 +302,16 @@ void ath10k_htt_rx_free(struct ath10k_htt *htt)
>  			  ath10k_htt_get_vaddr_ring(htt),
>  			  htt->rx_ring.base_paddr);
> =20
> +	ath10k_htt_config_paddrs_ring(htt, NULL);
> +
>  	dma_free_coherent(htt->ar->dev,
>  			  sizeof(*htt->rx_ring.alloc_idx.vaddr),
>  			  htt->rx_ring.alloc_idx.vaddr,
>  			  htt->rx_ring.alloc_idx.paddr);
> +	htt->rx_ring.alloc_idx.vaddr =3D NULL;
> =20
>  	kfree(htt->rx_ring.netbufs_ring);
> +	htt->rx_ring.netbufs_ring =3D NULL;
>  }
> =20
>  static inline struct sk_buff *ath10k_htt_rx_netbuf_pop(struct ath10k_htt=
 *htt)
> @@ -641,8 +645,10 @@ int ath10k_htt_rx_alloc(struct ath10k_htt *htt)
>  			  ath10k_htt_get_rx_ring_size(htt),
>  			  vaddr_ring,
>  			  htt->rx_ring.base_paddr);
> +	ath10k_htt_config_paddrs_ring(htt, NULL);
>  err_dma_ring:
>  	kfree(htt->rx_ring.netbufs_ring);
> +	htt->rx_ring.netbufs_ring =3D NULL;
>  err_netbuf:
>  	return -ENOMEM;
>  }
> --=20
> 2.35.1

--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--y0Ed1hDcWxc3B7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY053tAAKCRAw5/Bqldv6
8n84AJ45/QgkGMpSg/yVjmSGm2uAOTr89QCeLihL/LnMqBq5hHDBcCEB+8hBSt0=
=6ejv
-----END PGP SIGNATURE-----

--y0Ed1hDcWxc3B7cn--


--===============9158322431917060728==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============9158322431917060728==--

