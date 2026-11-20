Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4EB606A8BB
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F/oevUSV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ue88hfMy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TwOlR6uF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=; b=F/oevUSV20YPQg
	nrF/RI80RAJZZV9FVDcCrMsCDIFFCP/VaEABdDHedIRtv3rjZhNaTClFHrz7457iNWPU+PCHXIAsj
	ekUn005g2q+yWKasGRHvB/uyEFjR1uWEXqVA2zlz+lTpb/EX5do86HW/8r/a0a0pevXeukNqIPzA0
	ui4JHlxP/YPRHPFqziYhgTtbObEYdV89HjhTkUSbsUBJvhrWbqeYrvz13ADQ3HoHchgnpnEV6aH71
	iRjfdo0P8Oblo4E3lMfW2mw/VJ+NU46lNZxoLDz7+6ktLiqBo0Bsmhs+N5LhaPH9d4GNQNRt8fj0B
	/G3krz8H77igiIXF3emw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDk-0000000EN4e-0g1b;
	Fri, 20 Nov 2026 08:43:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD2-0000000EMc1-2Ljv
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7eqQG1268338
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=; b=Ue88hfMyeyknN/Na
	PMcVAuY6z/eVD7hdpBhtiSFXvWLmepbDDK+2kluueZs0ldsuAjGKKgajgMcAPnN5
	3GGCg6zrsh5VtnNUkzyyRIvg/w7Amzf8lc88YURAHkAcaALBqasggJHJRE43FbnI
	aCThIZHTcmUaCgFICApibpQ9UbUh8BLGTdrzaRwoBict1bPlD6H1iggg72y62N2W
	f2qdpEjeAbvqPD6IazEjLZG22RjKyJ88fMk9N+5oqFacHd4/57oXw2SDB5oocdlp
	9lqH2y3j9DbklWN23u7WEqXW4eOqlCEG9d4ybGISgSaxfLSAznabbJDBMX5cwLMj
	CFrPqw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1sgvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:03 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso714743eec.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164183; x=1795768983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=TwOlR6uFyNHnZ3eEIy8HCojuvTwckB+lT/MSuFeCHVdRVWh9G3vwCNRUZlUTu2wfby
         KTGtW/F2yEEPMijeT6JJ1PpsIfHc90q9DdQQ+ed9+I+Ip+ciCzW6VkqiS/xt5e99bSsx
         QBefQKAodtL4COjNZeZXyh2MugG03I5aSf6u/mjkmEbCnsUhuQfgvOK49t5s2LdCJgzV
         Mf1bjWHKrc6eNRx6MeAQyrGy9BmFaYJ3xvWkF0i2m8SDpHrl4mslGySU8NiRJbnc+H/Y
         V6F8+M2eJ1KO88P8E+YNvFOCtaQ8yd9JETsw2UAJ8qo2hIhN/CYIOKMmO8pW58g6xmwg
         FZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164183; x=1795768983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bk74ZT+MJ+JGKowULWayQu2LJp4VvyfuIMp2TvysVmg=;
        b=v26Czue0WoeDSw4rH04GrwYSGXOCWmNDVhI+z0y982yXW9h4e/H4BDFkVIDCp1S6I3
         9h7gBrN1ya7ZGK1ODXz8pJAEWtxRqf24dSGV+Y+CLKjVhu3s+SrREfp8Rm8D+5c5aHt9
         g64HVLiMdXagISuiTwmDexsRIvXylzFa6US52FV7/1Vn49S4SLJIlTU9P9fgXcd6U7qg
         5OLNoEJFR3hQu/d4YDml/X145cvmGeokveNOjgDWi8+lVZC4074om3RyDiLoG6WUm96l
         Hwf0Vw2l89d+yl/oDtzvZyzYNhsP/4D4a3ASREPvztgnEd4q/Kp/nSMuQIhT3+ZRKe3i
         HG0g==
X-Forwarded-Encrypted: i=1; AL+hErH3beGJ2RP4zIZ6Ogf0l1oRA9uqo5pYtTbbvvjJ7gIERjkTxrsj579tZYiBvhBU6KqSvtzxEfs=@lists.infradead.org
X-Gm-Message-State: APuU4Z9vBVbTScWIxIbjoOGI36DAr+LJ3Fw1E3OGJGiZWOmqMCnIghhO
	aUIVQe2gV+s0PHO0q9b2EDjvA9jqxvn2bDzGFd3frj7sWlw7zcEgYNBL1DXzImr8Re8CCuSJigM
	b+aNXyjTth6+0QV2/z0PmDmGLNbhUG/6B7NjU3bZyPPPUSBfo0vKHJlXbIk15iP8q
