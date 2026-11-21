Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBDB606A68E
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 19:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GKTkDo0N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OjB5wEGO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=; b=GKTkDo0N0ukruj
	KHL8J3LfRFdx3EtfKftsEjS0xjsyQOybDBYV0ZBLt5JUL8ZYJxsx9jdFVgrblYp+g1avRhR1l8Owp
	JVU+lJgw5moeDs7jFUOqAZ5DiTpYrBqtgyA98k0k3KXP2h+N2rtoDF/G+d0kbEsOtugyG+jSuqYsQ
	nZ111KMqGO7llwpGmzy+eto1Kz0S9P9PzmGFbj320AL1mhQEn+wwikXB119PPpqxJOhgFP541+V+v
	m7VnXRgfN2+Ki9hqy7BSXCNMieLzIPRaFlFJvyv5jdrhWsPKo4fm81VHiRSxN92qfpATyX4vNaKrk
	vbE5X2bpAF/E3NPazluw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr62-00000000900-49Di;
	Sat, 21 Nov 2026 19:50:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUr60-000000008yU-0xbc
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 19:50:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so18421635e9.3
        for <ath10k@lists.infradead.org>; Sat, 21 Nov 2026 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290598; x=1795895398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=OjB5wEGOK3dRniJmZinp7Z/FDEPYQbzNmCJ0TMcuRs+JYOX1C35mFT+gtPPSHm3jtZ
         j5u7PFrMLzOu6u9V2p2mtK1TsXO0hXtGtuj00qs0i77s+4k8GzVolEP0bfSTkMzrJytW
         DpidtyOsRBeUZLgM9NoTJ1YZORSMJZ8hFeWQ992AipDpj+8SIMq83TdgAVLsMwdCE757
         WqckQ0+ABKoWeAFA6L44goSJFju6lJkRExfig11JstbborBl9U1f78BBNE/alQkX+uZw
         IEPm+5/uvg5xyuMJFi1n+RUqAwC8ve0iZseNHNvh3ZI6mlG+TgeOo7plcaifFmFJdxHh
         FaPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290598; x=1795895398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jPNi713F9pOImhDVrHH7IF3TDFq2wI0T+LQ8lSB9bVw=;
        b=sYddwAWHp18DVYoxya76dhS5AgmgAPMf9UQgUdp85QW1J/57HHVsYcOQhiLseSFB+G
         +O+xuh6/j3Oa1FXJTKZ1F9FB1hC6UKneWdztKuDiQlzcHq6YusczRTJiVzPbtjgAhjSG
         0gjzcobmMKFrIXLgGGu75U00ySjaq2P5j6e6uTKTEPoFCTNAt/3t0eOcGBVo9CoWtR2F
         18Znt2BQOFX8/pmE6OBHtUzvaDMujloXAxpIoB+mcYOJ4tXN35H1v/KLXgvuq5RlEJBk
         WjQb5w6+qkicfBLQIZrtK7l6Gi1TEqEE1lyMWQvSm9aVrydqc+/EwiVh1QHXhbqaA6RX
         TP+Q==
X-Forwarded-Encrypted: i=1; AL+hErGcsH87dItMvc/StLaLHXUE/iF4nzUuOHeeFpPqjxIMPpFmXX1KYW/bGkw5L9SecfwHzY5RXkw=@lists.infradead.org
X-Gm-Message-State: APuU4Z8gANfFLN0IpZ+L2/Bpv8agbGs+cp/FCMzv4aeWfIJrpCHTTbgE
	1pJe0a5l62wH/VXu/jQDN2j5YViqBbAqdVplGVPKffq+6agP3FWREr+AWiPIOzAN
