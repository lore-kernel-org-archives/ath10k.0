Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B2AC4332F
	for <ath10k@archiver.kernel.org>; Tue,  8 Nov 2022 13:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iewQ91YD5w+j46/BPi3CU5Y6d0aLs/FK3N84KvJnjGs=; b=QBrTMsz/+kOUJQ
	jY9a7zScgL5smwQoyCsPJcqcRbReFS5uK2EWhreVZbY6bb3S5bvFO9R6lm5y4a55w0hImADVgZ2u6
	PnWSiSckSVOFc17fJ9zNvpxV/l4ahQW/c/xjdW+ccPN3YKPQ64z3uczs0jpeLUyv+QuQNxNEKRDlJ
	l+90tQToayM1BXRo9vboDVP4eLXWzm4yXvtnAOaS/0pr5ZZPIwhOpLTFA4BFrw/wrkjigvplVaNnp
	ozoESFA8FqehZar+nNWMAGCIfRJ1+HGFOxKJe8CEsh/7yHKx6KSeMHcO33mX8MuZPARR0OaNhujwn
	cTtdQ8voSMgREvZvSH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOsi-005gO7-H5; Tue, 08 Nov 2022 13:43:12 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osOsf-005gMb-Ra
	for ath10k@lists.infradead.org; Tue, 08 Nov 2022 13:43:11 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N68Rb3L0jzHvg3;
	Tue,  8 Nov 2022 21:42:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 8 Nov 2022 21:42:52 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] wifi: ath10k: Fix resource leak in ath10k_pci_init()
Date: Tue, 8 Nov 2022 21:38:58 +0800
Message-ID: <20221108133858.53308-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_054310_095168_02CF48DE 
X-CRM114-Status: UNSURE (   9.63  )
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

When ath10k_ahb_init() fails, it does not unregister ath10k_pci_driver,
which will cause a resource leak issue, call pci_unregister_driver() in
the error path to fix this issue.

Fixes: 0b523ced9a3c ("ath10k: add basic skeleton to support ahb")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e56c6a6b1379..22f8f8b20762 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3800,8 +3800,10 @@ static int __init ath10k_pci_init(void)
 		       ret);
 
 	ret = ath10k_ahb_init();
-	if (ret)
+	if (ret) {
 		printk(KERN_ERR "ahb init failed: %d\n", ret);
+		pci_unregister_driver(&ath10k_pci_driver);
+	}
 
 	return ret;
 }
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
