Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D51E7545F
	for <ath10k@archiver.kernel.org>; Tue,  3 Oct 2023 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCWFw8oUj0UJrXAj2FsHt/ne1i1q3eGa/kW9pPMTF/8=; b=zFUmFjzcrllblM
	b1NqXs0DoGsWRcuMUoZJyHK6arCv9M6O72yeva71pv+G8SBMhB2+mznl2uBi3LNWcgoFq8t1cOV0Q
	NiGPFXPI+w0TiGtiGrw5qpakJhgMTchq8jmEZQLB2m4YTXbidx82Kpw9oibzRZ2OQwMRo2OkgJgSk
	YMl1pX53wW5p6KjMiipyX/UgmFdV7q/AvjN9XqbfouGyOwwwpmInG7ztpiVFuKDwEEd3dYE6q6gQv
	fknUF4aswIcLD0comn68rNm7iMn1BIKvGEkjA1pYX1/1rtMMPfJCxl/PemEM4UsZKo4IvH3tXTljq
	acLYaN/9If9UnyRejq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkGF-00F80h-1N;
	Tue, 03 Oct 2023 18:36:47 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkGB-00F7y3-1w;
	Tue, 03 Oct 2023 18:36:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so1263117f8f.3;
        Tue, 03 Oct 2023 11:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696358200; x=1696963000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=f5Dpad6lscsIg9kZLwFpMlwDT2SYOaB2pkzdV3/dREKQxtMIH2en1NGiH39tUn7EfS
         B/YQ6stepD+5PTccx+ETGK8LuKbBy5DSUNkC0dS/noZlRVXLYyqXsxNQEjn6mi7mCIGI
         ugUGSZn4cNI4UiHErgyDYdaiB+0Z0LKUTrlcRQ/KPAOS+pB0Le9oFOlcGTizDY+3QbTT
         8W1Q3nr/XcOWybIWUUyPqWI0CD7L/IfNhEW+5VCAEEoMmcKa/DywQJH3QN5W57KhBfHb
         aRU90HIxUlVMGW8Dm4GgQYiM9M+neBwx3LPnglXOiZVKBj0Xr0n5GOVnsAYaM6wt0kTu
         lPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358200; x=1696963000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m01pIjBrpccmB+UTqpe3DsPW+GxNRr1hhJrCHjJ41h8=;
        b=GH5iFqIy/5HclmNbcfwuI7zuoSGtxcoiu3yu4+j7FAWW6yy6mhLVnZRFkYuIdpIS5I
         5RJWemA9iBZJbl+Y7p+yRv+efyIGKw72ZtIl0SwhaPN63X4limW0nF73/yBsvUYzsneh
         M/UjUjG9BS6vvg3IxOAb0c9C1s0MFBsQMLmcqWR4NprzZEVA5aVzQQQNUamN++JSGR5F
         R+UDgpDC2g8WJRBpy0XPTZOG2DSTCeZZAYGfn1lAebHlUHaOt71v4lFvHKkzbDq5ntZr
         /dAOLnBfI9o6xwSBJhUib5XBUyPxLl5+6UjsSfvt1KJPQcKc+R4O0RuMxCT7nmpgkVSn
         hFig==
X-Gm-Message-State: AOJu0YyK27QfUDzJz3bIWfPKvIVGYnsPS3CYMwPyqxZutakppOf6AjjU
	qkBtV38Ru3avO7HbESHUrds=
X-Google-Smtp-Source: AGHT+IFujSOcsXudCvocPk/iZUw+s3sjadA+Lbuh1dKD9fGAxnHqk/kWYlUE+iYoiRJHe7APaefnLg==
X-Received: by 2002:a5d:5908:0:b0:317:6c19:6445 with SMTP id v8-20020a5d5908000000b003176c196445mr63201wrd.39.1696358199537;
        Tue, 03 Oct 2023 11:36:39 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:36:39 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nick Child <nnac123@linux.ibm.com>,
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
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>,
	Coco Li <lixiaoyan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Junfeng Guo <junfeng.guo@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Fang <wei.fang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	Lee Jones <lee@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
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
Subject: [net-next PATCH v2 2/4] netdev: make napi_schedule return bool on NAPI successful schedule
Date: Tue,  3 Oct 2023 16:51:48 +0200
Message-Id: <20231003145150.2498-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003145150.2498-1-ansuelsmth@gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_113643_647474_34EF2FFD 
X-CRM114-Status: GOOD (  13.80  )
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
