Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E0AC433F5
	for <ath10k@archiver.kernel.org>; Sat, 19 Feb 2022 11:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8hh4ZZ7IU151YBOdu3jqYVKoJuyZNkvuahOBr+pAr6c=; b=edNl+bW9DLLQQD
	uA9aGWJODGXNsR8Ypy+6csTfxurzZ38qhxpJ9XxoP5Wgqxm8QxYvuDq68JSqD4ySCIAXBupsv3Ter
	JEisP3sgF7jvijX78tAQcplRANQElOSHRjtNAI6ShvmKFIDis8j52Fv1jQb5Dh0fL2bHdyWQzXt7E
	8SsjKiNKSHx7v+JVCkSQbF4UJcDQFHUv6oQ/McNWUcsCv35xzgbNb5syD79KrWn4fLOI5DmTxN/Wh
	zpW8tPjVlXZQCBthW+rBrCTKuhjYMkzSicVGuaGri//D/jCtjYsRC/GADSfivpa7g+4SD+lCamftu
	h35Qc6GGQD9bMIsxNiaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLNyj-00Gmkd-59; Sat, 19 Feb 2022 11:32:41 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLNyg-00Gmk7-Mh
 for ath10k@lists.infradead.org; Sat, 19 Feb 2022 11:32:40 +0000
Received: by mail-ej1-x630.google.com with SMTP id lw4so20949430ejb.12
 for <ath10k@lists.infradead.org>; Sat, 19 Feb 2022 03:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXtFK9XIWdkXWHWTAWeRWZH7ZkcOfy+R1WHS0XSQvFY=;
 b=m6yZSEvpx+SpBJnrhGDgT8+5GdxbUz70jUSxRtHgaSPPd4WYQFP++RIUniUpmfloXK
 rhtyTt52dkJdoF8MacFhCp4cmoHjFxrhaoyKGCINjuJmUJIDdcUMhB7J2XldgBIfkiVG
 SvcgwcSPeD88jLKHhLnocehkIrslgToZZHh6OeQ8urHOkH2qFLU9tSvIFBmCXedaIGna
 B5rpNPcyLNZrRW1SVht8tjHBAS+SoeBrf8rP7ejyk3Sto+sGBM3/sve8OD7IN8N/VE/h
 wg2XwV37bPIvivqrjuFoUek1wQWxKyACfgZEfq2U5ftY5X1D0cs9QR2PXyyFaijb9Fw2
 EntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mXtFK9XIWdkXWHWTAWeRWZH7ZkcOfy+R1WHS0XSQvFY=;
 b=4zrzFOMIf7GtJIOyrDwM+StSzFhY0T2ToqgufuWX0QaMj4cyNoysh8R1JmSaeLZ3CM
 yIP8Jxc2Rpr2/fUaiD7YdXqDzgSHYoLuYpxvlD/r0q89O+jQwBkUWy36k/AYb/f0sJK5
 N1lfog12ezgyj0xOpVA3wIWghjIFsjAFd2TTlTlVHHTpN+GPGU4rCh/Fs084svAYpCG7
 gOVXxs8QyV59/jfD2Gb2D28Nqdjm2VPnzab6iSjD5bGLWQzYAKfEDOVKEatmgsPJeWZ3
 VG4hWktu2lcpVZ/h16pqgJDql+xNM0kd+fWfW3bjuFgSrvn+cuwOLCtvtJ59h1nDqlMx
 ZFcg==
X-Gm-Message-State: AOAM531sJCNNIZ//PVaw9h4vm4yR4ZLQW/MR904y0JfN7XgmJjOnkPHN
 aXLKQL3ns/c2o/OKtbqohgwDzgd++z2Xuw==
X-Google-Smtp-Source: ABdhPJwGFEGsnT75Vw25+hjdivlXoTQA0i8VUpu/lTtNgqpPlSQ2W228NYnU9iOVAErNBa9K0mlziw==
X-Received: by 2002:a17:906:453:b0:6cd:6aa8:8e4c with SMTP id
 e19-20020a170906045300b006cd6aa88e4cmr9303233eja.588.1645270356018; 
 Sat, 19 Feb 2022 03:32:36 -0800 (PST)
Received: from picci.homenet.telecomitalia.it
 (host-87-17-90-61.retail.telecomitalia.it. [87.17.90.61])
 by smtp.gmail.com with ESMTPSA id h14sm2187816edz.29.2022.02.19.03.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 03:32:35 -0800 (PST)
From: Francesco Magliocca <franciman12@gmail.com>
To: ath10k@lists.infradead.org
Cc: dan.carpenter@oracle.com, rmanohar@qti.qualcomm.com,
 Francesco Magliocca <franciman12@gmail.com>
Subject: [PATCH] ath10k: fix pointer arithmetic error in trace call
Date: Sat, 19 Feb 2022 12:32:57 +0100
Message-Id: <20220219113257.5459-1-franciman12@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_033238_798474_96C0C92C 
X-CRM114-Status: GOOD (  17.66  )
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
