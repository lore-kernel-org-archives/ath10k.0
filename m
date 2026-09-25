Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC828C98328
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vzYXdSkKprGtNLKWEtOe2G7gqYD2Fig0Dn0aWWM8vfg=; b=KdizzkwVA4SFXwaYy/ujxaOH97
	RuhBJIW72TPw4L2tBo+Ofkp5sf5KK7cLy8jRfsHFGhzdvzK+9psh+Dtv+fHi5SR/lXk7V4sN4+jiY
	sF6A6xT0uiB+6d/GbzP27w2DH1c1E9/Eyn6K0kU+6wJy1kYFZixzIFvUtB+N2T7OkV0PNJ5EoOauS
	u0Rdy/6lqQhRSQq3XycikeVW/47AWJZDVxwzJccVnYXDUOhnTYHZYAoRzVnXbM03IPKQGHazIREXK
	V+zPwUjQPWzLYicEWlZV/RvVaf122+s9qxGhmKsEVQhPxpMqBRF3YFHifT06zdzkOigft13ZcQmAZ
	wBMsA3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50z-0000000DJVE-07S9;
	Fri, 25 Sep 2026 12:26:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50w-0000000DJSu-02KB
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YX2i2911727
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vzYXdSkKprGtNLKWEtOe2G7gqYD2Fig0Dn0aWWM8vfg=; b=Wroyf1MPjLZUHLmG
	LrHZNcgdB4LBm3PV5taubdUZZRPV+VpY6ZK9onwFjQUaqHBT1LV731fsfpLjgdMB
	t3qVkPxgP4GLU9+JfQ7A3Lu46+K7WQcmQkK/ooNjBGIY/R1dbACquOSF2XsrEQgR
	TXswoyJQBbXL9hYdjUorMnnEubd1kin7GJn5e+AoUEnpR16Y92ku12VyminlJrte
	OUb/dULF661OOqzPW8F7h+qOqB4L1lMdC5xIrBpwwWiJF76xsrPrNH1BzJ0cKZ5P
	AW5vS04N8CcsIVUPKxZpPFFuMmsOi99Cb36XVTotVzjCocH0ywfaled7OsWQxVXI
	oiyhvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51fvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1004385a91.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339213; x=1790944013; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vzYXdSkKprGtNLKWEtOe2G7gqYD2Fig0Dn0aWWM8vfg=;
        b=Ho+eHaMhBnsqqakXSmS695Rm7SxkcH7MZQFSfAAfE3tHL9NYTBRLG6bac3uQnkcRCZ
         LM1Ypq2Sv3t/bUjkne5A8R+PFOY7qn6aIl2wYa/aGvFPqnwy9uGNmTPeXYL88uBdRZ/s
         kj0ZmgdHqmpjr1tOPwuiea2uqZxgjzec+0vmKROiRH8WtR7zniOs5TWtULj8KsPA3GrJ
         rXtCxIsMtIgYoZPLfALj1N+hkUhKiF0afF+9LCxkPh+C3q6egsnM0YEdRTYwjWs9BIGz
         FUAzkfzmt1eXjsLeei0MwJcTwVDySdGFmIjC3XjIwwNwkppRt8STGrMHr39SXyg2f7DJ
         9L0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339213; x=1790944013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vzYXdSkKprGtNLKWEtOe2G7gqYD2Fig0Dn0aWWM8vfg=;
        b=uOguTPE1QwyJ73YBJs+V1utrxdgD6AZ4S17rR+4FcHk+e9ghn1gwODukgqcQZpYqB4
         SfIE+hyIj37UmPh88LSs8Blg6l8OhlCqteclyb2tEOpj341Uj00jmv2ZUdWoZnQ+JQZn
         OgMMfjFEO7ulY5PzrP4DZaX3Z1g/er58A29GNcLtDeOXiYKZEvO3y3cYGRZqz4velM+V
         POOgx+3aKa2SP/IpAax2L/i/P8tTJwnKW2/Q1TCuUxv6G2XPWUAgKUP8Yo0tM2fsOUTs
         /dUfHhSgayPg3FeUbIhdzYgAMbD7nhjLYqb4iCnED1Qem3/5ZjeTx76EpjdOFGbMlrTn
         zdTw==
X-Gm-Message-State: AFuF++m+fH/eYIKIYuRTjMszh+Ls8R48BVQg/7ZPkPs1YDwyl1UCEKDe
	z8ycXCNm2HnFGfNxU0ps+E03CAnVDbWTEGF+GUgpqdBQSFGET2m4PQIFaRDihddVvkNQjbHO8eA
	3IqiY/RWqzOuDV9F1VUywgIyZi1TC1a7q4H4aZXvzETXgyeiCtGudY88DUO0CBnzGQblwINN7
X-Gm-Gg: AYBFou0qt2zBkW3NFtG1Ah+4aaD37qzUStpD4E/MFBmnpyAfeuzDzbhHHwb+hXpwdns
	u065tb8Cj+4MiAFbsjAaiIMeXpJs0TrTzLF8mXFMQ6xaGmOPmzKKV+gdeIqPdiYhK83RRDLPW7k
	LYeK/ebMOFW9VhWHaUCxiZwidLRlBL51aGoKQ6HdwRAdov6MGEYs8FpDmub+oHSl8qBTgudfr8+
	gkE2qvcmItfA3r+pT2XHqOBn+ikmr30fnpWGOCxXb3ALuj4YmR4wxBs3SdidgOeG1E2V0lLfRo/
	Py9QTDZ1sXRdMhbbOau8f3N32KWITi5m5yAO5Qp6f6pjwfJgjsdB2uvPc1HKl2GdX+t7Jo0w7ep
	x+kXV0kx/nXNrN6YYgkzyEvPa2vhfMez+D9QVn9ekG2VImu0lDII=
