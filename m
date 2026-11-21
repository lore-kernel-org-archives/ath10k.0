Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C44606A32A
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4IygpUl6;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=YNg15F9f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=; b=4IygpUl6w7o3r3
	0gWSyGmwz/ur+ESwGlvI8N4eM9W0nts/d2cNo21Sa64TfKyV50eXFSgf1OWqz7apleU4YNSr4E8Dp
	TxszoMMk23Vpne7iUbvOdmFv5btJDIkWgceehnh0uio333KfyJPaR5F1zlpPycAdrfz/AfXBIeE8/
	SuHovi6/1Edn9Gx4exJrKFzf+U1EupNoaZfHKAMCgrcaLC5XGzv2fo3Iyb5ffh5Meoo9s/a1F+6my
	WJBeqkhc1i+xzLHv41wftTsoCkyHLpEu/FuPXCdS24+Vi6Ghc1f2N0bmIROfElCuV28VCXqrNa7mO
	3gCPPcTzdGkmTPpUybug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpHr-0000000019b-3bP0;
	Sat, 21 Nov 2026 17:54:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUpHo-0000000018k-46lQ
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 17:54:06 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c513a854320so341827366b.0
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 09:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795283643; x=1795888443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=YNg15F9fy6l24NmY/ySZRiC7oLZjZgOJOqRbtG0wXVeEnjV58v/ofu/exkn4P1ph+b
         RdzNWDgMh6LGsKBPBEZcLvqVzmUdIrF1BdBtX/uH5+Swpy4kI/XZ+WIysidO9lwLHEpN
         dYP6X4mwUsFCKxCnE2lY9a34CZvVlgmmI9Ml/Ih3RVsiK8zGGf9m5nZ4SexvkHtqZx1l
         CqVelgNZ78zgptHZIPTvhrXuURbAmmmGtN7oNUsO3d4FpytwGNJDKsYCe9G8U8+zVsbX
         qGTKaMs74sErx1MpiRiD1dQBULCJEF9kN7OBmZSTsceYQEXGpNM2YKDNLLDWDQLCnQSy
         VnHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283643; x=1795888443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=642e8VtdsdZMinjxx3omOwsnMPdu2xYacVDanMpl/DU=;
        b=2ZWLCS5G4mGmTJTU4GPYCSW+zL5TGdCVC/bK2mPDN79n3IjkNhPzohKUmsHBIzb9rA
         FWMK0k/PpPeAet5q27fHBuI2QayrHcIXph+7NQCWRxHQ24Sl0ZIrUu4AISx+450y4afM
         BFXjFX6paQyXXkcFr5oGtLhEvL3KXRq4nesgW9ub+juHk4nWIH/Wm/TnyeqzOBckES9s
         aALJnEnubwzsK2PWiQo5tUsqhwglZEJilQb4mq/SeEWLL0t/zU0JdLuAHAfzYWjdu6qD
         RKjcuJVSCHVb43EXgugygM8zr37N+KVPdiDR7LGQnuZjJ1luSb1uPuuIQPc4blav0SH9
         L6RQ==
X-Gm-Message-State: APuU4Z/rfg8DLXampmXwGinQkfgOFLj8kSb0R0x2a4TMc00iW57qE9jl
	2ejT1kYehjCmvRgkLaYNbyMF0XB+uzEkW1Crl/BdonMHOuGiToHaX9hlKv/fg4aABhERZrNNLEb
	E+mJEzQzZ
X-Gm-Gg: AZFdTZegg3twZ0hGOKIT2nQy1s8Fzk7C7QZKa5VOrs93RF+o37Cz5yD6hKitaXAXFZ1
	21IwLDaLk3eC9vbZ0FK+3+OYnzV3Ssn41P7T5oF2Sc5zfSVq657zuxaxJpTCE7YzlYNiZ/6iy8V
	nQUV4O4kYe0/YDnzzGXvSQQX8p/ZDuh2DW9KdMgtr1MQ6/+CF4IKfM4SICSKPCbreib3SUnA8BA
	ezaeY6dBIGwcLvA8cw3HgpQHSQEg6eBrtd5tmnptJpagJQAVsIbCmXwNmmZS6p03res4ePRVYzy
	IjxhpT+udiCAgyMx7Nitj7aLn/G2pPWaWMYRaJ5HJvCKNm5ON7d4OThlIhmvUOHqALLBy+Afvzz
	o2V4Xw5K/l7kAot303w/xes8H9cO9L/P9RTK1QAbQbBXFfPdmeTZR5cUhKcvOAno/a0X+eh8l2y
	cIE9ESNpbUUx6oX1AA0KiJHh4OmkdYIv+0eBA5jpFdljWP7Ejx0+ClCasPYsCa08EJSfoXiFbY0
	d3KQzOmAFGLCq8YErN4w94sy+Rb/WsFeWHTpK5E1tbatl1Y3kf4z3blkX7pzF8/QEPVIg3GvXbi
	4BdFgzSSjLh0RFapp3VIofP80oBnftDZWfiBnoFPWBKvRAQpCuplfnoBkxrNoZ9Zmpp0ujK/BqZ
	XjB5Prax0egrapM7h0opEmVYUj2BcivF8bRjQbhWyeYzkWJBAZRLWhtP3yvy9vcFRwDQIp9s+i+
	F7RqslQhtyw4rdGkmcnwPuh104PsnlAvjKohmRK7qXz4uMWEhqtO1X55G2LrqCMYhDKC1su/sut
	DTLOABV8LuIKNcr87OlWymkMG8ky3VWIs5GuSJTZIFNZZSkxECdJ9iibfJQPG5wBcd1jw2BjEYU
	oT6AaG1Y/+kSethQMe+tCTSYrBtrjrC3DVSdYFxtmErYjZIJwZNzjkc=
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr531868566b.30.1795283643039;
        Sat, 21 Nov 2026 09:54:03 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea8063sm220167466b.45.2026.11.21.09.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:54:02 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kalle Valo <kvalo@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next v2 1/2] wifi: ath10k: release the PCI interrupt mode when probe fails
Date: Sat, 21 Nov 2026 18:54:01 +0100
Message-ID: <20261121175402.644803-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121175402.644803-1-julius@bairaktaris.de>
References: <20261121175402.644803-1-julius@bairaktaris.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_095405_030928_BCCE86DA 
X-CRM114-Status: UNSURE (   9.54  )
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

Since commit 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB
device probe") the err_deinit_irq label of ath10k_pci_probe() only calls
ath10k_pci_release_resource(), so a probe that fails after
ath10k_pci_init_irq() leaves MSI enabled on the device, or the legacy
interrupt enabled in the target. With MSI, the device's MSI data is
released at the end of the failed probe while its vectors are still
allocated, which warns in msi_device_data_release(), and the next probe
of the device hits the WARN_ON_ONCE(dev->msi_enabled) in
__pci_enable_msi_range() and falls back to legacy interrupts.

Call ath10k_pci_deinit_irq() again before releasing the resources, as
ath10k_pci_remove() does.

Fixes: 1cfd3426ef98 ("ath10k: Fix NULL pointer dereference in AHB device probe")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
Changes in v2:
- New: the probe error path left MSI enabled (found while testing 2/2).

 drivers/net/wireless/ath/ath10k/pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..4843a41ea801 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3716,6 +3716,7 @@ static int ath10k_pci_probe(struct pci_dev *pdev,
 	ath10k_pci_free_irq(ar);
 
 err_deinit_irq:
+	ath10k_pci_deinit_irq(ar);
 	ath10k_pci_release_resource(ar);
 
 err_sleep:
-- 
2.53.0


