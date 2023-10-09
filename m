Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3ADE95A95
	for <ath10k@archiver.kernel.org>; Mon,  9 Oct 2023 13:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCWFw8oUj0UJrXAj2FsHt/ne1i1q3eGa/kW9pPMTF/8=; b=cT4rIGCBgkrhqW
	8cctaJkirO+VNu0neFwfj1MUvkDeVLhmXhkWBP+xJ0/IHmWSrJ6llanSxmxsBLobr/5UdeXOyCf0N
	RfoD1JC5giHJjRW8q2MGko7FNeQUOK8WqctfnVuG98JaA2CHamU++LBq1yFtHb1S7f+IJPr+BoZcs
	Q6bG4DudPjDAHBp2R9m8Kzu95cwOZKitwyLLRkn06USAlhoEwyY1iUlyqH+mJwrEcIdAVrQl0HDxz
	yLbURm9HzM1KeSEWpqm2pBznuqjDRUaUO21GIt9VMC6UsKg5/rEyFltkISins+DSx3Snj0KVBC9f0
	xaz7414avqnTU6qyhT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSd-00ApDZ-0g;
	Mon, 09 Oct 2023 13:38:15 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpqSY-00Ap9s-13;
	Mon, 09 Oct 2023 13:38:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-406650da82bso41731755e9.3;
        Mon, 09 Oct 2023 06:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696858686; x=1697463486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=JA/6igAIpiigqjNIGG+a7ezsr9nLesmLQ38wVNcdcpNc1MYlffm8vlXyX6X8/5Lpck
         2B1HAz3gaf9/S83ZksZaOVscHkd0fcO9WV2Xde6mN0pYUDqULx3TNI/tdgqpeU85Y7Ue
         5Jf3J1FL/xRn6Q2wsfi37gZkWssQ97pua2sKJesAnrI2ewK4QycCa5JlDbhgBudwfKI4
         KfvcIIglfiyryvIJhxmHhY+8wg+WfCZdP/Umw8iOVeNQRXqNfwvuMWoBrjzuJ9nG3GB/
         O6y2ejBilcEeA/e+KV10ZXJFjAUkLh/ww62OtY9pqRuwc/hJ7BiWmfthjQumYplmQ5ct
         hhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696858686; x=1697463486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=FSh14RFQhvuY7yIi1UzUCW00AN5YgZuJo4WmNxpIp2ibyOhOzNtr2sh+JXnv4TaLc8
         /o588dPYOlHP7v35vAcHl/96KX9tyuZ5Vi1S63kTmhvwyad9PThPz2QBO7ZLA4+Rwgc+
         SHnhWALaLuY+Bd2tsIz/L8H2XePy75GAb/YX/2BgRfoje2O8OD9WjoSjllcGg59/s36T
         3Ur4GkiCKM8ZSEeRKP6nm6shTYtm/Gbob3YY1pLGhsv3l+0nHafbRil+1d9ltbQuXCvt
         Fwtt3EM9qD0E1C9kbfypLbfhEhnhy6SPZMGeYJJ3lKQR7nsh/DO36AxaSvK/+keFN5jh
         Z7iw==
X-Gm-Message-State: AOJu0Yxdqtpb5hsPZhBynyklEIilaWoWBebwwyILs4XW49lmMmoyyaFJ
	aTikF3v10fN98ItIzGw3cfM=
X-Google-Smtp-Source: AGHT+IEMX7bz877y1sqkSBBwiuVDPwmUPP6Boy0DbKerTwIWpVX1/W8TSbdVp2MIATN2+AWYZ0P7bg==
X-Received: by 2002:a05:6000:128a:b0:31a:d9bc:47a2 with SMTP id f10-20020a056000128a00b0031ad9bc47a2mr15005335wrx.53.1696858686330;
        Mon, 09 Oct 2023 06:38:06 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id t4-20020a0560001a4400b0032763287473sm9746160wry.75.2023.10.09.06.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 06:38:06 -0700 (PDT)
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
Subject: [net-next v3 2/5] netdev: make napi_schedule return bool on NAPI successful schedule
Date: Mon,  9 Oct 2023 15:37:51 +0200
Message-Id: <20231009133754.9834-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231009133754.9834-1-ansuelsmth@gmail.com>
References: <20231009133754.9834-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_063810_361326_EA04BF55 
X-CRM114-Status: GOOD (  13.41  )
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

Change napi_schedule to return a bool on NAPI successful schedule.
This might be useful for some driver to do additional steps after a
NAPI has been scheduled.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
---
Changes v2:
- Add Suggested-by tag
- Add Reviewed-by tag
---
 include/linux/netdevice.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 7e520c14eb8c..2bead8e2a14d 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -490,11 +490,18 @@ bool napi_schedule_prep(struct napi_struct *n);
  *
  * Schedule NAPI poll routine to be called if it is not already
  * running.
+ * Return true if we schedule a NAPI or false if not.
+ * Refer to napi_schedule_prep() for additional reason on why
+ * a NAPI might not be scheduled.
  */
-static inline void napi_schedule(struct napi_struct *n)
+static inline bool napi_schedule(struct napi_struct *n)
 {
-	if (napi_schedule_prep(n))
+	if (napi_schedule_prep(n)) {
 		__napi_schedule(n);
+		return true;
+	}
+
+	return false;
 }
 
 /**
-- 
2.40.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
