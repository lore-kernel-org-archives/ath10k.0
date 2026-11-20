Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68A7606A89D
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rqQjJXDV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FZPDyoMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z4UUKunh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=; b=rqQjJXDVgTRlww
	VipxAdTlMunsq0bZIAot1TqbGpwBZDivrif1kRR1unRjUJHj37bHG1eTHCLn+0/8fNxIzCGk7tRdD
	+u7fsaEIn6kE9Mu8ocJclvyvcL8blTKvLqfNOpRay+dLObGaoQ7FXW2XIfez9DG6jnLbmdH4faiw3
	EHODuh2fFwx/8scobzgYOFd3E2Li0ISoh5kVL113SFyNT21OGDRSQhIxWCTSObrfuuYv9X551jEDi
	UmOUhu4CIR81yEfKMscP3UXXdZ/0m2aP6vS4GsjHH7+Rd9F1UFtK1rhxWD7CeJuERi+lNDFZJ2cZZ
	G8bGhrc8fyat+HexOtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDB-0000000EMhx-0VsN;
	Fri, 20 Nov 2026 08:43:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCw-0000000EMWM-0PgX
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7ewjT3575749
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=; b=FZPDyoMK/qbktyBl
	W64Ib4x4qMGe65QsOc5Q2BqACOsqZYBtV2NVfrmUF2hdHIdcpzNoOhtIDX4kSogz
	uo+7hAtSPIW79K5OOGKsibJwnWqb3jQwiClzdrqXNczqGzPRIYrrNKbxShr1q892
	kg84zkjZbIR8dr4keKf2MP/rvYT8ylmtWA+/JAerBHJaoojJkInvQ55jEGTmN4uV
	hYP13tFjd8FkXRWOEQi+skzzjMRec/wNS3zGgx4A7RKzpZa7xNPZ4TPh2pYTlMNb
	ga6EgjCtomLIA/a1GA3VGexO9Clayvg/xNYB22a68AA8Ze6YRnMcUecBO0dhOJEE
	lAkfCA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so679171eec.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164177; x=1795768977; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=Z4UUKunh/cw3RK5U0HQglzUe2NGKt+lJt+08v4H/nlofpRnDCMcvm2QtbGotD9oCmG
         7vRqtwmA4t72ic7zw8dzyJpPDdcaeEfzbwm7p2AdPPGzlFNoIXjRrKysKfDvJi2homUC
         idcBZMt3NcFMd3jC26tCxgpGs3sZUmCmujub992BCxsysz4c720mba5aC4jV2NGQxNrj
         FF6UZgKjCjG5FPRUynBG6BfUuMFVFRUYq9cuzzt/Qd5r2iJ9fMGixHAFUEVddFOWSE+R
         yRKgFuwYSawWdXIvx5tcLS9R9lCf96obRo7UdatdsaKcTqrL0hBBpqzR6aB99bQ9rsF4
         Vweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164177; x=1795768977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6UM1y/KWtHHd0/uNRfFEFks1dVYieXXfq27+VcRjfA=;
        b=GTruFPRV/Qq69HOl/HzdOhTdp70kzXQ8q603xr+KdYoG+dxR7h/fYSWUAPCzhuLTK/
         oqU1Tl6pb+ze0H8n7XDXMAtS0sacSJgzbeQM/zESvWakOPOv3ySO+W7iUvB0kHfL3WxU
         SIErbvL6wmRNdrPzERZn2bLyy4DcHChxR0gwzCP1bGEoYp3xtWO+7BwSdSsu6Hp5Ib1Y
         jGI185H/9Ad5uoXlJpZ+6Jxz9t0TJEkWUq5HoFIrKjbSlb2HUWFdIJwMUiuWGgZ9GK8B
         b2v4V7E+XbhdifP/0tk0b08CxEoXcWo1muuE0R/zmzR8i6HVk2uDwmuDpx7XmlB8aFy8
         dAvg==
