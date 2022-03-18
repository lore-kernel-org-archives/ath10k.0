Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F779C433EF
	for <ath10k@archiver.kernel.org>; Fri, 18 Mar 2022 02:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eV8K3bn7pxwp/1Lc0+aWZF3TJQnjsDpMfcXgHNLEcmk=; b=WnpCnsHUUdQ84z
	px/pPuMioVa6xscDITOd9QMTseODjmf/OJJZbcZ6ZAfxi+eLj4Rx1/qmyKtXIMgdm2sgpBfjtKQlv
	pDmZP16Rfcc0JQhfb4UN9r0rHlHuT5H0GkuSXBQyrNj0UI1i2ksb+HHLCiE875wLAHEEoItrT4idb
	JolHCcQHo0QB1UPyaSi7lhPKY9xNAYfSKtLYQKhJcwnM5g9rGE8P+uAfN8aRLvNeeXidmprJOaxTL
	yg6k6FOHBX/Z21tSLMojrc5zPfwu3yulrRcmxhch1yet4fH6gclhhLT4Ur5xMIIFimzIXJl8m1u06
	NYO6ok1qkN96fBOVK0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nV2km-000DkC-Fk; Fri, 18 Mar 2022 02:54:12 +0000
Received: from smtpbg702.qq.com ([203.205.195.102] helo=smtpproxy21.qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nV2ki-000DeB-RU
 for ath10k@lists.infradead.org; Fri, 18 Mar 2022 02:54:10 +0000
X-QQ-mid: bizesmtp75t1647572020t6n26plq
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 18 Mar 2022 10:53:33 +0800 (CST)
X-QQ-SSF: 01400000002000D0I000B00A0000000
X-QQ-FEAT: 9ftZnmyzxdiZygKhI/a9zsn2Ql3YkPwABNkaIECyxsLsHR0HX3LZxYTXcGRQN
 m/KV9Td9UttvaF421hJafNdN84yLyFLXh/3SwI7fhumPIHVOoHQgSiKgC6wYUJ4uBnotNI5
 yFUoyEco1kDAEXwtm7AV5ryuizUoeRS1ejNF4WSIdoDVNn7uPb2ClEkj+s6SFSQ96xRNEiY
 gkWb4KfvTqoNIcND6cSWlOwVAazxTUxi0TnJJ3aq933vRODCyB5Y11SzXTEefnQfefI9NYJ
 4P3CeX/j6o7pENkfjLH1G8vJqsf7I9ETEi0F2ql4tDe7sGBEKDp+l2ojgC7ytO/AjU2BZcW
 Y3rd8xrdbXQ4adIcfUgTADIuPO9iQ==
X-QQ-GoodBg: 2
From: Meng Tang <tangmeng@uniontech.com>
To: kvalo@kernel.org,
	davem@davemloft.net
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Meng Tang <tangmeng@uniontech.com>
Subject: [PATCH] net: wireless: ath10k: Use of_device_get_match_data() helper
Date: Fri, 18 Mar 2022 10:53:31 +0800
Message-Id: <20220318025331.23030-1-tangmeng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_195408_950737_0DE1B703 
X-CRM114-Status: GOOD (  10.23  )
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

Only the device data is needed, not the entire struct of_device_id.
Use of_device_get_match_data() instead of of_match_device().

Signed-off-by: Meng Tang <tangmeng@uniontech.com>
---
 drivers/net/wireless/ath/ath10k/ahb.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index ab8f77ae5e66..f0c615fa5614 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -728,20 +728,17 @@ static int ath10k_ahb_probe(struct platform_device *pdev)
 	struct ath10k *ar;
 	struct ath10k_ahb *ar_ahb;
 	struct ath10k_pci *ar_pci;
-	const struct of_device_id *of_id;
 	enum ath10k_hw_rev hw_rev;
 	size_t size;
 	int ret;
 	struct ath10k_bus_params bus_params = {};
 
-	of_id = of_match_device(ath10k_ahb_of_match, &pdev->dev);
-	if (!of_id) {
-		dev_err(&pdev->dev, "failed to find matching device tree id\n");
+	hw_rev = (enum ath10k_hw_rev)of_device_get_match_data(&pdev->dev);
+	if (!hw_rev) {
+		dev_err(&pdev->dev, "OF data missing\n");
 		return -EINVAL;
 	}
 
-	hw_rev = (enum ath10k_hw_rev)of_id->data;
-
 	size = sizeof(*ar_pci) + sizeof(*ar_ahb);
 	ar = ath10k_core_create(size, &pdev->dev, ATH10K_BUS_AHB,
 				hw_rev, &ath10k_ahb_hif_ops);
-- 
2.20.1




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
