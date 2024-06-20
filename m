Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00D4C2BB85
	for <ath10k@archiver.kernel.org>; Thu, 20 Jun 2024 17:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyCbmEERBgdbr2L9cnI5uWj+Q286mUzZnK0ig6JQYFg=; b=RWvVYXVL4gHVlpIi+zPtaMcRye
	SJBT3dEecIPwnYrbtyAET8ZIIyBN4Jpyy4YN27gu/T0vy0JoZBeLay9NvMEyYWShpcznu66l99XXO
	+6TUjZaSVctt3M58Vj2mwdmFdirUYqtGgbQUj6wInt/eWPxlF9ZpGOfhpHuB3TnP/or6HNnwCq5Lt
	ZBzXj7QkHNMG5BVktaFepsnJ2z/cdEqMJNcHgGsvylb2iaDdiAFl+7aALAgqH39RZnPdNBXZpOHTn
	YxQSah3KLTvHMoNHs7CaybV0Sa94skTfVPaPN7k89DAe3lOzGIHCqktbw5CJyH5N0DDXEIgrNqEck
	zXZMiUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3e-00000006B7w-2CCO;
	Thu, 20 Jun 2024 17:58:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM2X-00000006AOT-0Hc9
	for ath10k@lists.infradead.org;
	Thu, 20 Jun 2024 17:57:51 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70635466708so1163597b3a.1
        for <ath10k@lists.infradead.org>; Thu, 20 Jun 2024 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718906260; x=1719511060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyCbmEERBgdbr2L9cnI5uWj+Q286mUzZnK0ig6JQYFg=;
        b=E0mtnVJORiUMQQCbre3GBYNJD9/Oy0fgFYkOJ6ChyEAtJ75vooRTnBeBaVqP1qFbAU
         LyaCH0+heFRiO0Sdy3eGOyODcogES4rJpKbtuTWDEbmCAB1duqRmjmtlItjUe0UBgTgp
         HnNjHAhwjjYS0GPE0/lWPnTbyawu3E1eBI5fgfwcy2RRfIRDg0u/fdSCXkWnHHYvsNjE
         Ky5h6A1oMrh91Dg8kLz/+pGhr0rltS53l6/sTypXNsOLAjSKaQ1MYnTjSZHN4OZzs/AP
         cJ3b2zhXPEPypl0XiCtFnypLb56G8vSADMGdA8Fam9QZtRAXvfF4SePv29YcDpAlt/5h
         sKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906260; x=1719511060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JyCbmEERBgdbr2L9cnI5uWj+Q286mUzZnK0ig6JQYFg=;
        b=oQrvm8TbDWdAnfL0Dg6WJanZ778TT7UF1dE1SdGl/IcVjKr+TDq6lhQrB8gQFuPKoO
         VLsKGltFS8ihuBEj//8Xu21OTf7H6Fi333Lhwj1y55Vyl0uiZjGM9l8njmgQohQoda55
         405xKaj2XQYvfqJMo/LEnQuZsEvZhEG5uCPbjEaoDj20j9eV3mmqm0jBWMDkVg15ZSsD
         UtMPDzm92QIWHDjMyaewp19DCXtUaBcQD4i6JcsZjJXsNMgyXYHIAG240ioeSX8z13g4
         N8tR1NLUL64D3gSKqJPZkXIC7ZZdakNqpBTe2mb8Jo0d5AQl+d5PPH+PH8wI+cTQEhyO
         bm8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVE6+TdAYBShGSfCf2KI8cChd9bwaBHI6yxYpNuLs9uLhMGpvOcnGb1AycI+1EcJItt8gdQ6D0EWMQ/ILB+jgqvOkT48e2hV3CLdw==
X-Gm-Message-State: AOJu0YzmgX8RL3mDbs5O0iJsqNqEql+uUiTIy/EEoWh+H88e+cFWelRW
	bj/heKEKzqaO6Novk9WQ6jd4IspYwcjuE1weqwU+YlbZAFxS5Mlu
X-Google-Smtp-Source: AGHT+IF6k794+bXj65/GLuqQFCenpTYt6QZL4TjH+FL/9upfIcGTU3RlCoM3IuIh09X+vOAPLBF0ZQ==
X-Received: by 2002:a05:6a00:2f49:b0:706:2acd:405 with SMTP id d2e1a72fcca58-7062acd0449mr5420295b3a.31.1718906259963;
        Thu, 20 Jun 2024 10:57:39 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3d65csm12619770b3a.102.2024.06.20.10.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:57:39 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Jan Kara <jack@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: [PATCH v4 11/40] ath10k: optimize ath10k_snoc_napi_poll()
Date: Thu, 20 Jun 2024 10:56:34 -0700
Message-ID: <20240620175703.605111-12-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240620175703.605111-1-yury.norov@gmail.com>
References: <20240620175703.605111-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105741_518793_5395AEBD 
X-CRM114-Status: GOOD (  11.15  )
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
 drivers/net/wireless/ath/ath10k/snoc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8530550cf5df..d63608e34785 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -5,6 +5,7 @@
 
 #include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/find_atomic.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -1237,11 +1238,10 @@ static int ath10k_snoc_napi_poll(struct napi_struct *ctx, int budget)
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
2.43.0