X-Forwarded-Encrypted: i=1; AL+hErHWmn/3pFasnmGkEfr+Qa1JowUhCeSaXgB7q49kxV47GDANIwZlFMGxwk3EUQothUr8VC7HHGU=@lists.infradead.org
X-Gm-Message-State: APuU4Z8A4bAdyNcWn4o2ISlDCAuoCN9gCEBQzMzIxO5HNFRvHfJDRJKf
	R6WghuXoSnoJ7i8SW7AdA5xSMM7NqyCxel/2ywji0hu/Dhhl91SRymkfiZ8WQQqsn2qSL2WAAhC
	vf2zAwLdl4AUOxsQX/LRKKoM04seAJmeLMxVItV5CnGsQp9yGZ6F2O7FYwXO1rXJB
X-Gm-Gg: AZFdTZdCKKhbojrI1nAuV4CVLdzom98gmzPtU4vyBHikZ2H/kMXJhEPeUpGegzOaX+O
	hckgUQNNx0KyOiNK2Gx+oq4vL+xTXo3NURAhaBnsQJlsI116a17/rLmF/4gVpY7vULZ/aZ/9QrQ
	NbH1clvIPRj3xpzhLNPXvxCmrnMSbBcTGdSMkstd2kQlM06cJaf179oqAhqqBSo7L5ZTTOQGrSs
	VMBrnGGBzI+9Bahmhv5rIaLSHcXWAsc498P2Y7T4HUYWHg71+lzEmr8vSZLW/x5oypKvNpbofyY
	MRQqwGUMtbWopbJagOr2Rmf3BwGYdU401dm0jTr0tpJ8r7iU/OBaOE2kRrV9jQ2Z+HKmrsdQhM/
	wBIVqza7IWQcdAFKzpSKPU3+aXAe40OeGzq8yiL35CseVXsklU+q14KUAWYSskKav/0JebCFXql
	rQOQMF8u8dYpucbvzLjF1hMs8=
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649596eec.12.1795164176765;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
X-Received: by 2002:a05:7301:188e:b0:381:685a:e1ee with SMTP id 5a478bee46e88-384b3e78a26mr3649570eec.12.1795164176217;
        Fri, 20 Nov 2026 00:42:56 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:29 -0800
Subject: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=xYQJfPHtqX9vuxRlxr/c5QyrNSA+dqNPa2wUFMiopAk=;
 b=owhOCcr49FGFhwZPYvjUG3cGjpX6+180EF2O9AiSsCeEhXZWaK6s3h7uiI0gBGBEU3wZNo8c8
 uSNP3QYre7yCWkhCp675zLgLBKY35xnh+dssyKLB1fjo8Q28up6pcpw
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXznXBbUmRQu0/
 HAzYFUwyAN8E7Pwn69MctCM7qhq8I+jBBN0LoTflAvMLinDcOgUVxzcEpxfNeye0iFwKn0lupPT
 BNNpZPYLU9gm9YPo9e94XrKYEwOjm8ldpJBJcUbJ/rpUn6K+S4JFgR9P3QGUF0DriiftKx3a7mi
 ORL3lnXk6UZHlvyxFq3PaUun+mMEKzeMhMy9ejn83ob1azwhcy5fWr64wivYP8Cr2qKJtCQfbFJ
 w8o6VypWpwPvcqy119GA8vV55acdg1eu+xwGkInd9jkeTHroLhNz7al6WelQrymVL+p5gyY2Nup
 XN6LzmGrw6VjWewK5LTy4meywNX97MOtghSBOfI6EPAHQsMs/FyqwzwLvgFUQhzEyxdXZiFUmDH
 wwz3NAXNCQpZvHaUILcZ1zi5BE5zLrQD6YrlzPJu9NJDvozCin5/5SpRZhe5GhuHTW7ZidoGspC
 pwouxXe/ca4t6sUpd5g==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000811 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: tD5HQPNpdP-OujecJa5T0SVBX4SWUAmn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX8MacfquMv3CV
 +mBOaoaL/kv3S4s8w9vPohTpu85SNCfF0mRLbc9eK3H6pLvr1TSV1bp9x2Bg9+DCTBmEehq4qkc
 l1cgXqA5VrE+i+5kiZc1PKiBqWcKavM=
X-Proofpoint-GUID: tD5HQPNpdP-OujecJa5T0SVBX4SWUAmn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004258_168161_024A4072 
X-CRM114-Status: GOOD (  10.51  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 3bb4d2742c30..99960f12dc66 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 74aca0af11c8..695df1821e5c 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1


