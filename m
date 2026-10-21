Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45128606A32F
	for <ath10k@archiver.kernel.org>; Wed, 21 Oct 2026 09:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gYRKMaak;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AZA0kGTc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MC/16N7p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=; b=gYRKMaakXH8Dz1gLQ9sZ4+NF1v
	rP41fVKZ2b0zwtnAsURYJFrL9yulWnqH9J252lJDEoc/GkTP0O/XCFaIJ9Qgf4soEg0Jzipn0P9ss
	qzyOIT7n7keQEwBEe+zuVCYbswe96a6Hnr4l8yihwLXNKhvmuaUsR3d0kE5d1fxCWIlktPrppB8Ip
	QfAinpaWRoidKUu6uby+qBrfuBfx9BuGg/iPmZXERGBttuWYStv9EcEP1PAnPBa+0E3rd2O6fyG+E
	tjeT+ON68Cg8Gma+6c4qi8OY8pwWnwWkK1FyK7rHk9uX9nV4ML0Eoqa4Ib2qoMnXhckMkmNz+8chk
	DBLf4QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKp-0000000BRgG-49xG;
	Wed, 21 Oct 2026 09:10:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSKm-0000000BRdX-42Lk
	for ath10k@lists.infradead.org;
	Wed, 21 Oct 2026 09:10:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0GE3355556
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=; b=AZA0kGTcLAf+I8xh
	4qDURjN4lQIRJ08mfAH9igKwlyztL0wrOPrwpBO+IGGHv2IzP5Ix4/X5nMu17CCj
	KZuSuPYgSMIlv2BdoRDVjJGji1k1DAqxx9xXepgKBODSPOlPF4yx6yWYXRmN/SOZ
	W1vCs4MZI7fG5wDHLXAfiqiLcHP5463RvL/OPcQ6G8AEbM0gC5rcP+fwl3C0TYtc
	IMvtIUfIzH7ksm1beFrbQVRoFzyFT4TGoK+lzOFVpfHxwQKhtTOmtxpIMA50opki
	gyItfhgBnecM7DwzEcrgTtIZ7m5vegfQut6jIlivQAFRxvxyGL379VkhdYAUDQVJ
	QrB7NQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k5th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 09:10:08 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c734afb8deso657537b6e.1
        for <ath10k@lists.infradead.org>; Wed, 21 Oct 2026 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573807; x=1793178607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=;
        b=MC/16N7pTnZNTeFryWPAAfWVnpdlfrHoLQKCeDBdzNNHwwrfamWXVfcr1Y9rry14zN
         qXszfuam7osSNv98k49rZAx/G/618Sg/Y739wxxs0SIHfYLPdKWRULcSPocUdGw4uL20
         vOPDA56XPG1nV5EPbzfpm0KQUNNLPZokbFRNfZCeSL1L4zN1qTfsjVVYzzlMLx+Op/iN
         WT+zq/0Sp9i2uqdezreGOBL4+wMQA8nbk5moeNW0xrgRAjdLY+HKEOMMlie1ngHkkm/w
         m/53oOSYn6pRwbJILUaqMCatgUUaFCx10sCvLdkeV0jeIYihNk//xs+Ny5XlV5PNtYia
         Fnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573807; x=1793178607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NgSXnEEmgfgUTlanAo/6OQIO26bhBCj1wawXnORXqw=;
        b=VkUIRBvKJNoC9D3dDT9IHlWjVFP0OrWkMFJenEhLVinUOfPwopNb+oPShgmqhPQeU4
         OTAuvDY6RL/h3GMe0P202RdbddM8Ys0eUWfGWVMP7fmMzvh0QUK3f5nMXrwprjaFXnp6
         VOEJgQD3VQpzBJZ/tRwPM8XjreNm9Q4ZvKpO/6aFQPRMeE/nZWuMIgi6Ayp7Z9j26s6F
         JTnRQyUfVuNDi2pCyNGtK8jmuRt/2Z8BBw/ZH+y8hQGL4TcZIINVSiiAvYYYCqWcByFN
         bD2W0d2joNL/BIa57ye85hz+TLjOFmUrVYaEVgDM5127GRYlr3XhOtWsnV58o65vzDiQ
         3GVA==
X-Forwarded-Encrypted: i=1; AKwUvBwusLTXk9J/yssgpX93SlxQEx1Q1Vb828VRu6mPyPaglZn0fR9+1PC3ieThaNLkN84I1CcswSQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJVlkuxD2eIqcFdfq/GFdVShex4CM6mVFgYQd4i20WLYOmrYg/P
	qJW6AP/bM0iEgoGXHCNceLJDKP0J65KI49nGCR5ofto3oEoItS2YGA7Lnjzabdmg6m0c1BqN6aX
	DazQJ8gsGD9Ex2IPCaZdl00ML5LjqLdtd247OhG/e2Y+99LO3/EthHhYTYqu7KpiKErW5K0D0ci
	s=
