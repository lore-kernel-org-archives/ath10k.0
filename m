Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA70AC98338
	for <ath10k@archiver.kernel.org>; Sat, 26 Sep 2026 15:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQSBijeCpBYLcmXHo8ZBtBfG17pFXPWD63/WDXYEp+k=; b=CuPz5DhKVcBmZ3DFuCvoEYR4xM
	pv3YL+V+Tghc87dlZYMiq4enw0YPTNH/wViu0hn4gXbwhGmEoRg7k3O2IyvxWMbmyQsY6yZa/6TMB
	INslMPdC0zpuW62jCRRft9yzzn/IXdI/efmPECxADpVruOaVoJeI2r3OGEO3skXb1bjyYrAAuaYpv
	YRZ4WRftXSFKtXJxuAZhpylOhZoSOHH5MufPWpHjTJ2ChOQkN11btVAI6XOCdpbOQ0zdKMZrx5PdO
	rGJAfxTQtW/sqUrIa4nxPANNRbf0uBMbWBAKplTULJOkfY1EmTzVdUsvJsEJU1ZBKbSSZaptNFYs8
	39nhoXnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe7-0000000Fbh4-14GS;
	Sat, 26 Sep 2026 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAUe5-0000000Fbfi-31M1
	for ath10k@bombadil.infradead.org;
	Sat, 26 Sep 2026 15:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hQSBijeCpBYLcmXHo8ZBtBfG17pFXPWD63/WDXYEp+k=; b=QEPujL1YmWyYgn5VAh0SZoeaFE
	DfdlITdSZVdNe5wNR12ChG/jCohyUnVNo2mgWitb98jZpQZc3eFjoqbLj9cEVdHxRPnHqszG6Kuyw
	+Bq49OUwabgzK456gksc9ImkEH3QIQ4RPgb5pUESbAda4C94cDzYxVyDlvmj1mnssab1Ko9LVNzMt
	d0ngiJYdvsyJyfxGknd2MxaOPqJ8kfsIEMmRAbKyl26ETF7bZmsq8Et+LJB89ugtLc3aSCPuAJO7D
	rH3aNKfo/CJrMgD+5qMZXsNrgsTeRFOi6+/OnrJJJuOk9fb6uEY8AzWZ0+D36VmmGs0e39gQEo5Vy
	DSWyNQMg==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xAUe1-00000000GIM-2mpO
	for ath10k@lists.infradead.org;
	Sat, 26 Sep 2026 15:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=hQ
	SBijeCpBYLcmXHo8ZBtBfG17pFXPWD63/WDXYEp+k=; b=Ygh9xE04CCBs0hCRY6
	JuiFqoojNAsotCc8qxvUCesaXXFHh2wYpGewVDFhmj7kpOglz6F2GfSN3HsLHcXp
	Be2OHqsmhdNlyHWsuYAlInbDj5L1WIilNYtFC/Aqdz/Ime1tdGJLIbBJFybkayrO
	/upgxUPdoqFzw62a4C/HDycDI=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3F4pL6bdqlpIIBA--.11355S3;
	Sat, 26 Sep 2026 23:48:29 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Michal Kazior <michal.kazior@tieto.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/5] wifi: ath10k: avoid IDR mutation during TX cleanup
Date: Sat, 26 Sep 2026 23:48:20 +0800
Message-Id: <20260926154824.75224-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926154824.75224-1-yaojiale02@163.com>
References: <20260926154824.75224-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3F4pL6bdqlpIIBA--.11355S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr13ZF1xGF15AF1DtFy5urg_yoW8Wr1UpF
	W8uwsFvFy8Ar17Zr48J3WxGFn8Xan3Gw4a9rWDua4rKr1rCr10gFW5Kas0qrWUtFW5C3W7
	uF4Ut3srGw1ktFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piiiSXUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg0WUGq36U0gjwAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_164858_173336_668E2325 
X-CRM114-Status: UNSURE (   8.44  )
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

ath10k_htt_flush_tx_queue() walks pending_tx with idr_for_each().
Its callback calls ath10k_txrx_tx_unref(), which removes the current
entry from pending_tx through ath10k_htt_tx_free_msdu_id().

idr_for_each() keeps radix-tree iterator state across the callback.
Removing the current entry can therefore invalidate that state and
make the remaining walk unsafe.

Use idr_for_each_entry(), which starts a fresh lookup after each
callback.  The current entry can then be removed safely, while the
following idr_destroy() continues to release the IDR itself.

Fixes: 89d6d83565e9 ("ath10k: use idr api for msdu_ids")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index e46f579d745d..9993c5a2f96c 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -535,8 +535,13 @@ void ath10k_htt_tx_destroy(struct ath10k_htt *htt)
 
 static void ath10k_htt_flush_tx_queue(struct ath10k_htt *htt)
 {
+	struct sk_buff *msdu;
+	int msdu_id;
+
 	ath10k_htc_stop_hl(htt->ar);
-	idr_for_each(&htt->pending_tx, ath10k_htt_tx_clean_up_pending, htt->ar);
+
+	idr_for_each_entry(&htt->pending_tx, msdu, msdu_id)
+		ath10k_htt_tx_clean_up_pending(msdu_id, msdu, htt->ar);
 }
 
 void ath10k_htt_tx_stop(struct ath10k_htt *htt)
-- 
2.34.1