X-Gm-Gg: AZFdTZeVrZ0g2Zp2hWfsqkjvnW7Fm65QWxnblFgBlwGhSzn3/JFjJu/aQ/MrZOrMXrj
	BfQU3ZztU/NdRVt8/pJ8tq6t3nS0Md52QqOF/SE4rnCFzCa7a12f18ISpOoi4yVNgGDITs8+eka
	4soud813MuHUgQeEMTYNIKXN28JXm2CSO2lRNZGgSuI6vUjYzw16oZfZtXO/2XiP0sZ72/CC+Bs
	RiF+GX2E7tpTKjsD1Lhr3iP3zYDjrMKZrvcojUElUxpXpcT/mULWhZaPLoUiiWlQiQ4rxcQFUg4
	/FCOMhFlaLEQbJHOFTFYaNMVY9wCp/znwZBEUnYuFEgpjZihlG33cAi/5i/yPgSzv5gzKHkmLtK
	MLJdD5VdpiI/tAYzEpKfl+yt5r7KcWUDQFi6EN7tah28bw+sNSKPBgufqxZHQoC0vf7UpEf3awi
	Bxf61YG2ZWGzIARBbTxgTtu4Q=
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356574eec.14.1795164183254;
        Fri, 20 Nov 2026 00:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2356546eec.14.1795164182667;
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:43:02 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:35 -0800
Subject: [PATCH ath-next v4 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-10-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=6759;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=z8KYkGdqkhnSqr83Tg566e7vp6z6Rom1upSnLJcwUrM=;
 b=gRtoor9TRTWzrmnfB+uBtwKOMsYIpI2xFukls4ziPH6sEoB1Cyv/Kv7iUvqOJ55edvYom3YHg
 57/Zei/6pebAGLqX5ZFa7jcPsdfxRT9g1DRfIzCNH6PkeL4IC3bK9nL
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b000818 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=fr4EAzCGZu4FAUfOKUQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2UrpqKQq0ahgfZHkMdvqNE9ohADGqazz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX11te+S02+qIk
 7eO73JqyKy05GdRlnzHAgeqeIR49lSXeiDcHah0Ar2LRgwwATx1fQK6U/L69y8uVyUZRMpUJqvB
 XaPoKw2LrCDPhvTQA0mq5oD/yU61i8eclM/7Zgb7h3l+IkqClLR/NnT2cb1cM2yg3QoegaczlxD
 JboXDHl1UsWLEcFLRD6sB2mjysgm34SbzmbzyL5i2DtZM9q7t/LrJtRkmWoWTdQNij2kwQQl3rF
 UNGOHcFm1s4db7snw3NhHT67p4qMAXiWb9jdI8eN2bb3oNraiamTJUlCQfLSV3IWe1o8wu+EEZl
 LPpfSioogzrHZLkN4ZNGLMC4Qf1QOAeBAQCUQCYdvOCJH4P0UrOkyBLm0f09FE42WmtAFgiWhXJ
 sy3A98D9cJhesrxBDFrC5dZ3wXUlVIpL8Lbkj+Wk7vEja4Z64y9LoHQxdPkJGk+sElfJjfswobb
 48q1kRvUpjnvArn0dEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX/5/rZPWLfcBI
 ZSykyx9RPt+aU2IcUQvPp+o/LUv5lAvDPTESvJgee6kNnw3aWCBBu6hfG8PtAN7/06UBWT94uuH
 /nB0M0v+7MNv00yGoz/mgFKbMCDcszw=
X-Proofpoint-ORIG-GUID: 2UrpqKQq0ahgfZHkMdvqNE9ohADGqazz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004305_349948_7FE0C829 
X-CRM114-Status: GOOD (  21.79  )
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

ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
schedules wr_async_work. The SDIO sleep timer also schedules this
work, and the work may re-arm the timer.

The current shutdown sequence does not prevent this activity from
surviving an SDIO power cycle:

  - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
    still be queued before the card is marked disabled.

  - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
    cancel wr_async_work.

  - ath10k_sdio_hif_power_up() does not clear work or requests left
    from the previous power cycle.

As a result, stale work may access the SDIO bus while the device is
being reinitialized in BMI mode, causing errors such as:

      failed to read from address 0x868: -110
      failed to read fifo/chip control register: -110
      bmi communication timeout
      could not write board data (-110)

Mark the card disabled before power-down begins so new asynchronous
transfers are rejected. Make wr_async_work drop requests that raced
with the state change instead of accessing the bus.

Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
during both power-down and power-up so no request from an earlier
power cycle can run during BMI initialization. Factor the queue
cleanup into a helper shared with ath10k_sdio_hif_stop().

A dropped request is completed the same way as a written one, only
without the bus access. HTC messages go through
ath10k_htc_notify_tx_completion(), which lets the endpoint release the
skb. The IRQ disable request signals its completion and leaves the skb
to the waiter, which frees it. Every bus request is returned to the
free pool, so nothing is leaked.

As a result, ath10k_sdio_hif_stop() no longer frees the skb of a
non-HTC request itself. The IRQ disable request is the only such
request, and its skb is owned by its waiter.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fdf19ce4b55b..f0e1feacb629 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
 }
 