X-Received: by 2002:a17:90b:3908:b0:3a0:c276:1ecb with SMTP id 98e67ed59e1d1-3a0c276224amr1119330a91.15.1790339212716;
        Fri, 25 Sep 2026 05:26:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:3a0:c276:1ecb with SMTP id 98e67ed59e1d1-3a0c276224amr1119310a91.15.1790339212138;
        Fri, 25 Sep 2026 05:26:52 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:51 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:34 -0700
Subject: [PATCH ath-next 4/8] wifi: ath10k: bound recovery time before
 entering WEDGED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-4-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=3413;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=SbRp24IDcrWYJIdZ4C/TGtPpbGJ52bSKfbPBNRYcU1M=;
 b=7Hvx17ZEIBtJLIpdq9ZDNHPk0Ay4cXnOnhvDehs5jfH/4cTzwIvupAW/VI4ScsnFiBOb7m+Rv
 kq2L5k2S4CCCMki/htv3peMgA73rSCLbKcp7ZF9xsh+WMnpAL0aVOVs
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: u2HSI_OzvgfoNG6t_afNKDdWEDFqE5E2
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab6688d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VCOL0f_idG3aiQAZe1wA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX/bxwwmotdOir
 9TLNo8aHj2TzMcaLdVvLcm9YUWoN22D7BE4OGrT31RccvawEGpVyIr5PJcO6xZJQOEfP7hDjBk4
 mczpr2kVbLvlDEEv6SpEyGHGMHL6xw75thhAA07g90tw0T5hsUz0W3EAUEkE50q4Erh+baLUc7d
 cCCt2uEgg5ND/40SAd+xGuiYKQjrkr8SqIY5pPXFH1zlEWunpaw1HDFkeyqmrBPvlTA0NDkqbQo
 WGRaGpZVhXFgP7JdgfJ4qQGWCLWW/WSOIHgqGu7zllzDezE0wJeZDclqY7Ncfsuw859xpddAFlC
 AFUJDIh9gGBk3WRLBK4eJxn8BLpNsFvuI4ZV7ETlz87xWkkK6m0CD3QK3kvobgS+Bua6twjOgdq
 pKydE21I1N51W1rB7zauKlwIR0s0YX5EGoAM0w91177uKdLN1JtLewXDWZJ6jwjhhXWJpR3xTtT
 v6j7MCCShWUnehZ+jtA==
X-Proofpoint-ORIG-GUID: u2HSI_OzvgfoNG6t_afNKDdWEDFqE5E2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX5WiOG631alsG
 0PRAtVfo7/5QU1F/yr5x2v8o9j24dHmDms/x/6blAiGMfw5K4PsYJfrbhBMMjG1hkXejcBZAHxm
 nbqWVKdVnkFGK/OSfZ8T1n1sTf8fS7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052654_078596_148AF2B0 
X-CRM114-Status: GOOD (  16.21  )
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

Commit c256a94d1b1b ("wifi: ath10k: shutdown driver when
hardware is unreliable") added fail_cont_count tracking and
declared the device wedged after a fixed number of recovery
failures.

This relies solely on the number of observed failures and
does not place any bound on the total time spent in recovery.
As a result, the time required to reach ATH10K_STATE_WEDGED
depends on how recovery failures are observed rather than on
a fixed recovery budget.

In practice, recovery-related delays can stretch the interval
between failures and allow recovery attempts to continue far
longer than intended before the driver finally gives up.

Add ATH10K_RECOVERY_DEADLINE_HZ (15 seconds) as an independent upper
bound for each recovery attempt and declare the device wedged once either
the deadline expires or fail_cont_count reaches
ATH10K_RECOVERY_MAX_FAIL_COUNT.

Also reduce ATH10K_RECOVERY_MAX_FAIL_COUNT from 4 to 2 so
repeated failures reach the WEDGED state sooner.

This keeps recovery time bounded and helps avoid suspend
watchdog timeouts on platforms with tighter watchdog limits.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

Fixes: c256a94d1b1b ("wifi: ath10k: shutdown driver when hardware is unreliable")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 +++++---
 drivers/net/wireless/ath/ath10k/core.h | 8 +++++++-
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f2e457a0fcbe..29ca34a643ed 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/pm_qos.h>
 #include <linux/nvmem-consumer.h>
+#include <linux/jiffies.h>
 #include <asm/byteorder.h>
 
 #include "core.h"
@@ -2541,9 +2542,10 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 	/* Record the continuous recovery fail count when recovery is late. */
 	fail_count = atomic_inc_return(&ar->fail_cont_count);
 
-	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT) {
-		ath10k_err(ar, "consecutive fail %d times, will shutdown driver!",
-			   fail_count);
+	if (fail_count >= ATH10K_RECOVERY_MAX_FAIL_COUNT ||
+	    time_after(jiffies, recovery_start + ATH10K_RECOVERY_DEADLINE_HZ)) {
+		ath10k_err(ar, "recovery timeout %ums, fail count %d, shutting down driver!",
+			   jiffies_to_msecs(jiffies - recovery_start), fail_count);
 		ath10k_core_enter_wedged(ar);
 	}
 }
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index c739fbadc8bb..0319da3ec022 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -88,7 +88,13 @@
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_MAX_FAIL_COUNT			2
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; cap the
+ * total recovery time well under that so the WEDGED transition and
+ * any teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_DEADLINE_HZ			(15 * HZ)
 
 struct ath10k;
 

-- 
2.34.1


