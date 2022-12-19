Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E91C4332F
	for <ath10k@archiver.kernel.org>; Mon, 19 Dec 2022 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZoRntEKrSS1rsGwBG29SdGBxeHlgJ/djX28uPMoUbg=; b=O/F2rkaf+QKL8L
	CS8pG4CA0IcfOdSpS8usNUT04cwGH4RsDd/HOM2s1RbwPBTS6fI1W5K0KKliNsAJWKOGFChpCjgEH
	umjbQ1rfE6xl2QKvgD4rOBJIsxS+fWZ2THfSIV8LL/Pth5GW+f0WX4QkpAPIVFsltQefGSnxSp8N6
	gjFKUcecs4drMsjsw2+lAANgASjVhjBxxnfK1hjhBHLdj+P1nhFNKx3A8GLBgUX39Rt7gQm6edhIC
	NPc9ikGS7k7dxCa0uaDofQ9oexEUTgIKTLtAnhtht3nRrTFyiTfXDUy8cXy1y3FaQsjJbQ7k0C5Ri
	ICCVchOpyDswKoW9qwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7G4x-00DsrA-4G; Mon, 19 Dec 2022 13:21:15 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7G4q-00DseV-CT
	for ath10k@lists.infradead.org; Mon, 19 Dec 2022 13:21:12 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0VXhf1e9_1671456046;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VXhf1e9_1671456046)
          by smtp.aliyun-inc.com;
          Mon, 19 Dec 2022 21:20:57 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: kvalo@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] wifi: ath10k: Remove the unused function ath10k_ce_shadow_src_ring_write_index_set()
Date: Mon, 19 Dec 2022 21:20:41 +0800
Message-Id: <20221219132041.91418-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_052108_643143_BB990DA4 
X-CRM114-Status: UNSURE (   5.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

The function ath10k_ce_shadow_src_ring_write_index_set is defined in the
ce.c file, but not called elsewhere, so remove this unused function.

drivers/net/wireless/ath/ath10k/ce.c:212:1: warning: unused function 'ath10k_ce_shadow_dest_ring_write_index_set'.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3519
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 59926227bd49..c2f3bd35c392 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -208,14 +208,6 @@ ath10k_ce_shadow_src_ring_write_index_set(struct ath10k *ar,
 	ath10k_ce_write32(ar, shadow_sr_wr_ind_addr(ar, ce_state), value);
 }
 
-static inline void
-ath10k_ce_shadow_dest_ring_write_index_set(struct ath10k *ar,
-					   struct ath10k_ce_pipe *ce_state,
-					   unsigned int value)
-{
-	ath10k_ce_write32(ar, shadow_dst_wr_ind_addr(ar, ce_state), value);
-}
-
 static inline void ath10k_ce_src_ring_base_addr_set(struct ath10k *ar,
 						    u32 ce_id,
 						    u64 addr)
-- 
2.20.1.7.g153144c


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
