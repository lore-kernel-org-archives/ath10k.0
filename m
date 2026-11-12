Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54A0606DE68
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iqEKq4rS;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PW6iwmlI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PdxZGMBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=iqEKq4rS3HRXr5
	lgwUt0NrmIG3/HD0lCOQdYXrkeomzuuSvmvIvFBHO70VCGSjrBgaf1TI+QzfeQkGgPy3UcizwFR8W
	GIfSrOgpm1U7WXe5Q3sSzE87o3NTbdjWrWyXzdvJ+328pgiJSycD6uS01/TwH+kHxXziALU+XYbsN
	3FkJb6NpkV6VTI5QKlTwNOd+Isa0/lVMdr4QMULpMam7NmLyY06yYxttyf8K48RkUL0NQ9tHr0J51
	dp+2qVjajFxAG5zGLY6zQ3iXLTn/oEF8bYRui6jTPK/h+d8xgVbBQDddIjLzsyXsrcdXatsTmXcnu
	OspTvkdS+uqfK5/srBiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxQ-00000009hOQ-1aXz;
	Thu, 12 Nov 2026 11:27:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwv-00000009h2b-2Dpu
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB49Hr3476753
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=PW6iwmlIY0wJeZb4
	jNbKtoLiuKMPerhdmUDus0qfuSw1osFZ9xMiZUgnERyfCkPnQ8Kz/xZpSeqQF1dy
	URuPt+XcGFinoH3uQ1sJomdeoUWGbEngr8Xb75RVjm9/PdgcTfDpo2gY4/dq+kL7
	2QYf9wmpf69pDrXlXAYQFFdL0iUKTCxM1JfXXGao7IiZnafMMDdH4sLKFNVvJh2H
	BY07Kayh+gPvRFrW6ZRSdyro5/s/hEwJ5amZJCdWxAyZehlhnbu65nshOztb+Wbd
	dwVZLBposjWPcxMVfrdj2jRFwVP86b58IwbIpNBsy3syjKHOgj7BZNx24FbAsBfw
	ePbZ0Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yuha0c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:37 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso5974228c88.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482796; x=1795087596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=PdxZGMBKURXi+JOWmgx6b2KkC7A75XPeNXQWnzMiFSx2Lrksbqyn2acKMBf/Bv/mn+
         WHyZYIM/BYYUTiKRYVIoARcgPxnZho1XyUeLLl1d1cg90ml9NSHL/6iR8QmtiFxjxYxw
         xPwo0UkeI4K9+TQoSnZZfLsz5oGa0rY4Cb12kv7O2Q/Dadhy4RxpexCVi/R7baCgj1Dp
         +IsnUiaP+Loa6vP6Xe5SYrE1n8Y3BwDclL5XSuoJ9tLZvD7jzSippX7Mw6602j4DN8aX
         ZMow3/JguJdWFlyjYV6gM4qSmyUOSj4jTmfs8my3zR54oXIgoEimw1oTcm8RX442MGdl
         XjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482796; x=1795087596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=fSGeed4ato2orJhjSOZFVAsQRcQwbRYvdBgNRS/JrOogg0gzlz6pNRHMVVpmAcb8Rz
         vaJ5AO/StUEXaNLSKqqy3A/NSy3GOkVWMORTr6M3oTudytier9F1e2ZJHbSlK97tborh
         0KYT7C7fa4C/5XfOf/Wfi4PK6t+QIr0gfxxeEEIk9n8WHKfMWnkiHVfpWTg8jDdEOVCe
         8Vq0chfh8MTemG4yMjje0+fAu0IhIO1dQvKNgQpwe04hjH/kMJVUoLGstqexZjVHFlZz
         /8NYE8e0VwXLPcs4MpgH23oqgb6dIs/TmISfC9vXJWVPt0oA9KPcDai7jVInytPZPR27
         0cbg==
X-Forwarded-Encrypted: i=1; AL+hErHze55MC2CPII6pag6nYHiur1GzP1urKJoyzNn3+nj81fw5W5Hb3bYPYv2IzDG3V10+2TNstdo=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Dr5Fk5MV0izkJykpjTsb3MS7W/Pzb6JRrN0zazfssVlR8+DY/
	8H51EGG+CRDM/X8PF6eU8Tg4r6cHpPm+z4d2fllvKH362ZOYySR9BjHeVsw4AOVwvdDcjAXY95t
	BtII3+c/ByFlQ4BUN7ousMKqtdIt5w5mAjjPQQid9mm7PoYb5PIrEdTW09R5GiWvU
