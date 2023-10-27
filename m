Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E06DFC25B67
	for <ath10k@archiver.kernel.org>; Fri, 27 Oct 2023 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v7OI1CAyysKoa52Y2xN6pMrKQNgGG5QJTJfGTfNmoM4=; b=PS1F05naupXmss
	oo8OY2/1yCq3wSvJU/gp51C1s7h5iKuOYUh7UiZMZxTtimtJm9XV/t1KMKN8+6OJjNWBsmVDcEVNZ
	JxbEa7GcKdQAzkxzaNj38jEQVHPAB14jqX00otlOJigsRv5xOj5eG3OFWAmocua21rhFC/sPV0i2M
	njPUTVYnk7nyf4b/TzNae9o9h6p47JjJJIDaw4TmLL0VyGS6Sg/tXM92NNk/MMtIFalyLvOMkX24g
	JXyymDyViDo7hJllTPbZRE/HkNM7pWpsDRf/cbutsQIkAVd6cVC6mU0LpWEE2PYGFznGTdLkKOphf
	jsyAlJ6WY2IGGtTwpC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwI8o-00Fvf9-3B;
	Fri, 27 Oct 2023 08:24:26 +0000
Received: from forward103c.mail.yandex.net ([2a02:6b8:c03:500:1:45:d181:d103])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwI8l-00FveC-2V
	for ath10k@lists.infradead.org;
	Fri, 27 Oct 2023 08:24:26 +0000
Received: from mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:112b:0:640:c113:0])
	by forward103c.mail.yandex.net (Yandex) with ESMTP id 6C6C760A63;
	Fri, 27 Oct 2023 11:24:16 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id FOMODfGDeW20-2KZyRIKD;
	Fri, 27 Oct 2023 11:24:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1698395056; bh=6e2Y33FImmTf0qn7VHbP3LsSLfAcPTpja1q7ddEwKJk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=llN2U4SzGzpnXml93k5Z+dSiLUBqGUHKI0pwlmFQtEBXlka6smAdzA5MnXEYEQwPA
	 vpIaSU88KGdLcLT+rDobo7aYV8Y2sPRDihlO1udgh7sGWfEGwEWBvLtiqUEg03QtL3
	 rchbDETmdWzp44OkqP3f/J+NkYyKtRi2CyeRp0Dk=
Authentication-Results: mail-nwsmtp-smtp-production-main-57.myt.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] wifi: ath10k: prefer stack-allocated __le32 variables
Date: Fri, 27 Oct 2023 11:23:21 +0300
Message-ID: <20231027082325.126606-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_012424_305429_8AEBA125 
X-CRM114-Status: UNSURE (   9.99  )
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

There isn't too much sense to 'kzalloc()' buffer for the only
__le32 value which is going to be freed in the same function,
so switch to stack-allocated one in 'ath10k_sdio_writesb32()'
and 'ath10k_sdio_diag_read32()'. Compile tested only.

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 47 +++++++-------------------
 1 file changed, 13 insertions(+), 34 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 56fbcfb80bf8..5ce1bad417cd 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -238,36 +238,25 @@ static int ath10k_sdio_write32(struct ath10k *ar, u32 addr, u32 val)
 	return ret;
 }
 
-static int ath10k_sdio_writesb32(struct ath10k *ar, u32 addr, u32 val)
+static int ath10k_sdio_writesb32(struct ath10k *ar, u32 addr, u32 value)
 {
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sdio_func *func = ar_sdio->func;
-	__le32 *buf;
+	__le32 val = __cpu_to_le32(value);
 	int ret;
 
-	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
-
-	*buf = cpu_to_le32(val);
-
 	sdio_claim_host(func);
 
-	ret = sdio_writesb(func, addr, buf, sizeof(*buf));
-	if (ret) {
+	ret = sdio_writesb(func, addr, &val, sizeof(val));
+	if (ret)
 		ath10k_warn(ar, "failed to write value 0x%x to fixed sb address 0x%x: %d\n",
-			    val, addr, ret);
-		goto out;
-	}
-
-	ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio writesb32 addr 0x%x val 0x%x\n",
-		   addr, val);
+			    value, addr, ret);
+	else
+		ath10k_dbg(ar, ATH10K_DBG_SDIO, "sdio writesb32 addr 0x%x val 0x%x\n",
+			   addr, value);
 
-out:
 	sdio_release_host(func);
 
-	kfree(buf);
-
 	return ret;
 }
 
@@ -1758,24 +1747,14 @@ static int ath10k_sdio_hif_diag_read(struct ath10k *ar, u32 address, void *buf,
 	return ret;
 }
 
-static int ath10k_sdio_diag_read32(struct ath10k *ar, u32 address,
-				   u32 *value)
+static int ath10k_sdio_diag_read32(struct ath10k *ar, u32 address, u32 *value)
 {
-	__le32 *val;
+	__le32 val;
 	int ret;
 
-	val = kzalloc(sizeof(*val), GFP_KERNEL);
-	if (!val)
-		return -ENOMEM;
-
-	ret = ath10k_sdio_hif_diag_read(ar, address, val, sizeof(*val));
-	if (ret)
-		goto out;
-
-	*value = __le32_to_cpu(*val);
-
-out:
-	kfree(val);
+	ret = ath10k_sdio_hif_diag_read(ar, address, &val, sizeof(val));
+	if (!ret)
+		*value = __le32_to_cpu(val);
 
 	return ret;
 }
-- 
2.41.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
