Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D58606A320
	for <ath10k@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xixwIwak;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=HQ6cD0h1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iN3NuJW0NrAQeJl8hnA8WPW47zZnm0NMu3n174y6fXM=; b=xixwIwakr6Kjg5
	PgiUexmvXdT8Q+tg/DgIV4urWN+M92BAX6tqBy39zlTSP1LO/7tf0B8JXFzr9opJK8ZAfZjy4ldGS
	wKyS/sNua+UENTxEM4mx52UPrwP2do9WvQsH9e8EnEpC/W609wyVTr6xAOrcAeE1PFRPS5P8fQkUk
	joHB+RzovTzdMfmxUZDN/uE09TZIbOijG067Uzk033xiukcjhcfq6yYIYVDJPCA20eu1zSDp7qqmp
	FPpoAZF8w86QB7Nnks9SyCoJNmb4OfJsr2PYeSZ83Qnh+XY7/vlSDc2kZa1kwrdue/VOD5HFTfJ1r
	yu+KeT1VrmmdgxeF2JNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpN-00000006KVt-1tm0;
	Wed, 28 Oct 2026 05:03:57 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLvpK-00000006KUM-0oun
	for ath10k@lists.infradead.org;
	Wed, 28 Oct 2026 05:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=iN
	3NuJW0NrAQeJl8hnA8WPW47zZnm0NMu3n174y6fXM=; b=HQ6cD0h1/ga2mBgH7b
	v4u6RdpotSm66iY/hFJ82F6RHdIpA2JkGmUcZx5vcHTJWp0tc+KG5k+ONejxnTlF
	FEgVTjtCKnZiQH4jmmo4yLDISNBFGjcjj9UzjbNiO2vq+SCgthrw4cuHwC6v15Eh
	eEimVhD5r3qe+yaxv9nQBgCzI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3X28rguFqvXzDCw--.30877S3;
	Wed, 28 Oct 2026 13:03:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 1/4] wifi: ath10k: clear monitor interface after add failure
Date: Wed, 28 Oct 2026 13:03:34 +0800
Message-Id: <20261028050337.127464-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028050337.127464-1-yaojiale02@163.com>
References: <20261028050337.127464-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X28rguFqvXzDCw--.30877S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4fGw45Gw4fuF4kCrW7Jwb_yoWDCwc_CF
	4fGwn3Zr47Ar15tF48GayxAry0yF1UXF93try2qrWrAw43XrZYk3sa934UuF97Gr18AF9x
	CFnrXFyYvwnIgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0sID7UUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC7w2++Grhgi3cHAAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_220354_607351_3C1F902D 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_add_interface() publishes the monitor vif before recalculating the
monitor configuration. If that operation fails, the interface addition is
unwound but monitor_arvif still points at the vif that mac80211 will free.

Clear the published pointer before entering the common vdev cleanup path.

Fixes: 500ff9f9389d ("ath10k: implement chanctx API")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..36b694ae6de4 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5875,6 +5875,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		ret = ath10k_monitor_recalc(ar);
 		if (ret) {
 			ath10k_warn(ar, "failed to recalc monitor: %d\n", ret);
+			ar->monitor_arvif = NULL;
 			goto err_peer_delete;
 		}
 	}
-- 
2.34.1


