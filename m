Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71270E95A8E
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5V0NY5i5ZLzgKeg9f2BCUv0Q7VYYsBV5KP9hpEbvAs=; b=WMq3xRraTMY5ve
	k7CSSvWyvFwQNO6nRrIOe8HUgxYK3PdLQtSC7zMrxVn0W/KEMA6kwdeSmKfW686O0dIWkRymMy92f
	1LmdlBEBuXPMT/Kh97v1wJnAT1OGnImn8ldlV9qaCD42fOxpV5daczPib/HhiFOeoDTz4hWCDfxj+
	+rDlVZEtM9uPKXf3QG83ETd9G0POTPPY9MWJccLUCsDdaaoapS91uIWqTtPtt2yTKDp7umaVrkmCM
	kDkwNIyPA9wmCs9TPZdKvPHfERAkV7nQu8jFxyjKhbCSbwGfE8oFbNCQSC1xdaAjKHiyG6o/Mn7WN
	ZpDL6Cy9zue+K6EIjiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSp-00ApNP-0P;
	Mon, 09 Oct 2023 13:38:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSh-00ApBS-1c;
	Mon, 09 Oct 2023 13:38:22 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32615eaa312so4159791f8f.2;
        Mon, 09 Oct 2023 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858692; x=1697463492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
        b=d1NosGnJgNkuIwc1GUjQIywxf4Fm/fabTRjTejdaM86jpobaqTg4U7G93E5eNiG70C
         aNecsVn0vyiZnqCK1L9x65YgD2vgOK20eE7x8EzhSSxwUpL8aMhyTsiRpMF/CWww/+3e
         Pzg6mbIrdUBM5gI+ctdwz9khxrN9jSiBmF7owt77263xnlfdsmo0kKFAZkpglodRzYKj
         hw48d/KFwD+I3fqGRSHqb+1r4i5At8w7YlaNXtKwnW29eZeexD5rr56qF9P3UvDWdnPD
         a2NVlfFzv8Q2oIZGpkwfbZJm+/LmdZjX3Qph+l8wtKjZUXIBPir+QKJB+8gYddh7VUfI
         lDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858692; x=1697463492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EzAWHH01VVS9IgkvFldWVDddj9E+l4PxhyRk8MwG584=;
        b=cDO/6zkSgGCaBTAkGlJF7Na5MrI8VE185Nb8qndHcETh1klcPxRiCysVE+TkD4AIhH
         Q/g+G3wmovmLrZllV6SGc9YoBnpPYn83+cU0YXCTBYV4+ChnohDK5jzixhcDqqfE2Tb2
         D6iedUAhPHi3zzR5rMSTV5ZP2AI7TCw/PYFdXvhr8kx8vxkzONr7xaRWetMdDs9400Fh
         W5RaXId3MZ5EENcYnDF80lD5aRoqSeP8czM0yGnG4N2XHuPI2pH4w10Kaop2zQeWIxDX
         TiLiWyzAQur9klMz8DSxjdO5+hHTfYymgbJ2LMCt7R/R9roLSMY6XOkwsbrdPkyhQy3Y
         U9Ug==
X-Gm-Message-State: AOJu0YzbSnk+ew4gdLBznppwWjSqKVVNM65J1IMWOwBFerWuj7GdcUQk
	NCnpNDI0opzKwAcA+5AnXyc=
X-Google-Smtp-Source: AGHT+IHsAsFvK5zcfvpEHNpBjlrUZf2mmc5SciLA+pPQWufHQKhdvJk6OO5q7vOl9k3p/vj4f/tuWw==
X-Received: by 2002:adf:e9d0:0:b0:31f:f432:b541 with SMTP id l16-20020adfe9d0000000b0031ff432b541mr13440190wrn.69.1696858692458;
        Mon, 09 Oct 2023 06:38:12 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Nick Child <nnac123@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Alex Elder <elder@linaro.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bailey Forrest <bcf@google.com>,
	Junfeng Guo <junfeng.guo@intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	Dawei Li <set_pte_at@outlook.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [net-next v3 4/5] net: tc35815: rework network interface interrupt logic
Date: Mon,  9 Oct 2023 15:37:53 +0200
Message-Id: <20231009133754.9834-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063819_544056_6F7DD9D2 
X-CRM114-Status: GOOD (  15.86  )
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

Rework network interface logic. Before this change, the code flow was:
1. Disable interrupt
2. Try to schedule a NAPI
3. Check if it was possible (NAPI is not already scheduled)
4. emit BUG() if we receive interrupt while a NAPI is scheduled

If some application busy poll or set gro_flush_timeout low enough, it's
possible to reach the BUG() condition. Given that the condition may
happen and it wouldn't be a bug, rework the logic to permit such case
and prevent stall with interrupt never enabled again.

Disable the interrupt only if the NAPI can be scheduled (aka it's not
already scheduled) and drop the printk and BUG() call. With these
change, in the event of a NAPI already scheduled, the interrupt is
simply ignored with nothing done.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/toshiba/tc35815.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/tc35815.c b/drivers/net/ethernet/toshiba/tc35815.c
index 14cf6ecf6d0d..6e3758dfbdbd 100644
--- a/drivers/net/ethernet/toshiba/tc35815.c
+++ b/drivers/net/ethernet/toshiba/tc35815.c
@@ -1434,14 +1434,10 @@ static irqreturn_t tc35815_interrupt(int irq, void *dev_id)
 	u32 dmactl = tc_readl(&tr->DMA_Ctl);
 
 	if (!(dmactl & DMA_IntMask)) {
-		/* disable interrupts */
-		tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
-		if (napi_schedule_prep(&lp->napi))
+		if (napi_schedule_prep(&lp->napi)) {
+			/* disable interrupts */
+			tc_writel(dmactl | DMA_IntMask, &tr->DMA_Ctl);
 			__napi_schedule(&lp->napi);
-		else {
-			printk(KERN_ERR "%s: interrupt taken in poll\n",
-			       dev->name);
-			BUG();
 		}
 		(void)tc_readl(&tr->Int_Src);	/* flush */
 		return IRQ_HANDLED;
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
