Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9E160A2635
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=je5hGdha;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VbCZJBOV;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6GIuVdy;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2HajBJU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=; b=je5hGdhaRlHIJPoFG2rdzXvCRX
	dnI6+v7YEKH2AhWoQSOFhRd9MDqNJAxjIIEnqSwr/pnI7QAggQvBu7qF1WESCgA2nE9xl+tNHmwlc
	P8oMjbOnz+lqQuZJf/17+8olBd44rdHazQKxEabILyp/a7tGTEGQgzPGwkLV2gHg6ZLrYwvDluLXp
	f57B+Cj8LDFEvl9ZcE6DvcdzSoI9UMGFdW8S9WPCwbBnMZTU4sjB2IEaOJyaz7IaAKzMEaEjkhhr7
	svAp0RNgM9c1+/ep1+S9kEYtsjXSYoGBytqDlQ9urQhRw1aCDHTt2c0bOSpBDWgm0wTNHaFTmbZO/
	XLAoL7iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKi-0000000BRZv-22Fu;
	Wed, 21 Oct 2026 09:10:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKh-0000000BRZ2-1mCw
	for ath10k@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=; b=VbCZJBOVIZ0uSnyLAPDj6k3CU9
	q49VM32MSm9zpKBFpouyXdr01Z10wRw9PNSxeCR3sKCpoygwtCx1oE8E+u+LYncSKhKcNIImoytgw
	jzj2/pN/Nm9Is1a5QZBS40xqWfpvBHpRtKIWkDRu9CUckFqCaKRFSZumxUKG9RxgFy8vouauVnG17
	cffx9MKcw+1oOF/+9bTqyMmhLX8zadWRnHtlX+oTK/a5oVBYJAKs7900bTzcN5+V8aquKawaualfV
	opdCD9/hBD26OVWsWmJaYG8rW8806g/37VnCIDMDggk7w58EqwymehNXHgQSH2B3BU4HZ3W9k7lkR
	vk5LVF9w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xJSKe-00000005dMf-006s
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7cdVR502632
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=; b=V6GIuVdyLj48pIuA
	zPLCxfn0QM+Z+de4KDq9R1uskHyqRt/VhFrUjfJZt3cR4mBXJj39mQNYJ84hPAaW
	/wGn5lPuqTq3gPvO0NjvcA7WzhcJaCdwVhCEDoNBiwrJhCvp/kOCpB/2ref7sIzP
	99UZBG1hygSYT6TzVEZus8OlPMGk6NwnpjQgpb+otdse734MYnIoSkTz6vOIuAyl
	nt2+7czxx5Sa51KB6DD9BZP2wqYF8H/VgXosYul302UuIYN55e4ZeSERppAcAYI8
	yDGruEWd0FhEs+HQSr0hZDc810pexaqsPimmjANux5N/Blub2gkRS/7ENQmeJ/E3
	0sEZVg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk673-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:09:55 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso646277b6e.3
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573795; x=1793178595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=;
        b=O2HajBJU8DNcUdPAlySJBy4fzZc1Ti8/3LBYs2I0q8/JGlsMUcs9RWmu0PRkL/2lFW
         02RmawKlUYqDLa2zcHHSlDYafV1RKUYvruVRE2ILdq66PJMw+odwRQcMl6NBBN81Ha80
         78mPMt3NJCEqmyTrsPBJBuNxFvtyFVJ77YiPk8Ho+/r8QF/Dcks8mlqP8XJDGNkaXuaQ
         wZKkhoxa/Z8dSeBPzIEfF6IBTzn1Q7/RO3Mo+C5WF6nfCoxE8ZKKwPn04txEXCVMEJzV
         tB8iq8rKhRoP+bMbVYn7FYWT5IwEUHJ4+hmN1HAuVIFmgpIzIcMhFVxUy6NTxcZN2OlN
         pkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573795; x=1793178595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5F7IlOn+wHpmLBy6fLf5kOnI9xug8iEABbhwTUEk5nI=;
        b=AK1OvG2zlxyZngwpdhe0bPDmACahG4z1fVzzB2tlE/6DLNS24vlMt+ldDY307KM8l2
         279ItVsleSTdO9ktFhpAv5l+dPE10gT+04Ep8A0C3Rh4tMj1OjmlpW6M00mJzUmy5ND2
         QxqP9NvgTdfC1IZJ3hqH3Ms48hhqnIIn+qPM6HiNZooWMYcMLAxey+VWUuvfFZo2cZZW
         gyZbe7CauUvGXqcWJkVAr2NBNVYqTCn56DRlSQTS0gdAUe0D5Dx1y2NbdZTTlC0W3VbU
         QmgBd0VpI7fsaW4IxbJdYLodUEQqtUZt4uSX6DHvec5rfPpOLvPkBohhVaPkJsBTAicG
         b5aw==
