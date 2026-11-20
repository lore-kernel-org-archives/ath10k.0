Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF79460A5BDC
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmx/GcYR;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lYgF6jey;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P/ja4884
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=; b=fmx/GcYRvyfy4y
	twuajCmydw1/+JVDvTrKbWkR/UKr6CmBkalzTHQaARGVNYnmXcE+/cElWwuBEWP/eh8SCFvaGtBik
	7vwJ82XEAdnU08bdMGVU9054+DWhGf/EaHulfOVwWkikSqBR6hQk5d2041UBzNw1GO3EZuIjPJNh9
	NVZfziQnLqebeeBo3JzqHOOl/BDzwrwWjJXSQKEJ/YU6c1aohWwp0Wyg88TKqiVfKROCGdgTZk2AP
	RZQzGret/vN7RQExaJWY4l1RiGilxpmyKEd+E7nofhHqBrBuYR7YGywPYcPv4iqhaMMjfot4M7sGM
	EliYNB6CfuZy+9i9Payg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD3-0000000EMas-0uiu;
	Fri, 20 Nov 2026 08:43:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCu-0000000EMWJ-41Wl
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etDn3575501
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=; b=lYgF6jey/rig4Urv
	GY+9Lr0ki79lxAKj8asHI3OSSS+I/Pj9saK+p4wIwaa/9bOlmiZXFfurGM4RnGbb
	rxmktM1gWl/6n2j+LkveMLd6nPzJ+xbZ2YwFKq6yjrJdCQRx1I1ymrGR16TiLb48
	wPzMTKsd+JHjOfvsu29pFMkz6JmCUrYkqW+SzyJyrtUEnQIhZXo6kz7X9AE+xCLU
	rZB23c/OyE1u2EVMqnQPTqT2+DHYk2Ewj1uxZCVvpWfGTVCUthkcP4c3pFWOuQma
	ovWAt4vZkaGiMZ42U5nDrD6xr1xlaUrobBmnDm3h9CXK6mAmYmV9zO0KaKHNqKVb
	9lAQIQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80hs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso714622eec.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164176; x=1795768976; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=;
        b=P/ja4884tu85Q0Q/5Uuxoe1Oicz+4BYRkGYg7zXPlBLcAP1EeDMxu1hOkfQDu6aDU/
         60prRiEBvAwcRzTI/3npWS+4BlkPOxscntOvQfBfoO6fp4+vTe8yGbQ/xSm5qO3lgsJk
         c5LJ9wlpL8zd7TnEifKt8/qdetboBnMXKqbnkcPqQw0NvIswpk95n9VswRooZaOUQUnB
         Zf+Avr+J4PPg2jtV16C2QlC2HFACu8Z0vlOCWD7I+RpUEU5sTiylewccniDIvFcZyalg
         9ZRJb4g8zkUBlN2v8eQaEyhuGUVV9UjL6tdzSYI2HppqMehP3wgVTyS/yAFmG86lfQf8
         TrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164176; x=1795768976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf5IdZe9V9lj/Vti88O1sFT/iTlv3aw+82lHmjt/bSQ=;
        b=kxZX3KiNf6mW427Xm6nyKYf5wNSawd6ov8lk2QMCyJx1e9POupIEgr2R50Nh0FwtTJ
         iNveC2FHXXwAzZSfWU6v2sjfY22kIM7wWdCOjQREhbCw281mthK8ZrdPU8sEqZHufJ/p
         VUsvQL3C+it+vESxzsb3lF7TTDevASUjkxZ+Ez6kUfk3wOYz5aXRKGnA5Vysz9CdtFKg
         x8palBnNourisJkhedfYD4ATTEiiBsJU3dJVF49Ov3w3zJcK4w0yy075uH+jhtLANJpl
         +eLdauOIVh9c1KhxdoUty1RmU+AFlM+91pB7Cyh/zsU8cD/yfWY9dDeWFcKnAtqJ7SsU
         wdEQ==
X-Forwarded-Encrypted: i=1; AL+hErE8H2IW2hjX3TZQGy5yOZsRLbe4OTO8za1vr/Bx4KcoHeOzTm5eczTU5EPfVAMW7k+DUdNA4Uk=@lists.infradead.org
X-Gm-Message-State: APuU4Z/EkCQ3yXlWC6RgAorHSqapT2mG2YrmRNhRjifbkBu8LV/sCyOx
	veqAd7V/vq0RnHRmSdZQx9anaeB1FpAeR0KxmuuLKV6XuAL1P31RGlG08bOSbpWJM+t5toYfzhv
	HEzdoUfV1mU9Q4S8i+GZotR76zRfNo6NcA4VeFH72owp+DTLreHhht30ewZV7UprV
