Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D899FCA0EEB
	for <ath10k@archiver.kernel.org>; Fri, 22 Aug 2025 03:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JUhh1GmJ/Qz4pdwg/lcXmQC+CMN2oEjdZQxpe97lNUE=; b=zo3YVCc6+rSDwHyd8Arzkus4jq
	QCwuCWnmrGI7iBQ8ob+N2izEaEy0obv6Esipl9rL4JUg+cVn8Y7YiJatj8UvF80ipdodpInjhjJgr
	PuDU5mXEJgmQDml5SlQcQxaDwrqearUVwzcHEg52V/zUkvP6GmP6RmacMyACZUy+UBMR/DrjO0jpm
	TcbvxV30U8NHTDmzTv61+bItROuHNFz1+VeEEvULCUkeaTcPxqiZR+utyB6jwEKoQsiB8DrKr3pQg
	vGia7hqyjb+AOl47OWx0unvoxktG9X0ZMvZRvAyPlK0Cc2XTOFBROj1+0IaOPKhwudx2I0xZljGpJ
	6K7qgObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIam-00000001Pcq-1Yjd;
	Fri, 22 Aug 2025 03:37:28 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upE8E-00000000s02-0gYd
	for ath10k@lists.infradead.org;
	Thu, 21 Aug 2025 22:51:43 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7702fc617e9so277307b3a.1
        for <ath10k@lists.infradead.org>; Thu, 21 Aug 2025 15:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816701; x=1756421501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JUhh1GmJ/Qz4pdwg/lcXmQC+CMN2oEjdZQxpe97lNUE=;
        b=XelvNZIVBkvOv105Gbr6S75NQEYUTfq/rn3ronqiuAvAF+cVlQVD+rQ7Bd5tlZ7wyx
         BfolOITSZFioKapqWMIvIaNNSFym0CcJjxIOpMoi6mXmDAMh6JCDQsz0jRpC/0CUKxC6
         Zwm9FCW36HRDO0WtBPyYDICK9GN6D1PiXmvpckU57om7pmmEPdj9uf+snQstJzHdu+Sn
         I5Ke5Q8oMWCneT8ANsUL4WK21IcTqjH5J31nsf24K8pb/nLHg/sHSUbVsezo1eC//fET
         9Wq/O2MajQDCmkvJ4Rl3P2+5MKb+tV2dB4C08ljlXM5vdSvwRBit7c/Lvt3r2U1xEuP8
         cEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816701; x=1756421501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JUhh1GmJ/Qz4pdwg/lcXmQC+CMN2oEjdZQxpe97lNUE=;
        b=Fe4CuVM5CmStgHZoA98ckRqgJ1Gwx9ICM14ea6BhrMluOSZm2mjlE+D8u3cAgKs2a1
         0DIzJXEv4nllQ2r1YriXjFGU/CQtH0DkHBYgvrnce0idG5p18t1+r/nW4yZaKX4ggyGR
         bVD1j2zu7oaYsXrg97fetUtTWXLlMBeo7HuhTy0hmXmxfwHL1D8yDHRwE3Swvyuvj1S1
         XzKq/erKP0VrOaR/TDdrlQQXTSef+OB5Zkqqvqy+u5Zf0YTEy/l7xksudsaLBudDn8nw
         SLkm/1/64Dod3tC4yxuRRWDAACsRKVFr01jv8JQFys9wWI6hYJb+V0WDL+l0ql7XQU9H
         IViA==
X-Forwarded-Encrypted: i=1; AJvYcCWyx/4Wxo/j9F4QvIGcl+NJBvdkdiFldDeEwjDhb7gSQCbcXHy30l2ItB9/WsQgRkZiluf4754=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBprBrKEjns+6l/uBDry2G/lNZcPaA0F7z1OpgEGuhNqGjeNVe
	Vl80xxdbHIPOeGJznf7eaLqh7esApr3n5ocSI/ZEnS4nb7vIA4oWMwdv
X-Gm-Gg: ASbGncv0Ypk2gfBo6CTlMOrqGIJ65t8tlwpqfoIBxeCNI8d2vc2/vjD3boOXfGKATqk
	bbzzhAD6P59iqjyG5dHxCLDMh4zKw+PhwxhWOoTTuLyACifCVhlmR/7tVQtsdFEGluCr5KbohQb
	pjBNReljRgm8+9bM01QD7oOQ3Y7g6x5Vdu9gB1FBnPQtK/SC1CrAtdxa0w4zvIji83X1EY91ej7
	/NL1Un1ONU47fKpyDy0Au1N7Q7K8noGCf9djnbuW2BJBY4b8aXG6rfwqIIZuEdPBt2SyN8VoiIr
	kwFg3o4AAPNVC0N+pT+R0xnIbixj5XdRfF5FWqEITuOLXLyKpxmfJ0EJiSazDxp76gih05W4xvi
	ySMERbVTZCkoiW0746u9etU74ncbo2okUhswW2pICdR5AL2cy3ZOL3M09H17ReBXdCg==
X-Google-Smtp-Source: AGHT+IG+QlQjFX8nkVvH2M+ceOt5Hv2iyijKCoDiRbPdSbx0nl//cWPaD1uxBCWuti5JxURT/oNeqg==
X-Received: by 2002:a05:6a20:430b:b0:23d:54bd:92e6 with SMTP id adf61e73a8af0-24340d02428mr1134160637.29.1755816701292;
        Thu, 21 Aug 2025 15:51:41 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640905aasm5600231a12.28.2025.08.21.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:51:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	miquel.raynal@bootlin.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 ath-next] wifi: ath10k: add nvmem support for mac address
Date: Thu, 21 Aug 2025 15:51:39 -0700
Message-ID: <20250821225139.15406-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_155142_203195_F9573928 
X-CRM114-Status: GOOD (  11.07  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

device_get_mac_address is a generic way to get the MAC address which
lacks NVMEM support, which tends to be used on embedded platforms.

of_get_mac_address has NVMEM support and handles most of what
device_get_mac_address does. The only thing missing is ACPI which is not
used to store MAC addresses for ath10k chips.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: keep device_get_mac_address and use of_get_mac_address_nvmem
 v3: back to of_get_mac_address
 drivers/net/wireless/ath/ath10k/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..2bf7a141d8c7 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/of.h>
+#include <linux/of_net.h>
 #include <linux/property.h>
 #include <linux/dmi.h>
 #include <linux/ctype.h>
@@ -3456,7 +3457,7 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		ath10k_debug_print_board_info(ar);
 	}
 
-	device_get_mac_address(ar->dev, ar->mac_addr);
+	of_get_mac_address(ar->dev->of_node, ar->mac_addr);
 
 	ret = ath10k_core_init_firmware_features(ar);
 	if (ret) {
-- 
2.50.1


