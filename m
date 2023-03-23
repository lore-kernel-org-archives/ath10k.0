Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4B9C6FD1C
	for <ath10k@archiver.kernel.org>; Thu, 23 Mar 2023 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5egiqXgWjDs9GfbL99fZG9EPpyOtabt/NE5FJyHob9I=; b=o166gQPiDr+Q+U
	Toz8mnrIL3broLj5FAqPpOzprHa0IP+zUv63ivpkqXU9crfuZ41LPqS1xGiDLyeW2NgxEHUi2efyA
	7gty+nk/I+zOZtMJE+ytefEtu5haZUcqK7IpeRhsO+7fHzKo3w53UlxX+cHufihd39iVXXh0mdvLj
	boYHj+OcmzPWZ6Ydtq3TRPsYpTaEbi45OuTc+m0KujMZHM3SxsQoJAzCzvYX88dDwndoLOALzrwMa
	RZqOLoCYHfoaZGw2f2zl5fPjBPoseBI1pXKR9YKODdslnrBP1NurbqjzC6aJnGCv2RgXaHyPCNYDQ
	26AXOmrOuFlSeT4Qi6ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJt-001xxP-0q;
	Thu, 23 Mar 2023 12:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKJq-001xvp-2w
	for ath10k@bombadil.infradead.org;
	Thu, 23 Mar 2023 12:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tooTxJ1S3+bY95x8JLOzf8Cr/9M9iNd5ycqcB6CNt6g=; b=IB63cyLo233kjSExCg/oY2L7Bb
	Am12CZSE6+dLrpW2Ae1mZEcUjhXv9sq5A1atKs922Vu62cnG0snRHutEEkAv9Kp8xLSUXq+i7bEqG
	mbQU+ugiPBgQX0RlMOR5BpV/Pn6LEbqF5n+MT9GwXsztbLjvorrGRR0amhhFLTElzdTHdEm91SA6m
	zRLZ3CJ1n4zWHoIFrS93UkVyIcxXXttPHoIimteQVw3zkVaorrCBSilPQB0KmtU+7Kqvz22VucQzD
	bROrMc0XL3uL6xfPg9dLWqK4EwbzUpuk81dPcSVfU7li7/gKM8nYinEIUiRBscfntQf/X7yEEGtgm
	D+xHnPng==;
Received: from out-47.mta0.migadu.com ([2001:41d0:1004:224b::2f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJB5-004qWc-1m
	for ath10k@lists.infradead.org;
	Thu, 23 Mar 2023 11:32:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679570789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tooTxJ1S3+bY95x8JLOzf8Cr/9M9iNd5ycqcB6CNt6g=;
	b=MPPbcgSRYJtn4/oTx7vmZtr+8RpDlRdnN6QgSqBa/GWRXPjE+iDrG+orCzV826kNoxLPEk
	WALEbdE/Q9zmZ6Wf/cfnOibc5KyJqwOgKHl8pp8J/W1dC2nV6lP4vNajVT+51eSBQxS3v1
	paQWnioiLt/iK77rFsMewk9UnlTlWMo=
From: Cai Huoqing <cai.huoqing@linux.dev>
To: cai.huoqing@linux.dev
Cc: Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yan-Hsuan Chuang <tony0620emma@gmail.com>,
	Ping-Ke Shih <pkshih@realtek.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org
Subject: [PATCH 2/5] wifi: ath10k: Remove redundant pci_clear_master
Date: Thu, 23 Mar 2023 19:26:10 +0800
Message-Id: <20230323112613.7550-2-cai.huoqing@linux.dev>
In-Reply-To: <20230323112613.7550-1-cai.huoqing@linux.dev>
References: <20230323112613.7550-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_113219_917024_745DFCD6 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

Remove pci_clear_master to simplify the code,
the bus-mastering is also cleared in do_pci_disable_device,
like this:
./drivers/pci/pci.c:2197
static void do_pci_disable_device(struct pci_dev *dev)
{
	u16 pci_command;

	pci_read_config_word(dev, PCI_COMMAND, &pci_command);
	if (pci_command & PCI_COMMAND_MASTER) {
		pci_command &= ~PCI_COMMAND_MASTER;
		pci_write_config_word(dev, PCI_COMMAND, pci_command);
	}

	pcibios_disable_device(dev);
}.
And dev->is_busmaster is set to 0 in pci_disable_device.

Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>
---
 drivers/net/wireless/ath/ath10k/pci.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 728d607289c3..a7f44f6335fb 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3406,15 +3406,12 @@ static int ath10k_pci_claim(struct ath10k *ar)
 	if (!ar_pci->mem) {
 		ath10k_err(ar, "failed to iomap BAR%d\n", BAR_NUM);
 		ret = -EIO;
-		goto err_master;
+		goto err_region;
 	}
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot pci_mem 0x%pK\n", ar_pci->mem);
 	return 0;
 
-err_master:
-	pci_clear_master(pdev);
-
 err_region:
 	pci_release_region(pdev, BAR_NUM);
 
@@ -3431,7 +3428,6 @@ static void ath10k_pci_release(struct ath10k *ar)
 
 	pci_iounmap(pdev, ar_pci->mem);
 	pci_release_region(pdev, BAR_NUM);
-	pci_clear_master(pdev);
 	pci_disable_device(pdev);
 }
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
