Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC90C2BB3F
	for <ath10k@archiver.kernel.org>; Sat, 18 Nov 2023 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukz2tw2fXzu/rIvfUxGms/2UIqIrv+jizs3ZzcD8nB4=; b=Sb3l5bSBJXFcum
	11LagHpq6fML1Uowh0mwjIpQLqGoqWdvcqHiwH6yQeqjXb97mA4zHqAod7gOotzTRpJj4Z4fyxmdN
	YqT6o6tleDdNlF83+AlzOpMYP5GWAf0S1Gl1LVYLzCgZi92sg33dDZeHs7YNTLv9ygakj8wwZgBSF
	OlgP+YnTY22z9PVEnW8wM0EZIC0xFDbX2TLm0B25F23Wc3P7JvE1AEmPN2u98LyP0yLW28J07o2SX
	P6kFUJCf01reqEidDSVL3zoZrKnb+NPA4fvlAz7o+x5eU7cdFpcddRcGkbCSbL1exWj36MmEUsIOx
	LWSu9GOBa57scnavlTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4NbW-008lCF-1a;
	Sat, 18 Nov 2023 15:51:30 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4NbT-008l7z-0W
	for ath10k@lists.infradead.org;
	Sat, 18 Nov 2023 15:51:28 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d9a6399cf78so2391154276.0
        for <ath10k@lists.infradead.org>; Sat, 18 Nov 2023 07:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700322685; x=1700927485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrDABjtie/YsTla3oR4TwoLfOAKA91LiKhvoQvuKuZ0=;
        b=KQ2UCDXmzFG3/IPz2XKRTkgg2ZIXmu1hwK8kHaQiw2rnZC06yghdprwgSxfp3Jb9iD
         K02cIZyVNFxMFSApWRnT8YZVGhzQjeX3/CQYRzzNJ6qe3jX2yynxH8xgjJ5cvIKqZzsa
         vYf1UzgAOz0HLqs+h/KvRzdU1mr0c2UZ6CGtLdy1azI/9bjwnvi4YtrIGTizzR78JdoF
         l4Mg9xXybzCccV5Q9VrincxGsSZj/Q9HUIviBbpEAhSEBtJfzwtvl9aw9xpa8SrcjfR6
         fjILqpeEScye9jkJiFdxBqz5xvlkRikPqeICZqI56KaJfDHD6+Y9vbCAg3/crYdeBGTn
         +y5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700322685; x=1700927485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrDABjtie/YsTla3oR4TwoLfOAKA91LiKhvoQvuKuZ0=;
        b=c80jAuk8ar4BaOBvbSNQ76ZqMaI627Z/y0Wb+ImUA1d8pm1Y26vTsG2pGht7PpHOTY
         wgM/57fTtrNJ0h0vydaRqqSc40it8YMZa+JXHMzmGup7qGGdN9WP6NEvt0FsNN4P+hLT
         uW9heGiWXb7p62XHjccZueH21PsmxT4FgsgYQWyhEVI+L/6RXGvPEcB/z6HMrcm1B+Ju
         8vtvkwamCAxHVREMx+EkMbVez9RREm/VZ975EctCkVkVF4eMb4mXQlY7Hcy+bra59F3c
         c7latAFAEVGq+8KliZ4Ej+1ocnfl9JUIKPmt+s9szcGYdaqN5jh8UgPxOSLwOb3C7uEX
         R0pQ==
X-Gm-Message-State: AOJu0YyMqvptolfyi40oP/o098BzNG/0Zbi9AW4GUBOGS2jNMNqw4QSk
	mfOytCPGuoofXhMf6GfGL1I=
X-Google-Smtp-Source: AGHT+IFTfzteXdMOCngH4g6ThBL8jMLQtAxdwFQMPhz1ymRIf3wQ4UJX7I6T1IJmIedN4upY2EbAuQ==
X-Received: by 2002:a25:ad4f:0:b0:daf:7702:fd60 with SMTP id l15-20020a25ad4f000000b00daf7702fd60mr1666269ybe.1.1700322684938;
        Sat, 18 Nov 2023 07:51:24 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:48a9:bd4c:868d:dc97])
        by smtp.gmail.com with ESMTPSA id e14-20020a25d30e000000b00d9cd730e4d0sm1000457ybf.26.2023.11.18.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:51:24 -0800 (PST)
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
	Alexey Klimov <klimov.linux@gmail.com>
Subject: [PATCH 10/34] ath10k: optimize ath10k_snoc_napi_poll() by using find_bit()
Date: Sat, 18 Nov 2023 07:50:41 -0800
Message-Id: <20231118155105.25678-11-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118155105.25678-1-yury.norov@gmail.com>
References: <20231118155105.25678-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_075127_256538_6C3B2AF4 
X-CRM114-Status: UNSURE (   9.05  )
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

ath10k_snoc_napi_poll() traverses pending_ce_irqs bitmap bit by bit.
We can do it faster by using for_each_test_and_clear_bit() iterator.

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
2.39.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