+/* Drop any requests still queued on wr_asyncq without touching the bus.
+ * Caller must ensure wr_async_work is not running concurrently.
+ */
+static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_bus_request *req, *tmp_req;
+
+	spin_lock_bh(&ar_sdio->wr_async_lock);
+
+	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
+		struct ath10k_htc_ep *ep;
+
+		list_del(&req->list);
+
+		if (req->htc_msg) {
+			ep = &ar->htc.endpoint[req->eid];
+			ath10k_htc_notify_tx_completion(ep, req->skb);
+		} else if (req->comp) {
+			complete(req->comp);
+		}
+		ath10k_sdio_free_bus_req(ar, req);
+	}
+
+	spin_unlock_bh(&ar_sdio->wr_async_lock);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
@@ -1469,6 +1496,15 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
+	/* The card is powered down; drop pending requests instead of
+	 * touching the bus. Prevents stale writes from racing with a
+	 * concurrent BMI power-up on the next recovery cycle.
+	 */
+	if (ar_sdio->is_disabled) {
+		ath10k_sdio_drop_wr_async_reqs(ar);
+		return;
+	}
+
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
@@ -1586,6 +1622,13 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 	if (!ar_sdio->is_disabled)
 		return 0;
 
+	/* Flush any sleep timer or async work left over from the previous
+	 * cycle so they cannot fire during BMI and poke the bus.
+	 */
+	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
 	ret = ath10k_sdio_config(ar);
@@ -1629,7 +1672,16 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	/* Reject new async writes from ath10k_sdio_hif_tx_sg() and make
+	 * ath10k_sdio_write_async_work() drop any already-queued
+	 * requests before they touch the bus.
+	 */
+	ar_sdio->is_disabled = true;
+
 	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_sdio_set_mbox_sleep(ar, true);
 
 	/* Disable the card */
@@ -1647,8 +1699,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
 	sdio_release_host(ar_sdio->func);
-
-	ar_sdio->is_disabled = true;
 }
 
 static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -1659,6 +1709,9 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct sk_buff *skb;
 	int ret, i;
 
+	if (ar_sdio->is_disabled)
+		return -ESHUTDOWN;
+
 	eid = pipe_id_to_eid(pipe_id);
 
 	for (i = 0; i < n_items; i++) {
@@ -1972,7 +2025,6 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 static void ath10k_sdio_hif_stop(struct ath10k *ar)
 {
-	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb;
 
@@ -1984,25 +2036,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 		dev_kfree_skb_any(skb);
 
 	cancel_work_sync(&ar_sdio->wr_async_work);
-
-	spin_lock_bh(&ar_sdio->wr_async_lock);
-
-	/* Free all bus requests that have not been handled */
-	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
-		struct ath10k_htc_ep *ep;
-
-		list_del(&req->list);
-
-		if (req->htc_msg) {
-			ep = &ar->htc.endpoint[req->eid];
-			ath10k_htc_notify_tx_completion(ep, req->skb);
-		} else if (req->skb) {
-			kfree_skb(req->skb);
-		}
-		ath10k_sdio_free_bus_req(ar, req);
-	}
-
-	spin_unlock_bh(&ar_sdio->wr_async_lock);
+	ath10k_sdio_drop_wr_async_reqs(ar);
 
 	ath10k_core_napi_sync_disable(ar);
 }

-- 
2.34.1


