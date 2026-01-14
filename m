Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A7FD30CFD
	for <ath10k@archiver.kernel.org>; Wed, 14 Jan 2026 01:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IQeDIqj8yqDMuZVPm/CJmcBQw60eLG8uKw9keDCBPIc=; b=K2k/LJf/8xu17W2pLnxr9u90wd
	+MJPs8xU08AjSKVOK54BfpFME8UJEyzpFdbRCLs+i44N8App5Fh2RR/0yopEuIU4T4RogujkltwBc
	eDT5no2LM6dNjPbAp4cfAnhQMHAYFfHCbluzfadS6aJd6llhRLEuhtIBxxOEtcb0Wq181Xxg7so5j
	/BDeT4m4bZDlzdpiOM261+aXwXx5VCcjZD92z7qc3kH863akWpLSpENIxR9wH9gsxHhBfTxWoHPXj
	rNlNRw0Amn3fNNLEfBbkqeaDj1hGch2B94DVASmXSQ+Oo+2VoJQEHWH4u5HRcU4w4k6/eCcGpyzDe
	de6sUZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfppi-00000007wtN-1P2z;
	Wed, 14 Jan 2026 01:38:02 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfppe-00000007wsc-1WFk
	for ath10k@lists.infradead.org;
	Wed, 14 Jan 2026 01:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768354673;
	bh=IQeDIqj8yqDMuZVPm/CJmcBQw60eLG8uKw9keDCBPIc=;
	h=Date:From:To:Cc:Subject:From;
	b=lGsEtsirMdeLQUpunQ9wsqkP5IrpNH+eDs+23H2jK+GGZ55lr3rswgJlDRem7wOYL
	 Orjz3AJQ8e9tN8GEx7wQhvmJBDwDeZMf+X//IlHybwavrKr35UaRcG/dBnLhHhjz7K
	 4ppy0C4gmENzwsOLX9lgeCqzQ+Jf8rijpR9vbAQv3EeN2mW4RmqwuWX+sntbYNY4qh
	 OZEiuKbz6FFG52dD2r5u40HQ1PPe0ysJoOhkZDtkjk4cBRLV8foRxZ21sV2mQUNou9
	 8U4ZGob5SmeZzcZVMa5a9Kljp0R+cbPD/XX1OcS7F1qxe7FnrY9DQ4A6HYFT65BpYC
	 N6P5H/YJJb6HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drTJc5KJCz4wRG;
	Wed, 14 Jan 2026 12:37:51 +1100 (AEDT)
Date: Wed, 14 Jan 2026 12:37:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Ripan Deuri
 <quic_rdeuri@quicinc.com>, Yingying Tang <yingying.tang@oss.qualcomm.com>,
 Ath10k List <ath10k@lists.infradead.org>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the ath tree
Message-ID: <20260114123751.6a208818@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6tXw03ZjMuYvongKlANEsNe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_173758_812046_CD862234 
X-CRM114-Status: GOOD (  21.69  )
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

--Sig_/6tXw03ZjMuYvongKlANEsNe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mac.c

between commit:

  31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

from the ath tree and commit:

  c26f294fef2a ("wifi: ath12k: Move ieee80211_ops callback to the arch spec=
ific module")

from the net-next tree.

I fixed it up (following the directions in commit 31707572108d, I used
the latter version of the above file and then added the following merge
fix patch) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 14 Jan 2026 12:34:25 +1100
Subject: [PATCH] fix up for "wifi: ath12k: Move ieee80211_ops callback to t=
he
 arch specific module"

interacting with commit

  31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

from the ath tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wirel=
ess/ath/ath12k/wifi7/hw.c
index 1f5dda73230d..8ac06b2fc18f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -705,7 +705,10 @@ static void ath12k_wifi7_mac_op_tx(struct ieee80211_hw=
 *hw,
 			return;
 		}
 	} else {
-		link_id =3D 0;
+		if (vif->type =3D=3D NL80211_IFTYPE_P2P_DEVICE)
+			link_id =3D ATH12K_FIRST_SCAN_LINK;
+		else
+			link_id =3D 0;
 	}
=20
 	arvif =3D rcu_dereference(ahvif->link[link_id]);
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/6tXw03ZjMuYvongKlANEsNe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlm828ACgkQAVBC80lX
0GyDnQgAnw6XDBK7GRcPCnBeN6hNRB9efKv+FrXoh5Mn3RvCmgwzdsEi5ZCwVKB3
1S9jNtU7B/O0VM/dML9ICSL7gp3w5vNIlqAhuGh+jkgGsoDQ47LZzsc7gA+AtWQ3
r7VIAM8zzjx8rfvMQ2P4UadqmtQjg14WipeoquPbJrGcQnKWKOM23jjggvObxjBA
kjOHYxpeB7iM8Ccz4T4UCv8e+s37nIJsoO94I25roM/UUMaddbhgpiWiUTGWFKtO
jacJBCHR4ACkNwsPcYzsfszLb4quZ9rY2W+WwEbo4zeM9qQkVg9iYQ/e4EW+iCFS
0EphceDTlbEYtLHjTl59nRcx825ugg==
=seMT
-----END PGP SIGNATURE-----

--Sig_/6tXw03ZjMuYvongKlANEsNe--

