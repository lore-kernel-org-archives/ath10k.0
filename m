Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5A8E95A98
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jyojd9KefWI86KHxK8JAxDxtZT8Kd+uemwO1ErXjAaU=; b=Ku1cV5v9wnZ6qi
	yAfgWRSRaRuY2uj3dmzhze8OOtJOrwy6d1YU96b5uUvQ1FRESlOED8hSpW3i+N/0odjAe9t8DuARw
	bJF0nRntcI6FPsjmz8zEttpIcUkzuNnl5nrVQhqZkxZ8DrnGoZd1n4HmZUS9YUMSmWnt1T8EpRahp
	QRGUPWvkidGRyrjx3uo2Bc+CeFX9VexDmosTdM2x9n4stOR3cZtStdtwNdzgzCIk/ff991eKMLxuh
	OrcHAnZ0Eip3mj459zb+smaA3uxtJS5Vn6cKsrMAB5KMhyRUbW/1WckDFXX8hfpBPEwdjTOZNc9Qy
	K4eaPURAEMFNMPi9HV7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSa-00ApBL-36;
	Mon, 09 Oct 2023 13:38:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqST-00Ap9W-25;
	Mon, 09 Oct 2023 13:38:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-32329d935d4so4110894f8f.2;
        Mon, 09 Oct 2023 06:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858684; x=1697463484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
        b=bBvXOFvlb9X0JMs3YrxF1hfQtCahqQSFb26a4P7yipc69mBhBzPFSHJxLl7DBgaWr2
         AkQLAOnud/2d7FY5ZzQ8bDikH5a4et16eREwz/qlq9+u+L/Jbi8gZ3YrBD/MlVbYdTc2
         HjeuHeBhncIWneRryuNbKkFM9ThMukpUCEgKqYZJ7KtKBx7u/OYUy/Fwwir1PsDqKnAz
         O0RR8FVAlXgtbyUwQTJ7Ur3e6Vkckmj2cnAv/RuThxUxiRZmXIAF4pfR5QgMwv89fQ6b
         0Dr+lc1OxSKH9U3wMkvsL+ytHg2HSSJU/vH4+nyhDTZZv3cdTSgPSveeP09h5jMdtwEO
         ZPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858684; x=1697463484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u6KCxFngvX9I/hwQrj7ymkXhwkpFmhe1Y7OW2VCan1I=;
        b=B08LqhoNTPydbDMAdn9xP8jj9nujx0ehHJGGWi6iC/M5wG6aW06B7LEgaTM5qswFa5
         m6JfdJ6meQdhz+Yj1RxDV+EAFj4pcVWcLDlUYtYTzT6LHltVaxpzd8Vk0jDOGGL+Uz0o
         t3pB9oP6iz/KofNgY7sacgFUJDnbpsi5tjTVOQBI5I+M51BMpr5SDWgdD5k5UKRExk4B
         QzbBr5wEmcYt/qygtFHiEAsGGBt4Arr0ADX0vunhC8qhwyrI6mIlYpfuN0VnxQ/sUnmx
         GzjR6jsgNpvPEoA1hcuWuy2h1+yW7jblSfkkXLRoWEJ3YszBgHXq3lAdsWwBQoiUjzV0
         qU/w==
X-Gm-Message-State: AOJu0YzmMomKjiPn/USbbFR05OlfC5hwI0G3HUubZOcYJu2dlPXEvhGh
	7GfqoGTkvxJQKl8++G8RRHQ=
X-Google-Smtp-Source: AGHT+IEMzVE5102E/rR+PKbFb4Y1qJpv3S+lyAIEK40sgvEz//IRItxHur9Z7ZsOHs5xcO/iYCxqbg==
X-Received: by 2002:adf:f78d:0:b0:320:926:26d5 with SMTP id q13-20020adff78d000000b00320092626d5mr13881386wrp.30.1696858683739;
        Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:03 -0700 (PDT)
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
Subject: [net-next v3 1/5] netdev: replace simple napi_schedule_prep/__napi_schedule to napi_schedule
Date: Mon,  9 Oct 2023 15:37:50 +0200
Message-Id: <20231009133754.9834-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063805_681660_BF2C9A65 
X-CRM114-Status: GOOD (  12.45  )
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
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v3:
- Add Reviewed-by tag
Changes v2:
- Add missing semicolon
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
index 341ee2f249fd..b26fd15c25ae 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -930,8 +930,8 @@ static irqreturn_t w5100_interrupt(int irq, void *ndev_instance)
 
 		if (priv->ops->may_sleep)
 			queue_work(priv->xfer_wq, &priv->rx_work);
-		else if (napi_schedule_prep(&priv->napi))
-			__napi_schedule(&priv->napi);
+		else
+			napi_schedule(&priv->napi);
 	}
 
 	return IRQ_HANDLED;
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
