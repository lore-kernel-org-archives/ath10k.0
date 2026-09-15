Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AAEC88E7F
	for <ath10k@archiver.kernel.org>; Tue, 15 Sep 2026 14:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pre5/60EdsoFZkP5TOwGJVFWOlszP98LTb5epi2ki04=; b=PYwaA4++/jgch+Mww4IBk7gF4i
	Io7WDqb7e35vevkSAf3clDDOzicad1n93VqT5uX8mAi6WfjBkekccZ11pIVrd1XdyTSbhfnjW73is
	bTVT0wrynrRvAxpuK+vmIdb2ERH5y6qijNzsksW56N/TJCrBM9AF4wCGbti4GMplG/4uImfPurJjN
	SWlX4CRpmab+yXZjrHC8ofuLQNu4AnIZnDlSPlW8rFw05DLm0kgc3RaX74Etlq4DPIIcHLHgHh9TZ
	U0pTu1L8sf2OR95LLAT8HeB437+wHWyjA/qw+e95OuJYeD8KXCnsoubW8ksCw/JiLhsDV0puw+yRA
	Q1Tc36PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UGz-00000006xm5-414y;
	Tue, 15 Sep 2026 14:36:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6UGw-00000006xlq-3nOO
	for ath10k@lists.infradead.org;
	Tue, 15 Sep 2026 14:36:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26D66600C8;
	Tue, 15 Sep 2026 14:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674CF1F000FF;
	Tue, 15 Sep 2026 14:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482993;
	bh=pre5/60EdsoFZkP5TOwGJVFWOlszP98LTb5epi2ki04=;
	h=Date:From:To:Cc:Subject;
	b=j8ElJrB5V+9o+LZcYFz4zqm0Tq8+hnUpzLAhp/feErZU4vzNP9M10cnoEwNFH/kS3
	 TO0PObhPGpzA0M1WeWvLVgTEH/yy4IXNeJ9dMiFULZyJMOW/qjYNOdTIQqGdw1FaAs
	 HkbTS5vOqbZIZgRacvcZx1m4pUJUqWe+DvNqpL2ywvgPyBaMMk8ehfpqrnMwSHUEMs
	 8CFtmk0PZg7I5AzqZFdBsrajrIf+iOjyxbgeIM1sn1QuGSrSts9yJb+8k/dhyVeQib
	 GVF1vRmfIuUx3QuBsAJzmxrMX038nUg9dY6PWnuJNeu45wNgiucPb/VTw09iNMbJyu
	 05GNL1qZUZ+tg==
Date: Tue, 15 Sep 2026 15:36:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jeff Johnson <jjohnson@kernel.org>,
	Ath10k List <ath10k@lists.infradead.org>
Cc: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ath-next tree with the wireless tree
Message-ID: <aqlX7ecTiq6x0uMh@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oVy3I7wzxgJhHRU8"
Content-Disposition: inline
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


--oVy3I7wzxgJhHRU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ath-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/wifi7/ahb.c

between commit:

  ce9d5197d651c ("wifi: ath12k: ahb: Revert undocumented ABI and dead code")

=66rom the wireless tree and commit:

  c3bace8584ca7 ("wifi: ath12k: add support to load shared firmware on mult=
iPD")

=66rom the ath-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 6e9e9034cba1a,a8f5cf8cc2a63..0000000000000
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@@ -57,7 -108,8 +59,8 @@@ static int ath12k_wifi7_ahb_probe(struc
  	ab->hw_rev =3D desc->hw_rev;
  	ab->hif.ops =3D desc->ops;
  	ab_ahb->scm_auth_enabled =3D desc->auth_enabled;
+ 	ab_ahb->supports_multipd =3D desc->supports_multipd;
 -	ab_ahb->userpd_id =3D ath12k_wifi7_ahb_get_userpd_id(ab);
 +	ab_ahb->userpd_id =3D ATH12K_AHB_USERPD_ID_0;
  	if (!ab_ahb->userpd_id)
  		return -EOPNOTSUPP;
 =20

--oVy3I7wzxgJhHRU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqpV+0ACgkQJNaLcl1U
h9DDPgf8CyjNTnzKVU1HignMgbwOc6nJKVE5GLApSRoQAB7dSjYGmMuPjABH6zvY
5PPjQfI/wXzyEeFWaMO6QgbnQhNZtOVe9LZoo5knWGYlb+P5JVRu+n1OZN/yfzrn
/Or4RiE0RR2TNF0Wyp9wpjgFGUxHwvOAotkkYSoN6BapjnfKR794nsrfVm4rxtUy
pG7ptYMIsgiBRadZD59Kv0NUryxEFZBSKV11t+XirVdFw6MQDKCJh72v2sXnivjC
lFdtNjy0ZDNpHBj7xsKpUZDos/skbGQTyRVfk5Xo05m1BpEQSfhkBtfsdXBeDVpl
9rkZfih1FWYbuqlVvp2RM2vEDG39ng==
=SBvH
-----END PGP SIGNATURE-----

--oVy3I7wzxgJhHRU8--

