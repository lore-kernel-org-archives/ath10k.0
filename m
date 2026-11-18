Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E6606A32A
	for <ath10k@archiver.kernel.org>; Wed, 18 Nov 2026 05:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLHuPExW;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eu9AtuxH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=; b=PLHuPExW3c6LCVGqrjkehn54aX
	MwlZVrAnPdg55XnXWwukTE84lELLJY9Kw8wGoXIbs0NEJHPrOG9o7TUN8NnSWBa+s280AivzJVKpg
	NvS+rFVlu4tGMFtgRkdgg3vD3O/JjHuEA8Fdb5mEFJyozvO6BSuZtxG2kBcn3jBYge8cCaG6ah8fm
	gr5e9wh+HYny1mtL9kyVb58q3LO45WvAJUJZ2znGpvqVKAYYaBvKfSST7xLdODTCIxcbagZp+QS2c
	JltKrVdvoDiBoKb26SC7lE8z8pX3jCVu5ip+8sgR0/klkVzisws0zZi0YdP4QkpAAVOVsss9PnJGz
	KdDWeDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY6s-00000007kOH-396Q;
	Wed, 18 Nov 2026 05:21:30 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTY6q-00000007kNu-0CqC
	for ath10k@lists.infradead.org;
	Wed, 18 Nov 2026 05:21:29 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-93f1e5d7450so59237185a.2
        for <ath10k@lists.infradead.org>; Tue, 17 Nov 2026 21:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794979286; x=1795584086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=Eu9AtuxHkPlRCHZLI+qGwCmO3ewkvrMeMBNF246yWr3B9UbvHhYRgLfHg+bj/cpjMw
         HQrWCEYaxtQKGCCJRAoNQ4kZzQnfM25SdhqFZBPTw8U7uD2Vj5D9yIUdC7MFSXJjIa0p
         UIbfkx+mCwT1Rj1PrLNYJZ44XqwnTC632Fqu12tJq2G4EUY0AG9s1z6EivB/oUUjp9dN
         MJB4LDrr9HxMs+X0eG0ZbxkC6jAogIZp0t4rAReNe3Fl9GD1cwdMJIy67q2Ed950WmLj
         Ex2gsNw9/jbMFAqst3UsZoP3cAwBHwxPEq3dh9O/NUd0gmaQYbXji3eOEQVJYdH6obGQ
         RzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979286; x=1795584086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPHizIyryNLitu0wSeuSX7cXAqui8133TRyCoJfvIRk=;
        b=SGTEZcpcIDnKDr01SFJTCEkt5PGhY7tJhK4jKCRAbgijW5r9UF2jjHDO/0S4luAlHC
         u9AFVupNygtvZ/Jg9HMR0NVt/V5khZQawtVsPixC+z/t+aLzWy0pjzwUIep8YtZ7njyd
         DksMX7+lwgGRXgzabuWd2A6s/hyRcl+O9BOvnI/epqA6N/Lc3rNTJbKAvcwt+QMG5276
         B+KxokIV6szhHr3PiUJ4MH4veR/VqdXUvEd6GLP4G8GJC+/rJRT0pD8mVaocL1CmLot6
         +gLDJ5Uo6DiSaPPZHlvDNmM+UC1h4CaJHEs3KlNb8b68jL0vEPiXsMZOyjmaCDesIr/V
         5bug==
X-Forwarded-Encrypted: i=1; AL+hErFY3PoywcnnNy7shBiH9wlJn5mfNZ8FenTAfucyI6iF0/q8UMtz91TrfJeOda5olhQ5b7sPGHA=@lists.infradead.org
X-Gm-Message-State: APuU4Z8o7DrUs5XrLEBiIM+Hdq+Lasuw9dhirxAg3BNneyQK0fisxi1a
	s0inIjM8csDqhC9CnPJPqWlhV6/71xvRJ0EGr8aty+mlr6EA0AtUtKqJ
X-Gm-Gg: AYBFou0uiBbUiO5nEnV2yzBb9tiLV6/OqMNtfrdEVe/uX1MWJ/wWpvvpKQtOcZGHq89
	xm4lOG8rKwUNCKnWR4a2dfJgX/o1Vt8b+s7vnK4lgKDRIRO22AoRswTgZ832aWus81RDyFRA7WW
	EHmJKaLnuAHiFhy4DVe5+GiFRrw8gAj/Oi8V5Cqf3/N4Fy1InVwNhq2jQ50Ca1U1mU4ymmntBjv
	ORl3TIfvJwiFu7aMIQ0jCIsCoQQm0RRMzq5hI0wYMQiRGFrKMa/7BNUp8vlRj81I/7By0f023qb
	ClTuzjX88QbvLYPWme9+aEYf9WyYlX4LlIOKnTxtHBGttG2EFbrKh0bywCD07m9CwLXOedM4Zw9
	ZqNRuFuR6DfnMJgJ12NLYftdnZ8gK1nqRsx+TZhfb8A1Gv1fK9Ck6hLFpJs1XpDlGcloEJEU9Qt
	eeEX28Z33fc73qIC9esPMecIwHr5tih4KN92OyHKzRFBuliUvwL2aZjeDw53IJC83K4BqAuR31k
	gwDBlVuowsKYifcD+JINx9hGcNjEQIrqbb1Si8SNng+LgJfO444G1wxRq1Gl2wDbDk8nJi3lf3Y
	DnuPAJlKsTZlZYpcWmOu9ctEopHo6xVCf2QP+T71ne5qAIjh9D3AqP6vzkFkkjRaATpHdrvVNKU
	=
X-Received: by 2002:a05:620a:8710:20b0:949:99e1:42d7 with SMTP id af79cd13be357-94999e14369mr199935885a.73.1794979286447;
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d9b579sm12305296d6.38.2026.11.17.21.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:21:26 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference when HL TX fails
Date: Wed, 18 Nov 2026 00:21:16 -0500
Message-ID: <20261118052116.3901761-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_212128_103189_B7B05D14 
X-CRM114-Status: UNSURE (   8.35  )
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

For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
htt->pending_tx and takes an extra skb reference that
ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
fails, for example because the endpoint has no TX credits and TX
bundling is off, no completion runs and both are leaked. After
max_num_pending_tx such failures, msdu_id allocation fails and no more
data frames can be sent.

Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
path, and drop the extra skb reference.

Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
and W=1.

 drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wireless/ath/ath10k/htt_tx.c
index efaea150025b..b437b09717e1 100644
--- a/drivers/net/wireless/ath/ath10k/htt_tx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
@@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt, enum ath10k_hw_txrx_mode txm
 	tx_desc->peerid = __cpu_to_le32(HTT_INVALID_PEERID);
 
 	res = ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
+	if (res) {
+		if (ar->bus_param.hl_msdu_ids) {
+			spin_lock_bh(&htt->tx_lock);
+			ath10k_htt_tx_free_msdu_id(htt, msdu_id);
+			spin_unlock_bh(&htt->tx_lock);
+		}
+		dev_kfree_skb_any(msdu);
+	}
 
 out:
 	return res;

base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
-- 
2.43.0


