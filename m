Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA2E784BF
	for <ath10k@archiver.kernel.org>; Mon,  2 Oct 2023 15:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KRxZPyJPY+4OgVFFUqDEAQdf5xSAuGqL7JDAV3/0axE=; b=zcYUAW5Lzswr/I
	G9pGFSW/UWkuXms78F98Wb4WQDyTUYuQUHp/+/T8/PgD5NiXTdWIiUR8GGcU/gUiDC/b+ReoUj46c
	13AM09pI/yGW07MsTz+65KU58ACVAk9g8ThAlwDl5zFNplaAjZ2zHklzhVR7RwYn3ayK86sXI1/Yp
	GEpxS4GdwAt4tSSXpcLBfeaC7mm67unIJCCET/C4L6h1jOsfcRtpYbSlCyUJuZOGWw4no7khPlYG/
	+oycIXligvf64KTh69Icde6vatzB3csJ79SXIEBrjejDuva+05wGc8ChyOjNisyfDWMGJ93AU05sr
	mTOD3gjxWsJt9yOM9S4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKZH-00CwlP-0p;
	Mon, 02 Oct 2023 15:10:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKZC-00Cwie-1N;
	Mon, 02 Oct 2023 15:10:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4060b623e64so19744735e9.0;
        Mon, 02 Oct 2023 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696259435; x=1696864235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ow78hAE0yIyUemUyYOBz3q9ywNhxcPT95anou49aj54=;
        b=NR82s8eQn/OM25bqXOx048irJE2xiZJsjZ6zxKGrpuqvk1+94SNGAWk73MmKdFRR2z
         u5jxqVhicD/Fu5s1pfGX6vmiJjRdsdM56cYfB2nGTqBOfD8kZmJOC84QzYPyw0d3NaVW
         f5V9Q/hV6OPO9IYWFcaPRMdRJfbt1FW9Jq/zVfXiCJyxZHiyGg1nqLtlkLHTjo2EcQtX
         UZ59mC815vTFjso+3ntHpktUOXrKDFS0FMcp3u7id2MN/12SGMKZ+4y+DCEdiCWHhQjX
         EsEN4zeznZNvZOA/9HCJKlRTn1W0KMo/QmkRAp9Uawjsu+2fvegmcMbozg1VYvD4hKlV
         grWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259435; x=1696864235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow78hAE0yIyUemUyYOBz3q9ywNhxcPT95anou49aj54=;
        b=LuoSIglD4xCxvEYYRlJm4/ipY4zSpStMV50/xVpLLJA5rZO1Z71iPTQBYyGaaYfjDl
         fMWHmz2W0LAj+WzNKck5ca/axCB5xYZRtWua4IbB4+6brsVnXyhzcEhvzedOj3naIYo2
         iKzuctMrudCIOF1t6MuBGNDq3Oe19E2++55PXpLcdGSl8gGGpKR9TuMbPEK7XxeMyBfX
         m+7n8KaUs/wm38C59ki7ZiSo+XwqV0+5zaIqXirtrsWTaYQbeuEfo+tjCjScJHNJ8Rd0
         Gx385xGzFC/lquz0KUOEFNuBqyfJJFrd4c0c82bnPu0AXmAlRlnlbFBjh4UZXe6E1LBT
         MfoA==
X-Gm-Message-State: AOJu0YxM3u+imBXQ8DcaYks6lNONGJP9zGpwHIEx7Mj5ioTXlDADw1+b
	aslbBYvib9i8vyObE93zC9M=
X-Google-Smtp-Source: AGHT+IER54DFWa7vQIFTj6+iJgsPdY5/GDB29GHbGeIgWOfOFDfcvPSoorLgTOCTW0kTjVMyBnWZcA==
X-Received: by 2002:a05:600c:4991:b0:401:b92f:eec5 with SMTP id h17-20020a05600c499100b00401b92feec5mr10163374wmp.9.1696259434455;
        Mon, 02 Oct 2023 08:10:34 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm7421565wmi.44.2023.10.02.08.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:10:32 -0700 (PDT)
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
	Wei Fang <wei.fang@nxp.com>,
	Alex Elder <elder@linaro.org>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bailey Forrest <bcf@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Junfeng Guo <junfeng.guo@intel.com>,
	Ziwei Xiao <ziweixiao@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rushil Gupta <rushilg@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Lee Jones <lee@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [net-next PATCH 1/4] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
Date: Mon,  2 Oct 2023 17:10:20 +0200
Message-Id: <20231002151023.4054-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081038_472306_88110600 
X-CRM114-Status: GOOD (  12.35  )
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

Replace drivers that still use napi_schedule_prep/__napi_schedule
with napi_schedule helper as it does the same exact check and call.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/ni/nixge.c     | 3 +--
 drivers/net/ethernet/wiznet/w5100.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 97f4798f4b42..f71a4f8bbb89 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -755,8 +755,7 @@ static irqreturn_t nixge_rx_irq(int irq, void *_ndev)
 		cr &= ~(XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK);
 		nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET, cr);
 
-		if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		napi_schedule(&priv->napi);
 		goto out;
 	}
 	if (!(status & XAXIDMA_IRQ_ALL_MASK)) {
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index 341ee2f249fd..5613fd6a9f0a 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -930,8 +930,8 @@ static irqreturn_t w5100_interrupt(int irq, void *ndev_instance)
 
 		if (priv->ops->may_sleep)
 			queue_work(priv->xfer_wq, &priv->rx_work);
-		else if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		else
+			napi_schedule(&priv->napi)
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
