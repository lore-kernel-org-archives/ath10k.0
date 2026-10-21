Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880560A3808
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qRJCd64n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RXOM9mG6;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkKWLX19;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jr22OJdv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=; b=qRJCd64nEo5VvI952sNm2wb1r1
	rwfwDO+wqdSFv/+ZBrl6AqhpuxOTiWA77SrHKHZeDX/SRV+wK6HLZ8CotZ3VzTROIpenR30DD8KKb
	0CMIA8jaz52o4477/eDMm9k4x6rPUbwDt7qgCRIaMSo7NbnMq/JR5bl7s5niBgwsFJ0CWVNeALnhQ
	zUuFzmt+nVLgGEfZN/rjNRowl98zekF1kRKjZaew724C3Ed+Jt9W/j88YJ85p03fcbBfxlc3sJS3y
	FdqOMcU8AvKXCqDL0tVXOlj2oQ8gMYyxbv9LOt0nOyfvYFTUvNpIyvVTrC7pehnIBnX6TJf+Kzt2d
	f4TmgBzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKj-0000000BRb1-2YbA;
	Wed, 21 Oct 2026 09:10:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKh-0000000BRZD-3byu
	for ath10k@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:10:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=; b=RXOM9mG6iPg1glh+M0FpQyRPIa
	AnOuv3scUn2NOX6NyZrL8N8FjUJioV7rsci9tWk28c+/25bQW2XKzU+7hz/bAjZK03IlZk0GT3Xau
	mOFh/Wzi8i3/l/3XRNQU4A0szm27WHbP51kUqjLaEOqhvs3dyJSJZjvUJtOeow07QBmbIHQF+kTfN
	AB05xMwbRJsMtlPu5J1/dhta3mISNwlAT9WxUhn6Rke5rvesaD6DoMbkx/ZWQNgPaE0gXsvVlXc9E
	ujJ7KGEgBGHqwuQLZ1++HQ0Yww0Musk/ZwYL4ztOPzmjnEwucLh7ciSfocIM2J6DnD335VhLJ7/so
	j1v3XHJQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSKe-00000005dMi-1zEO
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:02 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iwq7164993
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=; b=SkKWLX19cIhddEgn
	fLAsVbbwY9QW2dhcb1n1Is8orvDRl0Lo75zPH1FtnuKojKUWpYwtdC2Rb5GjInmp
	6wKnQLezsgsGa7uFK/6tNnOFVXq187qb6uU8V7IYrotA844EM1eMqfuxgxj7XH7/
	S1SygAJYGIYeuS+mFhxO47LHhNKNGedoZa1okJk6ANoHPddGCUqlotPpryK5FerN
	kStB2jYgUlQo3jFE+6Z+zOSBvhR7UC3ZFJBULlWUiatGVNAyXhmgQ4sKEqn3ap+l
	eCwmlfzgqxWKZ31arVGl0ztIx8Ohm56ws/Y5+UgrxCiEV4UMLB9BEvTlCJZI7VDG
	tMgN/w==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02cy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:57 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-54dbbf252cdso708065b6e.2
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573797; x=1793178597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=;
        b=Jr22OJdv4CtCl8DJdDYD1y4+HbklFZw43zDmNqFdEOPq8B9JoE7+f3FebFQVXWiNoH
         TasXV22lsc7Aua5Ntca/yGf/8KKAPoSXm1sJ4/SwocVKdfCHk9oxX3e5W29yadLtUce2
         AZgq6KNAx3BpyE5Bnir00PGkkY2NLgeAofC5L9rAbgzu89siHX7lN5+9WTKlx+xaCxJK
         cIeP99LsEwZ8ZxXO4Y1823sb6MxBeoQlYMXLFldZuFcz9VthEMxO6K8PQmXe0qVpLU9w
         CprBlBw6kP8kZ424jQTox13w+Z3MqTnHqjtGsfPBNYMMMmDpzNMlK1CWJceF5y4Q+f2r
         IsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573797; x=1793178597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iaaDbUrXL1MbstCqkNh2A8z9QVuh0TfWXGm+u2WT+ns=;
        b=YlQuuYr+00i2Y/T2b81N2oU9h62/rr+MW6O7uzPymD30RFAVKgtVOoVphP6r4Ylmg6
         QquuDoAJUf7pij501WsCX/vOIbqbgL7c4mYRCaHddMWJgEsdpCyJr1EhZ7HdBPJqFxbc
         z0MvcenTrOD6DUQijaFcskX3xjyo5MhNO7rzoRDxyv/wRi5Z7Tw25q/TgbdmIW01IeJ+
         xCmgmzjZ35O8wdLIfXElwSr3xfrcAcIFafKS965uzW3UoBl++d8mD2thW9RmmiNJY+3n
         Oa7ZjyEx8rb/pw1tkOK9UVl9TB8lWA55FCKTqpboWxyNKrRB4TjKHY5E11+hfpGs+grC
         qhmw==
