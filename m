Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC6C9830E
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpzxKoiiTSBU1nVnLV1eocr7wH5M9Q65NcNAme4XRV4=; b=rDMkMrZia75a2tHbmih2nEP0CN
	7VgWnl4/MpsVyjSldO5JbA9pYuC3Z/kbKfEJD6rRCE4YmFhwUdiYegjnECDmOiTuqywpFJ44MIBry
	wE9cH48Uw3Rw6MjeZrg6j1sBfo5WFmM25h0YpdS9KWa7gOWDdq5Rudhk6ZHySU8UqPbdnNbWDXBy5
	NsFzjESc2Rj76ul4DlQXNnVJOUIlwLDTZcEplJY/HsQXHQslfvVHAtepFleNEJ/UP1r2gYOPVJLlC
	HDsTXuO4bnBKcfyK12at0xvOydeBmkOYPO8rejWW67C+cYFCED0BX/JylazAqEZXwQdt6mhXfNXJA
	yG2PQVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA514-0000000DJaT-22cT;
	Fri, 25 Sep 2026 12:27:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA511-0000000DJXq-2kSv
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:27:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PBV8m6425741
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpzxKoiiTSBU1nVnLV1eocr7wH5M9Q65NcNAme4XRV4=; b=SOk3bgHTOvq3AGco
	jdnOqFQbtyN/OzJT9RN0V4ZsSQYNpIfxBHw9NJzsyBZjLP5sXHFV2T0rpDMMWWKm
	Np4ak25VSuq2x/r/FfU9OEyUS3bKATHclClDbKwgrFlK4SRk+0OoopDwikFo9zXV
	HRU+EVr/KN+7afBYn4tGzoQh19PdjQeCNU0R1ZlS6o7Fn2iNWMSLoQ5xHJzP/AHM
	oiqjTpcvZ21Yzc4iiRQNLCjp/zi3S+bMl931Q2sQ7y/YLRvHJEbTQQAe4re3as/q
	U2EXVZP+0TN+OLAJcRnweNV+9OZZ59tk1BfVI0eXua6D5RqazkbSTwDNK1TL3+Q/
	XJQG4g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwr5e85hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1004447a91.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339218; x=1790944018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WpzxKoiiTSBU1nVnLV1eocr7wH5M9Q65NcNAme4XRV4=;
        b=UDQxn686bhLXf0BcEMWVylTml1lEjgVoq0MWE21YeZ7kI1rglhDoVPpYHUhtULrriZ
         ARM8RWr1B3El8keAwvvIjfhpucGGT58mEdZVtAudtAr4GdvJ0bJQubY8oxQF2RWCEcyJ
         ik6HT2+ekukV1n0p0w+K0M8cs1QUyNbwLBDCEZdjg9sXpjowvuCQHRAMtfGPMxATM/6e
         Xbo8UlPgsBzx1sNG3KG1sn+B+g1+rIzWgHjXKmSjpjeDU+Vsp3JjvT+VYdd3ddOaCE91
         TxiDTaS7dTp8BeXLo9eeruo+RdDzFiwKgP6rQw5ZhQplyuLgIqw2+jOc/U/4fHoj8Ks1
         6pWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339218; x=1790944018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpzxKoiiTSBU1nVnLV1eocr7wH5M9Q65NcNAme4XRV4=;
        b=FYuJHqK5ABSK7afiPcLMxbJcuuInJCiNsPCKPH5sDWrgC8XqxDHEIWysIvjHvvOylP
         l0gYWH5d1oQ7pVtIrFIgi+Q/HBoRhzkeGK2iOisyOFli5omjPZeztBFGHr1TRAxf45mw
         EmEHenUOeVILoMXPyc5MFcnE9AZIekyx7V7dmZLJZYWSYSquuI8sXHevngLwNSsgmyLi
         jw7Pi4EW11SZg+QIcXjJ/8VjjI0NltiqzgOOk8Un4BUjoN4bI8HJuwpPCXoTYhwJJe9h
         roFkw6xZPdmDGnWHT8GG400kQI4Bxrj4a2Lbf8tq1/BI0+ySxKgJNsdm9T+YG8QpEED6
         pHXQ==
X-Gm-Message-State: AFuF++k4kk/5qCpdV+BnDX+FCKqHw2dCbJPnv5fv4GrmGy+U7eUeDmfo
	er3sbIXZgp1wP3+fuZeKt8KoLe+8diQekZghBQJre36/RnDvL2D2vxeEtHYokri1LelmkvNUcul
	kM6pJF4t0VLQJNICnHP+kip1EGW39f2jj190coW7Xql2WhuT9KIncCjLkZnphppazKrKvrVG/A7
	uoWA==
