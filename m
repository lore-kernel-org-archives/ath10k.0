Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB4FC3601E
	for <ath10k@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOTZzP50siEULUrf5/csQUelECo0W99PmsjoCCM1QfI=; b=3tXe16STRI16uY94Odd2zp4Gxv
	PDmDKxACmUrCSssODa/QLxummEzs7TDSRtmn6MwMcnq/POoY8K/FsH69PpE+HSknmmNfggikqsg9/
	zeG3dS+1oxnt6Q4v3lcFCRHi61Uc1SgH41/Bc3sFutM0saAxDACeAQmeFPvEyN3KMB1Tm3SHtw8ZE
	eyT3CHmE11J8VghWPUbZai3PwIGg7zhEetHs0xtjjCbqOzux44rFPpgjsikP0NzErOe+vu2C5QI+t
	nv2bAh1iz4U5IRq5rNtyWqwHFyzDdQDpiu1Yc296bw/5b1Ugvhyew8FjPhA1R/TQ1sFtD5Q4+py77
	900HubeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xC3-00000002OZr-32G3;
	Tue, 08 Apr 2025 00:51:59 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1xC0-00000002OYn-1N21
	for ath10k@lists.infradead.org;
	Tue, 08 Apr 2025 00:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744073507;
	bh=aOTZzP50siEULUrf5/csQUelECo0W99PmsjoCCM1QfI=;
	h=Date:From:To:Cc:Subject:From;
	b=fH3DHDIAVgDtmrPzwkVPoCd/ZbryzeW4F+snxVdxkS9+d+sFWmy9Q4f2jHVhP++Gj
	 bn6cC3seRDZHxm4YekVGa5myKbFsYJ9+WMVOkf50GZ9sfmIF46Uy8wt5mvOMCrwY6H
	 CyIjLusqF8F/VMNgErXkAlMuHeLUyqtcMr/IGAyN2XIlfv0pvrWMkAf4JYkApRB+vZ
	 se5vedU2YjKiypmDdXcZ7v0GstvUU8LC1Da181zWollgTfI9v6Pbsxd4yo7q8frv3W
	 0qJOhq0j9ZfS3MwXDsGvhn/LFg2KwLvUuejlgDtjON3idU3aX/BRql+aFj1XRdGi8f
	 7KrfTKF+O7mjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZWnb71gbMz4wc4;
	Tue,  8 Apr 2025 10:51:47 +1000 (AEST)
Date: Tue, 8 Apr 2025 10:51:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Balamurugan S <quic_bselvara@quicinc.com>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, P Praneesh <quic_ppranees@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, Ath10k List
 <ath10k@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the ath-next tree
Message-ID: <20250408105146.459dfcf5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/U4LlY.F_bTv1q3nIDCt2.wy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_175156_719651_6C004C9B 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
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

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the ath-next tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/net/wireless/ath/ath12k/ahb.c: In function 'ath12k_ahb_stop':
drivers/net/wireless/ath/ath12k/ahb.c:337:9: error: implicit declaration of=
 function 'del_timer_sync'; did you mean 'dev_mc_sync'? [-Wimplicit-functio=
n-declaration]
  337 |         del_timer_sync(&ab->rx_replenish_retry);
      |         ^~~~~~~~~~~~~~
      |         dev_mc_sync

Caused by commit

  6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")

I have used the ath-next tree from next-20250407 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf0cyIACgkQAVBC80lX
0GxGaAf/almYg2cNCpAsxVo4sRFqSBPbvl8F4TJWeA8bXrIUmzAIM9z00YUaSXSy
9HctDk69oV/LLSwacS5+QeyBuvMUZDvFSCg8cEcaynMUfBTaUioDWdVMNYhZEhaW
mG0Pys6YNIZddblWaVFiCyfzyptJKznKCxjEgdIo9RSR98Pvjx0MI8OLUu5KuBgo
BlhA+uajM2zbHlN4ZcpEnL24eXZXOayuiWDcVoaZsFAD20gQBChDvdHJJvTbn86V
Le+RbvPVcLejP9dliPJhaaSUVTmAfjvxch2ZJ1G4eFjUccGOXS0vPubPi+N9ELs7
eVIyDKE/dYw81aLxuUdtRPaErWmR5Q==
=7ypU
-----END PGP SIGNATURE-----

--Sig_/U4LlY.F_bTv1q3nIDCt2.wy--

