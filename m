Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A22606A329
	for <ath10k@archiver.kernel.org>; Sun,  1 Nov 2026 16:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0D9C4rsc;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=mziMKppH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=; b=0D9C4rscq6pASUfHYipBKYLcwz
	7B7+yy8eT7Gn90W+/CVwe4E6PpnzxvziyqlxY3CIShXRSJoO5bC0gDvJAz6/xeokPIvG7y0dTQGwJ
	AtXaBRwD4CRMZ1MLZek/XbAaXdk9Uf0PlgqyfOmxJt4aWhoUNCmQ/Y3VP53aZUGgDSCaLC6AAGqgi
	AaKN2SJ9zP94hLXsJHdv6+eyZ54zV/XTiFSiA7OiUMzV5b0qjeSMfK5QeJ9PEGXTZo9Xrr6E4iKKX
	M1gR+XhMlMUuGCLsYlL4u4qe3kCrS+JZrSQacovLeCZSoOH3qHXrmNtpzy4J9wu3MhX1FFuDhP837
	LQZv/WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYe7-0000000Eg2v-3Mzx;
	Sun, 01 Nov 2026 16:43:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNYe5-0000000Eg2a-2GOI
	for ath10k@lists.infradead.org;
	Sun, 01 Nov 2026 16:43:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so3146678a12.3
        for <ath10k@lists.infradead.org>; Sun, 01 Nov 2026 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551379; x=1794156179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=;
        b=mziMKppHMeE+MWcq1tAPn2VqNMNDpipoNwal1R98wwGcwgS/0yEaQE6p6g71TrNb9G
         hnmzfgq4lWt+4XzxnakRyyh9+Dki5ANX07NCnPpbbsqjRqiqGxjvtB9xUJilTVZw8xxw
         t0AajS/vcYGbJnAGAyvb/f6gWIBdEjvnWaHwBzTy8zWgiygxCelJyvjQwxfIR84DJkDE
         KXjMGxhe+CXAuMkOyiA1sQ07H0i745vq3qBJJCv5xaEN/Cy/EWTlkZVpPvK44f8x7K+D
         4rtoo1fR3wPdXAz4DQ+lzoonnPhV+RNWfJjxfYR2hzTyXxKTqSLhKXCPUmmR/IPVToyi
         xxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551379; x=1794156179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqSPqL8yjaU09QPPfgAWe8HPn4ku6hVjF8Y+SAe+d9U=;
        b=XI4VvT4UzxTCAW/XFXrEDR/GZBy3tmr8SIcgL4N7St7DIHUXYydxb/lFFIrh2KbU9r
         WmqJ8/lkdIWxZFg5j1bVRBtxF1AAdq5OhJac1Wr3XKSNFtq1RyD/b6me+nHJ8SBCK38v
         gJIRecD/nnoSDdpJcrPG+X47twCvCZOaLwI6vDTF21yYSwRBtWps1aFCnZoAvusWPdZm
         DtE70Ho4HM5OI1FHGq3w+YEOdmrBzghCNZH0EYVadDM+38szIZxTzjK5wu9obsN+6Oad
         UoKn0Myu16Dy58C++aPyLI/8hN3291jfeg3Vb7h+WHZhjfsZcWwLtMhFXDIxZQRD9o+3
         6EDA==
X-Gm-Message-State: APuU4Z8BD+CqNO/Sq5zHOW3a/ijgQAKnJx3nBUwg4K3dN44ypccybbJ5
	bPeh+/XxjpS93mT54O6+gLDrx6CQFOQROiCq2i7k2EnPB0alg7r8sKllvm4PSvYhjw==