X-Gm-Gg: AYBFou2iMGmqNGSW7sCGxIbqxLrsmrs155vBQyqIs6vKWCoNmG0kTOaOUWv1/nub/2d
	4Eu7ImL5AFN9c8E5AmYlqUSb/AglEMRQg/zuZCqP5nqJ6GMpjHyyZHczxl21sRIGTsQR5/7VpM1
	XlvxdqKBdrRK5+JohOvt9JSIGCSLiIKCt30jTVYmzQdiYZi/J/iikBN1n6Yr+sT2euQc/f/usiu
	LOkdwfRF9XMTuje9h+q6tSibMt98gW7WZiOK+eYRXRbZjQ9w7mIHpi55enSCit9pfYj7GldEdnA
	6yb8ztQKEjmHZcPKUTzFxADiPIJ87/eqENtIO1PAc9/A/RO3U8J2UCCStTb0ngvIHtPq6eFEtIQ
	wXAGYJguLnQXfgA7YePgGzf7dEbYTfP35y0nnntNmJ8yaqEOtlK4=
X-Received: by 2002:a17:90b:39a8:b0:39e:6a81:f349 with SMTP id 98e67ed59e1d1-3a098bb60efmr5046498a91.35.1790339218368;
        Fri, 25 Sep 2026 05:26:58 -0700 (PDT)
X-Received: by 2002:a17:90b:39a8:b0:39e:6a81:f349 with SMTP id 98e67ed59e1d1-3a098bb60efmr5046479a91.35.1790339217715;
        Fri, 25 Sep 2026 05:26:57 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:57 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:37 -0700
Subject: [PATCH ath-next 7/8] wifi: ath10k: remove now-unused
 driver_recovery completion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-7-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=3437;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=92m/AGutZDokLi66FDq/i9Vv+leO8LbFn+ZC1sw7EXs=;
 b=WyvI1CkVtPJkXd5WUOLF5z9g4g2vJfsVmiqtUIoEbJawoxga8TVyx+vgnJr6djTaxTXqypJ1n
 s/oUl4FQYAsBxA5kAlw+IuEZ2D27pCMzjjP2qIU69Mpwkz99lcAqyu5
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX154j4y3R6NMI
 Mcy4EhLFfreFBBk0/ZnjGEs3OVBpmc5DunHT4iqyeGajvlbLMZP2XODbUOe2r4F16dDHdtV8K3l
 Ha6bC97BX+254ldYoBb/7w7TZGVJDhk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX3y79/DbViNuF
 wWJAsaCO2BlKu1mq85DLFkggdR7eOfozJ/wzBYjNA//cbfXWiTr+oauYLuGJCUc3VgWThRwxO0a
 yjUCRLgS/E92EL6m88QRAMS4mpmeVGcmIrohRAVnj6p84NIhcywQ06gn8k1n8I2gV5fb9hATJ//
 XhATzy6jD0/2E/sjJZKRHWpHiXH0yBi47MEr7ztMMVw1yhTBQakLovRi8LyPIAem9USiwoiXlSs
 T1BM0m3YwkLhPYen0tlqzNb7JfTEnHgbGgJO5d1oKBiPdynL+8kjImjXCVjBGoKKZu5GBXnXK14
 GoSpAJ3WxDxfost9bFJachy/pv+eWIBI8R6aXpafSwejqzA7xsns37SXu4kmohFfwPkxGCDbXk7
 z6+5aAp76CoSZM1oog0fdoWieRbU1XrHap0rDF8TaJslgjsmQL5RZqt+QOxf9N3l8FdQkRTJGY2
 RtfWZETh/G8x6v/asLA==
X-Proofpoint-GUID: VGS5tLRP9b_FXctHqZoIrcsCJOhJHC-5
X-Proofpoint-ORIG-GUID: VGS5tLRP9b_FXctHqZoIrcsCJOhJHC-5
X-Authority-Analysis: v=2.4 cv=Hf2B3SE8 c=1 sm=1 tr=0 ts=6ab66893 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=THAtv8xtLSZw0h4mMwsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052659_708962_251359CA 
X-CRM114-Status: GOOD (  14.86  )
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

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 ---
 drivers/net/wireless/ath/ath10k/core.h | 1 -
 drivers/net/wireless/ath/ath10k/mac.c  | 1 -
 drivers/net/wireless/ath/ath10k/snoc.c | 8 ++++----
 4 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 0a87a577b3f8..8c2ac2ec32d1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2626,8 +2626,6 @@ static void ath10k_core_restart(struct work_struct *work)
 	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
 	int ret;
 
-	reinit_completion(&ar->driver_recovery);
-
 	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	/* Place a barrier to make sure the compiler doesn't reorder
@@ -3725,7 +3723,6 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
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
index d10126351fce..9eb356786d3a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -8171,7 +8171,6 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ieee80211_wake_queues(ar->hw);
 
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