X-Forwarded-Encrypted: i=1; AKwUvBwVgIEK7u8dAFNx7nIogonSAu1E94xzuJALYDNThwGa7CDnkLq35u3/lElgNYm+pVt2emB8uQc=@lists.infradead.org
X-Gm-Message-State: AFq9FYIH68aMqfK1iPjdwU8cCqiMyiZU4eko7Tr1mZdBsKt09Nr9AQnM
	ccwe7NkKj81+KhC4iBsg/joh4FJbfnhA1SYnopzQGCM95JkbrrUAMQWI0eX9BIiqyN9W02vU2GX
	RLWABZCf6rHmsSb6m6AHB2QVUgsYPknEs/J94iVn1AYSUQHD8ZA/ilzQtmXBKaK6g
X-Gm-Gg: AYBFou0TYfFx7GyFhLHiIKykSLtfNg9khf+e3H4mqu4lkvQDgkwzJ9J3L7eb3wFoj7s
	IQ2jjtaM1hwvT0iNPZH6BMhSJ6sKOS6cC8rIUg3wpmkInocKyqeaYFjKRezl9iuCJVshkXt9e9t
	RxSIdpjuXMmm7T+cfNQy7Sv0hczBqyqnwZKeB0ph7uxNOMLqlo71JYY1OIaFZLoFD6K1ztbun8w
	SDQj9dVHTEA6oEuWVl4g13tsyK5xc5sDtSZxw8tSCyU45e1NpmyMhoXMQP2lTc+iifEQsZ9rvuj
	rB6wJ6zvybFQh+fwgEQIdgzi9qd1OvL4/k9EAgYfmMAvIPj1pjK2YBH79LCBH3T1jzE0ksM6RRF
	+QXrLehzoqu5rtdbuHbJQEj4bFReuVQ7l9vxS8qgMNyELiYCDLg==
X-Received: by 2002:a05:6808:1a0d:b0:4d5:27da:a494 with SMTP id 5614622812f47-5536254f291mr774444b6e.46.1792573795262;
        Wed, 21 Oct 2026 02:09:55 -0700 (PDT)
X-Received: by 2002:a05:6808:1a0d:b0:4d5:27da:a494 with SMTP id 5614622812f47-5536254f291mr774430b6e.46.1792573794833;
        Wed, 21 Oct 2026 02:09:54 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:09:54 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:29 -0700
Subject: [PATCH ath-next v2 1/8] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-1-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=5192;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=3Qvk9OIDyUsTcNIe2E6YYBLeFS5QkCqczUNU9XX2Ltc=;
 b=/O3hXTgsWHEdzcy23qkDooJoPrVrXISYeUkF8n/JJVz2iG+8pFgdWFao923KHmgVaUVmdFilg
 OPjRpKdTUPQDvG6YXgwiwvXrK0vHlt6MgsLFS6quiCjEGdPyC9DsQXy
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX2Lq8NNLlsDZU
 djwIT6Gg+qIaqtSHepUwdv08OObqlm2MBDFBgz6qUSzX9i2M/WXG6uYaC+AMX9Qvvn8XSnWjui+
 1me4SiqyRDBUn/F4gbgvILFuXXHGEpNGgj8Rm8wgk6Z5uomtqZknR6efelEx/bHWLc5M8DyqOpf
 Kgdf1EJJ+r3STIIXMcSfafeJuagOokF+y/mk8VlmkWeX5swonrNCzDgc7E2iEkMSbywKtGVNLl0
 7H2DVDd6poBQoGdybsS5+T3pjeFSEWdl1JrOBwhAPENlwgfynOhbju7WCTCoz7O5gJGngl693JQ
 cB3AGw42SOU4MN1ycprZUTN76UgYZeEiD36vet+621lMvERTY+1vY8ptLugDiEv6kxG0sU9ydLt
 u80cB8Ze/4deUij12SOFGO54eGWY1hN9tNH7o9JIHBBUI0EjtXOOaQzrZZeW+XeWafAwpYYQDSn
 THRm9wFvdhdRJrK2n7g==
