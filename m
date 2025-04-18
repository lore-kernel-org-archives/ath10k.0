Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB81C369AB
	for <ath10k@archiver.kernel.org>; Fri, 18 Apr 2025 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=erlZkBfBWeO6cYRlc+qHsjyCWTqA6RYSzWyCGbh+asc=; b=2ymMLU/+stB66i0LEjnJlxaKA3
	aB7s1UAvmUqrTpqttO+dLvL3qzLlSDvy5wuoOcAUbFmBa96RL35lbk30rkrl/9ETjKGTBP74dXLnX
	RmSsuF+Bzgb0nntb4p9OO64ZYY3OF1e6O6ZQMR08QOKldZFotr1/LzTkWgy0BUpzO60WxiVD0ATy4
	ufIvXch6f9WiHeNrmBEYaoWLNKszbqrNw4TO2M7jc32kimGjp9C3GlQU7KHjT4Vl68dTh9JQZLra8
	SxY2ZxmCMF6MmK8epKjtuG5aQ7CkNxdRQna02ZJQsIOcMKOlcZuPzEA+I/hYNE2qQBmYZnSKYhVei
	pEHXMuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kKl-0000000G0xJ-1Om3;
	Fri, 18 Apr 2025 11:56:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5kKi-0000000G0wc-1BZy
	for ath10k@lists.infradead.org;
	Fri, 18 Apr 2025 11:56:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso11834805e9.1
        for <ath10k@lists.infradead.org>; Fri, 18 Apr 2025 04:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744977394; x=1745582194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=erlZkBfBWeO6cYRlc+qHsjyCWTqA6RYSzWyCGbh+asc=;
        b=aKU3lWWx0IrX15kIRPYk2udw81DScHMpLb/caU73RY0tSz3PSFQR58Y9vJiLyF2vc+
         jDBMIoT2GLq3NVN201KUIpkbZ+ieUbbsALNfytJSz4pfWQ+iDXu0moCgWV8Gj/1mbyCE
         iXzR3L3zGinGUNLyAn8BdzR6tR4YeZFeBFMp8ak6vW4MBjpIsb1gKYPpwOKyRA7fn8nW
         FQhP1Q2E0EYzgufjXbkpkD50rgI/d0eEjcUi9RfKZbXQ5jSux5cPZ7v8h7AxPq4uEiMe
         MDfpXZuiTO6WFOatVB7WMpAibpSo3ks8Q21X6rntYaqSbsIlfOOEczvN/ksPmaTv1p/W
         2oMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744977394; x=1745582194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erlZkBfBWeO6cYRlc+qHsjyCWTqA6RYSzWyCGbh+asc=;
        b=VBXesQGd4tI536IGFzd4HYwGt5eHVeaSXRyKIlJJzoyb1C6bS8ZaMAMryCvNE1UHgk
         45IQfTOdtg/O5dLzOuY6vbPj9/nqk4CkG0by59FixywV2ZEeNi5bk+lg7psVDXp1Jms2
         VPsVw8qfdB6Wt5Lv70kseOc1wAcY5ChHyKppFQzVJUQXpv8PFf8TU7ITZWoxqDSkR29l
         ybPCfFimHYZNL+YT/D+VB0QyC+AIDGeUjFesdbSEV+fHlNrJKD5sg5LPfzuegZiXu75j
         SFdu+i3bFpKXK1tuycODFXA672wte5d6sWNYxTtuy7QtghGbqnSaYb7PlRp8p/W4O4hl
         Gp3g==
X-Forwarded-Encrypted: i=1; AJvYcCUxkWBf0S7GIEBZdE8smrmszE3LyKmI7OmESA8KpLP/YWAtay8yhQxPyy7GScj55VesaLHiHjM=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4zclUaYVT6oaU2Lxy5R3LSXarWED2fEKHTCL/AB1mKoI+Pmr
	jWm+btXvWOPHYb3SwtU5U481CoHAdJwRYJepbVYuYqOhZ9dFdKHy
X-Gm-Gg: ASbGnctoA76aWLduz1cQQWclxw8W9KdGaQNvF3GRQhvzc8HJbmZ8AMVI/L2RbotfrEY
	gwOJns8qXwtO6/sVvWllmAqobQU6Cma4evwyGnBMg3it1GB8DqIY5BZu75EwLNmaTPzrR3dyPrK
	4n3jw0R19Qc17ExWDjQsXddSXQxT1Y8H9UL4lQqbHG579EaqT5wu7RX5RTg9MpYv/H8xdpY19dK
	vnIc8Q9KhavCBzZurVl7CSVOU0aNMx1bZwz/63BgUJjoxgWJNXVo8kGYCmS3xsJuXvMb7hlxMvF
	gouae/RxGC1Osxn2uuQX+dodfw/2by5zhhlWb1+EUA==
X-Google-Smtp-Source: AGHT+IHEOz09b2J8Y12vKsBHy75zrVmXiI8vyJB2jeLApDk5E1XezYHipFLbWi+e73sIPaDbEpxEGw==
X-Received: by 2002:a05:600c:1c07:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-4406ab81962mr19746705e9.1.1744977394309;
        Fri, 18 Apr 2025 04:56:34 -0700 (PDT)
Received: from localhost ([194.120.133.58])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5ccd1dsm19614645e9.27.2025.04.18.04.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:56:34 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Fix spelling mistake "comple" -> "complete"
Date: Fri, 18 Apr 2025 12:56:27 +0100
Message-ID: <20250418115627.534833-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_045636_323948_6FAA2630 
X-CRM114-Status: GOOD (  10.49  )
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

There is a spelling mistake in a ath10k_warn message. Fix it and
remove space before colon to tidy up message.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 7ce74b4ef201..f3212eab56a1 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1844,7 +1844,7 @@ static int ath10k_sdio_get_htt_tx_complete(struct ath10k *ar)
 	ret = ath10k_sdio_diag_read32(ar, addr, &val);
 	if (ret) {
 		ath10k_warn(ar,
-			    "unable to read hi_acs_flags for htt tx comple : %d\n", ret);
+			    "unable to read hi_acs_flags for htt tx complete: %d\n", ret);
 		return ret;
 	}
 
-- 
2.49.0


