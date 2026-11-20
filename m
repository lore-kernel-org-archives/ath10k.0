Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363A960A3817
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FwZshuO0;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAwd3YLJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fk64z4sd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=; b=FwZshuO0V9YCzk
	xM7Gfn1xK6xLOjJqkVJGWEZO5yawhtYU9pIjawbYYYoe4v3dkFg1ynmr6Uw64lF9hhzTBBi2nLVmx
	YjzZSOcrkaAqAodmNatbVUgo8j0oOdZWwuypfYHXNSkHK15wsDzidFx8VLd7qjxSVDXG8QaI+FzY2
	KZ9Gmr1Jc8QKH4PCEZ20uxh1ZMv34Z+dB7dcfUXPya2Ie+wfWYqqcqzNylbby0HI+GYL1LwC4WPug
	KgQA0qv08I2sR1lP3j+XZQAMHdM3NPgt/DDx3C9m8bqogSK/UMP673ewVRIF/cMbvXa3y6h1bfwNd
	CO683fhSdwR38dj+vaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCy-0000000EMYC-3fMC;
	Fri, 20 Nov 2026 08:43:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCt-0000000EMVp-2OpW
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:42:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqXD1268326
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=; b=CAwd3YLJ2Xq+DPcf
	jUHBNIJrBOWskBJjqdy5BBi4aQdaLnlzPL5hLn4UWKkwqU2BCTjAB2/kYKF25bMJ
	+YK2tHMDLOc4pprfK4/muIXcYKBTdhc6GwjDV0fT76nAS8S0qGsXwUGddZoxhbew
	ITatdu7xJF4to0QTaqoQb0C6Wkh8eK7wDcWBYW4ySAVfNcJeG0z/Ci3+qgrhykx2
	XvJ7eqKTSP9kVsPx0mfQFj+jG1zq+1LgtPJBiqwHiXufmOFxpTLzXvGQfmFeJ994
	ux54+ih/XXlJe1taTo6cOD7k6XmllvqtqfX0VqhRoAnRdUDAamL+84WhwMdXjL1K
	eVrX6Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sguk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-370230d93efso2135840eec.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164174; x=1795768974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=;
        b=fk64z4sdYWQc/o8lWXYEWG90IBBO1qnbl1uq9lYwrYFW/0MuEt1egeKurH2MOZ7ODX
         00YyzOurQQlCV1zkrptbAMFdvEHSW6Ho/eN4SKLIHf5FkorDfGnDU8BCByR4WcIc8ce+
         11KU6kf2MLnmXh0nUTChdiCItQj1iBmdfML5QvOLQxi4o46+kaBVkS+7vS5tXCZZPhsb
         jqK6y1+wlo5sWzRIcRHvl49xr4A/8IZXPsCnrHsHJmH178UurS0/9UNXHZ70chbEGRpE
         BoZcxDQlIEEs23RcvT+kpZmAHcW4h0pSz0ytfuByWXpiCPdsGY+ySV82pgBOADm86ws9
         PYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164174; x=1795768974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQYUXYfPdq2fPt8IRznIPlgb9WmYLP4BPqusT9g3Z00=;
        b=bS5yzI73HN4qI6GX3ah89sxh4OelPV90y+V7PLe9DAdNFAEgjYfJHBMKN9In0TiOD4
         JQVdKBmiYBWGA3X0eDFR4yq6wAgTFiZh/pfc66VsLg8dV04tiPKINPiOvKm2usbSvbeR
         9aPeHHTDTQBsKyiWzlypT4r70X2u7a2vhG08KADRo+3zWR+EQqEIeFCgU/6trq1yUFGy
         G3C44WiSW1amDlMjh3xNuGp84tuCZHa2N9kC5zSd9sjg091KKkObUtLlvS6chxSicFmk
         XrFShaI2ZZHHikfSmHP5cGLwqzYQN/SVKtTFolscrqagqYagHP2r10fpHiN9VWuG0A1M
         /+lw==
