Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0484EE95A9B
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1qbwHLetFCZLQBdnaT5flRMFyQT9S4rMNcAqMkSNZg=; b=uHEqPnmCtL54Tc
	tUgufihzO3lMK/4BIGtY9eqK7aKdW/Nn7K4RzcwByI8jo7StZeCrtO10uWGBW0b0EwP4Uw731QmPV
	cXCrv1t18zVhBK1GLITmX4O4OoWOJUDD2/zJ7l0HhGrSCb/2VtuB21EVy3Ze1qRn9kb0Zicwr3G0+
	C/b9YAEJKOpYESsKW3kvjV8Tde2bPrZ0tC5XNWeiN9+IsSQ4dhP/Oo9ivKaDzLwl25WXf+gYOMcLC
	p3kX2bZEzg1Ve3y7zQFiBc3iWvPAND3X/FsimWUttqu8XPnj2W9gwOGsy7bf/xg1RSmks5QUA2GMu
	+ya5KV7tfttR5asVqqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSh-00ApGm-1x;
	Mon, 09 Oct 2023 13:38:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSb-00ApAU-2b;
	Mon, 09 Oct 2023 13:38:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-313e742a787so2688490f8f.1;
        Mon, 09 Oct 2023 06:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858690; x=1697463490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s40lJjZed1gxdZ2oTFcFhZRu/OmcTjbvbFoqBjK6C4o=;
        b=fX84d3sUmGv/TmyndEbByO0OlmDs91ycpa7uRAwZKlv6QfL+qYy6x1TXMXZ8Q2MqSp
         CDeAT3vqqlak+fNtPHesOfCbDi62TUdmlD6jXIIrqPoacTmYiqWlxEeleehibKuG7k4N
         WvosoxDSHhCn0DVbOfgmwgDoVWgutlzz6Ia+sCf3JDYxfyjMvTagcAYy+ik6drPr7rcH
         j5Ce+KOFsaCY6YYmWpxCU/zyOCjthLEIDng6Kb8lKtMzwLvESPLhyASJWTiUh3mL4rTZ
         3GUeR+8YR7UIichomrDJCjC104SYHBIbUrM1I5NTpnh38ssAcLqzT6pbIvf+S4n9PXTh
         2tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858690; x=1697463490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s40lJjZed1gxdZ2oTFcFhZRu/OmcTjbvbFoqBjK6C4o=;
        b=X66BvZHMsHbV91HjoPuFfBWjIpauYTW9Ios/hIwy4wDndygUlgdhiJR7e9Kr0T15Fc
         uVxovrNlEg0XgRo3eqsMgvFGzZrzIh87UPpEfNv2yXTJHawXela4kssHoDI/nfNNqjys
         4CTMbM8gK0MS0NKsAQqI3vgCpneirl6TQMuqvF24TxG/Uld4Idb1LIGkt2OXsxXcGvQP
         6QKUPb/V9M8bC7BHR8TYqdmN3aOBSUb9ryDmBHf7DbQXp2wpzzasE27TIpc1GULLE07b
         t7us0vsqBWX1HEQFSWLIenLX1bdkMX2FaVRwEJxx5+dr8DZf6E8oGwZrCqdeHnQeBL2+
         rXZQ==
X-Gm-Message-State: AOJu0YyRKpLr0aBh6nHab+zftiTtf1k432kmT3elslA1sqM1q2ad//Pf
	k8sZF7K0QFODepZy/1JiV5c=
X-Google-Smtp-Source: AGHT+IHhmg/2ezKMDdmGDYLXd0Qp+SGCEJp/8Boviz8cL/VP/vp/9mkILUL4YPlUBG82enIQl/DKrg==
X-Received: by 2002:a5d:63cc:0:b0:314:c6b:b9a2 with SMTP id c12-20020a5d63cc000000b003140c6bb9a2mr11503758wrw.13.1696858688976;
        Mon, 09 Oct 2023 06:38:08 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:08 -0700 (PDT)
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
Subject: [net-next v3 3/5] netdev: replace napi_reschedule with napi_schedule
Date: Mon,  9 Oct 2023 15:37:52 +0200
Message-Id: <20231009133754.9834-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063813_860348_E66D9CFE 
X-CRM114-Status: GOOD (  16.32  )
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

Now that napi_schedule return a bool, we can drop napi_reschedule that
does the same exact function. The function comes from a very old commit
bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
net_device") and the purpose is actually deprecated in favour of
different logic.

