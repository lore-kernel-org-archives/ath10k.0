Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCAC606A337
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 19:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w8itA8+c;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SE35NlYD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=; b=w8itA8+cEIPXme
	vkUbN1oDkqXLTs6Y9s2gLYNIyVBVyGhBCMsucYp/bHKt+W9ga78JZqDS1dGxikAzAu9M3DBahyuN9
	vcJvTujrUrDabTlXu5fZW6NKh4UMgY1rle5j+Vj60mqCMzSIQVCmfur4hLZBZo6pAHQMLybWD/OOK
	nv4iuMa331oDK3it9p3A30sSXYkMe2Yx6eF04KmqmPnz616+Gp+EPrysgq+1u6sWGKwjldNtP9p/k
	QdPVXCxjXvQlyLw8+aAn9dxhJqQc+Acv3Bmyngo4i3nEW+mC229Kv6h1uLsmFBA4YpqKLnZk03A9z
	ruNbXG3L+fJVkXlRWTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr67-0000000092x-2xkl;
	Sat, 21 Nov 2026 19:50:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr64-000000008zi-1wax
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 19:50:05 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so23538655e9.1
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 11:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290601; x=1795895401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=SE35NlYDo8RyRsBa16IhCR+yhDwh9aKXBzraCaEdUZ4BrIzF8finJ91DG/Sb5On3Qy
         aniPzUx9N+1PH6ksRaQhPl35ZetoZgckLUm6Wjf4qsOkMFvM6GwXDgxFRAAK61qrZ8l2
         2q6bEIbwBAGfQKsJmzOWIUT1PbtTUJCOrz6pXs7ozkPhN9UHGMk5RhIBhjVJ5+2vZB2q
         Ts6I8DBuYxeYjA7j7SHk+qx2/zgGRk1pVDGMQkE9kulTvK9/7oyM1frpH+6hI9aMr7pi
         ++EQ3XFDg53JbFvGrE6nhTX1bnbsAcjihtkLRxZhfjDxOuCu683EwbPshc69nQoG1j4B
         dD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290601; x=1795895401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dUkauO/jYSTVRb3SKDOjoVU2Zv4gQ4g7Ob1cBy3r7jA=;
        b=Kx2TleteptnRjGkeVG7kYZPfL2UOen8ZpvEqUPGw4yllo0bAmT8CrZRx6bUkFxse/Y
         MsXk1Q0xSHh0nBYlH/nTOLGXD3vY1YZOcm3rIWeuUL3oCaYEOHG/V0wyziXCCCF1sJCa
         q7/tlTVHC7sKrDM162PeO4GANTm/D+P2SREDC2mB1jJlYXfTYEgPZzzkKeOJ1H5xJaId
         +pKEYw1APA/7owAMuHIWlRA5XTQ15AUmD7yD3/tX1+AAnj6dQLZuRWeezarEgoiGIRJX
         yZoG5q5RvY8NdvDBcM1TdDX/SWwrpy808GaCoa/GdJK0qH1g2V/uspgpaRe66kKnY3Mq
         V97A==
X-Forwarded-Encrypted: i=1; AL+hErEkVDGinre22NZJrRH00MuYOsojIi45CElinEVTZsC52h6gD5W53QiP+HtB5FbPdgsakL+a7rU=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ku98uGybwWRISG+u2waZ587IrLTVghnJi5Xj4+qB/VO4/R4UE
	ksFCepnadluWCztY1DI7zsNhQ9fvNo9IA2khLTK4EwobGGMFQzOjtRy3iR6Efw73
X-Gm-Gg: AZFdTZfj9S4+RiqetW9SLKIuaJl89BIH3wEgMXQ28ChUW2emhpGRnmEkU27XsGyKCpM
	6lj5vkEjTnxYPeJBPE+IvcuFHRPZVP5vHp7hajFSM5d3MzdduOMDR0E9/RqkaUL1KuXPh4oB6Dc
	rVociCir/YGowrSiHvZZm7tCWngQgCwvVTjv25Xpdpxm75h7yAuNCmiWtlh51h7Rs90W42bJ7fi
	ADPBBBpc6ID7Nd0OygGAbCHqkNRhgPJmNyfwAl5jXXlqdcBr/vmfqCFa2NDLiHBNo5sSOHDA3DW
	l7zvX7zDa1iFlhnEaJgz0psg8OKf/YN5bkAThaMhCNNgc2eYnoZ6oKKx9cOmIpkLUWsGBV4Z27x
	Giv1/7K1GosgE2p+NPPynZxIt62svSWAxcyl52+xc2tplbFEsfjCQCzvO7OkwdhVuQvPGWQ7MHv
	BlV9dStEnfqeXk4/+HYo3oPQ/aQ4mDl43O15W7hM5JaJeMkcibxbgGe1WQqnlLpjXVGRwX6y+Gx
	HqBQaaYlfq1zaFqbXTITvF32qtnO5jnMHA5Sms/fxbuwve4rrXeULhQ4hKGdWWHqJST5fPYVLHL
	ccSxwnjYohGbsswCbe+s/eSVkDKhvBPHeKveUg==
X-Received: by 2002:a05:600c:1d09:b0:4bb:66fd:ad68 with SMTP id 5b1f17b1804b1-4bb888160cdmr156021525e9.14.1795290601026;
        Sat, 21 Nov 2026 11:50:01 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:50:00 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 2/3] wifi: ath10k: add firmware feature bit to skip quiet mode
Date: Sat, 21 Nov 2026 20:49:38 +0100
Message-ID: <20261121194939.3647400-3-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_115004_612857_E4E2CB41 
X-CRM114-Status: GOOD (  13.22  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WCN3990 firmware advertises WMI_SERVICE_THERM_THROT, so the existing
service-bit guard in ath10k_thermal_set_throttling() lets the pdev quiet
mode command through. The firmware crashes on it deterministically and
takes the modem down with it.

Rather than hardcoding a chip check, add ATH10K_FW_FEATURE_NO_QUIET_MODE
so affected firmware images can opt out via firmware-N.bin. With the bit
set, thermal throttling through the ath10k cooling device has no effect.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c    | 1 +
 drivers/net/wireless/ath/ath10k/core.h    | 5 +++++
 drivers/net/wireless/ath/ath10k/thermal.c | 5 +++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index d37add4cf..6272e0f62 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -816,6 +816,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
 	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
+	[ATH10K_FW_FEATURE_NO_QUIET_MODE] = "no-quiet-mode",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 29a4c0d74..5dd21f063 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -841,6 +841,11 @@ enum ath10k_fw_features {
 	/* Firmware crashes when asked for channel stats events during scan. */
 	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
 
+	/* Firmware advertises WMI_SERVICE_THERM_THROT but crashes when it
+	 * receives the pdev quiet mode command.
+	 */
+	ATH10K_FW_FEATURE_NO_QUIET_MODE = 24,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 9bb486f8e..c558a9e7c 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -139,6 +139,11 @@ void ath10k_thermal_set_throttling(struct ath10k *ar)
 	if (ar->state != ATH10K_STATE_ON)
 		return;
 
+	/* running_fw is only valid once the device is up */
+	if (test_bit(ATH10K_FW_FEATURE_NO_QUIET_MODE,
+		     ar->running_fw->fw_file.fw_features))
+		return;
+
 	period = ar->thermal.quiet_period;
 	duration = (period * ar->thermal.throttle_state) / 100;
 	enabled = duration ? 1 : 0;
-- 
2.56.1