X-Gm-Gg: AYBFou188oL7OK+fxYb0k4dU3WV1HP0M8FWuIrqiTdHBpKZm8T6o5idj7rM0kp+GYNM
	ZTtL3XfVPdIMTOT40yx2M1FH2E7+v4VceT3jKKqs3eVTlE5q3BAq4lJckaFgOUcHmUiy3E6kdHS
	4YhyZxTaqH5AORNPcxIdje82cLz6N6/Df5RKLJBBFwk0cOu/9SXlZFXE9UZVlOjT2SOTC5sUMDK
	kYBeTbgksOkAs9Wi6GYtedbkcyEK4b24d1VE25oHvpWlCuF22fD+jJSc2BfE0hWUq1V4Q7pSdyC
	gzIgSh45O2VblbrjxdlbidsXNvOlpJ2LieeHYqGuM4uDMXWlPH3KuLnZ/Cck6l95vA/xV8FZ+HW
	2h8siJ94erKZdEeKH1qo29tOdoHRZQmqmUdbmh3tEpnHdl+DHeaCFSV7ZK1y68nxrpsXFhFUpRA
	YoKCYRb4Umlo9EfD6fMDohEhaM3EhG7FimVBlyD1qF/w86074e2kOzBco+iwgG6NqjdAFRmVHXi
	alJjmflmzDPVSuEICIHkJU0iO9EiTIFqXFXSCVxuT4xM3u467VSRiydMeAhdpQ6+nlGkBPau72O
	+3PawxG3MHuErF3Zhod/w4QNz4bR/FBkSY9m4Oo3Evu3+kb8WxtP+Uh3gLPT4Jr0SgkGvTFWVVx
	95xVlte4357M6vt2OJehXPkO3HpCllxxn+W2VZoTuFXIGCbmuCHIohYN4Hx/fifKSmCO/r5+Yyx
	CbFULQxI31myMYCBKVwSxUK60DLm47F4nAF+VPPhoCDqSEHYqHiwlnglXEJP+n+58Ds6KdaIbx/
	r+bjvuJAC7k2Y5NsNE5drP7WXBSPhMKVBf+NjQO7hNVydNqx94eeHTlTvlPUsaP
X-Received: by 2002:a05:6402:d0d:b0:6b4:1d53:5185 with SMTP id 4fb4d7f45d1cf-6b4d467ca70mr5007157a12.16.1793551379106;
        Sun, 01 Nov 2026 08:42:59 -0800 (PST)
Received: from Desktop ([217.26.238.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec91e2f2sm2261112a12.0.2026.11.01.08.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:57 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine interrupts over the CPUs
Date: Sun,  1 Nov 2026 17:42:47 +0100
Message-ID: <20261101164247.258200-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_084301_639608_031DEB38 
X-CRM114-Status: GOOD (  22.45  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
Message Capable 3) and, when granted all of them, raises the firmware
interrupt and each copy engine on its own vector, the layout ath10k
used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
Since then ath10k asks for one vector, so all its copy engine
interrupts and the NAPI they schedule run on one CPU.

Ask for as many MSI vectors as the device offers and spread them over
the CPUs, starting each further device on the next CPU. Every vector
keeps the shared handler, which schedules the NAPI that services all
copy engines, so the copy engine to vector mapping does not matter for
correctness. With one vector nothing changes.

On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
Measured with idle-priority spinners, the CPU time of the whole system
stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
crash forced through debugfs recovered as without the change.

Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Tested on OpenWrt's ath10k (Linux 6.18 with backports 7.2) and on
ath10k-ct with the same change, where the DesignWare PCIe MSI of the
IPQ8074 lets each vector run on its own CPU since commit eaf290c404f7c
("PCI: dwc: Enable MSI affinity support").

I used Claude (Anthropic) to help write this patch.

 drivers/net/wireless/ath/ath10k/pci.c | 64 +++++++++++++++++++++------
 drivers/net/wireless/ath/ath10k/pci.h |  3 ++
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488..4de789cd06 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -38,6 +38,9 @@ MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi (default: 0)");
 module_param_named(reset_mode, ath10k_pci_reset_mode, uint, 0644);
 MODULE_PARM_DESC(reset_mode, "0: auto, 1: warm only (default: 0)");
 
+/* Spreads the interrupts of each further device from the next CPU on */
+static atomic_t ath10k_pci_num_devs = ATOMIC_INIT(0);
+
 /* how long wait to wait for target to initialise, in ms */
 #define ATH10K_PCI_TARGET_WAIT 3000
 #define ATH10K_PCI_NUM_WARM_RESET_ATTEMPTS 3
@@ -1943,8 +1946,10 @@ static void ath10k_pci_irq_disable(struct ath10k *ar)
 static void ath10k_pci_irq_sync(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int i;
 
-	synchronize_irq(ar_pci->pdev->irq);
+	for (i = 0; i < ar_pci->num_irqs; i++)
+		synchronize_irq(pci_irq_vector(ar_pci->pdev, i));
 }
 
 static void ath10k_pci_irq_enable(struct ath10k *ar)
@@ -3164,18 +3169,42 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 static int ath10k_pci_request_irq_msi(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
-	int ret;
+	int cpu_offset, cpu, irq, ret, i;
 
-	ret = request_irq(ar_pci->pdev->irq,
-			  ath10k_pci_interrupt_handler,
-			  IRQF_SHARED, "ath10k_pci", ar);
-	if (ret) {
-		ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
-			    ar_pci->pdev->irq, ret);
-		return ret;
+	/* With several vectors the device raises the firmware interrupt and
+	 * each copy engine on its own one. Each vector schedules the same
+	 * NAPI, so they only differ in where it runs: spread them over the
+	 * CPUs, from a different CPU for each device.
+	 */
+	cpu_offset = atomic_fetch_inc(&ath10k_pci_num_devs);
+
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		ret = request_irq(irq, ath10k_pci_interrupt_handler,
+				  IRQF_SHARED, "ath10k_pci", ar);
+		if (ret) {
+			ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
+				    irq, ret);
+			goto err_free;
+		}
+
+		if (ar_pci->num_irqs > 1) {
+			cpu = cpumask_local_spread(i + cpu_offset,
+						   dev_to_node(ar_pci->dev));
+			irq_set_affinity_and_hint(irq, cpumask_of(cpu));
+		}
 	}
 
 	return 0;
+
+err_free:
+	while (--i >= 0) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
+
+	return ret;
 }
 
 static int ath10k_pci_request_irq_intx(struct ath10k *ar)
