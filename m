Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AB160A2621
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MkpqWKAG;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z0w6X48f;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcAxOkSr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=; b=MkpqWKAG4PbuLIEYrMC7fNyVhW
	JCqE37JZgEvo3RpGPU3ZVYBRh0xb2jNghmDMM/0+0N8F4RV9WKzkfSiBlIhpkhgoCz1Xg1twQlmYM
	D89M//KzQzqPvFh8TQQUZ8WU6tyVWt8XxYjtXBbkajX6uGX8GJTSJzGOk3sweQOJ9TwoRbMtF4Udv
	s7Vq7wDfcJxED9Zer51JJDTz3jqWSGtPolu/rcP84KD4oDHiWRwR5wK7sIdtgLt2024pY70VFTTip
	8yIaQVD0c1nvHsSsMl4h9gtjzjV7tL9olksP7zH6K0NjvcRD9fMBF0UdTmom1wOatrXrTWMOWK1t+
	OuNUxw4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKg-0000000BRYg-1Odx;
	Wed, 21 Oct 2026 09:10:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKd-0000000BRXU-3sSn
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L8Ikjb594915
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=; b=Z0w6X48f1DaZ6K3R
	ZLB+y/BGasTuyoYb0wgOk29GTDbvjE+HgFQS4/BIr696zV5nIwCUMRVYv+VOHJhM
	PA+vBU+MrWxykKTCXfpT9lT98cl7OA202DXveWEEM6ChcvqbrEJFCzfa/VaU5/3n
	4zFBRuiRYuIVIT9JayPA/plFY4CtwpWLOfW8Op9Xt8aGKJbmtjgcO4m/Wa1a9AP/
	KeUbcadm1YQj2L3YPQqnWnYYbYDP3vUKKGJ2r0ZVMEkITzn822qqzk4BiwqBvmlX
	Ka1n/DAKnlbyGJy44+FsinoQRN6VMmUa22YT92bfoYGupRjNYl1JaDzGyDn12PJL
	1JolBg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk678-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:58 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso656763b6e.0
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573798; x=1793178598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=;
        b=BcAxOkSr8wvX9GFQpxRVM4AyQmqj9GK7V31YDZfJ7ftOPt1sQNXDY7uElrVKoKjHf1
         i6uvdhhIMsVkONVTHv09wNboPYT8lIM7OALU5l+koF+jY5tqyJiVW5poFTLdHyv+WxJi
         aByVytekN1+6+HEhtgLMgNelNLsmdZ9B0KcphbHOCUpv5Jx6tzQPBEiNkRBE3K34hMYw
         C+vRpiSdwuQ9i7+4GRujfuyobO3y5qixDa31TfUb2MeEAHDRhTaL6GVNe84FcJl77Uwr
         paqg//1ZjGLSIUL7frvTt3bjoUCMuZa9YwK2pu2WC0xXhmVPZobS1GM4ZSqFrVvTq1QI
         Iy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573798; x=1793178598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwTE3Pos3BZVgDma/NRRNIPIbpecC6fQW8FK8gZC6j0=;
        b=H3kutCcfs9cn99xjGuYKDKVf6nCoaq2qloOxuVWxvZ7NLzlSHc/sXRk4bjyGMTAlpC
         odmGP73/A9WOIIAPuqXcSWISacZ3s4Y3u06hVGh9p6hygEh5pQqMliOXOZidKI0KGkOS
         CrRAzmxLORdI0HDRjh/r3Ae2gpN0M0sgPwOXFPoSxaX9bxXTcWztZHzzU879DalktDCq
         jMsb7WRzkN5wV/ik5FrZB5X7DQC6xWK/YOuGrTWynAc6ASfZnQceyVgKilJUw40uTGS+
         sNWq8BIvaytCF4euLqlLE3wCpPATVfFmEzdlSH7MW6euTZAptXLUFBZkbCvZ3Qc5/0e4
         uiCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwahF7gXbi71Nzy+a+IL2XBviQsok+CQ1KX9L/tWX803YZ4bILkBPXhrLS960FEGAGA8ss84Vk=@lists.infradead.org
X-Gm-Message-State: AFq9FYLJTq9TQxYIPfc3Byk5aRO4zEWUdLKwcWUkOzGLFz4vnrDNgaCp
	3BsSjChU/n686eWiINAX/ioN6DKkMGi73g0MTX2NbW3j3xDlxEhabfJqGh9MMnH8el7YN1eukER
	JdbUuQ6bp5IYPok7tLaIk6lfadG1yGhT7Q0JZEwx2w/hIl4lg+VlntXNfhvKCKlnm
