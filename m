Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00095C9830E
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcaOZ2fJU6ffhgF2BemXGqCQZS+ca39vbxcg6RAcAgs=; b=he9lEBJbpgCyPfp+8LrpV6i2yb
	28EPaS447um+f0LtockjFUPwwkbM/EqHKEPEcwDrfOLiVJASMm2f348PKAWSYr22hFYGF5tc2vqGE
	Q+fgQMi9VNTWaqAmgr6SxntuTb3kt0xKf1exzcLS0bvO0DGI/pOUJy66rWgAsK8JsF9xwIbPI1naG
	0n2wnvZ61BOcDHTGBjOZt9sHpuSx0fsWLQwsAxdwY2OTzL6s6nJBQP5doysQbcDKxImwzL5HQylvI
	6CwFU1dwU0YJsQwZCkkClUxgaikzTi3OVpjjVWhxbw1p8AQfpVrHay5AeiJ7zKQ7JtLVHQdUbRzzh
	Scbmv6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA51F-0000000DJks-2gSB;
	Fri, 25 Sep 2026 12:27:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA515-0000000DJbf-3FSn
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:27:12 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5J4XS756781
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AcaOZ2fJU6ffhgF2BemXGqCQZS+ca39vbxcg6RAcAgs=; b=ZmIWHjNH+tQzrCP2
	+tJr76stlndraye3ZsgeNNwRYxRhzOS4DNNBLwX0OgrgsVMTSAbKpKxtc+mLApz7
	io2JriGAXcKvkjflFB3FdMGXO+NcLfVLtyl9AlX0qQw7N1ehzB7btt3aHLICsZwr
	7PowrzjUq59vnVSS2KRYJ8L/9oJtB6mBIpEBfWYHNWSFyXUCWCF6ClzWS2TQWgkL
	zBQ2D4DK7QeUhFeNuqruwdoiFZDz/8LAV/nH8lFt4d3rkC2PCWtcMvI7N5uWUchc
	EVowx5xE/MR5j9inUwQevOf2Ezc5G8Z1I3tqYz41jjrWn0QGTt27sSAvI5DfC2EV
	jscg4Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq099w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:27:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1506258a91.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339222; x=1790944022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AcaOZ2fJU6ffhgF2BemXGqCQZS+ca39vbxcg6RAcAgs=;
        b=RbXo2L8wMsytpAZCv43iHhNenI3qtwdQnLmXAdWbVRQQHXjykbRdzqCNzS0YFjSX8O
         f9+3cxUQn9Zh+aRo30ZgDG5aP8EEQUwDJwtv8kRWG/r2DChE81sHGs5cEFLRigY+ODx/
         FX+8ogL13cDf+uQhioUAe7GzZsosmLjrH9nuPeKsJYeZw+tN94L0QseUUN7Ih0Nz0U2a
         wzOHTHwqfkL728uq4WyGII3deAmV7ZCctEENIlKM0/rwXKRou87qtSUZnI5WRsg20+6c
         P1/Z3Oi+mFnwSOdjAdQl0Zyq2TjU0J/65NLkLScPC1PCzcbcbFWl7TH/ihiYOKD89NWJ
         KPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339222; x=1790944022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AcaOZ2fJU6ffhgF2BemXGqCQZS+ca39vbxcg6RAcAgs=;
        b=BA/dU/nNKRf06HEsKonqv6TIQ0AemJFyqWOT6Exqxh65XkN1fbgNqlgObN/pRFmqlV
         wGLxcivU3b11XqTUIxMeXSGPclou6k9URVoFh3W+nw7zoWP5QHg04nuewLpR+XLbON9j
         gfVtyn9XU/sWyBsMiUeQoUdEtaS63KYU7F1Q/XN0BAVPAOgmnpMmClm7+YcpuKgDOdn5
         eNVnS9xVOpuJ4gJ8MyXNRQWl6jYuexfBxzUgQ5YXeq319TrBlYWk47jSgem9fLooWSuu
         ryvBNILZ2S72lBNk/sgMB3Y/iwcoGsruf248O/DTVBCaKxk8F7s+jvjl7APM7Lri/M66
         ggOA==
X-Gm-Message-State: AFuF++kuEwfaD2/RgUC6J94yu8ka7VZSVid1kHdjqr0zP6U0STxEGhJD
	WQpt/Q+Tc4tbV2aXkhEFzBWupFAs5caPH+8eYwiDeJSW5kA4qNtw6md0tam1Yaa0ZvMOO0uFzcM
	K24UvZA+X+maCwJZO3h9yrvihltUiUBMRwpXz+ynwaAYcLpqMSGCAnmpLEEEHBUdM
