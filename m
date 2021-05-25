Return-Path: <SRS0=/di5=KU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E909C2B9F8
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 10:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7747610FA
	for <ath10k@archiver.kernel.org>; Tue, 25 May 2021 10:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7747610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eD3CagxdQHEcJzVDrts0R977VK5EB0ugfToE6xYDKjY=; b=bq5OY0M+5LjJCO
	OWfP0/KqKUMa2x37UW6P/qUOQiLcxrj63m/LnnEkaDnY3GrSaKG99nXWOK06Bt0F4kOgnEuRC3+pV
	cUIu+opWvWJsVeZsDbznREuDwZsVuXqXjyTxI59TJxQWbuXQY2QjYMGj/FMLG45FH2z17YtoJOSLm
	SEi09rzpPqGBNlKP/jf8zDVst3h6DO1yeNqaIqStb8xHYd/+ijXSL757e60ul5TcHpXhbhasPZID4
	uj+5vIngbMb0i00uc7U3csoBEsZEWpAxa9F8IAkLQbGv94Hks2Mn7k35RqiswXEGD/iCdqB4HLCPW
	bEWKwBGT8hXuYWCC/AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llUa8-004dE4-Fb; Tue, 25 May 2021 10:46:40 +0000
Received: from out4436.biz.mail.alibaba.com ([47.88.44.36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llUa5-004dCO-0J
 for ath10k@lists.infradead.org; Tue, 25 May 2021 10:46:38 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0Ua4PKOY_1621939578; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0Ua4PKOY_1621939578) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 25 May 2021 18:46:20 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: davem@davemloft.net
Cc: kuba@kernel.org, kvalo@codeaurora.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] ath10k: Fix an error code in ath10k_add_interface()
Date: Tue, 25 May 2021 18:46:17 +0800
Message-Id: <1621939577-62218-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_034637_219275_0C66AE78 
X-CRM114-Status: UNSURE (   8.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

When the code execute this if statement, the value of ret is 0. 
However, we can see from the ath10k_warn() log that the value of 
ret should be -EINVAL.

Clean up smatch warning:

drivers/net/wireless/ath/ath10k/mac.c:5596 ath10k_add_interface() warn:
missing error code 'ret'

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: 'commit ccec9038c721 ("ath10k: enable raw encap mode and software
crypto engine")'
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 5ce4f8d..c272b29 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5592,6 +5592,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 
 	if (arvif->nohwcrypt &&
 	    !test_bit(ATH10K_FLAG_RAW_MODE, &ar->dev_flags)) {
+		ret = -EINVAL;
 		ath10k_warn(ar, "cryptmode module param needed for sw crypto\n");
 		goto err;
 	}
-- 
1.8.3.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