X-Gm-Gg: AYBFou1oFIHBgWfURbDveGgdIuL5/zjCIyXXfRNZUHkcSXhZHtUNwBAVjri8kpXmIpG
	DZjg7iKzZ09LjjwKpzt9pukZrvbd47cx1gGwpG0D1jh6h8GiU0Dz0rcqRHJQNDbCJKsZpMM32jk
	G3Cd2LJqS0NWYL90PX5xvUZ+Kl9eCt2owJ96u9+Q1FHGFBA6Jeg81ljN1URjvVjBR3sK6ZlIL6n
	u4kmQvfKqAUXmGY7qBWXRNcK0UM6aRLBiPkA5bbQQZFdb+H+t8U/ToAKOqQ/UkWIo4ea2tJov33
	guuVnyqvAubucJS/JKU7jMSuLfPx2xenAWgLysmJo4X0G0rikT+gQx6MGqmiCTzMJU2YD7G7a7n
	pwLuxNK9LLSRDt2cgEQmCVnq5m0qCkHGivnxBZxD5JVrD5Wqvcw==
X-Received: by 2002:a05:6808:4fde:b0:4e8:721f:2824 with SMTP id 5614622812f47-5535fbb3a8cmr813199b6e.60.1792573798049;
        Wed, 21 Oct 2026 02:09:58 -0700 (PDT)
X-Received: by 2002:a05:6808:4fde:b0:4e8:721f:2824 with SMTP id 5614622812f47-5535fbb3a8cmr813190b6e.60.1792573797599;
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:31 -0700
Subject: [PATCH ath-next v2 3/8] wifi: ath10k: also wake remaining blocked
 waiters
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-3-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3231;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=/2dOtNID5u69agznXn4uIB8KW+SaBAax+d/DHi8fIRM=;
 b=q1K/zTxgVqrUOksIWnOs9Obafn/YPuh3uBgZ80D1tHOrVOA9s7YRi9bWvwAo3BjcqkkXtGX7O
 seYqGVjUcmqBNSFpIB32g2C1UotH5rbbmzcd5b0Bx0vY24OSJGzW6gP
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyxUe3D9bpNEp
 6lrddg5SN9mBhIMsZghw02Z/5n9YYpl041dZvxiTusixuUGCk6EcXUgBNFT1r1h2265lbVokyOH
 7BSAnwr7PmbXOYhYKFHeUYkbg4TKLp0ZglbPdd1PgQvWdciT0OoiFLW51PL6xbo06upwUNKSBh1
 ywN3i0lQakfaF5sWSKizzY9nxcvUVDDLcxOz3ouPZsS9NNp0PoGnQKfETWcF+zLNEnwJJqquAuT
 wzTKB/6TrlOmoE1GnWVK3SBUaggpYerOOpTOd1SGOrzmlt6IMSH5VqPK19SyTSGYpEzhpaavsh6
 18AVNyzwlk0XkPLGNHNFvzCkhZtzFmOiPg8/8qDMQpKaHZXmW3eG94SsHiAvJTXv6l355Dg5HFn
 IQb9XaxxukOF3gRYjUF64IA3Nyp+e+xrmgkZ28E7DSkpKFUPs6ZbXJbNxz2LIGDmSKM7eRd58dh
 mBy0dyGIlioDmzA1hng==
X-Proofpoint-GUID: ft8DhW40wvhYKiP6PQGH_DsiOdzQrtYK
X-Proofpoint-ORIG-GUID: ft8DhW40wvhYKiP6PQGH_DsiOdzQrtYK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX+nzOxa9kEypV
 7zUWE6wDc2O2J/N0FN4JziI6TsMvS0oucqtpIX0vWANRpAQbX4pAC3NG1qkAyXQYbzlcflSwRRV
 vNPCiSLWRmXSKPrfXvhZMsDn63pKUHo=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88166 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zeuzKm5edEikVQEUlRwA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_021000_091812_63DDCF88 
X-CRM114-Status: GOOD (  13.24  )
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

ath10k_core_wake_all_waiters() releases callers that would
otherwise remain blocked after the driver has given up on the
device.

However, peer_delete_done, target_suspend, wow.wakeup_completed,
peer_stats_info_complete and wmi.radar_confirm are not included
in that list. Callers waiting on any of them continue sleeping
until their individual timeouts expire, even though no further
progress can be made. The WoW and suspend waiters are on the
suspend/resume path, where these extra timeouts consume the
watchdog budget.

Add these completions to ath10k_core_wake_all_waiters() so
blocked callers are released immediately instead of waiting
for unnecessary timeout delays.

peer_delete_done is the only one of these that is never
reinitialized before its waiters run. A completion left over
from a wake during recovery would make the next peer delete
wait return immediately, so reinit it before each peer delete
command is sent.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 93140f1ffb7b..677e582b87e4 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
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
index 8e604697d6c2..45a3082d5a64 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5890,6 +5891,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5952,6 +5954,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1


