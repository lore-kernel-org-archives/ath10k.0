Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC42C4167D
	for <ath10k@archiver.kernel.org>; Tue, 12 Dec 2023 02:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXzBG6YZWj7GIPOLgSmnK31hIBgVH/D0z2Wg9iUswnw=; b=przJ326kNQS5TqEVTlXvPTYxBi
	7fL86O3sFr2JPoTbU5P5gl06y44ECpR7RH0snv8w5QMNAo7dVTGlMHauyHPLVW60Jbjo6xE5uK7Od
	M6WLQrXcdKgrQGrVITrk729M+UO+vXlkfJvk9XAoGGkDvWlFX2wuVNsRO6V+SpMHc0sK2+/mWGMIv
	AQtJ0Kuj0wqHwDGFUl9MakrZrJwpEfMc2HnpM9d9xzcnQegb7ORBHXMAgiv10xQYDLYnvuSdhMZET
	CyLlVk8D9WJiQ7QLPGmgRZAzyFJ8XMm1ZscubKbcXZZIUOevAPVNvjGl2btxysaiErpbc+F/G5W9u
	66QuH4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsVP-00AWbb-2P;
	Tue, 12 Dec 2023 02:28:19 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsVH-00AWU7-0t
	for ath10k@lists.infradead.org;
	Tue, 12 Dec 2023 02:28:13 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5d226f51f71so50581507b3.3
        for <ath10k@lists.infradead.org>; Mon, 11 Dec 2023 18:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702348090; x=1702952890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXzBG6YZWj7GIPOLgSmnK31hIBgVH/D0z2Wg9iUswnw=;
        b=Y9lekHXaKggUxPvMO01WoCuexKuA24QhkYgYz8KmL+aaTSD6o5ewfENyvkH0BEiWiZ
         wBYl1Gpbr/nwfvodBgHSN6DMrBL34lBxJLHi/GI7iDrIGZae2Hzc+u6lK8t3/6V4SWZ8
         PKj5Z7C0H0dQCD5L/7RGehF4XYTgf3hcNWn3pfve0TLsavZrR6+DHwBvF27sHAJtYRox
         oyJQIdMS1kkEuXiBB8HGzBsNMoSjbNBSuftnm1R1j3QoqBUrLv+OTImWa5SO/9TgWt3L
         ixqIjOtssIG2z85urqma/1iZaAN9P0iNM7z+KUDkCoHh4wtvRtYY1FSEtnviXzSVwXSf
         LK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702348090; x=1702952890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXzBG6YZWj7GIPOLgSmnK31hIBgVH/D0z2Wg9iUswnw=;
        b=ouAXyTUTDUIYFwyoqQblqPwjYV+0tBPjA7CQtF+mZ2ScoDl7FL5MHslKJPXr1TUXaG
         lTBO13+oDj1KrR714taJTVkQlVo3B/mrx0KkJNL/mPA15+q1ypURz0bd0a7QXSzQE/+d
         Qp+sgdD4D1EgNuE931v5Tmjxf54MYLLg7xAbVDr+eCkMmbrxBd7C0DtTdOvjnA8c0NMY
         G4LtHULz4qz8XYUW2r2u2uUwod6V6TNnTGkgRrNSt5Zeea2u6fpybTQbTND6gq8602IF
         SkyfWPUf1iyIdwg00zTSBVFM4Ip+POv/f7rdGl5BhbtN82N+92jqh/9FAaxC+ti/wKyW
         wQyw==
X-Gm-Message-State: AOJu0YwC0eGuIrJZCwzbxc5UbgDjJFPXfxtLnIZlX/DdX0iyEgR1x3P8
	bR2O+y9Apv63vQx7T7iF+hs=
X-Google-Smtp-Source: AGHT+IEvJ/cdo/qBZ8m0qRhit8FNqJGxb/89AgN0CYWfyzyQakL7L0pgxHzUFK2IFJ46o//TnQm2MQ==
X-Received: by 2002:a0d:c484:0:b0:5d7:1940:dd79 with SMTP id g126-20020a0dc484000000b005d71940dd79mr4223699ywd.79.1702348090187;
        Mon, 11 Dec 2023 18:28:10 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:38aa:1c88:df05:9b73])
        by smtp.gmail.com with ESMTPSA id d63-20020a0ddb42000000b005845e6f9b50sm133308ywe.113.2023.12.11.18.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 18:28:09 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Matthew Wilcox <willy@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>,
	Alexey Klimov <klimov.linux@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v3 11/35] ath10k: optimize ath10k_snoc_napi_poll()
Date: Mon, 11 Dec 2023 18:27:25 -0800
Message-Id: <20231212022749.625238-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231212022749.625238-1-yury.norov@gmail.com>
References: <20231212022749.625238-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_182811_399669_56E68489 
X-CRM114-Status: UNSURE (   9.32  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

ath10k_snoc_napi_poll() traverses pending_ce_irqs bitmap bit by bit.
Simplify it by using for_each_test_and_clear_bit() iterator.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 2c39bad7ebfb..a1db5a973780 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1237,11 +1237,10 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
 		return done;
 	}
 
-	for (ce_id = 0; ce_id < CE_COUNT; ce_id++)
-		if (test_and_clear_bit(ce_id, ar_snoc->pending_ce_irqs)) {
-			ath10k_ce_per_engine_service(ar, ce_id);
-			ath10k_ce_enable_interrupt(ar, ce_id);
-		}
+	for_each_test_and_clear_bit(ce_id, ar_snoc->pending_ce_irqs, CE_COUNT) {
+		ath10k_ce_per_engine_service(ar, ce_id);
+		ath10k_ce_enable_interrupt(ar, ce_id);
+	}
 
 	done = ath10k_htt_txrx_compl_task(ar, budget);
 
-- 
2.40.1