X-Forwarded-Encrypted: i=1; AL+hErG+Xy0Y2GW6BVV7vcQre9sgXcBiCxCZgPukn0idU+zJqvRO3LuCtKCovafQc0SY57d9lOYzuHA=@lists.infradead.org
X-Gm-Message-State: APuU4Z/fJwvPUQmn2ka6ZPIX0TXJP61ZTSktMm5I1Z5KS0rGyRq+M7jY
	KkYgGcPheJBiczqnjHmU6y2vIQZ59VYAsou8Z3AKve4KrooqNXwHBSDovtBRaVyA0AzlhCknAvs
	RzEd2wzpPEYp5xDJ3QuygCFMcJp4xby9YJbI1Uy2ZOvmuef1Bd1V4uErCg4Sisegl
X-Gm-Gg: AZFdTZcZ5MhYqcvjZmRSDjwiLHNLRVzpLFb4Cpumz1TbWfo5ZH+nurXCDvJL098veTZ
	KbMIrSZBNxlkfhFYht6zHl1Uiu8gaDIr6mjl8GiF/sdgI1wkVtgo6EU4XyxCgksozmZvxnrzbwn
	1pGayvcil+AWbwAkxY4NEuMUGY18SyV1P71v7U8mozQePaLXds2gf+/WlRSmPFyTFmXBHcHoJTb
	QRDShlGOQlcg7zLCYeLq73QQsSvk2tIPOCV6wg20lR2gu0JOA8WTm0nMAxt5osNdBmgNcHyTuZ3
	afG46WZqfKNQdhfakQOiOonU0nn/3DYSQtLUdvIsly82UMq74PNSDD4O2unt/Nmh0iNTruAIor8
	2sgR+Dfg+iOvwRpqpvkDcvcjtQu2/2hP8cN/UGE+FlI4zJ637itYXouQUbSLW9QSJAkt/r2ZEQs
	3iI1znLj8MT7AiRoNcLdu61zI=
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr2121402eec.15.1795164174067;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
X-Received: by 2002:a05:693c:8083:b0:377:678:2309 with SMTP id 5a478bee46e88-3856ef47a98mr2121375eec.15.1795164173531;
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:26 -0800
Subject: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=8944;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=9gqH+Au05myLHxq7lWVgy1ylKzPzsDxr90eUYmZFMLw=;
 b=ymOiYkz0ORlHEtbatsfnv8cUOBmJnk1hB83qcYOee+PetBcOFt6wx4vxEP0qc/73EelhESl5k
 MS3oPJim8NSDz5+3Fg/NfeH0vh35rFHe3V2wGJggnfuX1914nShfa55
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ekyff-_h-x0lYrcLLmUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: CNoqpGWgfEFYme4KOiz2fLmRb1c7ZGEa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX1A/UkAZdkDaG
 pUd35ThswOnm3T4xE2aKMRW+uL9J3D/0i4sZFvuamwzBp5q8TjCfKnzIvRR9pYCkqBIDybMJ2hL
 qu/ciiQeWc1V3W8gtPlZSRWm2RTq6HL7ywgVl6HQtQs+7saB94N3YNEzChYzh6hYpcRs4zTVzEf
 ZqafzhcUOUqQQZO32QPFRDCUf+8aKuXFishJ/etQxQoGXnNelFukzb35qPVwmn+NEs64ZoWW8K8
 7O4+apRsgKkTd9M5pqrd0r+ijBQ5j65MPaqfgb+QIkbDyDwAiVz7k4gg43QPTKzMyKofsdp/hf2
 LNjS9x84OD/kpGTl4KmVkDFAWoto4w59Y/2VtbNVse8drKhD8WveTtYr3c/KO1Z1UJrsEx8XYhv
 KZA7KpDKOuFJCJOcCYTITdDzexybGpZH52zxpLKwdScOTGvd85tivnq4ETd5/1x3FensUvvs7qk
 NAn88KhW6AJsYV9o/0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXzORCWrwzg8th
 Zvn2yddwUKhp14DVuHWhUigOvoeMDXwUt4AE9twEjgEeQdLoCPPDUcxdtoZvGh6aRGn/LF8XaO7
 ylq33iZT2QmZUXIbN1SjvSeiu+4Ruwk=
