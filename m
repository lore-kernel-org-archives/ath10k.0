Return-Path: <SRS0=aCQL=MO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99235C4338F
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591D460EB8
	for <ath10k@archiver.kernel.org>; Thu, 22 Jul 2021 19:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 591D460EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ojab.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=elpueKQYrnACKUMN+KypOzXBsL28J5M2Lf+vDqSMJ74=; b=YksF9fKe+OJ75c
	hnWBg1yTgqaKxjf35deQpEKXVS02AKDXN3DllyZQ9+CkJ69NGmuEVHPS0A4qPPKE6r/o4+7zduapL
	StNxWh6FTHDUDHAlvXYCkIGUcmK9h2sjkewohAYi9m18uPER0ztN5wAxQDG6wmLXs4wC5enrfNgGi
	8/VIvfCEJ/uHsww+BqvV+tDCtnZ7PJvPqQ5UEQEccwCUuDXkKndZWdnghF7yT5yZzHMdTX7pEPbuy
	MkTkEAPSkJfUC4yx4E6RZVcyAe5MDcSJX+C4uvmFRz+x8TyayKoElIxzGHXslMdTV+lk8/LplF4WU
	rsbQt7hdn9VzCNoYBcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6eUg-002Zz6-64; Thu, 22 Jul 2021 19:36:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6eUd-002ZyZ-Dy
 for ath10k@lists.infradead.org; Thu, 22 Jul 2021 19:36:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id m16so10175526lfg.13
 for <ath10k@lists.infradead.org>; Thu, 22 Jul 2021 12:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ojab.ru; s=ojab;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jaMEi86/yRIF0nStxKvMT6tnJtS/t00o8y+9paLHic=;
 b=X5vNGwcPHmK39Sz/ZOY9rK5FOMkon7mIL6VGiwyEEzzWSybiBBIMLzUUHMif2LTtqU
 yEqELZv9aNUlhu0MBKg9PcotCpo1hpOCJwk9AJuKwxkpyRKzvYwuqZpuwGhpablx+8Ax
 zF/6t8I+ipzbTfQAc3Ur8Nbbr/b97Y4to0AOlgudq16Ze8JlRRv99HbBHqtj6QnUqMOn
 5RuZLfssgke8dR+fNMucQSDg0jRSwabJQIZZQHxfC3Kyk4AouHT3dAwhakGo86lD80fQ
 2cb1iRBSENupsQ7N4kcrsy/x8ROL5/zFwLS8EuUlZHvBiYegqTr4ag8J8p43uYOG3Ndt
 uEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jaMEi86/yRIF0nStxKvMT6tnJtS/t00o8y+9paLHic=;
 b=Os7T09Z+rQf5c1/bIb9z1CgsurOIttS5ABWiDnjqHyQfzqwm2oGJpSYEUCjWBmmsXp
 yxkimDAmZswxIZ/27/Hw6l4mvflSP5p2q1QegY6n0miBrod8eSGLFd9O2hOhDxesCt9E
 EWnv9ot9HB72cTlSjxpCBF2qWeokxfo3bycqVM6mAlRyraWclKqClMxOtkey/XBVV+zG
 AqxeaBZwZFrxSggpUdLmrvdXPdoYidQoPCoAhRcc50pW10giU8lPzscOZDmGpTMyguTh
 VCeneA8g7sI9vwAFWhGE5JtiKicVri6d15osdlNzVV1m02n6nacM0LC6hcZjyjG8gHEn
 vf6Q==
X-Gm-Message-State: AOAM530DfHXHZeHtr55M3zrVNLIc/99jxn5x80Q4v8dbxlW0JUfpcGQh
 P9X67mRTkCvqnr1f3rNEvG933A==
X-Google-Smtp-Source: ABdhPJyOCiVVxo9BvQ0t3cC1n/byEnaEHoXTNRxQm7kyHIjkLcm85M3Pt0R0CeGSJO/NFBRLNOox9g==
X-Received: by 2002:ac2:5684:: with SMTP id 4mr641352lfr.386.1626982585593;
 Thu, 22 Jul 2021 12:36:25 -0700 (PDT)
Received: from ojab.ru ([2a03:e2c0:1ce::2])
 by smtp.gmail.com with ESMTPSA id n8sm1813576lfk.198.2021.07.22.12.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:36:24 -0700 (PDT)
From: ojab <ojab@ojab.ru>
To: Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Cc: ojab <ojab@ojab.ru>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH V2] ath10k: don't fail if IRAM write fails
Date: Thu, 22 Jul 2021 19:35:00 +0000
Message-Id: <20210722193459.7474-1-ojab@ojab.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_123627_518198_84E9DFA9 
X-CRM114-Status: GOOD (  14.06  )
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

After reboot with kernel & firmware updates I found `failed to copy
target iram contents:` in dmesg and missing wlan interfaces for both
of my QCA9984 compex cards. Rolling back kernel/firmware didn't fixed
it, so while I have no idea what's actually happening, I don't see why
we should fail in this case, looks like some optional firmware ability
that could be skipped.

Also with additional logging there is
```
[    6.839858] ath10k_pci 0000:04:00.0: No hardware memory
[    6.841205] ath10k_pci 0000:04:00.0: failed to copy target iram contents: -12
[    6.873578] ath10k_pci 0000:07:00.0: No hardware memory
[    6.875052] ath10k_pci 0000:07:00.0: failed to copy target iram contents: -12
```
so exact branch could be seen.

Signed-off-by: Slava Kardakov <ojab@ojab.ru>
---
 Of course I forgot to sing off, since I don't use it by default because I
 hate my real name and kernel requires it

 drivers/net/wireless/ath/ath10k/core.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2f9be182fbfb..d9fd5294e142 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2691,8 +2691,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 	u32 len, remaining_len;

 	hw_mem = ath10k_coredump_get_mem_layout(ar);
-	if (!hw_mem)
+	if (!hw_mem) {
+		ath10k_warn(ar, "No hardware memory");
 		return -ENOMEM;
+	}

 	for (i = 0; i < hw_mem->region_table.size; i++) {
 		tmp = &hw_mem->region_table.regions[i];
@@ -2702,8 +2704,10 @@ static int ath10k_core_copy_target_iram(struct ath10k *ar)
 		}
 	}

-	if (!mem_region)
+	if (!mem_region) {
+		ath10k_warn(ar, "No memory region");
 		return -ENOMEM;
+	}

 	for (i = 0; i < ar->wmi.num_mem_chunks; i++) {
 		if (ar->wmi.mem_chunks[i].req_id ==
@@ -2917,7 +2921,6 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 		if (status) {
 			ath10k_warn(ar, "failed to copy target iram contents: %d",
 				    status);
-			goto err_hif_stop;
 		}
 	}

--
2.32.0

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