@@ -3212,8 +3241,13 @@ static int ath10k_pci_request_irq(struct ath10k *ar)
 static void ath10k_pci_free_irq(struct ath10k *ar)
 {
 	struct ath10k_pci *ar_pci = ath10k_pci_priv(ar);
+	int irq, i;
 
-	free_irq(ar_pci->pdev->irq, ar);
+	for (i = 0; i < ar_pci->num_irqs; i++) {
+		irq = pci_irq_vector(ar_pci->pdev, i);
+		irq_update_affinity_hint(irq, NULL);
+		free_irq(irq, ar);
+	}
 }
 
 void ath10k_pci_init_napi(struct ath10k *ar)
@@ -3235,9 +3269,12 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	/* Try MSI */
 	if (ath10k_pci_irq_mode != ATH10K_PCI_IRQ_INTX) {
 		ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_MSI;
-		ret = pci_enable_msi(ar_pci->pdev);
-		if (ret == 0)
+		ret = pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_MAX + 1,
+					    PCI_IRQ_MSI);
+		if (ret > 0) {
+			ar_pci->num_irqs = ret;
 			return 0;
+		}
 
 		/* MHI failed, try legacy irq next */
 	}
@@ -3252,6 +3289,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
 	 * synchronization checking.
 	 */
 	ar_pci->oper_irq_mode = ATH10K_PCI_IRQ_INTX;
+	ar_pci->num_irqs = 1;
 
 	ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_ADDRESS,
 			   PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_ALL);
@@ -3274,7 +3312,7 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
 		ath10k_pci_deinit_irq_intx(ar);
 		break;
 	default:
-		pci_disable_msi(ar_pci->pdev);
+		pci_free_irq_vectors(ar_pci->pdev);
 		break;
 	}
 
diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless/ath/ath10k/pci.h
index d114778edb..252044dd63 100644
--- a/drivers/net/wireless/ath/ath10k/pci.h
+++ b/drivers/net/wireless/ath/ath10k/pci.h
@@ -115,6 +115,9 @@ struct ath10k_pci {
 	/* Operating interrupt mode */
 	enum ath10k_pci_irq_mode oper_irq_mode;
 
+	/* Number of MSI vectors, or 1 for INTx */
+	int num_irqs;
+
 	struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
 
 	/* Copy Engine used for Diagnostic Accesses */
-- 
2.53.0