Convert every user of napi_reschedule to napi_schedule.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # ath10k
Acked-by: Nick Child <nnac123@linux.ibm.com> # ibm
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v3:
- Add Reviewed-by tag
Changes v2:
- Add ack tag
---
 drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
 drivers/net/can/dev/rx-offload.c                       |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
 drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
 drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
 drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
 drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
 drivers/net/ethernet/ni/nixge.c                        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
 drivers/net/fjes/fjes_main.c                           |  2 +-
 drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
 drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
 include/linux/netdevice.h                              | 10 ----------
 19 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_ib.c b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
index ed25061fac62..7f84d9866cef 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_ib.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
@@ -488,7 +488,7 @@ int ipoib_rx_poll(struct napi_struct *napi, int budget)
 		if (unlikely(ib_req_notify_cq(priv->recv_cq,
 					      IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 
@@ -518,7 +518,7 @@ int ipoib_tx_poll(struct napi_struct *napi, int budget)
 		napi_complete(napi);
 		if (unlikely(ib_req_notify_cq(priv->send_cq, IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 	return n < 0 ? 0 : n;
diff --git a/drivers/net/can/dev/rx-offload.c b/drivers/net/can/dev/rx-offload.c
index 77091f7d1fa7..46e7b6db4a1e 100644
--- a/drivers/net/can/dev/rx-offload.c
+++ b/drivers/net/can/dev/rx-offload.c
@@ -67,7 +67,7 @@ static int can_rx_offload_napi_poll(struct napi_struct *napi, int quota)
 
 		/* Check if there was another interrupt */
 		if (!skb_queue_empty(&offload->skb_queue))
-			napi_reschedule(&offload->napi);
+			napi_schedule(&offload->napi);
 	}
 
 	return work_done;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 98dd78551d89..b5ff2e1a9975 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 
 			if (fl_starving(adap, fl)) {
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 2d0cf76fb3c5..5b1d746e6563 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2094,7 +2094,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 				struct sge_eth_rxq *rxq;
 
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index edf000e7bab4..4d7184d46824 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -198,7 +198,7 @@ static int nps_enet_poll(struct napi_struct *napi, int budget)
 		 */
 		if (nps_enet_is_tx_pending(priv)) {
 			nps_enet_reg_set(priv, NPS_ENET_REG_BUF_INT_ENABLE, 0);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		}
 	}
 
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 83b09dcfafc4..276f996f95dc 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -281,7 +281,7 @@ static int gve_napi_poll(struct napi_struct *napi, int budget)
 		if (block->rx)
 			reschedule |= gve_rx_work_pending(block->rx);
 
-		if (reschedule && napi_reschedule(napi))
+		if (reschedule && napi_schedule(napi))
 			iowrite32be(GVE_IRQ_MASK, irq_doorbell);
 	}
 	return work_done;
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 251dedd55cfb..1e29e5c9a2df 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -900,7 +900,7 @@ static int ehea_poll(struct napi_struct *napi, int budget)
 		if (!cqe && !cqe_skb)
 			return rx;
 
-		if (!napi_reschedule(napi))
+		if (!napi_schedule(napi))
 			return rx;
 
 		cqe_skb = ehea_proc_cqes(pr, EHEA_POLL_MAX_CQES);
diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 462646d1b817..2439f7e96e05 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -442,7 +442,7 @@ static int mal_poll(struct napi_struct *napi, int budget)
 		if (unlikely(mc->ops->peek_rx(mc->dev) ||
 			     test_bit(MAL_COMMAC_RX_STOPPED, &mc->flags))) {
 			MAL_DBG2(mal, "rotting packet" NL);
-			if (!napi_reschedule(napi))
+			if (!napi_schedule(napi))
 				goto more_work;
 
 			spin_lock_irqsave(&mal->lock, flags);
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 832a2ae01950..9490272c0421 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1433,7 +1433,7 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 		BUG_ON(lpar_rc != H_SUCCESS);
 
 		if (ibmveth_rxq_pending_buffer(adapter) &&
-		    napi_reschedule(napi)) {
+		    napi_schedule(napi)) {
 			lpar_rc = h_vio_signal(adapter->vdev->unit_address,
 					       VIO_IRQ_DISABLE);
 		}
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index cdf5251e5679..2094f413cbe4 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3519,7 +3519,7 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 		if (napi_complete_done(napi, frames_processed)) {
 			enable_scrq_irq(adapter, rx_scrq);
 			if (pending_scrq(adapter, rx_scrq)) {
-				if (napi_reschedule(napi)) {
+				if (napi_schedule(napi)) {
 					disable_scrq_irq(adapter, rx_scrq);
 					goto restart_poll;
 				}
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
index 332472fe4990..a09b6e05337d 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
 	for (ring = 0; ring < priv->rx_ring_num; ring++) {
 		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
 			local_bh_disable();
-			napi_reschedule(&priv->rx_cq[ring]->napi);
+			napi_schedule(&priv->rx_cq[ring]->napi);
 			local_bh_enable();
 		}
 	}
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index f71a4f8bbb89..fa1f78b03cb2 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -683,7 +683,7 @@ static int nixge_poll(struct napi_struct *napi, int budget)
 		if (status & (XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK)) {
 			/* If there's more, reschedule, but clear */
 			nixge_dma_write_reg(priv, XAXIDMA_RX_SR_OFFSET, status);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			/* if not, turn on RX IRQs again ... */
 			cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index f9e43fc32ee8..3ca1c2a816ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -802,7 +802,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 		stmmac_start_rx(priv, priv->ioaddr, i);
 
 		local_bh_disable();
-		napi_reschedule(&ch->rx_napi);
+		napi_schedule(&ch->rx_napi);
 		local_bh_enable();
 	}
 
diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index b242aa61d8ab..64dea4ad2ad3 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -714,9 +714,9 @@ static int eth_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_below_low_watermark(rxq) &&
-			    napi_reschedule(napi)) { /* not empty again */
+			    napi_schedule(napi)) { /* not empty again */
 #if DEBUG_RX
-				netdev_debug(dev, "eth_poll napi_reschedule succeeded\n");
+				netdev_debug(dev, "eth_poll napi_schedule succeeded\n");
 #endif
 				qmgr_disable_irq(rxq);
 				continue;
diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 2513be6d4e11..cd8cf08477ec 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1030,7 +1030,7 @@ static int fjes_poll(struct napi_struct *napi, int budget)
 		}
 
 		if (((long)jiffies - (long)adapter->rx_last_jiffies) < 3) {
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			spin_lock(&hw->rx_status_lock);
 			for (epidx = 0; epidx < hw->max_epid; epidx++) {
diff --git a/drivers/net/wan/ixp4xx_hss.c b/drivers/net/wan/ixp4xx_hss.c
index e46b7f5ee49e..b09f4c235142 100644
--- a/drivers/net/wan/ixp4xx_hss.c
+++ b/drivers/net/wan/ixp4xx_hss.c
@@ -687,10 +687,10 @@ static int hss_hdlc_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_empty(rxq) &&
-			    napi_reschedule(napi)) {
+			    napi_schedule(napi)) {
 #if DEBUG_RX
 				printk(KERN_DEBUG "%s: hss_hdlc_poll"
-				       " napi_reschedule succeeded\n",
+				       " napi_schedule succeeded\n",
 				       dev->name);
 #endif
 				qmgr_disable_irq(rxq);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 23f366221939..2f8c785277af 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3148,7 +3148,7 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 		 * immediate servicing.
 		 */
 		if (ath10k_ce_interrupt_summary(ar)) {
-			napi_reschedule(ctx);
+			napi_schedule(ctx);
 			goto out;
 		}
 		ath10k_pci_enable_legacy_irq(ar);
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index f4ff2198b5ef..210d84c67ef9 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -852,7 +852,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 	if (!ret) {
 		napi_complete_done(napi, work_done);
 		rxq->sleep_lock_pending = true;
-		napi_reschedule(napi);
+		napi_schedule(napi);
 		return work_done;
 	}
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2bead8e2a14d..bbf9038f2afd 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -516,16 +516,6 @@ static inline void napi_schedule_irqoff(struct napi_struct *n)
 		__napi_schedule_irqoff(n);
 }
 
-/* Try to reschedule poll. Called by dev->poll() after napi_complete().  */
-static inline bool napi_reschedule(struct napi_struct *napi)
-{
-	if (napi_schedule_prep(napi)) {
-		__napi_schedule(napi);
-		return true;
-	}
-	return false;
-}
-
 /**
  * napi_complete_done - NAPI processing complete
  * @n: NAPI context
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
