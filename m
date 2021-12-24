Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFFAC433F5
	for <ath10k@archiver.kernel.org>; Fri, 24 Dec 2021 19:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wh1RDi1zuI92jkgqNDG6Qin70XNZqeH6VJHBvhJ5JLw=; b=Y2M4i/4kqSzIbZ
	xueJ6e65V5p7G4EpnOegonrMNUCeZSsQg+FypndWD56+Y3LmyW8vasIW3LKbI9rK8sEg8SgfBJN8U
	J7KQCQAw23Y+rCR043uMuOVV0lKWidR/oEC6ja4q7ZUYHwG7O+MU0hR7QkNiuYn9wd3InHAnzkFq1
	nXj2HaZzaBLcNty+LOVBKkXpxs5ib9NZkG8jP86cGeTVaV/3u1EtW9nc5A5UHhoRL8lKVDL7QJJpc
	9wmiHY1TvMzmZchFCyvOPMs6OrxnTPS2ZW/9/r/v6s/7k78aopa4McMSgoByczEmodFQiFVV9kfKq
	AlW1HPTEpEMzhTQAtlmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0qDV-00EQqM-63; Fri, 24 Dec 2021 19:27:01 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0qDM-00EQmn-64
 for ath10k@lists.infradead.org; Fri, 24 Dec 2021 19:26:53 +0000
X-IronPort-AV: E=Sophos;i="5.88,233,1635174000"; d="scan'208";a="104635860"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 25 Dec 2021 04:26:51 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7665F40F5214;
 Sat, 25 Dec 2021 04:26:49 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: [PATCH 7/8] ath10k: Use platform_get_irq() to get the interrupt
Date: Fri, 24 Dec 2021 19:26:25 +0000
Message-Id: <20211224192626.15843-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224192626.15843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211224192626.15843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_112652_357333_380E5674 
X-CRM114-Status: GOOD (  10.39  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
allocation of IRQ resources in DT core code, this causes an issue
when using hierarchical interrupt domains using "interrupts" property
in the node as this bypasses the hierarchical setup and messes up the
irq chaining.

In preparation for removal of static setup of IRQ resource from DT core
code use platform_get_irq().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 9513ab696fff..681e1abe7440 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1306,13 +1306,10 @@ static int ath10k_snoc_resource_init(struct ath10k *ar)
 	}
 
 	for (i = 0; i < CE_COUNT; i++) {
-		res = platform_get_resource(ar_snoc->dev, IORESOURCE_IRQ, i);
-		if (!res) {
-			ath10k_err(ar, "failed to get IRQ%d\n", i);
-			ret = -ENODEV;
-			goto out;
-		}
-		ar_snoc->ce_irqs[i].irq_line = res->start;
+		ret = platform_get_irq(ar_snoc->dev, i);
+		if (ret < 0)
+			return ret;
+		ar_snoc->ce_irqs[i].irq_line = ret;
 	}
 
 	ret = device_property_read_u32(&pdev->dev, "qcom,xo-cal-data",
@@ -1323,10 +1320,8 @@ static int ath10k_snoc_resource_init(struct ath10k *ar)
 		ath10k_dbg(ar, ATH10K_DBG_SNOC, "xo cal data %x\n",
 			   ar_snoc->xo_cal_data);
 	}
-	ret = 0;
 
-out:
-	return ret;
+	return 0;
 }
 
 static void ath10k_snoc_quirks_init(struct ath10k *ar)
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
