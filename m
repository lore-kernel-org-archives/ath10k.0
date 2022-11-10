Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE29C433FE
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 06:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qqf0e6iFjpKiQIYkIsmi0am+tU9xNYwcV4wdQdHBG8o=; b=2CYiP0ua7+4pCR
	9FSq4J4jEtPdsZxgjUcdnI4mGjG3OQuZuCbxuB7yLFPvbR4BlIuwq+3PV5tmkb8u2kPS/yW7iIfNV
	3S3cirGhzqlXSmw25K5ebEecnc7Vd7ijaJlfmvBI8XqVSQHgwp47oVbtYCxLgmyyERnsc2ZI4U7Jw
	pTHia27QglbVuOZkzhmCHFbgU+6G/2mWvHFWkS01Vz4r/Q+ldH+DQHqbW1jHBb0tpLvzT11SW9Ysh
	6tvOE5Qysbw+6d1viBhm8N/+ylWm24ojwYo7lTRPwNRnp1wHFAgC6YKDp5A+a71nCEwxVP6tLLuvW
	Dp47L10c/H1DmR6Ih5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot0xc-003MnQ-Ou; Thu, 10 Nov 2022 06:22:48 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot0xZ-003MmS-Ch
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 06:22:47 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4N7BWW315VzJnYn;
	Thu, 10 Nov 2022 14:19:35 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 14:22:37 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <rmani@qti.qualcomm.com>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v2] wifi: ath10k: Fix return value in ath10k_pci_init()
Date: Thu, 10 Nov 2022 14:19:26 +0800
Message-ID: <20221110061926.18163-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_222245_603840_AFF90101 
X-CRM114-Status: GOOD (  11.42  )
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

This driver is attempting to register to support two different buses.
if either of these is successful then ath10k_pci_init() should return 0
so that hardware attached to the successful bus can be probed and
supported. only if both of these are unsuccessful should ath10k_pci_init()
return an errno.

Fixes: 0b523ced9a3c ("ath10k: add basic skeleton to support ahb")
Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>

---
v2: modify according to Jeff's suggestion, and change the commit message
    and body as well.
---
 drivers/net/wireless/ath/ath10k/pci.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e56c6a6b1379..728d607289c3 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3792,18 +3792,22 @@ static struct pci_driver ath10k_pci_driver = {
 
 static int __init ath10k_pci_init(void)
 {
-	int ret;
+	int ret1, ret2;
 
-	ret = pci_register_driver(&ath10k_pci_driver);
-	if (ret)
+	ret1 = pci_register_driver(&ath10k_pci_driver);
+	if (ret1)
 		printk(KERN_ERR "failed to register ath10k pci driver: %d\n",
-		       ret);
+		       ret1);
 
-	ret = ath10k_ahb_init();
-	if (ret)
-		printk(KERN_ERR "ahb init failed: %d\n", ret);
+	ret2 = ath10k_ahb_init();
+	if (ret2)
+		printk(KERN_ERR "ahb init failed: %d\n", ret2);
 
-	return ret;
+	if (ret1 && ret2)
+		return ret1;
+
+	/* registered to at least one bus */
+	return 0;
 }
 module_init(ath10k_pci_init);
 
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
