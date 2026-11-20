Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC7E606A333
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TvOymwxr;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jymF+Jlb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PlwlNixX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=TvOymwxrbm1k1q
	DzQ++O9sabWMaiwgrU/pA60T+O+gKy2/6/Ot5NRvFizjscj4XVo9QCykuj/IbPJzp3n9ILnOmOngo
	rJWi6aSvVX7vCpK/3bH5vEBeNN8aWRUB+Mz6rqZ2IIf1THNF4xDCIqzqPDU/dcjqzX2dg+JGu0yY6
	VFRnvd4Nbm3ejv/oijcCJVZe6mvvqRkabmRYRy11IcnVy3YJeph746L9Bnl+WRi1s23FFicwiNDyk
	Wt6S9guL1nFmJ5xGS4phIEVtG1S7UygHSVmYkGRTR8mpz3Jt4KsJ5P99mCAR5G7wWMSwismudzs6G
	5kBFIuQj91zSh/jaS+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDG-0000000EMoq-2ewX;
	Fri, 20 Nov 2026 08:43:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCz-0000000EMYJ-0bLu
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etXH2019505
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=; b=jymF+JlbJAQA2ODU
	dNJEgJWuzOyjs4i11FyI8zA77NRgIVzeVeMB7IvywqpLqZZ4Ep9xMFe7JOIM3eMw
	tsLJ1QbzVPOGIewiuyvQiwh2ha8EHv1ozcrQkgsET2l1UxD/6SXzlFPxfdi890uv
	BOdly3iMIrA2GShtJR0YgECwJlcrAP3I8w20VL6jXa4wRwLKvmVhXTmHvQZnKZ07
	vSoPUkv9snltqfUDgqqUxCHGW0I/TF8L7tWpFe7Mes3ZHh00OPYI8T+u0gFjWOa0
	FXDvFKcIKi7BypYLAx7aXomuJ5bLXT2fq4zGjE94ffISBPGXWqPvm990RgpW9p2m
	Utbslw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj8vnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:00 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383435e46f9so491876eec.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164180; x=1795768980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=PlwlNixXOCP6aSMNXQO+HB6xW3v0hiUMA3db9CL0Y0XgaqslOF9gSQHheLlbRqroH1
         kjyKSRtQgMBoI0i5/1dKMqycCj9wc8/DxVhpLNu47q6qTWamedRUpGBWJ89go85C+D1e
         cenuCkR82rDsT8lQl3OgooZCMKtSz3KGjIqSKzYkSU2nkBPZ29OKx7VaWu+xOgJISSBn
         Jq7oigbQA+ccSxhbpoaUOHoHBFIEsWfK2Uh+XNvW44kN1mQdneYUxi3ALOb3y524oH/b
         uk4l5mt8c999zufsByQcTO3RuJ0tD5DfKh7iaRRxo/sPnqGn11U0I2u4zr5A14vx7n0q
         u3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164180; x=1795768980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tqiyx8gT9s1uWX3xJB16R4tmdUJMTAe8h0BjVdNGtc=;
        b=Fne1HhbdtPu+Jn0LLkCY2S+nbb3tWiaZFCTogFDonId3znffouEPgiXAKRi7jbBb+m
         o3xbDDtQcI65cbqSLy/HoeuQRKX+O067RkJ2Cfkn+9eA0l/cGe8ttztjmgjav5u9+VBw
         u17wLDSaVrTx3hd9PaImgKbpVV9ftXGtYxW7PmPGtaQimF7y6g2i1qZvoH///9rI+fw5
         M3sBWtD/6G9fA1Dtg8IAkpAZuu9MtUX/r+VHA5su9Pc+Q7Fq1D/SJ86QSNvGvdUOqoCG
         RxygA/9pjMmxq5q5zNhc6Yv5yiSEkDCCFXnHYhCnC94BlhuiPPBKqA1uz0ggeo/PyFYt
         7gLQ==
