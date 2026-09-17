Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A56C88E72
	for <ath10k@archiver.kernel.org>; Thu, 17 Sep 2026 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QMKT74REgTRITvrjpXJlYeGQ4Tb9L6TN8kEZxKg0iLI=; b=bZMDrqOEpQ/SuboGixlYFCAKK9
	gIM6ihY+rRFngR5Pzv0mDpxbBdiCiAMsvH3iANyA3LRVXSQE44zL4ZUfi8UgncCuAEwQr1nZjBAPf
	xQWVS+2dLr34MXTZyRQRe4/D9GhF+XgD2RBL+jmSJQWcKoLolSuibrJM5wo+v9b7/mvr6FRg2j7qZ
	AbyxQbkwoilXYczSC798+ce046gL3Uzk1LGsWpAQ87/7yL9IgXMcZnxMAOtI6zhugJABnIf5eKF4q
	sSYeYkjQgbfgN13S89BBd0u9cq3KHS3urAZEJcHNsKyLRbqIHEH0bAymE+kbkrH01309yuOpjiGr+
	O/J6fKug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Anm-0000000BFEY-2d5o;
	Thu, 17 Sep 2026 12:01:18 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Anj-0000000BFE0-12dj
	for ath10k@lists.infradead.org;
	Thu, 17 Sep 2026 12:01:16 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAC36EKI1qtqwxWACA--.2297S2;
	Thu, 17 Sep 2026 20:01:12 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: ath10k@lists.infradead.org
Cc: jjohnson@kernel.org,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	quic_wgong@quicinc.com,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Fix skb leak when hl TX submission fails
Date: Thu, 17 Sep 2026 12:01:12 +0000
Message-Id: <20260917120112.2150211-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAC36EKI1qtqwxWACA--.2297S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gr43tFW5tr4xCrW3Ww18AFb_yoWkJFg_Kr
	1F93Z3Zry8G3ZFkr1UAF48Aw12kFyvqF95Wr4Sqry8XrW7JrWDCr9Yvwn8WrnrGrWxZF1Y
	kFnrXa4Ut3yqgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSxYjsxI4VWkCwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxV
	W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0E0s8F02x267IIx4CEVc8vx2IErcIFxwCY
	1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r48Zr
	WUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAIcVC2z280aV
	CY1x0267AKxVW0oVCq3bIYCTnIWIevJa73UjIFyTuYvjxU2G-eUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgQNA2qrq3aHOAAAsv
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_050115_691769_EC02688D 
X-CRM114-Status: UNSURE (   7.29  )
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

ath10k_htt_tx_hl() takes an extra reference on the msdu with skb_get(),
which is normally dropped by ath10k_htt_htc_tx_complete(). When
ath10k_htc_send_hl() fails it does not free the skb and no completion
runs, so that reference is never released. Drop the reference on the
error path.

Fixes: c8334512f3dd ("ath10k: add htt TX bundle for sdio")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index d6f1d85ba871..24617d610297 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1377,6 +1377,8 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res)
+		dev_kfree_skb_any(msdu);
 
 out:
 	return res;
-- 
2.34.1


