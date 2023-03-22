Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33CEC6FD1F
	for <ath10k@archiver.kernel.org>; Wed, 22 Mar 2023 12:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FGNot1Id8oc+InNBuifrVSKsli97+pQv1j+BVbN1jmg=; b=ZiG2eO8Vp9F4jb
	bg2dIzs/M7blqCvf4ltbLws5SlXdAOwhiN+4s2xTp+QGFsH3T/hSqK4IuFWDmVBoHcMyambi5VIrf
	45UdlrgfPedJe0YfkdWhPwl/oboAbVQjWUPCRFFO19wHLAcAq+i8bXsGs8STD5SGlt7/0+cJBF42t
	WKsb4197GUGlDGJhpBj3fpP1xBllIUSNz2kQtE88vuZe/V3ZXYghZolF5AsjGMHfiOsce1eHe5Td1
	s6YZTEPsejm0qBPs2CPVPRkae2172pVunrV2lB2bbr9VmQfnEthAH4AsM9oD+xeBYvSjUk+JJUHL4
	yRxFKsg5c8B98iwtDj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pexaS-00FvwD-2d;
	Wed, 22 Mar 2023 12:29:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pexaP-00Fvva-1S
	for ath10k@lists.infradead.org;
	Wed, 22 Mar 2023 12:29:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679488140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/RmaCdFiflknr5F/EzALZWl8EQAEMlohlo+Bq/6n784=;
	b=Mj8ociXFfTjBg2nuSt6ayckqj5PVKL2CyF8i8RxiDh6LIJ/s684sz/xxKCBp++SqCx+Ktb
	ZlOCDaUwbwH4bh3GBMD7TIn0TJwP8w7E3MbXsDM6zY7YYym7OBG4UlNn7YadkDxZqHfuyp
	SQfMjdRUvbFXoHPA7KrivXolCUx+G1c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-eh6wpEGJMcCzriKT_XYK6Q-1; Wed, 22 Mar 2023 08:28:58 -0400
X-MC-Unique: eh6wpEGJMcCzriKT_XYK6Q-1
Received: by mail-qt1-f200.google.com with SMTP id l17-20020ac84cd1000000b003bfbae42753so10679956qtv.12
        for <ath10k@lists.infradead.org>; Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679488138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/RmaCdFiflknr5F/EzALZWl8EQAEMlohlo+Bq/6n784=;
        b=GvNtCBfQc7gKK7RTKmvRNQe5IHM0THlCgN/BD4ruPEyknGSnTVz6f7o/S2KcSZ2S4M
         rZDBXatXilJg8KHXuO1tVVZDF0y6EsjKkeFefnYKtJbR7tE4Cg8TcRO5gXej0lx3ERbB
         F640j7ZR3mFYXOvZdGYfjtTOJEbJZJDcbGuWMvAjKWbDCCKCMqsU5HYq52FPQa5UgnL2
         11xpqPqAk57yGhWMRLSNjxIyCMeP6fvoItxFc0A1dYlZ+LFEW3EebGVz7iY6lDl4l6Vz
         uNEX8JR90vxEmKATbsH7+30d8zV0j1XYX34H9hCseyjZRrMIydEytBZlfei5cayEXGLX
         hdQg==
X-Gm-Message-State: AO0yUKXgjW8ZwK+r0cjwEaq7+5K//ev/rPaK85y4Qmeo1dD/5KSASnFO
	7NemY56ZWmTd2eLICBX9M4yMfNXHWCe2GJm5TUtLx8I3ICn0VPxU/B/Mm7Cng7SQIsxX6Hj7zDE
	2ENcY6PfLlNetVvt2vA3zUQ==
X-Received: by 2002:ac8:7f8e:0:b0:3bf:d9d2:484f with SMTP id z14-20020ac87f8e000000b003bfd9d2484fmr5698849qtj.11.1679488138455;
        Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Gcxx8GdV/OeVtTOhHQR7MlyYiQ1UjJcEDEFgxn3029wWSBoOMbr8ofWD/oxpFcUXsweisow==
X-Received: by 2002:ac8:7f8e:0:b0:3bf:d9d2:484f with SMTP id z14-20020ac87f8e000000b003bfd9d2484fmr5698812qtj.11.1679488138211;
        Wed, 22 Mar 2023 05:28:58 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id j13-20020a37ef0d000000b00729b7d71ac7sm11174245qkk.33.2023.03.22.05.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 05:28:57 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: kvalo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ath10k: remove unused ath10k_get_ring_byte function
Date: Wed, 22 Mar 2023 08:28:55 -0400
Message-Id: <20230322122855.2570417-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_052901_563550_19C7289F 
X-CRM114-Status: UNSURE (   7.64  )
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

clang with W=1 reports
drivers/net/wireless/ath/ath10k/ce.c:88:1: error:
  unused function 'ath10k_get_ring_byte' [-Werror,-Wunused-function]
ath10k_get_ring_byte(unsigned int offset,
^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/ath/ath10k/ce.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/ce.c b/drivers/net/wireless/ath/ath10k/ce.c
index b656cfc03648..c27b8204718a 100644
--- a/drivers/net/wireless/ath/ath10k/ce.c
+++ b/drivers/net/wireless/ath/ath10k/ce.c
@@ -84,13 +84,6 @@ ath10k_set_ring_byte(unsigned int offset,
 	return ((offset << addr_map->lsb) & addr_map->mask);
 }
 
-static inline unsigned int
-ath10k_get_ring_byte(unsigned int offset,
-		     struct ath10k_hw_ce_regs_addr_map *addr_map)
-{
-	return ((offset & addr_map->mask) >> (addr_map->lsb));
-}
-
 static inline u32 ath10k_ce_read32(struct ath10k *ar, u32 offset)
 {
 	struct ath10k_ce *ce = ath10k_ce_priv(ar);
-- 
2.27.0


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
