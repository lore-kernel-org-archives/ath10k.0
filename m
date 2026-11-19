Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA2A60A2617
	for <ath10k@archiver.kernel.org>; Thu, 19 Nov 2026 00:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2pWJW7uD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rc9muo7O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=; b=2pWJW7uDrOfcvK
	hDZ7+p8oXEu2w4ivN7M1SLUfd7KbnSiGmd5I29lXwiwWRzbEA9bG7i/oLCo074EuNFzLoaFSAFvLP
	yNTZnFpvo2Dn9DeuPId+0xRqOFAvcMYsm18OS+57/Y3ktG07iXXl/4LTw5+YawJc8GkxSzNrjchMC
	fUXRbEkzBp9wUq0OOH9I1eeCTN8o6t9tTLHOycRBhGWJx0itiC+gnBmGxqelOxLkZHO4J3el+c082
	p8Qpvb4RdNHe6HOx6Jt3jmmDgSUgaYbx07dHRjpZT2/ms3jrMmjOcuoqowjOsGZrVeJfRKpaWRmkv
	WJNE6WC2XSzzsJvylGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1X-0000000AZnI-456J;
	Thu, 19 Nov 2026 00:29:11 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTq1V-0000000AZl7-27Fu
	for ath10k@lists.infradead.org;
	Thu, 19 Nov 2026 00:29:10 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5364d86f7f0so19359731cf.1
        for <ath10k@lists.infradead.org>; Wed, 18 Nov 2026 16:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048148; x=1795652948; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=rc9muo7ONW0ZiOUdBK8ip7nK2qzAAjOsyF5gckz9rZxOP49WBgghaZln9RGqYhkPpo
         N6/sUdDypyZn+xNWgXZZ1MbNcpabdRmNtjpAtF6e3wjf3pxTdCnoOTq0aBuWhF1CNOxf
         vOlmyfg5NxVqB+ZP/x9nksOzLiTh0nnWC7i3LNxQxtRVaGnRQ2Zg/Up3KbyP8aCOZdcR
         q4sTVtTc1+Bj52AWzV+QDAtw6hO3xZ9eX8gnZmUkhDnAuYHHKSecM6oR+ZG80ycS93+j
         RlKUlae9AXvpEeqHdgbll41BH21A7GfJz4RNLVqV8Q6FLHI9qOQdqBRLytU+/ifKSEnF
         0Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048148; x=1795652948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjXdfM9Xk6dJXeJxolWhgQCA3DIf/b/Pn3vsuXj+pJI=;
        b=bLnja7s8vslwouK6bBQe8BfR7lYT99n3WaDo0Qby+TPY4+6ly5U8Wg4NLnQP3+ADEC
         A0QyMrPUNN6rtv8A3deBpylFVLPuFzSZGBTQfH147p8AmvUTFQ/avSnxud8kgAtzMFEO
         kD+fxBrYpCNVzEXkzBPKzimaHPv3YTbIAy8U6mlAABhpkPR9nyltZ4l54YEnGNf//9qU
         gOGUqzZa5hYwIxACQVwUFut/HWOb/PpEXlppab5fUOG4gFDqqKMXKJU1OcIREy4kutiX
         a7j01ceLA+jD2A2PAxEtGFMQZhEuyPJQAeXzGc0pD8e/TeCPJuSU4uInuPegVbOj5cjY
         1Ahw==
X-Forwarded-Encrypted: i=1; AL+hErHB9OjldEkTjpWFgYRJKWsINEC3fDm40Loe5rs5qEZFEFnOQmo8q5w6MpGYVeRuiQs52unMDOI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/+OwHxivfTxj4eExuon3IxLLl8PHhUC7qtgqJs2S+Ev3zlD6m3
	KFJ+qmZpj/UC9HrivJIGtvn61oPecpf/u1FCaZP90aLKQjKY58+ElxYpDEL0FEgP
X-Gm-Gg: AYBFou3fOPosSsisW5uemTy7PbA4tGyR9oZdnvIXmgNxZNr2HN4x1pMdY883aTfGgbT
	KA3stIfqGKe3eGAp0dQhWxjGLob3/HZYC47O/cD82p9nQ8uBEfP+9lQXL+NF/3387R/zesX9OI4
	460G0orSgChgCyz49m7JLADgAqj8vCIFmE7f/F0gMauukDs4VmrgbJnW2NJ3+xMuV16m9824lHA
	7v4py8b7x2tSWSmXB9TqBZv8mM4TsXz0jYWNnmD/oZtSlYJdyEumnszhGVn2eHMSwtxUh1O7S+1
	mF84/FMxD0gIihIEsxiAnSyBlPWdODpz3pKsLBKFzJ5s7IuZ9aqiokY8v62NTHuC7A8KFrOqg3l
	6ZlTxK7zUsgtXv2K8pxL2I/NBbeirQcOK1gZJPv78B6QH5f61o/7PciPynpmTFbTEOBhfBptp/x
	Oxiy1qcnLCJ5WtK/VEyS52ETGvl4GfeFVihE+oYjRYLda9cqznP0XoVUfFs8pD6x9zS1bSjRQy9
	8+GUDaGBAMjJXKw5vAGKAkDfZJFpfpIrefMKbambjJYKIsYnxz5uhhHSLLpQkmi42lfY/MNdzo8
	akjVr6l66beRJCpsbb/Ucva3r5B2BMjuLMxFLJ/jFvRTCywUoZBCB6n+2e+P9ngQ/d+Er/KwIUI
	=
X-Received: by 2002:a05:622a:2b0b:b0:55d:33e2:a351 with SMTP id d75a77b69052e-55d5a537aabmr69062431cf.15.1795048148019;
        Wed, 18 Nov 2026 16:29:08 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d16bafsm34925086d6.7.2026.11.18.16.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:29:07 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-current v2 2/2] wifi: ath10k: drop extra skb reference when HL TX fails
Date: Wed, 18 Nov 2026 19:28:58 -0500
Message-ID: <20261119002858.425666-3-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119002858.425666-1-lcy8047@gmail.com>
References: <20261119002858.425666-1-lcy8047@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_162909_549464_D4AB7919 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If ath10k_htc_send_hl() fails, drop the reference taken by skb_get()
so the skb can be freed.

Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
 drivers/net/wireless/ath/ath10k/htt_tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index 298e6a092101..7142dc1c4eb9 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1383,6 +1383,8 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 		ath10k_htt_tx_free_msdu_id(htt, msdu_id);
 		spin_unlock_bh(&htt->tx_lock);
 	}
+	if (res)
+		dev_kfree_skb_any(msdu);
 
 out:
 	return res;
-- 
2.43.0


