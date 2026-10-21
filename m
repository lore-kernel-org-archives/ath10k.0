Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADB60A4AD9
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2rgASsAq;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e6WmxSca;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N5cF2iy2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=; b=2rgASsAq1TWV4MxeyAEWnlEogf
	0pNw7X8O+clBNRn/19PoGcB8BQbDeNDbTRxOOtSGwzYO2Fabi3zJ2+NNhUdUGN/rI1hPESBPm3g+2
	i1VLDIucB3L992VO153qsyBZkFjH8myxp+lsdQnwIcRlAR/7inUvCK7Y9+sJiq13yHf7bW6GRGrdv
	2YvZ7w8TOPks44gKjLkc+vT4h6hww9XigIhhzbWVVvzHRcgeOynK2GZ22blNgWt7YSLrCgD9lEOxF
	wpm4NE4ma9BylUhlSvfDEuPziVCqcZO7e/O5TzWqps+9vflMxlVuw0MPmhq3//nQ4E3xp0joB6Uaw
	NHQ0gmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKo-0000000BRfC-3n3W;
	Wed, 21 Oct 2026 09:10:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKm-0000000BRdH-2Rhl
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jecG3573555
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=; b=e6WmxScaXt/H1L0T
	oIOT4jdLmg5Xx5oHu3TlicZMCE0IyQyLKvadZrb3bkvH4h9Gs7f7z+t9gPbU/C5d
	xLDMsOvpHiR8WCezSzkErNp8UpOVjvoJeMVfPfzn59fIq3u9U2vu9VT7MAs5GRqq
	ouumRq3wRVBjzQxwkPnIMbDMu2RyZjsGa2HetyhXNVD3nR4nmT2yOy+Ij0hvG/rm
	0NHu71HFDI4Z7D7zSsBa1tadOI/V/bINxsg1clnk0oSZcXPrIy0suHrvpvEn/Jhm
	YabiEVT571AJnzQq8Am3NVf04tf1dW+pORxmR+BGy5E+FTbdSYL/RpLqc+9rhdom
	bLVFcg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hu5mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:07 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab260600easo2095696b6e.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573807; x=1793178607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=;
        b=N5cF2iy2MgNuNkZfdcNCONpso8QrULdQSvqfUP6z1c4YzXjskYAiwEZmCLZkmkd39M
         a5lpKf1eVe+U6ncGP+8vjVX6CowVGJplUeONhe+P9/4Y40RpOe9Awtci87SerIKQ4YUm
         OMGamWML50ust+G2g6G9Rt6tWqfGl5RqjbhaHLHz1IhvcIUzZPvMnCRCEGJgjUDyGwnD
         j2ivMBiLwuYG9itYtrajrJmLSWJ21Gb+pC+V+QsCPhmwswHu2RLAeyngqhgic5jchR0r
         n6tUnBML2KfzF6PkJi657q+RfTcbuS9lWEycehb6WbIdrvSJ+cOfJbIDv0Y6V5B1wMSY
         YsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573807; x=1793178607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Du3tEgvL55yjePVWq7XInLS86N3i/yJW/fLUSRhGwFc=;
        b=MXwpb2LG+QWEpD+wXXKO/y3SbIcWjt3DUO+IY/ABpKBY2XnP/8U4k4kBv21oRXcnwn
         hlYKlNIgM72oNCvnZPI1XVEfTSGpPjPPWG8/9uxkIOG6izchq8q+Obrs2O1kwgNbGM5b
         A4K7enBs8FBxJ20wkhXEmVrgIIE3GMXnf5eIbX+rG5j4vw5r8hZ1lnqw54DBzLL5bLek
         CNbfnJvWrM0lSUly+stAAYKkHsfOEF6JYpkw7uTuofpZX6eBqWWIGUtQ0T6aiU10MdXf
         nUubaYn5fA0uQzU5QF0yT3CUN8jPB7R7PYRgwPXBZglLfi9FD6if7lvudKd34zcSYZgV
         MfRw==
X-Forwarded-Encrypted: i=1; AKwUvBzfnMqlJ/pV1pc7is5DGjInkwabZJhT8s1ydLU4kggP0I4+TGWgBUI7doBUUrzUeJ8oFyckw3M=@lists.infradead.org
X-Gm-Message-State: AFq9FYIrsYaWE+qg9w116LL84VW4e85hWTbIRMlHtSwCtw8opSBzvIr/
	t/bmDjlFYHvIk528QULOXPBeITm2V/1ztUclQTfdRz9HjRtxJ0wI5KCXKIPTBgPldb9E2Ke80Ju
	80ZZQ4I0Y22yf/pMxJpMFZhOyZ9dYVqHTT1RIraiq3EYObbstzmwXtg8q5E8I+UOb
X-Gm-Gg: AYBFou1wtH2b0KPdUYO7v0NoKuHUVqPezo5Zm7FyQ2mMzCHtQLYsyrhd+XBX8ov8qHx
	sjYQkGnsV2JNrQHElkXDJs/AKLfBvyPqOujFD/0OjhSKlRwOlOBL+w3TGJiUnntr+bj4G0g9gkJ
	NrEXcs4fGKv0Kx5BmQFipogTAuOE7I/qvkrU4Khg5mtKZusd0OaWaMP1gzPDMvwIfIzw4yoLjrF
	v0tGL3wogw5HT+5Jp59qNGRV2tllH6sHlzEAsVEcLeiDWt4UNnDouhJILi7CqAXhhdOUeKi5TCY
	Aj8hRBQF5YHExFICimOaODFIBfaiq9FX73oMMadJsV56ITWAgt1LzTVutnom3mycOCEef4z9oEs
	sc9MU/rR92gdpHXmqYUXwgWd9pnvV0l2Ah3XXA9F42qbnRfBzNw==
