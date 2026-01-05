Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F657CD0406
	for <ath10k@archiver.kernel.org>; Mon,  5 Jan 2026 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ExRvh8gizlzCosztwzGXJoboDd+Ig4VaE8sOE6jME08=; b=our9Eclqhor8GE2/DulVhMa6td
	5H8h6WQeoLBcdYr0evfhSraeiy5zQrFkwaysW3Ihgkns7NWQ6u4gOpbu7aqqRMLMM4W2tpT9iLqi9
	Lhr29vX3ULPFd4AgjEVCeT7mGIQdexd3F2lVasRORD8DlBu1XN262xDz2lEwgFbvXV5BBVafvGAgA
	vainEaBqRx06u0aShbRIZPcuUdDjb3cRRIuBw111UenByzlD07SoIbQNRKO8TSk50Lia/UGRrhj+s
	RxHFkRePKrHyCLCYrrjVj6rR0shWwPMsJj/XuThU20QwbAx4+MPe0rc/MjPIFUXhHBWrXvNYqnHB/
	25J3W/BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrlx-0000000C5cV-3Unq;
	Mon, 05 Jan 2026 21:05:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrlv-0000000C5c5-3FHk
	for ath10k@lists.infradead.org;
	Mon, 05 Jan 2026 21:05:52 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47d211aee52so439235e9.2
        for <ath10k@lists.infradead.org>; Mon, 05 Jan 2026 13:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767647149; x=1768251949; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ExRvh8gizlzCosztwzGXJoboDd+Ig4VaE8sOE6jME08=;
        b=hETyP7vnKbiaqycO6gp7+rd/xlTl2+zW0AtPjjjmF+QMcQ5ReMq/VqpqZpvmkjd48d
         9+GZvvS2+9xDtRbrSiCKIIQnj0JJUPUpleVEsQt3ZXeKH+UsZ2t9Mm0o4iVDAW3ndl8I
         injVU9hgpgY+nLxg9xbbW2fp4LwH7hyQDfqOc8AdJwIuqO1bIxjkvuRb0oRoTABy2yoI
         CxnoXPqJtab05ARLYdhDmpU47qnizEIBsShHG3LTGq9xFcYqPxIFeHbvvO6jFz7wEL1B
         1iC5MbRPom6+8WG9G4w1lGhnhKhHwlSn/xCXeWIqNCgIdNeMsNwT/mi6B/RReemcw+tt
         /mfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767647149; x=1768251949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ExRvh8gizlzCosztwzGXJoboDd+Ig4VaE8sOE6jME08=;
        b=FmNUHcW4vJftiC6hTfvwjrdZJnBMpN/5SGun7VBMOL8+IBUpOoBkZ8ulPQLLiuiXXO
         iOO7mfZJ0pCZpLOkiVikYI+D8qHO0q8Y2+7Z49sfcj/o1PKBnMVxczEq9iQWbrKsej3i
         IL03gm/wkJFRj4WYsKYkRFaCKCpR7Gt06xO1qv/1FkWfu/FX5RsEeUJZLTrcQgSiNT93
         j78Xpc24GBv1hTfSy0zMgQIWPmV8Zyk4hOcYIJb/9dSm0WrYKg98J/pK8Io8Dcv4nU2B
         HJpW16du5ugWj5oJ+ag6qviF3Aw4xa6OmgX/adGUuqd3Xhm6G0wpQH8fKhv/1LrL8vbn
         xE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXtbDM63A2gz4ol9TJplqi/G9x8xb1xVZMZXADKcxP3f4JVWSw8zrX8Y/sV3u93UgiiknXvcI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGpnDwVW/OMQ3UklOtLuDurjT2F4+8CoKNnokcAzxJJ+0VwrKV
	1JPwLg1vLVG1IAlmCWb1MEOdvBlZ5oqUXq8ptZFaazkBx+69i+rVx1p8
