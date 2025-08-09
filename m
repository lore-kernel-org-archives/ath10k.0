Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE50C87FCB
	for <ath10k@archiver.kernel.org>; Sat,  9 Aug 2025 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46P9Qe+V3mlrJsYmvr/FTUH9c45AThc9QMz5HU6zoKA=; b=qei/0zvxpImsyNlb2cMWHZXmEa
	p1X5H0TzLOwOXK/JZpjvxWyyTtcEjco0nWwOkqIucxjI5tta30q/97SQFUVsYpJcXJaiD18Y7XjYE
	93o9rPEAYMUK+EPdK8A07OTzmVP0u/cJ/R/v9qhp8aT/ZPpRLrHAC/2Ks7knxc1mJSX3XWiapMgbL
	tZtkz6xD6ePuE8rwuDoi1uW7CnwciVSDNleT+o2L3DwjBZmrBkyU8fRVc2OhiOUKGl9nURN0ozj+9
	yf2sNOV0pb1vlqsiigypbR+iE1r4cRLRkowD2M/mqU/jw0kouqXBFV9zGCZtHOlfWZkEZKyFOzJIG
	4R/2CP8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka3H-000000042RS-0Xr5;
	Sat, 09 Aug 2025 03:15:23 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uka3E-000000042R7-2spV
	for ath10k@lists.infradead.org;
	Sat, 09 Aug 2025 03:15:21 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-31f4e49dca0so3435123a91.1
        for <ath10k@lists.infradead.org>; Fri, 08 Aug 2025 20:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754709320; x=1755314120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46P9Qe+V3mlrJsYmvr/FTUH9c45AThc9QMz5HU6zoKA=;
        b=GR3o3BjJaQk/gjRI1L1tuv8o8tdseTbVoxS9nMketpqWRqE2vSHeJATAm9It7zy+ui
         PF5RY6Rm80+0pJXKmk2CAifL+qeMv2+rqG5jky1CKJ4NqJMHDxz8rqYvEtgdbsEfLX3v
         WCM7ezxqmA3fo+zdoD9AK6R0irUT+UbeQZjkKOIqZeG9+AUmanroIWmmKWAeO3C5jdif
         xSxrJsuWHp1RUknK++Sa6XhMAos+LGemOS+TOgh3fztOZaqQfmOttC6pNfVmIhiip5WA
         SSCAMZRRxeAtI15so+Txu9CV4QIDnfEmg5gYwm8SO2Hwe+R7iX1dQVmHJBax81uOpr9F
         eMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754709320; x=1755314120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46P9Qe+V3mlrJsYmvr/FTUH9c45AThc9QMz5HU6zoKA=;
        b=Usoy5RktIydHPlqAg2ob2b1DcPSA4c5csCYgFc4Fx40uLUCiVQoqAiLat7wzkUg9oj
         f35LCF2wybxEjf3WWtPZtax7bKHrJdRtBole00ej8ueD79OEZHCq3Sb05ESOOFF3/s0p
         p5+qX4m9BPBrm0S/UapR/7CaovZXdohsHKHPJHZX/GVvF7HeVAV9jcw00aB1D3cdzcdK
         AOPxR1QLR0ob42SHF1BXVcI4t0D4I1qBa2EXvVPTHAJ5up6RysWnXEy9nor/fjKANK7X
         jp4dbiJ1rw/j8nuBzChdL543uDJpOdFPW0wmbUyL83IcSuyPq7MutJMuE61xJdiSzdCJ
         elCg==
X-Forwarded-Encrypted: i=1; AJvYcCVV8NBaE8IxVdHfdkgoGg/MqMHfFQR8Ar0u2aTqrX3Hw7GZfdAriDUbTRQbPFdUZMyUINEA/qE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxNO74sLRY/VZA6bxSatHhbd14bEdEayNgxssOF9qY6lutouY
	Sysv/DUj9GGsLatK2uUHjvoKN79c2E/02A1Rr6Snr0Mi0hGh880T4uHq
X-Gm-Gg: ASbGnct6Zq/z6ZZFXAs9/McXg/RnO1y3h9MJ4liT/OO63RvYgyeiAC1NQeBrjS4HSwA
	QChrLXa0lIrEHYN6IFqMOhnr5TpyFVLbVvwRkDVB5sXGhKiAfIBP5ZXL7xpIkJEKBYJcMylqGqe
	MKg+N8liSLCHgG2LpJq3rFApAVBkCYtsATTjkY3evYlQ+m5sDf0HOf9Bb9NP49wteEJ1MwifZQd
	uoz0WA9G6ByaCjpTYYJVO9F0pwuu5LeTG/AmF79y7BJMNdM7T8kTZ9hzk90gI4abPQbXqPzF2Qu
	q1f6RZA1hibqXdTzvKYGVz+XpNih6A7r9miFxQgLrJIxjnzv/zQ5pKcuiybyunNMlIjCxm7FRLF
	zhJ8=
X-Google-Smtp-Source: AGHT+IFeprYnDuXSMUyQMFUHnCT0gO21hf/Our67h1VwLYgFg/XReIWO4NavPTRMFt2wlcZJOH4kBQ==
X-Received: by 2002:a17:903:11c7:b0:240:80f:a4b6 with SMTP id d9443c01a7336-242c2070712mr78197865ad.4.1754709319578;
        Fri, 08 Aug 2025 20:15:19 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-242460ffab3sm174741215ad.50.2025.08.08.20.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 20:15:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH ath-next] wifi: ath10k: switch to of_get_mac_address
Date: Fri,  8 Aug 2025 20:15:17 -0700
Message-ID: <20250809031517.5535-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_201520_726340_813C25CF 
X-CRM114-Status: GOOD (  12.59  )
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

In 9d5804662ce1f9bdde0a14c3c40940acbbf09538 , device_get_mac_address was
introduced as a generic way to get MAC addresses from anywhere.
Unfortunately since then, the landscape has changed and the OF version
is required for NVMEM support. The second problem is that with NVMEM
it's possible that it loads after ath10k. For that reason, check for
deferred errors and exit out of probe in such a case.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 6f78f1752cd6..76747eb0925b 100644
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
@@ -3456,7 +3457,9 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 		ath10k_debug_print_board_info(ar);
 	}
 
-	device_get_mac_address(ar->dev, ar->mac_addr);
+	ret = of_get_mac_address(ar->dev->of_node, ar->mac_addr);
+	if (ret == -EPROBE_DEFER)
+		goto err_free_firmware_files;
 
 	ret = ath10k_core_init_firmware_features(ar);
 	if (ret) {
-- 
2.50.1


