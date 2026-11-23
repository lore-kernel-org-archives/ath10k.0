Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE84606A321
	for <ath10k@archiver.kernel.org>; Mon, 23 Nov 2026 14:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbImiWec;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yw6bHTQc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VspRcK8r/bAxbnrJk3ARH5ZGSzxCu7C2u9+3Jvhwp3w=; b=qbImiWecOcVBrTacxnpopv6PjB
	hzNInAtomZrVev44Xg2+/XorzWJe88OVmcGx+oweZDf5bdPwCl7ItwN7CFff52YyFKjfM+RpF6HrL
	1hFbN9zMZk31lnpiCtJy1gCgaWUhgizOpyPtiqAlI14hDqNpC5u/Q0IglQpfI+++j8WpxrsSgQGv6
	8FkD1BRFkLt4wd2nP7cs2OHYW01EB1TMmLx74OsljTCYsIswCi2CjUPuv42V4yazduNuFyytt3nsq
	dcKx/R0XF4KphbkOM6FjZtFUjo8cNtAmZHN13MkY1aomH97IhVwRduDHwBJ6VnjiATY9XN9fixYe0
	jwl63ckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVAf-00000003lB9-1T0y;
	Mon, 23 Nov 2026 14:37:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVAe-00000003lB2-02NQ
	for ath10k@lists.infradead.org;
	Mon, 23 Nov 2026 14:37:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95E1B400A3;
	Mon, 23 Nov 2026 14:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35FF1F000CF;
	Mon, 23 Nov 2026 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444647;
	bh=VspRcK8r/bAxbnrJk3ARH5ZGSzxCu7C2u9+3Jvhwp3w=;
	h=Date:From:To:Cc:Subject;
	b=Yw6bHTQcHVgcqNULPpheAlLLu11BezjfsgfEgLVBzm5zcM0fZoaTVq0zvAQ21N5RW
	 qOr1Aat1CtC7n/iUzNsntRPzMbkxUWM84tPYn2PbDDsazKdI7aYVmlDDRb+c6uufqJ
	 UUALWSOO666PGKMB08kbQ3y2ZxJSsJAXALeebybRHDp6RKBQ5toRFb4FG1/aVz6P7/
	 fg5X1wn8bZLFbNnx2Bmr6QMU2pehf8asEH6OsMSfCosbPecN2A59yHKK1EEdZf7fse
	 1Oz3/acOKwckMfc40UYL3X2r9smAtzsFvCLqcEOXzFomIJXzIGoKsr9OP0iapoQNht
	 ye87HQdx9fLNg==
Date: Mon, 23 Nov 2026 14:37:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>
Subject: linux-next: manual merge of the ath-next tree with the
 mm-nonmm-hotfixes-unstable tree
Message-ID: <awRPo1T3BGWPYOG7@sirena.org.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BM+gsJGj69bNaxLO"
Content-Disposition: inline
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--BM+gsJGj69bNaxLO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  .mailmap

between commit:

  7d72815bc36cc ("mailmap: add entry for Yuanfang Zhang")

=66rom the mm-nonmm-hotfixes-unstable tree and commit:

  92039549ef782 (".mailmap: add entry for Yu Zhang(Yuriy)")

=66rom the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc .mailmap
index 2478b4943f8c1,da76f7b21654a..0000000000000
--- a/.mailmap
+++ b/.mailmap
@@@ -236,11 -225,8 +236,12 @@@ Christoph Paasch <cpaasch@openai.com> <
  Chuck Lever <cel@kernel.org> <chuck.lever@oracle.com>
  Chuck Lever <cel@kernel.org> <cel@netapp.com>
  Chuck Lever <cel@kernel.org> <cel@citi.umich.edu>
+ Chunkai Deng <chunkai.deng@oss.qualcomm.com> <quic_chunkaid@quicinc.com>
  Claudiu Beznea <claudiu.beznea@tuxon.dev> <claudiu.beznea@microchip.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@kalray.eu>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <clement.leger@bootlin.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@rivosinc.com>
 +Cl=E9ment L=E9ger <clement.leger@linux.dev> <cleger@meta.com>
  Coiby Xu <coiby.xu@gmail.com> <coxu@redhat.com>
  Colin Ian King <colin.i.king@gmail.com> <colin.king@canonical.com>
  Corey Minyard <minyard@acm.org>
@@@ -1047,8 -1025,8 +1064,9 @@@ Yixun Lan <dlan@kernel.org> <dlan@gento
  Yixun Lan <dlan@kernel.org> <yixun.lan@amlogic.com>
  Yosry Ahmed <yosry@kernel.org> <yosryahmed@google.com>
  Yosry Ahmed <yosry@kernel.org> <yosry.ahmed@linux.dev>
- Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com> <quic_yuanfang@quicinc.c=
om>
+ Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com> <quic_yuzha@quicinc.com>
  Yu-Chun Lin <eleanor.lin@realtek.com> <eleanor15x@gmail.com>
++Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com> <quic_yuanfang@quicinc.c=
om>
  Yusuke Goda <goda.yusuke@renesas.com>
  Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
  Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>

--BM+gsJGj69bNaxLO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsET6IACgkQJNaLcl1U
h9Dd9wf+O5W91KshoUHKP4qzhSd0UxTthn86Xa21MNViawNhbFGcQrv0hB6vKQhd
VXzNc9c3z3hQNvukW+dSdqOhgLISHPkMszWM95bZ+ubcmQLqcKXkvVfUl0c/UY4D
93wpnn8GeAhXoIsoEGEuEw8yLAY4RIbVuSg2EBjhC3ZynX6nCbC53Y5vvhRhv/rx
Tf6JVFqp+RwW7GoXmQytNJ0Q+3rSKNfdhVuMhrII5cObRHn1wrohhxIMdIVh/5x2
hOYjOQyIThKQxgeglz05eEn69P06XKWxOkNFfqHU6VAIZlCjagNnd3vPvzMEIUOV
i7kWKpBrduB4bQugMmgWlRm47kh6NQ==
=aqLS
-----END PGP SIGNATURE-----

--BM+gsJGj69bNaxLO--