X-Forwarded-Encrypted: i=1; AKwUvBzJlN86TZrKF/C3IZHYOLDAcEKN6Ib/T8rHSwkEhqLSBkGEaXpKZI3ONnSB9YkXZ457wxwLvzQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYIK3NTrjEUrj+fOi0xbEGZePkWiVC2ggu+8qNc1ie++/xgiVDwr
	VHjJT1kxdmH/GaSaKRCaMEV1mFgL+Rsd1ND7Bwt5scD4hKRpljoxX3WRSSPlg6eaizzg+5Iz2QP
	QEnBtoo7B7q3kXiruN8pjcPdAOEPZMjXwwq6hKrcaTX+q7+0H/FWL1M5z0hZ9Ewf3
X-Gm-Gg: AYBFou2oNo1EJV9b/KZ7NQ4vlDU+oqBfUgfhld4p7o8D12UPfRL96ZEiRABH3k37xZS
	Hyid4Xz74jfsaCVkIPnwQnQUKaH8teeUNBA6FxRhq+Q4+tefyacw0PqF0xy4mxehlLSKNA2hYPQ
	Q2HczX6cEbljgBN9OmDgSc++r1sT1QGCT5uoiMv3F4qQGFIs6oBiVhQIyefDSMnXiuDUBOdctOo
	unCorz5IRfg9hhZSFPQa/Zl+uCzd9v/AOFfG3eurXjKrPczMh2u5HDvo00cEQU77bgeKwrczxRS
	H8axMjYhjUo4s3AXPpDbwY+vqpCspCdeeF+byNQMeAkmPoAqGtBlnAkLX201YsahuoetYWaIwPr
	BVkOfIyb8AnzRfBhdWLTlIKIYgoLddaEWnXBMFfXpZsaDwBSScA==
X-Received: by 2002:a05:6808:4fd4:b0:4d6:90f4:48b7 with SMTP id 5614622812f47-5535bea1b87mr999425b6e.57.1792573796695;
        Wed, 21 Oct 2026 02:09:56 -0700 (PDT)
X-Received: by 2002:a05:6808:4fd4:b0:4d6:90f4:48b7 with SMTP id 5614622812f47-5535bea1b87mr999408b6e.57.1792573796225;
        Wed, 21 Oct 2026 02:09:56 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:30 -0700
Subject: [PATCH ath-next v2 2/8] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-2-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=4080;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Rw4qE318zOpF8ysP1n4lo9aO3ThjAOMDbjwAMreJziE=;
 b=lFCaFDrXUXmpdeYacf2XKBTxSI51kI9OE8NosZ+FSVG//kfLs+xiNKWsYo7oYcVcergv/Reeo
 PkGPDDQU62aDax3cTLgX8OOS8RdLVG8Jff1NirnueNx8U2qUNVEdtat
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad88165 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX4dIpE5nEZn+0
 b2g9fLCkz8MEhqiJ3imJjHTiYIEy8wYObtZyRLJmJyy5C6AOb/JQGHknUlXz2tOK2ePfAwSgtVN
 Oaw6UFjr76rBGGvgoUVefnEQeSrOAsu487FT1uq6a+AIpUqg48ypjuaIMY97AszF6GnkT8NSFwf
 kTP21xsmLr1Oohlmm173jcRAK834ggjM45hWlhAI1EKJa2hlftbK05vO/InGLbqBj/n6NlXQdgh
 NbhNbSGgVLjmSKl7EwGFy4uNiwKsabBqY9rNs+Jt9XMiXd69YEGYl3EDXmkiG1UgHRckVH6hRiv
 2XzvkHpJUvZUF99f/mtj23nE/Rjszrnxc8nTXSpoplmn7W0leRGwRRO3OtLx0H+spnAXFreQ0i6
 guys0mDOg4C2px+JJH/2+iNsmxooU2hIQhtGnUUKETfibfrC1wBcSURVM/obpP/w3pmU2JM0jof
 31nF8nSnN75Hx3Ea9UQ==
