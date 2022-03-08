Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E78C433F5
	for <ath10k@archiver.kernel.org>; Tue,  8 Mar 2022 07:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNlTvc0eq9MHECAS/4jsQ8KvNcNMi1+tKXIXvZMzlIs=; b=Jgni/NEI17oI2/
	vHYMvNfx23Ic/X2Wdmd4uiZUHd0X8d1nhHzSJB/qs5qB4ptiImu3S6rkOFHCjPCyQOJzSXvJ968J6
	u1vqA3emqmaX/eOsPsjfPi/SzCl+bDGlX0+iJgMK+QMD/e8pqzbIWbiAmx6qnVHjgXVnV4AIiYK8l
	xKqRrhD8PUSvcgCEkHlc0l4ILvAIY9JuNPdS/CrsKxJKBqaQcom/uxhR4tbdtCgqC4LTOrWsySOFp
	vUa/0vnYwqc/k3uphxi84WOWIkK06xkebuW7PxvwrdampYSAz4DCMiyuzei+OLYN3+m3mJWrtQ7ZS
	CxZenJJd6gkEh9O3n4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRTrq-002zDq-4V; Tue, 08 Mar 2022 07:02:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRTro-002zDL-4h
 for ath10k@lists.infradead.org; Tue, 08 Mar 2022 07:02:45 +0000
Received: by mail-pl1-x629.google.com with SMTP id z3so7758821plg.8
 for <ath10k@lists.infradead.org>; Mon, 07 Mar 2022 23:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=A8EZjLfRCVLiqLB95fXPDgz0vTM6xfddeH/ZPy1XLa8=;
 b=e9VqiE0WD1f3eFyJbCKD5qtmN1MWAWvdxaMntfWIthz3hSCIyboXWObl6FvkQJhf/p
 AMHsv2ZHs4U5r2D+C+PngLux5lPfMiMXA5GFXSC9kibXFbQMfp8qjQAc0KbHrUFMfJyD
 kL8YtGRmo+LKsr8gfFWwLI8F8juVwgFSSzZeZyPFr5Rg5tmjkAQxtEG59rEoHHUCbdoy
 MEjTTtOVWk93reFJ51LPGpCEpazYQPKO7JR8HNOPpWFq+8C2nYUIvxWKxZz/qhf7wFez
 cW67Wa2SXlWnyjkJSf0N9tT+NynaAhfozGbWF5MM5tjZ5wjIaF6nya0mPuYpFKAtEJ8O
 Tmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=A8EZjLfRCVLiqLB95fXPDgz0vTM6xfddeH/ZPy1XLa8=;
 b=qfHgBa4QE+xrfYU/vXlXHUK1/ZEGq/S2dm0qCsfUbL83lH+p2wzDc1wipkNLfHY0tp
 QptSHVEjF+pbTbdAJuKl64iu8nq4DhBiDJWYvUejrY5u8iC5Hf712dRo2F0+V82h/FyO
 pIl3NyszQgGnZWnUr2oQchiOIdr2A4YLMoVklYmdAxJH8d5m4a9pnk3LhkWbm6JDeEwx
 tedWuPwj4+WCMqT7fAYE4goYLgUstf14RK1i/GQ6UJVzT4kEQdaAMu3UAmIUgEWSq725
 OtNf76jqZ565j9aA9PAZtFEc0xCaS2GnbtID7er7yiWTWaykJq6XgEn2qwRxW3i4QslZ
 sAzw==
X-Gm-Message-State: AOAM5337I5V6Lzm9g4PGxAXa4FQjB9k2GekHHhuGPwGNx5OFQyCFWHLN
 C3hcv5BmsHW1ZwhAQwGh6GM=
X-Google-Smtp-Source: ABdhPJxGjxKfzDA2Y6r5ZxA67siNwEq9+SHU4CNGHkyYjf7dSP1TEsEhH8CTFj+l7OWKdjvW2BMCRA==
X-Received: by 2002:a17:902:bd88:b0:14f:8ddf:e373 with SMTP id
 q8-20020a170902bd8800b0014f8ddfe373mr15762890pls.89.1646722963584; 
 Mon, 07 Mar 2022 23:02:43 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm18072135pfl.41.2022.03.07.23.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:02:43 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rakesh Pillai <pillair@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] ath10k: Fix error handling in ath10k_setup_msa_resources
Date: Tue,  8 Mar 2022 07:02:38 +0000
Message-Id: <20220308070238.19295-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_230244_209016_8E819CD0 
X-CRM114-Status: GOOD (  11.89  )
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error path.

Fixes: 727fec790ead ("ath10k: Setup the msa resources before qmi init")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 9513ab696fff..f79dd9a71690 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1556,11 +1556,11 @@ static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
 	node = of_parse_phandle(dev->of_node, "memory-region", 0);
 	if (node) {
 		ret = of_address_to_resource(node, 0, &r);
+		of_node_put(node);
 		if (ret) {
 			dev_err(dev, "failed to resolve msa fixed region\n");
 			return ret;
 		}
-		of_node_put(node);
 
 		ar->msa.paddr = r.start;
 		ar->msa.mem_size = resource_size(&r);
-- 
2.17.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