X-Received: by 2002:a05:6808:238a:b0:4c5:6a01:210a with SMTP id 5614622812f47-55354eead93mr595946b6e.17.1792573806708;
        Wed, 21 Oct 2026 02:10:06 -0700 (PDT)
X-Received: by 2002:a05:6808:238a:b0:4c5:6a01:210a with SMTP id 5614622812f47-55354eead93mr595928b6e.17.1792573805299;
        Wed, 21 Oct 2026 02:10:05 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:04 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:35 -0700
Subject: [PATCH ath-next v2 7/8] wifi: ath10k: remove now-unused
 driver_recovery completion
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-7-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3510;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=0MX56h+G5vwBMUj7+Wrtzk4LSA9Q2kd7+MXHjWNs0hE=;
 b=LGw/a4nmclHQqbw5nk6z8pHL0GkmeSMpeDV1FEEwwcgoI2ith6J/WXIEPvgej7S28mDffcwrM
 cP7O9Dpfi8hAkxg3A2kk37Fx3QlT+Udh4xnKevnIXhwFF0BhMLqR3o4
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8816f cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=THAtv8xtLSZw0h4mMwsA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX8ljjaF4QMqe+
 AQ8y9b//qIjf6s/TjpQLOi7NSUyzQkF+r7S16hxLuoZLUA4UX/5T2wKrCO8FfkJdNxR+TAgsbki
 vTd7J3UF2a+jwrqh9hOSU+DXgTCcJ/0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX/ZpEUgVw8Fko
 g32hB/zt7LwVF3+n0V1G4c59I8b/JhVpsNK2S9DnJvc5TeRVvRFguwCA2AlkRx7psUGQDPFgUg0
 nU70JMifmlSK78FKlVMxxO64AzK6s/kcXvcvS3M/vyVBL9PqZYrRFazfiK9loZrk9ZplCgvj2hm
 rx437X6/g444ULX0wmaLxHJRsVXLTf8uC0OTca2RqTCu+lQJUb5X5+5EvTWQEanNpfb8bM/s3qq
 mCurTOaSC3GlxtqQ+VSI0XZ6ElM9/NRLSpWij7oHaqTgPIu+NQ5jfnJVekaeCv/lwWREBlWsGp0
 tneGykR1B3QJUXXadvY6LQ+BolVyuCPr88v8xOzzwFEBJD0CXKZtiOOcJGM4Ui033ZMx1xNAnAw
 ZNhYjJr7mBpbcgUIYMHmGHU7hvj0vobMu3J73GK3o5OYu5kSarm5Y04SyTD6E/EoBVv5gVYPk96
 2ILdNuQBZPwS/9x10EQ==
X-Proofpoint-GUID: xFBQCr5FfNK95f-a6MFu_uDC1kqN_lpZ
X-Proofpoint-ORIG-GUID: xFBQCr5FfNK95f-a6MFu_uDC1kqN_lpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_021008_752654_3260BFE0 
X-CRM114-Status: GOOD (  15.44  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Previous patch removes the recovery monitor's dependency on
driver_recovery, leaving SNOC removal as the only
remaining user.

Replace the SNOC teardown synchronization with
cancel_work_sync() and cancel_delayed_work_sync(),
which already provide the required guarantee that
recovery work has stopped before resources are freed.

Remove the now-unused driver_recovery completion and
associated initialization and cleanup code.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 66585cfa6d96..7692e1a8b2e6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2617,8 +2617,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3716,7 +3714,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 	init_completion(&ar->scan.completed);
 	init_completion(&ar->scan.on_channel);
 	init_completion(&ar->target_suspend);
-	init_completion(&ar->driver_recovery);
 	init_completion(&ar->wow.wakeup_completed);
 
 	init_completion(&ar->install_key_done);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index a1ded2cba103..7c961308d7b9 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1067,7 +1067,6 @@ struct ath10k {
 	} hif;
 
 	struct completion target_suspend;
-	struct completion driver_recovery;
 
 	const struct ath10k_hw_regs *regs;
 	const struct ath10k_hw_ce_regs *hw_ce_regs;
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 693b935536c2..5f828704f8ef 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8177,7 +8177,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		cancel_delayed_work_sync(&ar->recovery_check_work);
 
 		/* Clear recovery state. */
-		complete(&ar->driver_recovery);
 		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 8f171ab6f4de..1ec58ec1029b 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1916,10 +1916,10 @@ static void ath10k_snoc_remove(struct platform_device *pdev)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "snoc remove\n");
 
-	reinit_completion(&ar->driver_recovery);
-
-	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags))
-		wait_for_completion_timeout(&ar->driver_recovery, 3 * HZ);
+	if (test_bit(ATH10K_SNOC_FLAG_RECOVERY, &ar_snoc->flags)) {
+		cancel_work_sync(&ar->restart_work);
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+	}
 
 	ath10k_snoc_free_resources(ar);
 }

-- 
2.34.1


