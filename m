Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4013FC10DCE
	for <ath10k@archiver.kernel.org>; Sun,  3 Dec 2023 19:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GfnViHUiQRdwcyME4SHx6F8gnhZe+b7onoGZNvEd7Lo=; b=igBEc4hUcNT2nskCCwfClW+3Qs
	m5RL4c6a13st8GJP6h3+zYsbDpA6w/l9oJ5Emt04P5H8oQLVURsYvySVcnkz9ZN0Stba6MNx2eO4s
	SbgZ4XBtJdkBSUqzGIN3oXgtA3eAoCoSf8l+seK0Er7ffDsACXSme7wTIlz2NeBI8XXbl4au3xrtK
	qDFihmMI3xQzONh9iYQZWuT2dtTp6IC4Fh9CAOi5n6YlLsp1b/Uks0SFhIUQfpzj7dcc7xgnf5Mx2
	D7DU74Nzii/VDuItum3OPtV7PeF+2AkPS8+z42x8VnBQNN67GGqu3DkDGVjTdzxLAfS2D05CSOn6y
	6T3UH+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9sDb-002W6S-2s;
	Sun, 03 Dec 2023 19:33:31 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9sDY-002W3N-0Z
	for ath10k@lists.infradead.org;
	Sun, 03 Dec 2023 19:33:30 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5d77a1163faso7151767b3.0
        for <ath10k@lists.infradead.org>; Sun, 03 Dec 2023 11:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701632007; x=1702236807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfnViHUiQRdwcyME4SHx6F8gnhZe+b7onoGZNvEd7Lo=;
        b=a519Q4QUADLqFQKP0KeeKlWY7EVdtMEs2ZHwc4hckVQ6WZ2AiZYeGoy+QzotS1f8/K
         8/AwPBXpGFwtioQFfrZsjsFQlpO0ujbBFmFgP725aybdDHzLNKyhz419sEJ41CLm12iF
         pkWPpEgrkJn/fZ2fcJxKRrj2Jdx1esL1uQR6f5eqN+5rF3ZC3AKUjEQ2Zh0AaXB4wVlR
         HbcfoAq3grNIf1A0PfrodS4RX+tDw9JxJf3uIN6lzTGJZGenRV4e95jjTEIL7tb+uYXm
         +a0yZ2ebOtVL8dUi/Ta5uT8EctPe7sUFyMyF3I3tRYkSQZtmAeJ2nza3LaJUTRtOMLCp
         3Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701632007; x=1702236807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GfnViHUiQRdwcyME4SHx6F8gnhZe+b7onoGZNvEd7Lo=;
        b=ihBzIV4DwldYagsdEcNvSaKO/TeYnbcbCfxAUE3E5qDhdQjMBqvtv3G6QWDmEHOI9z
         fQCtyMG7OWCfSFJMYjL8nhFTge7PGRg+NjJKyDjHG+CeEjc0qSqFbxQ00DziAETp3GCT
         dnQ/TP0KjLfo53J3NiwLW4hCbM3rShP63XPQAjQO3HQ3jt83xx7j2GefWIQdKKYprdxb
         NHMkM5t48pEGdXgqVzVGs3A8XlaU7otm94PFTHltD4xCWSCauIMeH3oA2uOojJVRYi4e
         ZP8k5Y29YZ8+/R8VP6XwVpzF8Xn94+XBXr/VhrR9bELk7f0fXLuLUnPCsZ/5w/TZQ2Zi
         iwCQ==
X-Gm-Message-State: AOJu0YwJcVnT1k//EgRu01JLrrV25kGBOH6pehtW0wf9y03HlLa3a7KE
	KF9ZYf9linQt5Ki4pEnVovU=
X-Google-Smtp-Source: AGHT+IG6vqhh+2ikOpv4+3EIQGSuGL/ROzm2e227H32GQng8dg5JFKm7uLPR9UVsyHGBiPnhm3niaQ==
X-Received: by 2002:a81:af07:0:b0:5d4:90a:566d with SMTP id n7-20020a81af07000000b005d4090a566dmr1786895ywh.4.1701632007152;
        Sun, 03 Dec 2023 11:33:27 -0800 (PST)
Received: from localhost ([2601:344:8301:57f0:cb98:c3e:57c:8191])
        by smtp.gmail.com with ESMTPSA id t9-20020a817809000000b005d3500ea9fasm2730455ywc.10.2023.12.03.11.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 11:33:26 -0800 (PST)
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
Subject: [PATCH v2 11/35] ath10k: optimize ath10k_snoc_napi_poll() by using find_bit()
Date: Sun,  3 Dec 2023 11:32:43 -0800
Message-Id: <20231203193307.542794-10-yury.norov@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203193307.542794-1-yury.norov@gmail.com>
References: <20231203192422.539300-1-yury.norov@gmail.com>
 <20231203193307.542794-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_113328_299137_47D0DEDF 
X-CRM114-Status: UNSURE (   9.17  )
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
2.40.1


