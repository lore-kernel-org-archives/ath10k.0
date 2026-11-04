Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD985606D81D
	for <ath10k@archiver.kernel.org>; Wed,  4 Nov 2026 02:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G82Z4oTX;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=S8XK6U7a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BKdCmLx4asAbOBNQcstL1F5GM5V0+1b4YpXSce2bg7M=; b=G82Z4oTX7bntWUHXvJXk0gvDNF
	666Z/xV9vNtAw7OGtCwe9swQB+S25aUkHN1aYvxYtHvz19iqMNTPmLZob5DVdqcyGim2GT41JEM8b
	YlAT6v/FBXbLwh0hORbdEOKmu8+jTwN0fgqxkZQ0xfme8c+oXqSQG/K5tHxQRV6whTiPFMeZNzvgo
	NGO721eZYksYnIsDFiK2Yts2xUTyeRlQSmGFnfobw5UQJ7IU2ZxZ1toa1joIN/gTiybNbu4SNRqby
	7KONfrQAl+iv9rb3WZ7YPQZzwMFxpuOkwzBQVrGMlVx0PRMMtccCmmOtLo3nbG7Fl0HFupckU8eau
	KNF6ZGbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQp1-00000004A9T-3F6n;
	Wed, 04 Nov 2026 02:33:55 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQow-00000004A5s-1lNs
	for ath10k@lists.infradead.org;
	Wed, 04 Nov 2026 02:33:54 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5367d073f;
	Wed, 4 Nov 2026 10:33:41 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath10k: Fix potential CE configuration leaks on PCI probe failure
Date: Wed,  4 Nov 2026 10:33:40 +0800
Message-ID: <20261104-db9e3c75b3-wifi-ath10k-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a467b27403a1kunme6817c2d1636eb
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUkZVkhJT0pPTRodS0pKSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=S8XK6U7ajBL35uEiPFwe7Q/3rDmAhG8PB8myWmp9dKaR4MgWGqQ3s+Ojswzcc0U6ApmXmbcBjyKIcB/Ceg09jSqOwJJq54C+1DUyKwtqrPWSflK2lOM2zh3Ey7PJcSV2Zuy+uDylom0XfAZY5UblxhELousNHgGZEEJnnfpOXUU=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=BKdCmLx4asAbOBNQcstL1F5GM5V0+1b4YpXSce2bg7M=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_183351_158758_A03EFFAD 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
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

PCI claim, wakeup or IRQ initialization failures bypass
ath10k_pci_release_resource(), leaking the three configuration arrays
allocated by ath10k_pci_setup_resource().

Free the arrays with the CE pipes on the common unwind path. Keep
the later hardware cleanup separate so the arrays are freed once.

This issue was found by our static analysis tool under development.

Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device probe")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: x86-64 Clang W=1 changed-object builds passed with
allmodconfig and allyesconfig. No hardware/kernel runtime test or full
linked-kernel build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 drivers/net/wireless/ath/ath10k/pci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..f3c4fe13f76b 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3716,7 +3716,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ath10k_pci_free_irq(ar);
 
 err_deinit_irq:
-	ath10k_pci_release_resource(ar);
+	ath10k_pci_rx_retry_sync(ar);
+	netif_napi_del(&ar->napi);
+	ath10k_pci_ce_deinit(ar);
 
 err_sleep:
 	ath10k_pci_sleep_sync(ar);
@@ -3724,6 +3726,9 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 
 err_free_pipes:
 	ath10k_pci_free_pipes(ar);
+	kfree(ar_pci->attr);
+	kfree(ar_pci->pipe_config);
+	kfree(ar_pci->serv_to_pipe);
 
 err_core_destroy:
 	ath10k_core_destroy(ar);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d

