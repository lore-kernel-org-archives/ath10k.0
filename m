Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760A2C433EF
	for <ath10k@archiver.kernel.org>; Mon, 21 Feb 2022 13:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8hh4ZZ7IU151YBOdu3jqYVKoJuyZNkvuahOBr+pAr6c=; b=kQJJwz2n1OH+9Y
	H2oDspg3lCuQEOZ5niF+UtCsFnjTYPEI8YatOFXZ/nHNW0WXe1oRHe5MmTE4YTmCaqi3lUlymUzi8
	Yy1NNZIiv6eofd8KHPW6ejhCM7qxemfAhhh3rLr4JNbE5UWB4/xgFbCfCkYCkQ6DWzKjp+8iwHaVV
	3klkctF7Qe7akc0B7BhT3CQMIBa7Ihxmbr/yZJOV0aA9kH0xz/x0L57HeVvAwfXAmh/wjnFZBsiNZ
	jv3Kqfn5oD2KqgR7yqIYY1vtZ2FveIB70gn5RfZvxDYVwK4IAW1ys3B+RkVcLTpOU/KMQoZ131cb6
	FSrmtkAwaFjsfyRiGD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8fQ-005tEq-7u; Mon, 21 Feb 2022 13:23:52 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7lu-005e6D-8H
 for ath10k@lists.infradead.org; Mon, 21 Feb 2022 12:26:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id s14so11631405edw.0
 for <ath10k@lists.infradead.org>; Mon, 21 Feb 2022 04:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXtFK9XIWdkXWHWTAWeRWZH7ZkcOfy+R1WHS0XSQvFY=;
 b=qdtUwIxZq6krEOxRrY6aH4UnuIHbE0uKsTU6XOt67NwnQBohbqH53jUZZjGy4f4C7L
 TwU7r0jtKyeyOfHt0sN8wyCC8GeqjE5OEaPsLha6H/z1SqIwYMSObdoekdCxeJL+zRuQ
 h3Hej11KDvauh8xp4WVh9zlpJauClSPAjFS/ZNJC+D8CwluPPftHqbIa+cFhrcUpw5ET
 duzKoGUfqGKEaxHDvg1UgRF4AQ6WfP7hIX8pM8o2hg/u8KMedoOwIV2svzHFwp4KGU9o
 v9UNBfgHssuW5SE6q95ZhNZNrtck108hU3OL/I21ue6lX9/rKo0fdgRpBFoY3eP11iPY
 v9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXtFK9XIWdkXWHWTAWeRWZH7ZkcOfy+R1WHS0XSQvFY=;
 b=lKpzDSW4dYC6JavCa9E/Cr6Tb2aR0J9rCrWBBhiOknxUJpon7TC6zWFGVaejnfnZuQ
 B6e7mUFL01CGZ1CJQUj9exDlsi9YNDU3VNFWJ0KUWgpQNEM+X0Gq2m23rQzny5+yDMPy
 PHlcmGL52WJr5vPEWLcqpGqviC5L+u3ADTn+gAgXKFzlB/Gb9e98wrDm7+gBZxbYSHqO
 gdFcXNUmaS0s/fErTbtCBWvTn0imam1eNDki+VE1qusMM2Arm5l8oaW5PozfyNRNlJvu
 TMr0NFgGPPvfZ/EyIzwRPj0+/tcXAqJlEkvf3InvuH01yzP+UFxgT8MDL1iRUNeTiXMT
 7GWg==
X-Gm-Message-State: AOAM5329fOgfJGPzBTGRy9nxcfLTf6unQ5Ca4RJj2BbU/4k3vp8wLzkf
 Qb1acPT5Rn77PLjf2U1iqxFI2DpMVfJHFw==
X-Google-Smtp-Source: ABdhPJyS1HuFg/g1gO0muNEi+yK1UaqwaM4CiNTxSlM1/FdKMzuVfJMST5j7OdXRaWrM71VppzevGQ==
X-Received: by 2002:a05:6402:270a:b0:410:63d:a66d with SMTP id
 y10-20020a056402270a00b00410063da66dmr21293487edd.48.1645446387711; 
 Mon, 21 Feb 2022 04:26:27 -0800 (PST)
Received: from picci.homenet.telecomitalia.it
 (host-87-17-90-61.retail.telecomitalia.it. [87.17.90.61])
 by smtp.gmail.com with ESMTPSA id d18sm5115236ejd.95.2022.02.21.04.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:26:27 -0800 (PST)
From: Francesco Magliocca <franciman12@gmail.com>
To: ath10k@lists.infradead.org
Cc: dan.carpenter@oracle.com, rmanohar@qti.qualcomm.com,
 linux-wireless@vger.kernel.org, Francesco Magliocca <franciman12@gmail.com>
Subject: [PATCH v2] ath10k: fix pointer arithmetic error in trace call
Date: Mon, 21 Feb 2022 13:26:38 +0100
Message-Id: <20220221122638.7971-1-franciman12@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_042630_336706_2393F85B 
X-CRM114-Status: GOOD (  17.41  )
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

Reading through the commit history, it looks like
there is no special need why we must skip the first 4 bytes
in this trace call:

trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
			 hw->rx_desc_ops->rx_desc_size - sizeof(u32));

found in the function ath10k_htt_rx_amsdu_pop in the file htt_rx.c

i think the original author
(who is also the one who added rx_desc tracing capabilities
in a0883cf7e75a) just wanted to trace the rx_desc contents,
ignoring the fw_rx_desc_base info field
(which is the part being skipped over).
But the trace_ath10k_htt_rx_desc later added
don't care about skipping it, so it may be good
to uniform this call to the others in the file.
But this would change the output of the trace and
thus it may be a problem for tools that rely on it.
Therefore I propose until further discussion
to just keep it as it is and just fix the pointer arithmetic bug.

Add missing void* cast to rx descriptor pointer in order to
properly skip the initial 4 bytes of the rx descriptor
when passing it to trace_ath10k_htt_rx_desc trace function.

This fixes the pointer arithmetic error detected
by Dan Carpenter's static analysis tool.

Fixes: 6bae9de622d3 ("ath10k: abstract htt_rx_desc structure")

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1

Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
Link: https://lore.kernel.org/ath10k/20220201130900.GD22458@kili/
---
 drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
index 9ad64ca84beb..e01efcd2ce06 100644
--- a/drivers/net/wireless/ath/ath10k/htt_rx.c
+++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
@@ -429,7 +429,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
 				RX_MSDU_END_INFO0_LAST_MSDU;
 
 		/* FIXME: why are we skipping the first part of the rx_desc? */
-		trace_ath10k_htt_rx_desc(ar, rx_desc + sizeof(u32),
+		trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
 					 hw->rx_desc_ops->rx_desc_size - sizeof(u32));
 
 		if (last_msdu)
-- 
2.35.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