X-Gm-Gg: AYBFou0sHevrHePYfJAfycK8BU7fBFj7NRvftMfjrA+A14mhYgqr1I8SB83kY9Fc6lM
	/9/Vs6s6bwipTXkMBgLK5BKdFAj8VmDJRJMhd+uCNPG3pltXrBtqwtpXS0Tc1clmIilG3/qD4yV
	CWsllDooLym+0FU3rckHkvF21U4APTY5/hz7Ve7/g0dW7Oo8A3SS3PFzKWv/46pndd6vLT1eBPv
	fToeht6ZbrSUexYNLj3CYKG5soh6MOXMiG6b7v6iIVbEgsOYnhL6VckcNmKjY3FHcbG6eQtdUTU
	3xpsw2R+seQKxP1KZBAMPB68REBqh0O/JRLIleFHED5/rmbcHPkBw+/+6EbM9XSFWCtHK69e9EY
	IuAUo0QLvzi2YcFmRqfZLoUsBJe0zFEveGlbhiGHFNFH+SR2BLaw=
X-Received: by 2002:a17:90b:50:b0:39e:5c88:ce10 with SMTP id 98e67ed59e1d1-3a0bb443ff8mr1713085a91.0.1790339221643;
        Fri, 25 Sep 2026 05:27:01 -0700 (PDT)
X-Received: by 2002:a17:90b:50:b0:39e:5c88:ce10 with SMTP id 98e67ed59e1d1-3a0bb443ff8mr1713069a91.0.1790339221103;
        Fri, 25 Sep 2026 05:27:01 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:58 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 05:26:38 -0700
Subject: [PATCH ath-next 8/8] wifi: ath10k: trigger recovery on PCIe MMIO
 wake-up failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-10k-sdio-crash-v1-8-14baf913df94@oss.qualcomm.com>
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
In-Reply-To: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=3453;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=6DlQdupdI3sE5KW4WGC+fgLIQP6e+cwnTKfsVyYBx90=;
 b=pyn7qwTmLSuu7bN1kmnRtgC+n6zLAzS5sF8LU5fbeUXkF6Dz6Ull/Ncj4SnDjRQ9a6uQdcmA+
 3JAyq0brhLdD7CfKbpA33Btefxs1FYdRzSxF2RdU4Fb+6AriyyNkqNZ
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXzhcnMiyPkP/O
 xf6IVX7IJ3vo8hvaVrjTV/j527aHHhtJfsL+XN+xnbZWQ8YOt/H4zUpaUHDo9muCveZl/skDKOE
 Ffd3BTB+HAQ5rdXJMFVq/JaYIFAdR2M=
X-Proofpoint-GUID: m8nCTSRRBLCWE9Mgb69DBw-plO-21QCF
X-Proofpoint-ORIG-GUID: m8nCTSRRBLCWE9Mgb69DBw-plO-21QCF
X-Authority-Analysis: v=2.4 cv=LNPz05W9 c=1 sm=1 tr=0 ts=6ab66896 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX9xMlMjmFfK48
 sWQ10gP723WfcXoglaStqK8Vaj68ke+I+IpHO7Ch+iVrWb5S/zVtjT9CC5Mi1Qdjq/YwEeVSqVq
 GSbPNBUfx1e8U6BzTgnZaJQRCjeBEQtcdv+7OCK52/DVNic9ezWPdw9ZoESuJ8DwAev6HK39395
 4ff2BxIe6aHtibNDBK7fpJrym30FFtvlo472q1hV6NMEHKXeTQetDVEDrn2KmPrj37+AqZV6+pR
 uhP0J1M4S9g8ZUdVEwgiUM6c1HqXcSt8lQpdSjIJCREx2qZweza8mUjVlKpLe8iDCJIlUojU7uR
 FV/s2iqEyMpDPpwu5pDxZ4Uui1QrhipL9On624uk1NWaTbrVo6e0bX6H1CUGfRtoYFya1DnouY5
 W/zjngxmQWXr6JXbIaDykZADBXk8R53PabMD8HGa+DovFujIMTFKpFZ7VtwGDDwL5flz/V4Y4qz
 zNgpbObjPE4pi1KmtAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052703_959196_1408DA6C 
X-CRM114-Status: GOOD (  16.39  )
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

Commit 77258d409ce4 ("ath10k: enable pci soc powersaving")
introduced MMIO wake-up handling through ath10k_pci_wake().

Current code only logs MMIO wake-up failures and returns.
This becomes a problem when a PCIe link-down leaves MMIO
wake-up failures as the earliest indication that the device
has stopped responding, because the existing recovery
mechanism is not triggered until higher-layer timeout paths
expire, for example:
  failed to wake target for read32 at 0x00036044: -110
  failed to wake target for write32 of 0xfffff81f at 0x00034834: -110

Improve this by triggering recovery immediately on MMIO
wake-up failures and by aborting MMIO-driven waits once the
device enters ATH10K_STATE_WEDGED, because no further forward
progress is possible after either condition.

This shortens known-failed recovery attempts and helps avoid
suspend watchdog timeouts on systems where recovery time is
tightly constrained.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1

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


