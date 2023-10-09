Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDC4E95A91
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QJk/Nfo6OXg58e4jQTZz7MlR9WnTTavYiJMQIPh8gbg=; b=b8TTmNtTwnRMd/
	gk1GyI1X+CqIIAGkTgFpRfsnPlIxjrou/fOXg46FFvlJEWgr67PoYcFP+fytxLaik2oMBypUv+GO2
	KTiTRd6DB/H/h3r7IPFFxRvxulXvV8zNidkSnDmfwPXI+rwLyiNrjVk87fTUBSbYmtG7akxnatMc7
	bfvpI5HYscs9I4JzBfTKWymMke+dt3M+IIkCsXT5j2OqinJh4iNUI28VCSsm8R7lSOEGIlgNa+Y6M
	zP9Z9wOoC/IsAAhpwUt4hYxvMt+unhVvn4DcL2cMZ7VtOl7cLn0bVtowB9e4ocrERaiEcq56ioUIt
	3tGKIR8hUVf5Ux+HiMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSo-00ApMg-0y;
	Mon, 09 Oct 2023 13:38:26 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSh-00ApDz-1g;
	Mon, 09 Oct 2023 13:38:22 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3232be274a0so3383214f8f.1;
        Mon, 09 Oct 2023 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858695; x=1697463495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6V3Yp/K15xx7ev3Qhf5+/0w5en07kzL7Wskfo0+HBPw=;
        b=f4ylHzkTLyb6+bLy020cg8g6vcC2bx4vTp1nRgSwsYibPyWy8OPWV4ucie6d8a4MQb
         q7NbU/Z79zWJtCW9CDFSC53EwsiCli6joMA0HWrqiBi1E1Z//MJcoTcA9jJz+wLHbVNS
         dnD/4yG/PeQlEvZDh0P6KKSbGESURpbU9ukQTq9qi8J/EnOyb74Rln55Fl6F7GXjCrGU
         oR70RF/vRcP0xmZZSFtaRx3TJsETFxH1A7CrKnus31IEiSxzAJhnnmss+zkhHcuRr60C
         /pkZWOovTwQcK2mLJEpJrfO8E/kkkZTCf/Kf2R2wKOeobrPo4f9m6d4JAN35tAGjeKm6
         +T0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858695; x=1697463495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V3Yp/K15xx7ev3Qhf5+/0w5en07kzL7Wskfo0+HBPw=;
        b=a+miColL1gRPlw24J5lJlFVO/bDgjPj064sVafsktlzwxGDHW0HRnkw5ocQ538Xmcf
         QJawpGxAMYIUoXySYrX2Q9TSNeU6SYyCXvmis4Z5w3RxwSNs+YUnduJ1y20r1UyMnkyS
         7WLUKXXWQkZWJ8vPLEpnRON0su39ewNn4BpvD7dKUbJNT1WYkDJyT5UpwrTR/pBmLtPH
         00e9WmWHlvv14qo4UCx2CTd3PnIyZ67tkhcf4V1SSnQF9ZM6Foe07wARhnYmjaA6eCeE
         3chJ/Ry4LOUbOELghjJjOMgUou7P8F2EcnosCudgCSPD7PyiBTa05PpKevsmGiGfCII3
         2Mag==
X-Gm-Message-State: AOJu0Yw9gCvhxpITRrA5FiiKXRJzP3ZP+pSqTGb+Eqbf3kmu9XW/IBH6
	aIOmYpHkCHEtIcZzT8TgMFE=
X-Google-Smtp-Source: AGHT+IEg5HTR+xDE3IzwD0pbfXpmjGlWQO4VcUmgAYjzp1NHs11O05PimyYF9rp+Ru7+he92h2hBgA==
X-Received: by 2002:a05:6000:1112:b0:317:6734:c2ae with SMTP id z18-20020a056000111200b003176734c2aemr9423512wrw.11.1696858695077;
        Mon, 09 Oct 2023 06:38:15 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:14 -0700 (PDT)
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
Subject: [net-next v3 5/5] netdev: use napi_schedule bool instead of napi_schedule_prep/__napi_schedule
Date: Mon,  9 Oct 2023 15:37:54 +0200
Message-Id: <20231009133754.9834-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063819_565503_CE32F2E8 
X-CRM114-Status: GOOD (  16.25  )
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

Replace if condition of napi_schedule_prep/__napi_schedule and use bool
from napi_schedule directly where possible.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v3:
- Drop toshiba change and rework in separate patch
---
 drivers/net/ethernet/atheros/atlx/atl1.c     | 4 +---
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/atheros/atlx/atl1.c b/drivers/net/ethernet/atheros/atlx/atl1.c
index 02aa6fd8ebc2..a9014d7932db 100644
--- a/drivers/net/ethernet/atheros/atlx/atl1.c
+++ b/drivers/net/ethernet/atheros/atlx/atl1.c
@@ -2446,7 +2446,7 @@ static int atl1_rings_clean(struct napi_struct *napi, int budget)
 
 static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 {
-	if (!napi_schedule_prep(&adapter->napi))
+	if (!napi_schedule(&adapter->napi))
 		/* It is possible in case even the RX/TX ints are disabled via IMR
 		 * register the ISR bits are set anyway (but do not produce IRQ).
 		 * To handle such situation the napi functions used to check is
@@ -2454,8 +2454,6 @@ static inline int atl1_sched_rings_clean(struct atl1_adapter* adapter)
 		 */
 		return 0;
 
-	__napi_schedule(&adapter->napi);
-
 	/*
 	 * Disable RX/TX ints via IMR register if it is
 	 * allowed. NAPI handler must reenable them in same
diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
index 23b5a0adcbd6..146bc7bd14fb 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/rx.c
@@ -1660,9 +1660,7 @@ irqreturn_t iwl_pcie_irq_rx_msix_handler(int irq, void *dev_id)
 	IWL_DEBUG_ISR(trans, "[%d] Got interrupt\n", entry->entry);
 
 	local_bh_disable();
-	if (napi_schedule_prep(&rxq->napi))
-		__napi_schedule(&rxq->napi);
-	else
+	if (!napi_schedule(&rxq->napi))
 		iwl_pcie_clear_irq(trans, entry->entry);
 	local_bh_enable();
 
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