X-Forwarded-Encrypted: i=1; AL+hErGd1vhB4rPk3iukvQg5dAhGeyk08n02KQdvzhZ9sVEwYAt4sALBKcuFogslvWCn70Dwu8nczZg=@lists.infradead.org
X-Gm-Message-State: APuU4Z8DcjDRS9GEsSrmbx8KIblMs3ozBlpSzz/lA0/vngCKFDOcdWJ0
	iN6by3nGl+T3o4ywyXbnz6FdTQTy6Z0PchpjOPVArxmhZy+Ex5MMWUpa44fds9Lu0yI6KZTRtMA
	hytfqGio6QynzSfREBmsZPGWmMZH8i+CGJlKrj6jo3YfBYtuh4PYXRoRDdOIZfdFZ
X-Gm-Gg: AZFdTZdm+zm0Jdq4btTjXfQSQTR7YFETOGo1d1pg2nuViZWShVHAfq8j+ENzQiZV6bz
	6xWqwleKDAiUWIWxyqMUOyaIEVV/tLI9MEliFhSb16mVUo8vElP0m69S+HKhABLIvUXw9PlB1eX
	FZgr3L04EP7p2Qtr9B8v8/VKJiXGO2X0jyxEP4dYihkiyLkIzDzr4Gy2Z914ADiwGwi/sbRhqye
	eRxZDC1+Rq9l59Mhe6hQRJJ+Ne/hJpeGZ70eZVupqSZi5iU87Jc6VRfcr2qgPUDBXO86GJ8irlp
	CtngBiwtb9jo1jAuIvGsBNDNIFE5nIe5acOyBxl2ajuU0mdmLO0sptP9KYW+NaaTM2GTUAyJ3Xv
	ADXRErCCjBYU9r94VAkRUwQaG1lyghh5/RV7EUaOzEZUrxNhcTiLpUuKt81aB3k6AWTweeRnZM1
	8KyNLQoMDxqruX5NVIZFMLk4E=
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061494eec.34.1795164179940;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
X-Received: by 2002:a05:7301:1806:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-38570450b07mr2061474eec.34.1795164179424;
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:58 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:32 -0800
Subject: [PATCH ath-next v4 07/10] wifi: ath10k: trigger recovery on PCIe
 MMIO wake-up failures
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-7-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=3505;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=8sf0rAmeCFvmk0B+SaOwK1SuISp//KMx+nDrAcdmPS4=;
 b=c5CSFc0PAbTYrFe6noEKoNKEIXHmuFhzTONQ/fJqI5xYZTxPeRXt0SlWiBn1asYALukb7S3o0
 SJHKsBz3ah+Bfxx/OcvizxfPwNg1sf7KL063d1idj2srQkGPX6ZpQ4n
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b000814 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=r31ynADB2PxU4kuVuc4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX/XnRDUEoQB6P
 zdfQt5HNwOz2JtKDhaZTe2J6NjRICH/0Wd+PRnTzfp+qvjP5y6S3E0wvoi512rUjb17bix5cvw0
 h0rUcDyHwcik7km4jkKsO+Gqo63QF84=
X-Proofpoint-ORIG-GUID: V-f28bSSrMyaiMKs52lPnwAXWek4xNnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX7MqFaymmjSZg
 F+3vJU96J1OWAe1RBBvEayMyxAICDVJWSnoVeo5pSu0LNDl4b84MlA/SnrlarmE8L/lCmV59zx+
 RQnXXZgjo4kROP02Lecz1XfI6z78cLa8djsutMT9mUtpxS7kK2L1YGv1yANBIFaThwZEhi+qEbq
 EOUh4dTbWwRGh3o6oTmUC9uIuwB44jg+VygJMROm5p30FHe2J8zUkO/dVRVZt5CUj6uGi+QgSOb
 mK0UF0qfZ+DuNp3TgPvYaJODs+oJAbeBLFtEGSZZMaXuHy1Xs3/NgSHNaKD21vZpHBmmPdIkB8K
 slEZSGlYrjILsbG310G3qbVL7lpC1MmeeXP2n0KqCdspWofjp0IXqj6OJtElQVFTBGxhBimObev
 Y1CfxMrHQqIvx39JRKeWO4H4J22vWPi+xDNeAKxGGrt/62t1JW4cklQtIbR+k2+7EsCiRTb05UO
 o+jEgcMQvxvCiy7zCpg==
X-Proofpoint-GUID: V-f28bSSrMyaiMKs52lPnwAXWek4xNnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004301_347414_AD61E2C9 
X-CRM114-Status: GOOD (  16.31  )
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


