Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D002C77B6C
	for <ath10k@archiver.kernel.org>; Thu, 23 Mar 2023 11:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tt1r0mr2p/Wqa4EVIJu+3gK/KeiRzWHQYkqQoNC1Seo=; b=J6PgvzMRSkKfQp
	wEbqldXRykpAyunNxTCVDEgUm7A9ULX6rfR8t8mQ90Flu1yNJgJAZlwtf+vg5/QLARmjLQKJoVWz/
	5P3TgQOuf4GYGVtd9zQWZlwWoYqugRDE9L6/w6JZf0mhUIrxOMThIEbZS+vzYh4hXl+1R/R4cRra9
	caAggWgvk2pFIklHbdQbbFBo81+3ecz7r4NOyreOJj+hgTPzrbFNQXVYPFc16HRs8NPdsAxFEr/wN
	56y2VI/HqZYCU5vM8zmxTdnc8AatS5f09KlGV9rbxx3RfvZANJAny3O+ycZW4JcZSGTdcy0Ku2qK+
	7IMEomLCTEHXkLpN27UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJBC-001jot-06;
	Thu, 23 Mar 2023 11:32:26 +0000
Received: from out-35.mta0.migadu.com ([91.218.175.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfJB6-001jkj-06
	for ath10k@lists.infradead.org;
	Thu, 23 Mar 2023 11:32:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679570800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZdgDBuT4R3jYSxR7mPDt2s0ue0mJFKZNVR81FCp1IBk=;
	b=fqAbpCsaP3fQqEmQ3WmwcgxofDhbTR9Foo+kABFooB5SEWA51oOArpWXh3+E22u+OvTuzl
	4kB3mh11+EjwMt/cdDd8+Pd067J8e6UHBti+IDAsg28/AE1lDzENAJz/wauJWfkWbMKTQ+
	TCjgMya52bHugLpy5CUatBZ8jTkvmz0=
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
Subject: [PATCH 4/5] wifi: rtw88: Remove redundant pci_clear_master
Date: Thu, 23 Mar 2023 19:26:12 +0800
Message-Id: <20230323112613.7550-4-cai.huoqing@linux.dev>
In-Reply-To: <20230323112613.7550-1-cai.huoqing@linux.dev>
References: <20230323112613.7550-1-cai.huoqing@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_043220_278151_329AE1A4 
X-CRM114-Status: UNSURE (   8.00  )
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
 drivers/net/wireless/realtek/rtw88/pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index b4bd831c9845..60145d2f3e5a 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1552,7 +1552,6 @@ static int rtw_pci_claim(struct rtw_dev *rtwdev, struct pci_dev *pdev)
 
 static void rtw_pci_declaim(struct rtw_dev *rtwdev, struct pci_dev *pdev)
 {
-	pci_clear_master(pdev);
 	pci_disable_device(pdev);
 }
 
-- 
2.34.1


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