X-Gm-Gg: AZFdTZdpaBC/Zc8FzsMqGjBmNXBh4at6iTdWxBaMvqukRUycRDXnCIvi1Q2PecOUEgB
	hBKNivJcEOtrxwx3A6DhKcGJFUQ/Bw7yKkR/i/6DVsvQ0kBaPkG/5snSkNGFdTSSzN/aLuHL4oC
	KeigrypX/6kohR2dOtTP6T1gjhYcdEsCFPrdJ0inh2Z9ryBU3J9xQeDWzHOeln2YhSqcNv2+ave
	FbA9pCtKsavdGQrkAyWNr5N2g27lirBn+t9wheBiMZQBKdceDGqeIo/SQRTU2MgpNQQQqQPhPMu
	MldijM4wgYYm6mCrD/Zh3yGln+NKbJ4ljXAfu64MzGLsoGf+QdKSAMLOCmRD5uT+Ak/RhyynS6L
	VIxfu2aeZXZncet7iWkvCEDFvTquIDUbhPlnNf8AM3Gro2yf3pXPvA2jI3lk5I42JSnEi52szi3
	+hDIQ+FB8bj5Eq4fNDQBm6OpsCsgjSiZ6GBMjwnJUxSA7JV1UvQJUFKhNawMF7mKVnvDfRp5T+P
	cTC6OPunNX94HXb/qBKz0b9ittltlXT9/XivpF8fItldYJPg0NqBkbzepDKf8iWRc7lAlTCFrFn
	OU7UZ1MV8ZCTJL/MaxcnqOEqJPXe1TOQ4ckRIa86jqPgvIpLqudDa/SBGCw=
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr170965775e9.21.1795290598210;
        Sat, 21 Nov 2026 11:49:58 -0800 (PST)
Received: from unknown.m0rf30.ray ([2a02:b027:12:31d3:47a3:3d6d:45fa:53e1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm196876215e9.7.2026.11.21.11.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:49:57 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: jjohnson@kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Gianluca Boiano <morf3089@gmail.com>
Subject: [PATCH 1/3] wifi: ath10k: add firmware feature bit to skip channel stats events
Date: Sat, 21 Nov 2026 20:49:37 +0100
Message-ID: <20261121194939.3647400-2-morf3089@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121194939.3647400-1-morf3089@gmail.com>
References: <20261121194939.3647400-1-morf3089@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_115000_288749_FFC6A59B 
X-CRM114-Status: GOOD (  14.52  )
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

SDM660 WCN3990 firmware crashes during scan when the scan command
requests channel stats events (WMI_SCAN_CHAN_STAT_EVENT):

  qcom-q6v5-mss 4080000.remoteproc: fatal error received:
    err_qdi.c:459:EX:wlan_process:1:WLAN RT:2073:PC=b00a5d88

qcacld-3.0 only sets this flag when gEnableSNRMonitoring=1, which
defaults to 0 and is not set by the vendor WCNSS_qcom_cfg.ini, so the
vendor driver never exercises this path.

Add ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT so affected firmware images
can opt out via firmware-N.bin. With the bit set the firmware no longer
reports per-channel statistics during scan, so survey data is not
updated on these devices.

Tested on SDM660 (WCN3990).

Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 1 +
 drivers/net/wireless/ath/ath10k/core.h | 3 +++
 drivers/net/wireless/ath/ath10k/wmi.c  | 4 +++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2aa18adb3..d37add4cf 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -815,6 +815,7 @@ static const char *const ath10k_core_fw_feature_str[] = {
 	[ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL] = "single-chan-info-per-channel",
 	[ATH10K_FW_FEATURE_PEER_FIXED_RATE] = "peer-fixed-rate",
 	[ATH10K_FW_FEATURE_IRAM_RECOVERY] = "iram-recovery",
+	[ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT] = "no-chan-stat-event",
 };
 
 static unsigned int ath10k_core_get_fw_feature_str(char *buf,
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee43261..29a4c0d74 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -838,6 +838,9 @@ enum ath10k_fw_features {
 	/* Firmware support IRAM recovery */
 	ATH10K_FW_FEATURE_IRAM_RECOVERY = 22,
 
+	/* Firmware crashes when asked for channel stats events during scan. */
+	ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT = 23,
+
 	/* keep last */
 	ATH10K_FW_FEATURE_COUNT,
 };
diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
index e57588c19..adaf3c80f 100644
--- a/drivers/net/wireless/ath/ath10k/wmi.c
+++ b/drivers/net/wireless/ath/ath10k/wmi.c
@@ -7095,7 +7095,9 @@ void ath10k_wmi_start_scan_init(struct ath10k *ar,
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL
 		| WMI_SCAN_EVENT_FOREIGN_CHANNEL_EXIT
 		| WMI_SCAN_EVENT_DEQUEUED;
-	arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
+	if (!test_bit(ATH10K_FW_FEATURE_NO_CHAN_STAT_EVENT,
+		      ar->running_fw->fw_file.fw_features))
+		arg->scan_ctrl_flags |= WMI_SCAN_CHAN_STAT_EVENT;
 	arg->n_bssids = 1;
 	arg->bssids[0].bssid = "\xFF\xFF\xFF\xFF\xFF\xFF";
 }
-- 
2.56.1


