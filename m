Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501F6E83847
	for <ath10k@archiver.kernel.org>; Mon, 23 Feb 2026 02:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MUfZvLCxWQPo9+B+GJatrz7V0AxZAnIHeCpWnwAFuA0=; b=CGEb1v8oaUU5h/bu+x16uAHJhf
	f6B0I3hz/exkgDxwJDCDTSBX+0zOOyurwtKpRUCUHn3CtXs4Hq7bfcQzhkBqq7dgYpTJwuC5NRB2z
	J4yn8T7jr/9D4fGQEujVuoHzw+DCIS+Z0c7M2PvPS7i4HdXQeYZLZd2NLQS46Oi1amjKmhMWG6JO9
	HHZfMm8fLr0Li9vdqdJ4kD153g93ygOlgI12kieqz7C8NjiMU1z14Q2ta13vUe4tt3ffrJxJbuA+W
	/VP2v7HSib2a1E/S6raHj/R7XiAin9xZKuMJW+p7QPmuMw/W6KeiyfaIyjyMEOrlzeTE2Lt+9/r4A
	sCI8I1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuM0g-0000000H9gF-3c7P;
	Mon, 23 Feb 2026 02:49:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuM0e-0000000H9fu-0sWe
	for ath10k@lists.infradead.org;
	Mon, 23 Feb 2026 02:49:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c6e72d7a4d7so2513957a12.0
        for <ath10k@lists.infradead.org>; Sun, 22 Feb 2026 18:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771814958; x=1772419758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MUfZvLCxWQPo9+B+GJatrz7V0AxZAnIHeCpWnwAFuA0=;
        b=fdiBOh007Q26HWOoK6CKogLEEMJGX2k/dfC3ez05D5bOMK59ofAn8iUvUGIwarKQ0x
         +P6a9kI6v3KaYjIIC2FZiAFqj2uHt4jEdys4X4bCh/63+or14CCm3CWt0mVjssiUjPJe
         821N8okCY1Hva4/M0AKrxFVBCPxlfBxJ2Zj/dhML7d0otOdxn5TEVIfrDeYcRxekw8rc
         Ps/vvcKakXF4/9ErieBVNMg5dZACiOvn7VgFtxKOE1WhNacGuQ8PEM8GLZI6D0h8LkqX
         kAKhnty3zO9mxh7pb0vIAtQbjJ5qBWQuiOrSRuflrAeVD7CRtXRGZ7LRJOs6c1ExR0J2
         Vk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771814958; x=1772419758;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUfZvLCxWQPo9+B+GJatrz7V0AxZAnIHeCpWnwAFuA0=;
        b=msjeYKfLyAu9JmYI6lzw7hnYfNHCyZVOfXqUhllAuPwjZEFA6KVojjTrLpQP1QgtTm
         YjQNrlhzJxeGHqIrhzw6+XpPUSPpqQIRhC5rxqpfuNY55Cni3D3ExSoJHCmFCHFKp5nV
         mB6BR2uLreSSjAjCIsenA0hVkAxnlf0CxtAMo3d5QQhZG++kB7NEnEVqgLe0DJDyGBPg
         olNvRzXBkH+Emwn5fR9+lbfyI0zGfeLt3rWEj1xx1YOp0EmCvVkH9tx01JIIW7CWuRXp
         RV/D2Xz3jO3S2YkjV9WwP/efmQqgMLApMWQLwUj75AQVK96bKNnsjj1CDfRmTvvbTPsp
         4OeA==
X-Forwarded-Encrypted: i=1; AJvYcCW2LomuIXUvg+lAH46pv7b/1eohWxFVbP+WQXDvkpbhbhGcwMCWZ8DD/V7iScUJwwid2gDVpYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeP+dOwzhsdCWJbZxVt/WClbGInI0DGaBWQ1SvyqWaNgV/VoUQ
	uCvzzFth8j18+EaBnCcJ7/L+22S5+irnxIGrf2SndUpRKraGtADbK/a6
X-Gm-Gg: AZuq6aKfmiOz+KMfKlZjNTgiQRKcsl6aTSZeHDKQhB6Qh6rWzKPNOtOglOz1lHQ284U
	Pmwx9BnHU4TlEzgUW8CLchTyhrdDfCso3Pe5QrkJ42lyX8MjcbaeQ9ShDzBaQqSDStovajkKh6l
	miFltgEv+9oC/znV2LH6sCrV9pFaqQlWFf6ls/G5xCyRSz1qzuqFpvSFaoYB6/7SvgoU7rG//ql
	0dSVeFjrtYYAYW/SKuevZ477CMmply3Gcgptzg7E0u8IX5gvVBH9jT/j9aRl7VYiDISTljMeT5v
	Ne4lTEGN8XJR9tquR37dBi+bZfQPy5ttG2TOAUU2I8n8wECDYCfYOOu/2l3940Yty4Coz6S6x8Z
	8985CN78Mlhslzcm79jvz7Sqqx7MN2o3rLTmV6f6OZWt3nRWMe98GjIRBwDvUWGRJT3ALHW16fz
	NahM2ukyPSCot3Yt3Ud1CU8bwwY1xWkMB+lBQrV/3BhKsBn33uTYaB+g==
X-Received: by 2002:a17:903:3b8f:b0:2aa:f2f3:bca1 with SMTP id d9443c01a7336-2ad743e304emr67075485ad.9.1771814958388;
        Sun, 22 Feb 2026 18:49:18 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e350a9sm56126785ad.15.2026.02.22.18.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:49:17 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath10k: use non devm for nvmem_cell_get
Date: Sun, 22 Feb 2026 18:48:54 -0800
Message-ID: <20260223024854.18910-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_184920_251160_A0A0CFC6 
X-CRM114-Status: UNSURE (   8.57  )
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

There's absolutely no need to extend the lifetime of cell to post
removal of the driver. It's only used in this function.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 5c5bd5ef7175..38c5f5f95433 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1981,13 +1981,14 @@ static int ath10k_download_cal_nvmem(struct ath10k *ar, const char *cell_name)
 	size_t len;
 	int ret;

-	cell = devm_nvmem_cell_get(ar->dev, cell_name);
+	cell = nvmem_cell_get(ar->dev, cell_name);
 	if (IS_ERR(cell)) {
 		ret = PTR_ERR(cell);
 		return ret;
 	}

 	buf = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
 	if (IS_ERR(buf))
 		return PTR_ERR(buf);

--
2.53.0


