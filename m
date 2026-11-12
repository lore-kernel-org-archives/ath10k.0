Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976B606A331
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0F9kKrdZ;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b339ZTnc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G5JEAkvA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=; b=0F9kKrdZ/xVtfe
	6kH6Ox2whJfn8cGasSp3IQ2H2fkMaiKp5n49HDt9B8Xe8RQnXX3wq0FHwtTi8s33ucok4E4/UuvLF
	gsilojVIFtH+nD59scfjJmAt8C7UUGC3YbM49da1BnhcItWuky2whM15234GVnWZM0WSos9Vz8trI
	LsceNNk7IJbarHuf1uuF3ZiYZeFbcz/iyYagnHb8mrNBOy2qg9FWwgrnXIT71AP603FEgIFz8Qwrj
	DUbUA5UEOPtyj3Iy7iVhNP6AqrS6HfNU+Nw8N2bNcruHNM5eB7trgj+tIXoxE0zWtfjs3LzE2bI0Z
	XC522H1OZ/02NIkiMlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxR-00000009hPQ-2SPd;
	Thu, 12 Nov 2026 11:27:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwx-00000009h3k-0fFS
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:52 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAfKBe1953709
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=; b=b339ZTncpo+HQRv9
	J53v0AU0ZcIZC1XgpduaVcCKcdlcZZG04lZ7NGz1hK6WqyQ6aQP+v5RbokU089cl
	seqb+9zLVStKQJnqWIV+JI6z2aP2LGwoYgOgFUj92Jq1/mYuzx0CnBz/3z0EcIky
	hQePIYFvzgEv/bs4uGk+lamJWrsnvKI9BuyJPfCT0lclm0nkq2y9lEEvD9OKftQc
	wra243Op9X3HQkcdT5z+LMMoURVX+cBEx6DxZsyupFu6trCRVSdXMU+vc09RfoZI
	NXwHKsp3eb1rop6GRNhj7I0MwIty0T6tauJ1R9jTlOzPjeQc3KDphKXpmp1Okw/k
	jXpHBQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx304qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso2419244eec.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482798; x=1795087598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=G5JEAkvApaVWobLTcPRHt/MQo8aOuV+nrWRnkG+/JUkWYQbWktA8v4XZXEJldj7n0U
         hlcWuS4ZAVXH13cKQcKjz1/1spVZdjMPYR//VDHEjkZlNVDecDYQ/pIoYTgTwm+8mXwI
         1N8gHlWCk2vlCWTCfRvugvT2iyt+5Xxn2CNXwgCc2V/UL+wBAusYDToLC6koolTErq9l
         UOGdG8Nz0A/TRpnIe0U4Jils0Y2sE+WE2QbDZ+Sagn2+PMPS78DwEE6M//g0OjxG7oeq
         T+GDh7yY7t29z+sLDOqjKRz2YdMhMp2u3rFLrg2ECkR8jMxvRZk1DFm21yWFUnvSXZYV
         A2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482798; x=1795087598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mc+ENi/MTeqPiXtu65VXrE1ZIUhkEL9j3kp6fXkHeiw=;
        b=IMdk+8dccVX4D0I/9zxI3xyr5exR0ZnI+e+Tfb4+vfVnBioE7uCkRy75Yee3Szj2rO
         Fh95cuMBO9fBV0x4vaLHqbSlJPnSvb6/5EDb+eFhjcf/vuXO0YTv+oBa+HqVs5m2F+19
         9HEzyHZ/3siBzbr/wN+ySdJeKpd1S6PAkU51+T5AJsR9pE/rDT5lLAi+h9qzO7q2B38e
         eY+h4mlVVMm6E1GuTUlLxAtdeyd1UZrtooN7gSpK9DNm0nyTGLGE1uq7W6euVYBERFZo
         YfJtDDm+piManQT5WMdQB866vnIRfBhOJScK4/xWsGLq3xQgm3OAzV7ITycsBsNuzWPA
         Vg5A==
X-Forwarded-Encrypted: i=1; AL+hErGkgxWBgAADLFw1gvT2FxucnQhj1X06iLywkI//3OT5uRniQ7ja+jkKWFyNvuwmFZXOJ/BQiZQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z88MIetEfH9CuXspZxcvkiBtar8RACvx3r8QIjLooMnlAiE8nA5
	CY5jLotQQ5fGmJifHe3fMqUPUibnWFKV5Lp05L0xQb8Ci954h3DI45rP5Axq2pXlTu2bQY+tMHc
	GOCuFvZvl5JwyhlSJNJkQA4fTOREiQMLB/s6xUTxZIkcu3B7ugVcFrJt8mmrbCeYb