X-Proofpoint-ORIG-GUID: QvKRjWMjo7rlNi1pe54dLdqHGaolVo28
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX6/DNh/E2VqYW
 sN8hWrWtpRZj581lXpq/S7lhV6e162zYqxUQkPw4lM7iEpVZbPexjYvS2TMX5WBKHVosPdJy5Ur
 eRS4Tnj5PJoGCvFPpFSsxAYmq4BDxRE=
X-Proofpoint-GUID: QvKRjWMjo7rlNi1pe54dLdqHGaolVo28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101000_898193_75DC91B7 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: -0.9 (/)
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

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added a fail-count based transition
to ATH10K_STATE_WEDGED after repeated recovery failures.

When recovery starts, ath10k_core_restart() sets
ATH10K_FLAG_CRASH_FLUSH and wakes waiters already blocked at
the time the failure is detected. However, additional waits
may be created later while the recovery attempt is still in
progress.

If recovery ultimately fails and the device transitions to
ATH10K_STATE_WEDGED, those later waiters continue sleeping
until their individual timeouts expire even though no further
progress is possible.

On suspend/resume, these extra wait timeouts consume watchdog
budget. Crash logs show cases where one or two such timeouts
are enough to cause the suspend watchdog to fire before the
driver finishes shutting down.

Apply the same CRASH_FLUSH, queue-stop and waiter wakeup
handling when entering ATH10K_STATE_WEDGED so blocked callers
fail immediately once the driver gives up.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 43 +++++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 07beefa06c4c..93140f1ffb7b 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2491,6 +2491,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 	return 0;
 }
 
+static void ath10k_core_wake_all_waiters(struct ath10k *ar)
+{
+	complete(&ar->scan.started);
+	complete(&ar->scan.completed);
+	complete(&ar->scan.on_channel);
+	complete(&ar->offchan_tx_completed);
+	complete(&ar->install_key_done);
+	complete(&ar->vdev_setup_done);
+	complete(&ar->vdev_delete_done);
+	complete(&ar->thermal.wmi_sync);
+	complete(&ar->bss_survey_done);
+	wake_up(&ar->htt.empty_tx_wq);
+	wake_up(&ar->wmi.tx_credits_wq);
+	wake_up(&ar->peer_mapping_wq);
+}
+
+static void ath10k_core_enter_wedged(struct ath10k *ar)
+{
+	ar->state = ATH10K_STATE_WEDGED;
+
+	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
+
+	ieee80211_stop_queues(ar->hw);
+	ath10k_core_wake_all_waiters(ar);
+}
+
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
@@ -2516,7 +2542,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
 		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
 			   fail_count);
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 	}
 }
 
@@ -2585,18 +2611,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_drain_tx(ar);
-	complete(&ar->scan.started);
-	complete(&ar->scan.completed);
-	complete(&ar->scan.on_channel);
-	complete(&ar->offchan_tx_completed);
-	complete(&ar->install_key_done);
-	complete(&ar->vdev_setup_done);
-	complete(&ar->vdev_delete_done);
-	complete(&ar->thermal.wmi_sync);
-	complete(&ar->bss_survey_done);
-	wake_up(&ar->htt.empty_tx_wq);
-	wake_up(&ar->wmi.tx_credits_wq);
-	wake_up(&ar->peer_mapping_wq);
+	ath10k_core_wake_all_waiters(ar);
 
 	/* TODO: We can have one instance of cancelling coverage_class_work by
 	 * moving it to ath10k_halt(), so that both stop() and restart() would
@@ -2624,7 +2639,7 @@ static void ath10k_core_restart(struct work_struct *work)
 		/* hw restart might be requested from multiple places */
 		break;
 	case ATH10K_STATE_RESTARTED:
-		ar->state = ATH10K_STATE_WEDGED;
+		ath10k_core_enter_wedged(ar);
 		fallthrough;
 	case ATH10K_STATE_WEDGED:
 		ath10k_warn(ar, "device is wedged, will not restart\n");

-- 
2.34.1