X-Proofpoint-GUID: wEl5G7RKKxAbV-S9BhO2WMwXb040rNRE
X-Proofpoint-ORIG-GUID: wEl5G7RKKxAbV-S9BhO2WMwXb040rNRE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX3S6zLN5mpbQP
 If1j5hZiqt5rQUny/gMxmBM/licT3YSZwFoa0B7BOPup9D9xSJcKFLAkTsreSwQLfkptta0Zdwe
 HUh67IbHL5Ee/abjOpPvAMhqBzR2fLc=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad88164 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FvdSVOc6Z0cOWoVicyIA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101000_544753_B9E7932E 
X-CRM114-Status: GOOD (  22.05  )
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

Recovery monitoring runs on workqueue_aux, which is also
used by SDIO RX dispatch and WMI SERVICE_READY handling.

A single firmware crash may generate multiple recovery
triggers. Recovery detection currently handles each one by
waiting for recovery completion on workqueue_aux. On SDIO,
this blocks the same workqueue needed to deliver recovery
traffic, preventing recovery from completing.

As a result, otherwise recoverable firmware crashes fail
with:
  ctl_resp never came in (-110)

Treat duplicate recovery triggers as part of a single
recovery attempt by gating recovery startup in
ath10k_core_start_recovery() with an atomic_cmpxchg() on
pending_recovery, and by making the monitor path check the
elapsed time since the attempt started instead of blocking
on a completion.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 64 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  2 ++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..07beefa06c4c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2494,46 +2494,52 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
 	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	unsigned long recovery_start = READ_ONCE(ar->recovery_start_jiffies);
+	int fail_count;
 
-	/* Sometimes the recovery will fail and then the next all recovery fail,
-	 * so avoid infinite recovery.
-	 */
-	if (atomic_read(&ar->fail_cont_count) >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   atomic_read(&ar->fail_cont_count));
-		ar->state = ATH10K_STATE_WEDGED;
+	if (ar->state == ATH10K_STATE_WEDGED)
 		return;
-	}
 
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
+	/*
+	 * Pure monitor: only ath10k_core_start_recovery() starts a fresh
+	 * cycle. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
+		return;
 
-	if (atomic_read(&ar->pending_recovery)) {
-		/* Sometimes it happened another recovery work before the previous one
-		 * completed, then the second recovery work will destroy the previous
-		 * one, thus below is to avoid that.
-		 */
-		time_left = wait_for_completion_timeout(&ar->driver_recovery,
-							ATH10K_RECOVERY_TIMEOUT_HZ);
-		if (time_left) {
-			ath10k_warn(ar, "previous recovery succeeded, skip this!\n");
-			return;
-		}
+	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
+		return;
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
+	/* Record the continuous recovery fail count when recovery is late. */
+	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-		/* Avoid having multiple recoveries at the same time. */
-		return;
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
+		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
+			   fail_count);
+		ar->state = ATH10K_STATE_WEDGED;
 	}
-
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle and stamps the
+	 * deadline. Losers do nothing while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/* Start a fresh failure budget; the last cycle may not have completed. */
+	atomic_set(&ar->fail_cont_count, 0);
+	WRITE_ONCE(ar->recovery_start_jiffies, jiffies);
+	queue_work(ar->workqueue, &ar->restart_work);
+
+	/* Start monitoring after publishing the recovery timestamp. */
 	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..c739fbadc8bb 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1215,6 +1215,8 @@ struct ath10k {
 	unsigned int recovery_count;
 	/* continuous recovery fail count */
 	atomic_t fail_cont_count;
+	/* jiffies when the current recovery attempt started */
+	unsigned long recovery_start_jiffies;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock

-- 
2.34.1