X-Proofpoint-ORIG-GUID: CNoqpGWgfEFYme4KOiz2fLmRb1c7ZGEa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004255_627964_F9BF292E 
X-CRM114-Status: GOOD (  27.13  )
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

Each recovery trigger queues recovery_check_work on workqueue_aux. If
a recovery is already pending, the work blocks for up to 5 seconds
waiting for it to finish, and marks the device WEDGED after four
failed waits.

On SDIO, one firmware crash can raise several triggers. workqueue_aux
also runs SDIO RX and WMI SERVICE_READY handling, so the blocked
check stalls the traffic the recovery itself is waiting for. Recovery
then fails with "ctl_resp never came in (-110)", and a recoverable
crash ends up WEDGED.

Stop waiting on workqueue_aux. Let only the first trigger start a
recovery, using atomic_cmpxchg() on pending_recovery, and ignore the
rest. Replace the wait-and-count logic with a single 20 second
delayed work, the same bound as four 5-second waits. If recovery has
not completed when it fires, mark the device WEDGED. Since the
deadline already covers elapsed time, fail_cont_count is no longer
needed and is removed.

Because pending_recovery is now set only once per recovery, any path
that abandons a recovery must clear it. Otherwise the next crash is
ignored: the device is neither restarted nor marked WEDGED. Clear it
in ath10k_stop(), and in ath10k_core_restart() when the device is OFF
and there is nothing to restart. The OFF case was found by code
inspection and has not been reproduced.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: f35a07a4842a ("wifi: ath10k: move recovery check logic into a new work")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 75 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath10k/core.h |  7 +---
 drivers/net/wireless/ath/ath10k/mac.c  | 15 ++++++-
 3 files changed, 56 insertions(+), 41 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 2aa18adb31cc..b536c21630b1 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2535,48 +2535,45 @@ static int ath10k_init_hw_params(struct ath10k *ar)
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)
 {
-	struct ath10k *ar = container_of(work, struct ath10k, recovery_check_work);
-	long time_left;
+	struct ath10k *ar = container_of(work, struct ath10k,
+					 recovery_check_work.work);
 
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
-
-	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d", ++ar->recovery_count);
-
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
 
-		/* Record the continuous recovery fail count when recovery failed. */
-		atomic_inc(&ar->fail_cont_count);
-
-		/* Avoid having multiple recoveries at the same time. */
+	/*
+	 * Pure deadline monitor: it is armed by
+	 * ath10k_core_start_recovery() and cancelled once recovery
+	 * completes. Bail if there is nothing in flight.
+	 */
+	if (!atomic_read(&ar->pending_recovery))
 		return;
-	}
 
-	atomic_inc(&ar->pending_recovery);
-	queue_work(ar->workqueue, &ar->restart_work);
+	ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
+		   jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
+	ar->state = ATH10K_STATE_WEDGED;
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
 {
-	/* Use workqueue_aux to avoid blocking recovery tracking */
-	queue_work(ar->workqueue_aux, &ar->recovery_check_work);
+	if (ar->state == ATH10K_STATE_WEDGED)
+		return;
+
+	/*
+	 * SDIO raises several triggers within microseconds of one crash;
+	 * only the first winner starts a fresh cycle. Losers do nothing
+	 * while the owner runs recovery.
+	 */
+	if (atomic_cmpxchg(&ar->pending_recovery, 0, 1) != 0)
+		return;
+	ath10k_dbg(ar, ATH10K_DBG_BOOT, "total recovery count: %d",
+		   ++ar->recovery_count);
+	/* Arm the monitor before queueing restart_work so that restart_work
+	 * can cancel it if there turns out to be nothing to restart.
+	 */
+	queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
+			   ATH10K_RECOVERY_TIMEOUT_HZ);
+	queue_work(ar->workqueue, &ar->restart_work);
 }
 EXPORT_SYMBOL(ath10k_core_start_recovery);
 