X-Gm-Gg: AYBFou2ajfPy7nJpN2jIrYb3cL7Ophrh1v/oy7KD7dFGRdqfz7H+z5Mas7C1YRzpZYC
	9qqtGqEX74J9bGoQNyTJTvdUjRyYC4ojqXBucaoGuUQ45VcijrTCN+jMd0g4t4Z7ZoJNFx1R2/3
	6w+xCt6B2hH0Wp5xwFIObVyzHb4ZunblQW5y4tIUcL++nmeAUxoDbXA6qFhC7MlPP4Ucj8g+Q4j
	iohRyN4LtMaRPSESmG+xNkbAqhytWpl+3ymkoi8QNPLjIHortD5h6/S/15VkoipGPGIasxEpWhE
	tgjEzhDAWEy3Tbvmx6NTJYDylmioj/IqSPxwvc4JmB6N/2VGLFWpmSo91GwnffMAqbx/aHGlbm7
	kmvoDIlJO/Xh93PNjoyOcYeA7/XR+JtW4DehtZ9e5h8l+vpox3g==
X-Received: by 2002:a05:6808:1822:b0:4d5:295c:a82c with SMTP id 5614622812f47-5536436a25fmr803755b6e.57.1792573807481;
        Wed, 21 Oct 2026 02:10:07 -0700 (PDT)
X-Received: by 2002:a05:6808:1822:b0:4d5:295c:a82c with SMTP id 5614622812f47-5536436a25fmr803747b6e.57.1792573807082;
        Wed, 21 Oct 2026 02:10:07 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552a182d59bsm1554595b6e.0.2026.10.21.02.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:10:06 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 02:09:36 -0700
Subject: [PATCH ath-next v2 8/8] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-10k-sdio-crash-v2-8-5df80bf16e86@oss.qualcomm.com>
References: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
In-Reply-To: <20261021-10k-sdio-crash-v2-0-5df80bf16e86@oss.qualcomm.com>
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573790; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=aqXbHJb+y8P/i5hcNxNZ05zuFzzRiubjGC5cyQScfYw=;
 b=l0Truq/CdJjBKD+I1n9QpDVhmTitSnzL5xp6Iue8hbgm/N6MO92AAOvYxxTmXICaCd7XDGB9I
 6tP197zOE6tA9BEerYOzBo64UcSehOeRbJ9H5uzljajwCprHSYzzdW5
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfX9PlrC3NQ0OOp
 oT50WVARsne2ihnDBeFvPzquPATNp24pscrsjoa8Wbjk/wEINLcbnNyr9zuMIZq8RMgVnEgBQ9v
 Du+adnLU4zb/hwIVNsUqNx/82evgOhEx/Sdwq08CS8TxFxaxL3prwX0uIhPFSqW8/z/gDoZBQV/
 kv9pDM6YIjjAdBU5RvTD2bvelT+enz31Fn+5xa3SeqZ2Si6IgHcSVTVhNZ+kEV8Wkz3B1xnBLQW
 0fkx2mm5bMGecNhUOBGIqDWECb2C9i72EjnA2bn6Br8Yl7U/6Zqm/b2ah2WHTyavmmAteKK+BP4
 Xf9MKmjaBYa/oRa0nQONG70M80j+NI/ZHiF/Ot/yjEBqaXvPi9dpXFy7k09tguMGtd6m/FJAFv1
 hylmL/EjgHqSPqg3D5GKLMvPVFUXJp5hnlYLiEd/t+Z0zJU8LQpTmiNkyhdKvs0oC9YBnk8LPAW
 QgXks5wiFcyFpawEs0w==
X-Proofpoint-ORIG-GUID: kKlirJk1doRhdvzq9-D9fc3beptJIc9w
X-Proofpoint-GUID: kKlirJk1doRhdvzq9-D9fc3beptJIc9w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNiBTYWx0ZWRfXyfbkX7hIYfIw
 Lqej2z5/7zCM7Nz/zdpHnw+CBIdL87sX6TdkFJXjRaYZZhfJlL2KD4XzsqPPWO4QVUokuOA/3LF
 bskS0tn1kZiTHteRu35UKAP58iTdUs4=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88170 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_021009_024670_A1C31CFC 
X-CRM114-Status: GOOD (  16.94  )
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


