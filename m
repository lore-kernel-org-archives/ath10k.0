Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75C0CA0ED1
	for <ath10k@archiver.kernel.org>; Mon, 11 Aug 2025 22:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XGdw+3/eqo8YkV2PsrcnOH6vTKbUsfuUgKSwYeGkCMc=; b=h5DRVml4tNXKB7a4OXe+HEYYmE
	U+fwC5jwKJNNxqBJAn0gsHwRHkFMvS8qg48xznwkQd+ijkaFulG9L4REDZ91nNWJMSWLwgElIT3Cq
	8kLfR57WKf6w93GqZHzvDjM7Te8FABz4xYDji0MDuthf6H+RPweCADp3V5UWvDC89rSA9kaS/8mEO
	9GDvs+2XtsXlCdcSl+o/LDL2yVJLTWVnUV3aZXnEFGuk3YFZ8dhb56+j/0Wd/vI+b5z3fyTZMBG3k
	HoOhFASW0aHD+h7MRR0ogpuzzBeKnLEyXI4UC+NiY1UjCbWod97Dkb4/52vbI/42tsG7vg0BYilN/
	K9uBxGyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladY-00000009EMb-0tum;
	Mon, 11 Aug 2025 22:05:00 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulZEO-000000091e1-1YOz
	for ath10k@lists.infradead.org;
	Mon, 11 Aug 2025 20:34:57 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b0c5d57713so29629001cf.0
        for <ath10k@lists.infradead.org>; Mon, 11 Aug 2025 13:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754944495; x=1755549295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGdw+3/eqo8YkV2PsrcnOH6vTKbUsfuUgKSwYeGkCMc=;
        b=Cpi1YQlV7axh7BfQzGaB0JP8YWg/nzJsDjBhVcekzK6Cq8lY+Vv2Q4PK4pfH9oHdYO
         kKULHjyzYRMICwiVat3grlPQBCEQVKe65WpX/ves+F1HP8p4CT8kWlk8ryve6reOZx9C
         HORnP0j/n7VO709h3kk8G7JMcBzR6IEWGYZoR6rM0NztCt+fY3XyIfIK12B+jzdgxWe4
         W0/U/ccGuUlI+RNivuZ8HPk8CPrS3Sfeuj24ez5IP7yWVEyzdZzvXlPWGPXEzZeSUy4Y
         ajjuRy4ooLJTJ9C5so6vdSKUF9j3nXKFgTHJNG9z4f5ieHzxff7AIvmYwQoVN0/nme4d
         h57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754944495; x=1755549295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGdw+3/eqo8YkV2PsrcnOH6vTKbUsfuUgKSwYeGkCMc=;
        b=g/w2oBY4Ov/YRMNzYhZzYCSxS0NgrgmExB9fLZCmwZMf4YX86Yua3J2G7V/2evObE7
         VWEo8pFk6NqxoVaEV9VlaZ5k6bnWekGYupeHiBZKiiDjWo9DJ2uSnpI4PfmuvzbUVDym
         eHX6rwevS+LEUyPGcCuvmqeU1I4M324EldRG963ShHammsNPv80v9r7W7zvc9DQVqZUY
         A9DKnDDhXPKRedTgIJgpT9pZ2zdTdJmyC5Df01ptip2DEpta58o8ciM60SvPjS9o1kLN
         OhJbwm3t6FpLTJxKDqWHZVh2nyHxRNSNCVUEfMdOia1wdP8AHZ8TVtN+502n09NOAret
         5P5A==
X-Forwarded-Encrypted: i=1; AJvYcCUVdXfvJE7wqakfAiQUj1c39aKTna7CAz4/CmUr12zvdI37GvD6jtPoETfj8zyLR5uSTF80vwg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyix+cuWPlQ7V5gGpVW5Vi3nbMQ1Gure5+ZiOT8r2V1gbl8T5Wp
	3jTHppP4HtYleSO0YShywbSJiO32D2RICa+3efCnmBJ59XrSi/MYaRoi
X-Gm-Gg: ASbGnctdtGRROPKsdC2jaOlMtpo8nrt9Rv59BW9Z4CnOeSLWvg8AlGzhYrv0coQ3svj
	7TONSz0cyjzzzXC2pQycQjurdUx7vX/pwQHdbAidE8PuCVHtNQp/dHsMbnrgAkn3mbkaiCCxncC
	bkQrteneOm4WhL0MGornn+EJDwFjYZvfzP2UAhmdH3yIkNhpqX91Gjz1c0iou4McLqjqaa5bbJf
	MqULtg/knmnVHhMUMxmZTo9sB5VeLydCGBNf0JiwiWQhNcoFJBdyc3/qbxQeFDML+lC1do8BF7E
	qM4hSBso9s1YxSh4eZsjfn9//CD5s3oUUZrlkYFqucChNlNNO66E6En0heIwSml4szR6QN8RKQv
	MflqJruwInBpGiQ==
X-Google-Smtp-Source: AGHT+IH5oYNZbp6lFLpvzwx/XO/iWNKukKsiHkMjSLleCkQatdFNfPyBQ5+VfWt3odmW31cO1Vz8hA==
X-Received: by 2002:ac8:7d43:0:b0:4ae:f961:4f57 with SMTP id d75a77b69052e-4b0eccd7751mr14047561cf.55.1754944495184;
        Mon, 11 Aug 2025 13:34:55 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b09da0eaa2sm72432321cf.49.2025.08.11.13.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 13:34:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	miquel.raynal@bootlin.com,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 ath-next] wifi: ath10k: add nvmem support for mac address
Date: Mon, 11 Aug 2025 13:34:51 -0700
Message-ID: <20250811203451.3763-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_133456_408084_20BD486C 
X-CRM114-Status: GOOD (  11.88  )
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

device_get_mac_address is a generic way to get the MAC address which
lacks NVMEM support, which tends to be used on embedded platforms.

In case device_get_mac_address fails, try of_get_mac_address_nvmem and
handle EPROBE_DEFER to wait for the nvmem driver to initialize.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: keep device_get_mac_address and use of_get_mac_address_nvmem
 added Miquel to CC. Maybe he has insight.
 drivers/net/wireless/ath/ath10k/core.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..8214b0c0ea80 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/of_net.h>
 #include <linux/property.h>
 #include <linux/dmi.h>
 #include <linux/ctype.h>
@@ -3456,7 +3457,11 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		ath10k_debug_print_board_info(ar);
 	}
 
-	device_get_mac_address(ar->dev, ar->mac_addr);
+	if (device_get_mac_address(ar->dev, ar->mac_addr)) {
+		ret = of_get_mac_address_nvmem(ar->dev->of_node, ar->mac_addr);
+		if (ret == -EPROBE_DEFER)
+			goto err_free_firmware_files;
+	}
 
 	ret = ath10k_core_init_firmware_features(ar);
 	if (ret) {
-- 
2.50.1