X-Gm-Gg: AYBFou0T8DMB3I2x6NrvkScokE6vJsHuOtgNW++0BkS9VTGukh+itkNbeWuUweZaMQ4
	LGS8p1Go+W9J9R3+3L3vjKKz5H81EOT4Tr8zjNnchInCV4+h4PFT41gQ1oY4Qd7aNXnAVgrj7X0
	nJXipWNtxxZbNsq0AdYMTbT7WjlckeleQLFfdNuGPA1RzaloerQOC4sADz84y7yWp75XS3ciAKm
	qxhu3UUHx/qIfvOl0wKyWkP+/bUqK7Kj3H7BvpFGCfQPOZrrrmSebMceVZ+d+KepvR+4tifBy0n
	qE1zVEj2GhdOr1dUGNuASAmjH0dywbyQwEC8Tu7RwbJufoJoohp5wPhqoQ24ZwjN53ghm24NDvM
	c8IedJUasmSb3Bxp7a3OUg2whTeY7js9NJMgA6BO30QIG3tCH4noQasunAiMR5CyB2YcbumVqmy
	Il67g1Wb3H4r4lxu5BumbuZa6e
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221973c88.19.1794482796299;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
X-Received: by 2002:a05:701b:2802:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1b3c03179d9mr4221947c88.19.1794482795679;
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:35 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:06 -0800
Subject: [PATCH ath-next v3 07/10] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-7-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=N5sl2Mdpvr96xS5zyBkY8ux81+7tJBXwf6M8xGKMNNmyxxkJ2+jVcCbrhKGzfTtMbUupYwxrJ
 mY8Dxy4uUJuDFGH0WN2RJ8iL12iVVWmN7A9eOSbhgxwI6KtrZVia92X
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: 3u5wq19YMiP7ZvgNB-M9zAN1NtecOupz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX1Kpn/2TOUHVM
 u/7E5hTy22NwM+7apqDpLjFwzEiS4WHbVVE+QyBBhyOurbdSqSnx730j3ZZEF0ZZCzdV+WgFX4M
 QVe+D8jhXaFH2VmlqDNeuggZAb7twpU=
X-Proofpoint-ORIG-GUID: 3u5wq19YMiP7ZvgNB-M9zAN1NtecOupz
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5a26d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX6Jqh9nuMeP9Y
 c3oEQHkB657RaDXzC/IjNRqvQw35mrxTICYgHiepXQ+B1lFsaB/6XnVtknvwRzclDrrnigMnh6C
 XfgSk4MZ9VcPfY44xfWdPjGEJu4JOj8qAr94EVNhfyNTLU5Z+5XBcgE1/mwVSJC6DaefW0Y37sb
 rpfgEOYi+7RWUnRQpR9qENyUfWyxMUgT0vLZjHwgor93aXniG19wnWIJtZUoysJDP9pyScZf9xt
 LArUi9nmoNCoFWTtJJzm0zK3Xs7OtE5xTsAlSH7OGHnICRbVXGD3bzj5t8mP8WJb4sRKNH5Vo+C
 bLLKpG8KTWUP3PqET/uWp0dkxArDtHmj96LIyhDt5YVxqt6S+tlJUrINSMRX46ih75z8afPvUCd
 EFx0HvgX2NP9g16hd9fnZnLjwT5Hr9w0CF9v4oetBigpE5M8VRJdZIqgDdvCQuQdkIzeiFfk8ht
 IY9rWMaKNBRTGVKbdWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032638_568370_866B379C 
X-CRM114-Status: GOOD (  16.59  )
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

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

The current code only logs an error when the target cannot be
woken for an MMIO access:

  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

When the target or PCIe link stops responding, an MMIO wake-up
failure may be the earliest indication that the device is no
longer accessible. Since it does not trigger recovery, recovery
may be delayed until another path requests it.

Trigger recovery immediately on MMIO wake-up failures while the
device is running. Also abort PCIe wake, BMI and target-
initialization waits once the device enters ATH10K_STATE_WEDGED,
because no further hardware progress is possible.

This triggers recovery earlier and avoids unnecessary timeout
delays that may lead to suspend watchdog timeouts.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Fixes: 77258d409ce4 ("ath10k: enable pci soc powersaving")
Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 335bc7c488e4..0c671630cfc9 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -478,6 +478,10 @@ static int ath10k_pci_wake_wait(struct ath10k *ar)
 			return 0;
 		}
 
+		/* The device cannot wake once it is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			return -ESHUTDOWN;
+
 		udelay(curr_delay);
 		tot_delay += curr_delay;
 
@@ -642,6 +646,16 @@ static void ath10k_bus_pci_write32(struct ath10k *ar, u32 offset, u32 value)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for write32 of 0x%08x at 0x%08x: %d\n",
 			    value, offset, ret);
+		/*
+		 * wake_wait timed out; the device is unresponsive at the
+		 * MMIO level. write32 returns void so the write is
+		 * silently dropped -- kick recovery here instead of
+		 * letting an upper WMI wait notice it seconds later.
+		 * Guards confine this to runtime; cmpxchg dedups.
+		 */
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return;
 	}
 
@@ -665,6 +679,9 @@ static u32 ath10k_bus_pci_read32(struct ath10k *ar, u32 offset)
 	if (ret) {
 		ath10k_warn(ar, "failed to wake target for read32 at 0x%08x: %d\n",
 			    offset, ret);
+		if (test_bit(ATH10K_FLAG_CORE_REGISTERED, &ar->dev_flags) &&
+		    ar->state == ATH10K_STATE_ON)
+			ath10k_core_start_recovery(ar);
 		return 0xffffffff;
 	}
 
@@ -2248,6 +2265,12 @@ static int ath10k_pci_bmi_wait(struct ath10k *ar,
 			goto out;
 		}
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED) {
+			ret = -ESHUTDOWN;
+			goto out;
+		}
+
 		schedule();
 	}
 
@@ -3308,6 +3331,10 @@ int ath10k_pci_wait_for_target_init(struct ath10k *ar)
 		if (val & FW_IND_INITIALIZED)
 			break;
 
+		/* Stop waiting once the device is wedged. */
+		if (ar->state == ATH10K_STATE_WEDGED)
+			break;
+
 		if (ar_pci->oper_irq_mode == ATH10K_PCI_IRQ_INTX)
 			/* Fix potential race by repeating CORE_BASE writes */
 			ath10k_pci_enable_intx_irq(ar);

-- 
2.34.1