@@ -2655,6 +2652,13 @@ static void ath10k_core_restart(struct work_struct *work)
 		 * or if the crash happens during FW probing
 		 */
 		ath10k_warn(ar, "cannot restart a device that hasn't been started\n");
+		/* Nothing will be restarted, so no recovery is pending any
+		 * more. Leaving pending_recovery set would block the next real
+		 * recovery and let the monitor wedge a device that is started
+		 * later.
+		 */
+		cancel_delayed_work(&ar->recovery_check_work);
+		atomic_set(&ar->pending_recovery, 0);
 		break;
 	case ATH10K_STATE_RESTARTING:
 		/* hw restart might be requested from multiple places */
@@ -3769,7 +3773,7 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
 
 	INIT_WORK(&ar->register_work, ath10k_core_register_work);
 	INIT_WORK(&ar->restart_work, ath10k_core_restart);
-	INIT_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
+	INIT_DELAYED_WORK(&ar->recovery_check_work, ath10k_core_recovery_check_work);
 	INIT_WORK(&ar->set_coverage_class_work,
 		  ath10k_core_set_coverage_class_work);
 
@@ -3806,6 +3810,9 @@ EXPORT_SYMBOL(ath10k_core_create);
 
 void ath10k_core_destroy(struct ath10k *ar)
 {
+	cancel_work_sync(&ar->restart_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
 	destroy_workqueue(ar->workqueue);
 
 	destroy_workqueue(ar->workqueue_aux);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..2e100dd246e2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -87,8 +87,7 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
-#define ATH10K_RECOVERY_TIMEOUT_HZ			(5 * HZ)
-#define ATH10K_RECOVERY_MAX_FAIL_COUNT			4
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(20 * HZ)
 
 struct ath10k;
 
@@ -1207,14 +1206,12 @@ struct ath10k {
 
 	struct work_struct register_work;
 	struct work_struct restart_work;
-	struct work_struct recovery_check_work;
+	struct delayed_work recovery_check_work;
 	struct work_struct bundle_tx_work;
 	struct work_struct tx_complete_work;
 
 	atomic_t pending_recovery;
 	unsigned int recovery_count;
-	/* continuous recovery fail count */
-	atomic_t fail_cont_count;
 
 	/* cycle count is reported twice for each visited channel during scan.
 	 * access protected by data_lock
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..74aca0af11c8 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -5427,7 +5427,14 @@ static void ath10k_stop(struct ieee80211_hw *hw, bool suspend)
 	cancel_work_sync(&ar->set_coverage_class_work);
 	cancel_delayed_work_sync(&ar->scan.timeout);
 	cancel_work_sync(&ar->restart_work);
-	cancel_work_sync(&ar->recovery_check_work);
+	cancel_delayed_work_sync(&ar->recovery_check_work);
+
+	/* ath10k_stop() can race with an in-flight recovery. Clear the
+	 * recovery state after the works are cancelled so a later
+	 * ath10k_start() can start a fresh cycle instead of being blocked
+	 * by a stale pending_recovery that nothing will clear.
+	 */
+	atomic_set(&ar->pending_recovery, 0);
 }
 
 static int ath10k_config_ps(struct ath10k *ar)
@@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
 		ar->state = ATH10K_STATE_ON;
 		ieee80211_wake_queues(ar->hw);
 
+		/* Cancel the deadline monitor first so it cannot declare the
+		 * device wedged after recovery has completed.
+		 */
+		cancel_delayed_work_sync(&ar->recovery_check_work);
+
 		/* Clear recovery state. */
 		complete(&ar->driver_recovery);
-		atomic_set(&ar->fail_cont_count, 0);
 		atomic_set(&ar->pending_recovery, 0);
 
 		if (ar->hw_params.hw_restart_disconnect) {

-- 
2.34.1


