Return-Path: <SRS0=NZz8=I3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A47C433DB
	for <ath10k@archiver.kernel.org>; Mon, 29 Mar 2021 19:30:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A087601FD
	for <ath10k@archiver.kernel.org>; Mon, 29 Mar 2021 19:30:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A087601FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0i+nEeYUrHUXKwt26vnEt68j5Fx7xK8efc+j5jZ3lfc=; b=OHfMcZPrrM1jlzvqic8Ogn8qPJ
	gLy3weMESFma6c9p3X4AJ56zfWb6571VRHOEYXAE5W3EyYaA6x1LNHpuVczYKKJ26gxXk1R1JdChk
	xRSFTn/qlgH2wv0DvE7ziRx0JQfEm7uLq7NIsHdVtupqlmfOPLIveuBei9Cap2PokSc6B50USIKKE
	xbNBrcE3ILtNexfmAKmjl0qczJF+VxR0Y9TOypiJdFU6tXRBK6LzdFIdzxazI+TbzmnHDzYGk1v7Z
	H2ScqUvC2MlFyFAvGQtgvb1d/BwM8yQWHJMxqC4fmGfht7U5KvByVyw+jxunPXmhfMd0n+mU+425J
	FlRLvtYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxZL-001FZW-68; Mon, 29 Mar 2021 19:28:59 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqb8-000dFH-G0
 for ath10k@lists.infradead.org; Mon, 29 Mar 2021 12:02:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=R34OrgAceM
 eMrFV+JCpxaSd85NskDzH5U6NaA8ZXVAg=; b=VcCyTLrornF+2maYRIkk5dSBH1
 Hp8v9Ry05h93kBjiD4M1tSZSAYGGK9IEM6drQVX05EMqiPb1MPcDRhz/T04h8xn9
 n5l6oXxLPLJ1cVjS+Z2Oje297UXoOf5+qmOYWTWQ3m27+UW6ccLpOT7UqhwxVwmr
 Dx9LH6E6MShVH7Q9Y=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygA3Pkq1wWFg7mVnAA--.201S4; 
 Mon, 29 Mar 2021 20:01:57 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	kuba@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lv Yunlong <lyl2019@mail.ustc.edu.cn>
Subject: [PATCH] wireless: ath10k: Fix a use after free in
 ath10k_htc_send_bundle
Date: Mon, 29 Mar 2021 05:01:54 -0700
Message-Id: <20210329120154.8963-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygA3Pkq1wWFg7mVnAA--.201S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4xGr1ktw13KFW5Xry7Jrb_yoWDKwcEga
 1kZF1fZ3ykJw17AFy2yF4ftrWIyFyIqFZ5u3sxKrW8XrW3JFZrCrWY93s8Gr9rGrWrZF9x
 CrnxWryDA3sYgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbV8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
 C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
 wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
 v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x0JUPl1kUUUUU=
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_130224_212682_46BCC9E9 
X-CRM114-Status: UNSURE (   8.80  )
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

In ath10k_htc_send_bundle, the bundle_skb could be freed by
dev_kfree_skb_any(bundle_skb). But the bundle_skb is used later
by bundle_skb->len.

As skb_len = bundle_skb->len, my patch replaces bundle_skb->len to
skb_len after the bundle_skb was freed.

Fixes: c8334512f3dd1 ("ath10k: add htt TX bundle for sdio")
Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/net/wireless/ath/ath10k/htc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htc.c b/drivers/net/wireless/ath/ath10k/htc.c
index 0a37be6a7d33..fab398046a3f 100644
--- a/drivers/net/wireless/ath/ath10k/htc.c
+++ b/drivers/net/wireless/ath/ath10k/htc.c
@@ -669,7 +669,7 @@ static int ath10k_htc_send_bundle(struct ath10k_htc_ep *ep,
 
 	ath10k_dbg(ar, ATH10K_DBG_HTC,
 		   "bundle tx status %d eid %d req count %d count %d len %d\n",
-		   ret, ep->eid, skb_queue_len(&ep->tx_req_head), cn, bundle_skb->len);
+		   ret, ep->eid, skb_queue_len(&ep->tx_req_head), cn, skb_len);
 	return ret;
 }
 
-- 
2.25.1



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