X-Gm-Gg: AZFdTZfBALyoCCr1hldEzhwAHTw1ZT5ecXZlMRb1mINW3A703WlgHFPbwMsCqo5LPvA
	xcAy3X2UnsAuKPGxv0pKQCNyqLSB6sdJYMobdd1zsxtrHJqW7Wbs7CuRCIoGu8XXF9yDab9vxIl
	qu94u/jaPqDvZgc+YebLd0b95Uk/VQLYsgmmJ9Tcx9Fmp3WcZ0wo4sdKG0oAN381w6Wt6F6aGRM
	R5myl9IULGhUyxR05efMCmQNfBkx3BmeQQpXkv5KHUIZK3QygWlJzNueTGBmy0M/zMHPjb47xYF
	Z0IrIvRZoYZqEgEJx+H1ZOnjteJMMCL59heSZAMvMHakN0Mckxbf4b1muPHA0V7UUd1iptxmT6e
	n1ch4duEoZnuwby4mMJFCKnnYUY52QeaRVM4gcNK+5dy1Zwcg92SrUxfKAmc67DNX+3KppKuIC8
	bFzbNtrM0nct5rZsBvStjc/po=
X-Received: by 2002:a05:7301:6484:b0:370:121a:b2f with SMTP id 5a478bee46e88-3856f65ad8amr1904452eec.11.1795164175758;
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
X-Received: by 2002:a05:7301:6484:b0:370:121a:b2f with SMTP id 5a478bee46e88-3856f65ad8amr1904427eec.11.1795164175206;
        Fri, 20 Nov 2026 00:42:55 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:28 -0800
Subject: [PATCH ath-next v4 03/10] wifi: ath10k: wake blocked waiters when
 entering WEDGED state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-3-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=4095;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=Ffcymno37RuIQ6A3MjiQY7jG8BEb1dkThzhiZcss1GY=;
 b=GTTjHvDc89GeAUDj0QE8VC91UTb8z1BgeAf1eIzOBCv+Wyw7C+t/AB7fLmcvyJ99oZEbRS72z
 Seshg7G1fMGBE27FRAFYs6fwXlinLugEcDb+gbLfj0gC9w6sus5Y9Uc
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxCwfH7099ZQb
 3id3gRR5rNA7F2n7amTHCRxmFuymSoLmHh2zsNk52iLz1UlhLSLKp1d5aH0UBX9d84JuUZYQn2i
 YhV+W3P6fEffzmDjZKttO8xqGkBoQcgTvBBucr4+/6/ADAxjWPEswY3OEbTSd/xxhHabOmOM7MC
 zY7L4IzUygAqODWOOnqB6CH8SkXL8biy20peIX6sgId85LsCl0pGWSBcEc80Hi5RVolPMPaIh1c
 5BuZMvpXrTZLVg4EaCDwU1GwWeA+NeI1v/fNqGkQcP7o2aUo9f/Sgcpfe3ld+yTLcFu5oWHs8S2
 F1yxT9uA+Vfv6nDcstFWEHaF8FNGmU0ee3nc4UYJKVx9QXkooSdqytrHq3fx1tU1XMtXOWGbej2
 J0Cbcbxk6uHo3H4/MSl4rdDCBElLlFfoHm7qVpEEnik64xMo/bcrhy4PFrejXAcRlYYX71x3IGc
 pwYqGel2Xt61wUYSS5A==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b000810 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6QK6Bl5UZFK8huMW9Y4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: hrV3IbLnfHTqfrHPVmW_jzta15JcDFOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX0ZxL3S3Cyi/f
 egae0a665EnvE8HKXIg+hod81dd1O5+qOpPS1v6QFbwAduD9FtnoG2ZYwfJrBYQcLkqUjmrrIpg
 oZr1JLWiVJbtNZBifPBqYDCefmRhc8g=
X-Proofpoint-GUID: hrV3IbLnfHTqfrHPVmW_jzta15JcDFOQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004258_074904_582470C5 
X-CRM114-Status: GOOD (  13.54  )
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
index b536c21630b1..3bb4d2742c30 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2533,6 +2533,32 @@ static int ath10k_init_hw_params(struct ath10k *ar)
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
 	struct ath10k *ar = container_of(work, struct ath10k,
@@ -2551,7 +2577,7 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
 
 	ath10k_err(ar, "recovery did not complete in %u ms, will shutdown driver!\n",
 		   jiffies_to_msecs(ATH10K_RECOVERY_TIMEOUT_HZ));
-	ar->state = ATH10K_STATE_WEDGED;
+	ath10k_core_enter_wedged(ar);
 }
 
 void ath10k_core_start_recovery(struct ath10k *ar)
@@ -2618,18 +2644,7 @@ static void ath10k_core_restart(struct work_struct *work)
 
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
@@ -2664,7 +2679,7 @@ static void ath10k_core_restart(struct work_struct *work)
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


