Return-Path: <SRS0=RSRu=PC=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8FEC433FE
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 07:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7913A61108
	for <ath10k@archiver.kernel.org>; Thu, 14 Oct 2021 07:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7913A61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=juU4yit7cUV+EVhoNqcMMQqA7D0HggBT1l2iUKOg+rk=; b=JETDsm1GZhm16y
	QJmV3If7UsQQyaURcyGxM5o55Qz8RUOpPkrtba2A1vta2h5EfunSN9xZBUMK01aydcnuTK5veWJ0+
	VZfOkFz87gtG+jEH4NrTnFJFS6iq0gUIbFVDcnr9XzJMSRhWrtR81i52RS4Pb3rAcJfd1oN0e5t16
	7La+WVb/QQaUlOkLkojmLoVvRwroWJorXxDQ3l6yqjCybY5LPbGTyAsWmceHFGXOHwaKIpje1tatM
	gqvgTAcJzfxcJdE72+bR5jO5qgHrE3mpnXy1CJ+2Xgp5jUppV5w0CJL/sXK+05zkbNaY5/KZPeVei
	mdnyglVK8FGOfOKcbEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mavX1-001yPV-0V; Thu, 14 Oct 2021 07:52:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mavWy-001yO8-7G
 for ath10k@lists.infradead.org; Thu, 14 Oct 2021 07:52:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BACCB61019;
 Thu, 14 Oct 2021 07:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634197919;
 bh=PgQ8DWLj15Tn737Iixsm64rGGY1DE9ojmh8tALjZ11Q=;
 h=From:To:Cc:Subject:Date:From;
 b=O40rSVIBPZIeaNmnZrBI55sDnVF4LqbXOhFliczCNqa9V3CKjAspkW9hX/G1JEYjJ
 6CwhjeyYDOq7ZcBMYx55TlCOAHh7Zk30sZWxwSdDK9Uerx8tMMi959fGRx/k4WFiZQ
 GehcxUp3u2gxty0W21OnvGlLCy9bnMuS3LQcWKGD6ExqI6h7+y5I06B5RL5LoxsSqO
 THPxuHq4QNI+sWjtLdIrjpj9FQUKY/ITd8vFrPsZnT+Y9MaWebL/57eDvZUa6g7So8
 phjZfqaT4cX/6pXQjsYo70wj6bDVcr0L0XChe9VRL9XBtLU36Y2jpSJdJOzbGNEw58
 g02ufvH4DL8WQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Kalle Valo <kvalo@codeaurora.org>,
 Alagu Sankar <alagusankar@silex-india.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Brian Norris <briannorris@chromium.org>,
 Wen Gong <wgong@codeaurora.org>, Tamizh Chelvam <tamizhr@codeaurora.org>,
 Carl Huang <cjhuang@codeaurora.org>,
 Miaoqing Pan <miaoqing@codeaurora.org>,
 Ben Greear <greearb@candelatech.com>,
 Erik Stromdahl <erik.stromdahl@gmail.com>,
 Fabio Estevam <festevam@denx.de>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ath10k: fix invalid dma_addr_t token assignment
Date: Thu, 14 Oct 2021 09:51:15 +0200
Message-Id: <20211014075153.3655910-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_005200_306427_37CD3D23 
X-CRM114-Status: GOOD (  13.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Using a kernel pointer in place of a dma_addr_t token can
lead to undefined behavior if that makes it into cache
management functions. The compiler caught one such attempt
in a cast:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_add_interface':
drivers/net/wireless/ath/ath10k/mac.c:5586:47: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
 5586 |                         arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
      |                                               ^

Looking through how this gets used down the way, I'm fairly
sure that beacon_paddr is never accessed again for ATH10K_DEV_TYPE_HL
devices, and if it was accessed, that would be a bug.

Change the assignment to use a known-invalid address token
instead, which avoids the warning and makes it easier to catch
bugs if it does end up getting used.

Fixes: e263bdab9c0e ("ath10k: high latency fixes for beacon buffer")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/ath/ath10k/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 7ca68c81d9b6..c0e78eaa65f8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5583,7 +5583,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 		if (ar->bus_param.dev_type == ATH10K_DEV_TYPE_HL) {
 			arvif->beacon_buf = kmalloc(IEEE80211_MAX_FRAME_LEN,
 						    GFP_KERNEL);
-			arvif->beacon_paddr = (dma_addr_t)arvif->beacon_buf;
+			arvif->beacon_paddr = DMA_MAPPING_ERROR;
 		} else {
 			arvif->beacon_buf =
 				dma_alloc_coherent(ar->dev,
-- 
2.29.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