X-Gm-Gg: AY/fxX5fhBuv7vozbBC/5qf609ZiNt39M+GXyjV+R+YrEjvA3rfuso8TNOV21bb2/Kg
	UlazDxZbV7NQyugMjY18Auyg0yJTjgvyb6vqzlnWawQOLD7Fka4xKHM/fLi0Vd01R2igtKg6dwa
	wH3Qf5bXmeyQqXkDaLlQHmOPGRZp0OWRJJUmjC806hDqsU5CQxd0Da9mNJDGgsBBB5JabcwN7yH
	nZ8wRxQFvvpKcX5MkXDJkJaP5y/7XTvNW9nMXkFEcIkW7pQHE7PyqRgrETO6GF/CpzHutdiEhdG
	pPt1X8au5U21D5EOguZzBprBTsLHbk8riDKuWscGCw1lysrH81P4ah52Q276lDjS3D29JAVdJtN
	ELWsf66vjLbnfG7MMQZWJAJMgQ6mWSiicmT1ABZKArblwA+sytOn6Vf+72gcYYOkB3FbaVtYelB
	zd4oIvUBdNjTSLV+Sxx6Kwmat5T1D0DZGjimw=
X-Google-Smtp-Source: AGHT+IFjVV5YYWM1Hac/Fy7//KMT/cxXD4H8sP8nsBaJZGJr9obOAP5rEPdrJ+zyBeOpMLvhACyeFw==
X-Received: by 2002:a05:600c:1f94:b0:47d:3ffb:39ed with SMTP id 5b1f17b1804b1-47d7f09cca9mr5148485e9.4.1767647149186;
        Mon, 05 Jan 2026 13:05:49 -0800 (PST)
Received: from thomas-precision3591.. ([2a0d:e487:144e:5eef:4e0a:3841:cee5:ead8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-432bd5df939sm535579f8f.21.2026.01.05.13.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 13:05:48 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Govind Singh <govinds@qti.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] wifi: ath10k: fix dma_free_coherent() pointer
Date: Mon,  5 Jan 2026 22:04:38 +0100
Message-ID: <20260105210439.20131-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_130551_848266_2E042BE4 
X-CRM114-Status: UNSURE (   9.30  )
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

dma_alloc_coherent() allocates a DMA mapped buffer and stores the
addresses in XXX_unaligned fields.  Those should be reused when freeing
the buffer rather than the aligned addresses.

Fixes: 2a1e1ad3fd37 ("ath10k: Add support for 64 bit ce descriptor")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index 7bbda46cfd93..82f120ee1c66 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -1727,8 +1727,8 @@ static void _ath10k_ce_free_pipe(struct ath10k *ar, int ce_id)
 				  (ce_state->src_ring->nentries *
 				   sizeof(struct ce_desc) +
 				   CE_DESC_RING_ALIGN),
-				  ce_state->src_ring->base_addr_owner_space,
-				  ce_state->src_ring->base_addr_ce_space);
+				  ce_state->src_ring->base_addr_owner_space_unaligned,
+				  ce_state->src_ring->base_addr_ce_space_unaligned);
 		kfree(ce_state->src_ring);
 	}
 
@@ -1737,8 +1737,8 @@ static void _ath10k_ce_free_pipe(struct ath10k *ar, int ce_id)
 				  (ce_state->dest_ring->nentries *
 				   sizeof(struct ce_desc) +
 				   CE_DESC_RING_ALIGN),
-				  ce_state->dest_ring->base_addr_owner_space,
-				  ce_state->dest_ring->base_addr_ce_space);
+				  ce_state->dest_ring->base_addr_owner_space_unaligned,
+				  ce_state->dest_ring->base_addr_ce_space_unaligned);
 		kfree(ce_state->dest_ring);
 	}
 
@@ -1758,8 +1758,8 @@ static void _ath10k_ce_free_pipe_64(struct ath10k *ar, int ce_id)
 				  (ce_state->src_ring->nentries *
 				   sizeof(struct ce_desc_64) +
 				   CE_DESC_RING_ALIGN),
-				  ce_state->src_ring->base_addr_owner_space,
-				  ce_state->src_ring->base_addr_ce_space);
+				  ce_state->src_ring->base_addr_owner_space_unaligned,
+				  ce_state->src_ring->base_addr_ce_space_unaligned);
 		kfree(ce_state->src_ring);
 	}
 
@@ -1768,8 +1768,8 @@ static void _ath10k_ce_free_pipe_64(struct ath10k *ar, int ce_id)
 				  (ce_state->dest_ring->nentries *
 				   sizeof(struct ce_desc_64) +
 				   CE_DESC_RING_ALIGN),
-				  ce_state->dest_ring->base_addr_owner_space,
-				  ce_state->dest_ring->base_addr_ce_space);
+				  ce_state->dest_ring->base_addr_owner_space_unaligned,
+				  ce_state->dest_ring->base_addr_ce_space_unaligned);
 		kfree(ce_state->dest_ring);
 	}
 
-- 
2.43.0