X-Gm-Gg: AYBFou0/isiiTx8NOyvKA36jlO/M4EsyQYzXRQ9bJX1EHvKWW3zVD0teef4KVQBTa8d
	AWT8v4PA7GHbu9JC4DCtshchaJVc0ywca+iyABtVn5iAFKITNfLejfzwn1nFWOliGt2w/aSf0WW
	gGXMCzphraV9ce5P7fnt7fzB1zzQbL2GVvufh2eN6IDpcl48BodH1mk/eCKuzloz4WkWdVxzeD0
	n/j+SRVlu3aTzPMRKo2WaTNSERkJu0Sb64tsGeqsfLVwN9DH5yXeYMHAehZmqMGQ7dPH9URY3QM
	bB+Yx1sOE2FdXlemEbGGmrsUfunSG0iYehcpFq6mTArB6CzyGJLWMVNAhxwd8qD5ObM1jf7zqBB
	5TEgt2/9x3g+/hfd7Ciu/BTNt1v0va32LBiFkuI1NrQ6av1cNCwnm76UdeSwlPstETuWwv8wDUM
	QA1OWMmeCLqxaXIg0Yfi6cy88m
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987892eec.11.1794482797616;
        Thu, 12 Nov 2026 03:26:37 -0800 (PST)
X-Received: by 2002:a05:7301:2424:b0:36a:1489:fdf6 with SMTP id 5a478bee46e88-376851ce3b7mr5987859eec.11.1794482796989;
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:36 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:07 -0800
Subject: [PATCH ath-next v3 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-8-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=2516;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=fsIi1wDRKBpErglutX/2tf+wxeQ+MsUAjY482x6TBZ0=;
 b=L8F4BBjI5oGSYV64y89lnThhjuR+8x7M4gCTctaO2sWkD5L7B2FTLoU08HZQgcC0tC73IzxnB
 VrWBzCIxwajCy2omj11StHaogtB29+lSMYn2RChW2CzJ1JlwaV/ZFxI
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5a26e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX92zOoQ9h1HRS
 PvFf/JW2eBxuchTPW8ZduphyJotBLkiYG/e7itMIOMTPWDdfgpSyBBfTr490mTSfxhm88MU2PXN
 9M62S+Lhi7ny2g2G0hIrE/jCXIg6IaYY0HVpJHk4IphJknbvfiJGgb/P40Yt4n8yaTrM+oNuPuf
 p9E+2p267a3txDhxKsV28ebn7C57orL9uwFMJ7/5FPhOD+FmNE3DBjYaFRrUZsCV4sv8vjMt/yv
 pMydzDFEeyTkEFUOumDaKi8DC+w/z0/54S4YIJkudZnR24KEMAY5YNjdMGlADVrVz4zeIIt7v5Y
 Nc6iTurqx1w3neoKluJdPxFYKr6k2e9E4topQMrAQ4+T9AejHxPBM+wiKu3aDHlXXsQRDlD22/S
 P0BXmDnd0/hUVyrG4b7avnPGx7aJv9mS67TLjtl0Jmd1AClcBXL1JRsAHHo55ha5okReoSRO1uZ
 WAamGdMiFNrgz37VI/g==
X-Proofpoint-ORIG-GUID: 8TqjYR113ypiZ4Su5hz07MLtN8Rh_t52
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX667+Me8+OEUR
 iA5WmImPujcq2BA/ZQs/ft7FbtExnoUKLqO5AUw5oYcM8Bsq3qJe3qWqCitgJwsUYmSKV35P3Qj
 +yAT9OIF+oIVWsDPv5j9LW5KZB7ANCg=
X-Proofpoint-GUID: 8TqjYR113ypiZ4Su5hz07MLtN8Rh_t52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032641_402749_14F3120F 
X-CRM114-Status: GOOD (  13.09  )
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

When firmware crashes, the SDIO interrupt handler may read a
corrupted RX lookahead whose header reports more messages than
ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
as:

  HTC bundle length 2322 exceeds maximum 32
  failed to allocate a bundle: -12
  failed to get pending recv messages: -12
  failed to process pending SDIO interrupts: -12

The handler returns -ENOMEM without consuming the mailbox lookahead
or checking the firmware-crash CPU interrupt. The SDIO interrupt
therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
processes the same invalid lookahead.

Stress-test logs show that this interrupt storm can continue for
15 to 20 seconds before the firmware watchdog allows the crash
interrupt to be observed and recovery to start. RX remains stalled
and user traffic times out during this interval.

ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
A bundle count above max_msgs_per_htc_bundle is the same class of
corrupted lookahead.

Mask the target interrupts immediately when the invalid bundle count
is detected, then start recovery so the HIF is reinitialized instead
of waiting for the firmware watchdog.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index 748ba6749339..fdf19ce4b55b 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
 	return ret;
 }
 
+static int ath10k_sdio_disable_intrs(struct ath10k *ar);
+
 static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 					 struct ath10k_sdio_rx_data *rx_pkts,
 					 struct ath10k_htc_hdr *htc_hdr,
@@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
 			    "HTC bundle length %u exceeds maximum %u\n",
 			    le16_to_cpu(htc_hdr->len),
 			    max_msgs);
+		ath10k_core_start_recovery(ar);
+		/* Recovery is a no-op if already pending, so also mask the
+		 * target interrupts to stop the IRQ storm.
+		 */
+		ath10k_sdio_disable_intrs(ar);
 		return -ENOMEM;
 	}
 

-- 
2.34.1


