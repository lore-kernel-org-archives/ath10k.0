Return-Path: <SRS0=591D=LR=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BB5C4743C
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:14:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDD6F610A0
	for <ath10k@archiver.kernel.org>; Wed, 23 Jun 2021 19:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDD6F610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GTYyiMDyTo4DUTgDuDWKXZTNjf2c07VoamcRH0bkiW8=; b=mB8tm79BWrn8yp
	MeuNgXWfXR/jzRrcNGvBZc81l3lbkMoQcXL+c8d9CwUlF9vLZIqP4MRKEaddqySgvI6KZvJUGn1aX
	QQnI7+dr9BveW9zow4rTOhcoWE7KOfx2DZrdZqO4COf+tA70sO5ppapUS0rjmTazGKd8uvdZHB9bE
	+2Mj/QjE+bR8leCqCN868joBkWUXiVGn7yyDYszRc2Ah4aVJ+AkUzui2ucffjVk1BW1plLK2eaNZX
	QYaGzQ4vXf71TQDC6hFNr99XadQpYJLolqbZgXRcsX49NkRmu346sNQTyku4oNEwMKKzHzyh//aMa
	mZUhAZytORBoC+xmdU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw8Ka-00BlQ7-Qu; Wed, 23 Jun 2021 19:14:36 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw8KX-00BlPR-Kf
 for ath10k@lists.infradead.org; Wed, 23 Jun 2021 19:14:34 +0000
Received: by mail-lf1-x131.google.com with SMTP id i1so5930741lfe.6
 for <ath10k@lists.infradead.org>; Wed, 23 Jun 2021 12:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCA9UxJ+EMCBunFdIzfCgcc8cOVFYGFyGgIL+e4eYGc=;
 b=UzNhGzf3APIIvFvjJsrVV26jL1WdkAkoAwzH5J+sxCyYYAY8XvjzLBKarHlYSgEW+H
 ROakHkkCfn70i7JTu+yHbCUbnkuPf7TkqgAOUJt1d0Ms8qGccgWOFHX7YAWXLuxF4qZl
 U/XbtVMPj5nLRPkZKpRykEAA6jKBoO5kEXNfZAlVD+EWR1Led/Uz5YOVeudBbQyx3X57
 OurvlnmzdOoSny+LJAPPAbww4QTxM0W6d/VHRAR8uiuhK1xGiMG1A94AOKVZJSkD5qPj
 0bbbGsEAChYON9jaMET8xnLxvZDByABYXkAbL4e6Wq3VBH9HdfNQcUsTU0Os2aMchm45
 AXkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vCA9UxJ+EMCBunFdIzfCgcc8cOVFYGFyGgIL+e4eYGc=;
 b=AtBcaIMRrW8BD6OSdLU33sdbFsDQ16BMw+GGZsGnuuGk4Fh9iOVgwIFsy1QBdsfwVS
 MQuhkUkaJpepf8DXcV8d87jRarYk43xbu2+YdW6Tv/EIfSI3s6G9GAyjL0Y26MRE/PR2
 auJFoiAzfSs1ntxEFZ4MBZLX0XK2CTnETvmYL5elBGoaQPnAR7xY33+jOXxL+Cw9qtnw
 /452mnRNQsX7YygCn4c3TIWO2RXzX3uJbQ9GNXdVE3+2F29vgRoqxDR5N2GTEAbBLTN0
 iTnxq7BubH13TAAcLVLrKN3FQNpjZxAu3vTtAwPCXS32LDP/aTAVMZYvg8UxtqlH2Kjd
 UMDg==
X-Gm-Message-State: AOAM5301vZa0fPe0uzvyqVLLvPdJRShiKKCHR6az/43d9vDQBLa+bIGR
 VD/mg38QWd6ia9ATdpKcSqY=
X-Google-Smtp-Source: ABdhPJwEryE5nA4/ztCF+DQUY46j/ZZB0JCfX0QWNYwk/Gjoy0mw/XvPRg1ombAoJ9/Rq/4JX1XHwg==
X-Received: by 2002:a05:6512:b26:: with SMTP id
 w38mr859979lfu.227.1624475670940; 
 Wed, 23 Jun 2021 12:14:30 -0700 (PDT)
Received: from localhost.localdomain ([94.103.225.155])
 by smtp.gmail.com with ESMTPSA id w4sm79724lfr.282.2021.06.23.12.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 12:14:30 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: kvalo@codeaurora.org,
	davem@davemloft.net,
	chunkeey@gmail.com
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] net: ath10: add missing ret initialization
Date: Wed, 23 Jun 2021 22:14:26 +0300
Message-Id: <20210623191426.13648-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_121433_738280_9037072D 
X-CRM114-Status: GOOD (  11.80  )
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

In case of not supported chip the code jump
to the error handling path, but _ret_ will be set to 0.
Returning 0 from probe means, that ->probe() succeeded, but
it's not true when chip is not supported.

Fixes: f8914a14623a ("ath10k: restore QCA9880-AR1A (v1) detection")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index e7fde635e0ee..36ea8debd1c7 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3697,11 +3697,15 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	}
 
 	bus_params.chip_id = ath10k_pci_soc_read32(ar, SOC_CHIP_ID_ADDRESS);
-	if (bus_params.chip_id == 0xffffffff)
+	if (bus_params.chip_id == 0xffffffff) {
+		ret = -ENODEV;
 		goto err_unsupported;
+	}
 
-	if (!ath10k_pci_chip_is_supported(pdev->device, bus_params.chip_id))
+	if (!ath10k_pci_chip_is_supported(pdev->device, bus_params.chip_id)) {
+		ret = -ENODEV;
 		goto err_free_irq;
+	}
 
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
-- 
2.32.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
