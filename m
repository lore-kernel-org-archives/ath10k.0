Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCABBC36010
	for <ath10k@archiver.kernel.org>; Tue,  8 Apr 2025 01:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pry0XYR1bNyVtjgGwwK1T2iqph7egXui1QMVMr15pE4=; b=yJFDeXb26V2shbPvJG2KzRv/+U
	Sd36XWZCkzcndK6PfQDdFILRuO3sio1kJvYdBH55tZUEUzW4UZzAz7tRYCIIpV0//bCQDWdL0jsQP
	IA+ECyTGa21kCDk0TcT4qZOzOhDsNZTq0SBt1P39qanPA2o2K4A2d5ZyFQIvllrC7yWQamSyIU0Fg
	EQota5wajL/yy6ofPnTG0J2bCBJRKCN9QyEATtDKYo3ea8wZc4i9PcWKv5zt0ChrQOegnM1OgkB0s
	vf8jNeX1CFeX/ry0zHUlg5rGW/oL1VQiVHSAQzFYKgTjKVTM+BpUWmHz2PkDOgDzo0YAjQNU58PGe
	JHOS4+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xuS-00000002SpZ-2a5x;
	Tue, 08 Apr 2025 01:37:52 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xuQ-00000002Sob-0JSL
	for ath10k@lists.infradead.org;
	Tue, 08 Apr 2025 01:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744076268;
	bh=pry0XYR1bNyVtjgGwwK1T2iqph7egXui1QMVMr15pE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QBOxgWCGVDM0mYWO28VCIVWVP1Hw1VF8KkrN8UfnnXQXCF/o3+f0Spx7FqUpA3nvQ
	 znMFWNBRGKqO2Qqy8UGMl2+uUBz8VSqYTP5wCe7P8xQcKGqnlwTUrTkZ3gJdM0N28h
	 dkNQLX8X658IsZEaIzPNipKXC+m0XzavPo48+AFBH7GMf2HzqtDTNTcTr+F1PtbDxt
	 oURF5M+zzKYnbLUV+W8bO5yEPGlTNT3UisYNBA6iddu778xeoiJKICqbZ2Lp/8YMR2
	 ODrG2MNQDsSbL/AkAdTV5EH8eBGFEgLa38pu6sd7+R6vh86MDtpFYhm+ARQEaH8eiP
	 lT7bAOKsB2tqA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWpcD1Nvmz4x8Y;
	Tue,  8 Apr 2025 11:37:47 +1000 (AEST)
Date: Tue, 8 Apr 2025 11:37:47 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 Balamurugan S <quic_bselvara@quicinc.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, P Praneesh <quic_ppranees@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, Ath10k List
 <ath10k@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250408113747.3a10275a@canb.auug.org.au>
In-Reply-To: <Z_R2lEVjqn2Y3_sP@gallifrey>
References: <20250408105146.459dfcf5@canb.auug.org.au>
	<Z_R2lEVjqn2Y3_sP@gallifrey>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+gp7kqPae4FJqvCGp=VvsLM";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_183750_252146_534896D2 
X-CRM114-Status: GOOD (  13.82  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--Sig_/+gp7kqPae4FJqvCGp=VvsLM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, 8 Apr 2025 01:06:28 +0000 "Dr. David Alan Gilbert" <linux@treblig.o=
rg> wrote:
>
> * Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> >=20
> > After merging the ath-next tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
> > drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaratio=
n of function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-fun=
ction-declaration]
> >   337 |         del_timer_sync(&ab->rx_replenish_retry);
> >       |         ^~~~~~~~~~~~~~
> >       |         dev_mc_sync
> >=20
> > Caused by commit
> >=20
> >   6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> >=20
> > I have used the ath-next tree from next-20250407 for today. =20
>=20
> I guess a clash with the recent:
> Fixes: 8fa7292fee5c ("treewide: Switch/rename to timer_delete[_sync]()")

I will try that out tomorrow.
--=20
Cheers,
Stephen Rothwell

--Sig_/+gp7kqPae4FJqvCGp=VvsLM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0fesACgkQAVBC80lX
0GyIFQgAnISd1YyFiTjCOFbapwzs/ZBqzyIaYKnXBnGbnTnv6ZTNeXYaY1EvGsXr
Hlz5cvbtV4JETqIlMCBSfx0/gGBTTka4uqeV+110Grsh+lWSip5jKDEHevtjJehF
7T9dvr6RY6VGlc0sAyT91aWruLlLJzKeuZW8cgdMSkH04FKhIs6HRwpVLGJj0wU1
yU/a+5/8PQiOZZpZY2ZSGfk7rlZRwddzhlV2kFpgMb2fCUWmX/RUiXUVRy8dB9KQ
cWLepciql773B3DLZePmJ0PULy2iLek9m1V8AHn40vNbFHtijjk9dYjKk0e3i1FJ
+4wjUfH15h6KoDDlzRGjMTiePFKfsw==
=Hs2Q
-----END PGP SIGNATURE-----

--Sig_/+gp7kqPae4FJqvCGp=VvsLM--

