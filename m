Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C204606A326
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bvCyJ1Cu;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ItsHc+4O;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kCpZieWg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=; b=bvCyJ1Cu1umZqT
	RwRMu/4XRwZ2IWr+fbH5nZNXLm5p6havE8UrN8PZS4FwHGBYc9135SV8nDGQFl6G33RM127Q4j4gy
	2GwSWKerWi4z6NQM2qNbS+Tcq9bAKma/2/TzLPlwULrLcnimCu/Uz26WL/4u85jbJrpEbGFAvQfSh
	eNtixDeoR03uXC8wMJOeahe1dQEPVI5fTScFe9yVDoQ5IQsmrCBwWDKiXlLIS/PsDOWwk3iZpJC4Y
	AIkzcy+fEt5Hgm5OAogL1vVqknPEXrqzAWYpH4/uh9MruDWrZDWTbEswqkhP8hWR6g4e1ehfUrTCS
	GljQriSSfL4PCD8m1KoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKDj-0000000EN3T-3b4m;
	Fri, 20 Nov 2026 08:43:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKD0-0000000EMZo-1CzQ
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:43:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7etNG1048843
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=; b=ItsHc+4OZO4Vc/aA
	bT6p3f4oe3j+Yut8OGR+vU425k8/QQhZFXjYhmMmiF2r5bB30HVZANeC9m4ozxSC
	VNHbC61pUeWXo/XrtYrHoaKXbZi03vplTnn3R0FfKlmnpDP37JeD7QHO86vCbr6y
	s3h8uyyBPdW+pka4nNlcC9jv0GeUHA3caKiXmyWuZTuKlgcO8r3NGCKU3QuGboOJ
	hKcvrRNhoqm+Ie0N3WuW03encFH3ajkSqfsRSPCpbFaszMjzp8gj8TsZl8jJe38t
	8HWf3bRTxfpqDQDznhw7m3al/wMEJNM/D5r5xVAdRmUomurlE5wzvB4p5rL7avO+
	d6KPUw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guagjwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:43:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso768166c88.0
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164181; x=1795768981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=kCpZieWgrtzAME2yFfCiSYthUJCTLGQLstJmwx8GrarAR42D+mPBeJMwLD6Rj+6egg
         xS/Z3T61qIO/b8l37KUJL6mDhmk1Gegm+ntDqBG9itECHix7r/ulDaC7vCaGq9O8lEFr
         uD1FdTUKv3hH34epqkgH0clD881f6/IuDEzyQ3ytCq685D/qA6eHUH/i3/MO5T0BBoEM
         /YpCJR3KZe7JpNnB1RKSHqxWMCmjyw+CGqCz786QXTqc0pAoC75Uq0DGTx3tMV+EhYFD
         3ZFIMDtFpJswWUYB0bg9fPr7kG3xXA8mX2JyweFIm0JnIW2+bpOkbP8t2R0p/HzM1P+0
         S18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164181; x=1795768981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOWLjAZnvwwYdES752KqdXc8VUTFIEjGHucmLOx00so=;
        b=iKOodIJtSx/pAxCa90nIGPZ2U94Wb44Xur5tzUocA6KtRVVkLhMeOiZ4aHWERXSXOQ
         XmelExxLkwXpZxGRqVRukjJEBqpsCqRVuq98KLOPbze2rhV5zIdS1NrMv7QdCHeIxeBB
         QgAo3jCu5Zg2owxtw03f5dXkzKZvZYyFJwX2x4uUGpaAA6zcwOt4xRz2vILZ3N6rFoB4
         MxvIPtsiVJa6AmU36RMnNynARceRYC8Cht4g2LUghFzk6W5A4H2Figb4wZRvRa3uOHaR
         efHGjDO7z0euVWyrikpT8i4OptetIkB6igjsOxxkZ/AflZee2nZ42vOcuGP00coyEUsm
         FEUw==
X-Forwarded-Encrypted: i=1; AL+hErErcMm6/muFggKmxwVRvOq8Jp2sbbvsBn7ApDE0xLapmGSMvEP9427XpPPIoMBWXVBq5x9gbao=@lists.infradead.org
X-Gm-Message-State: APuU4Z/U6+Dqxp8YHoaukN83/FLkj0JEnkziuNmnGaLMq54ImMP+XjW3
	df2QxZCkPWIdqR6fjTv+QjMOAFTPHcHPN+3FKT3lwJVRmq/QJIdfscrgVAnYbBxcQKPpwqTb2MT
	48Du+/YzyLjCGzqVUrVGRuLlA+JVbrliDQzEZ3AnxOlwuPVcYB7e4SaP+rxq4KrNbRiAEIkrHVB
	M=
X-Gm-Gg: AYBFou0XF2U6jJqxVAI0Jn+NXqScN8qs0Uxi6j2rSmZjc6gToa4OD/3nYQdn03+wUK4
	JKWOx0qFzri3oHbnqu9HBI5ixtdNd6xk4+rARenVi99e+7nBvoOAGZaRNuOHpSZp5rRHggmEWdW
	CjsDCUIoeKjWXehlqcoz2QRQQBNCklI4am8ftpwrNxiSW1CHgqG7bVM0ShCLIb29Pi5+O0pXvx7
	VVWh7+muXx73gCHluz0vo9kiuDJeEKfxQ/XBWTTNJSaYrrhNVqQ2F0BHRtvrAZD1UZaU95DDB7T
	9JctWb5iU4l5+AoD1BJu8Wa+btUVz05hGemQFVExYsyvwP/JKd0mbD7bjUm9wHrTNCQYtd7z5sv
	9e9E9dN4FGdGAqXk16HRlLImRp/srzHE9DqHlgz1BIcJGwzCEVtWtNko6JJLAe9ZB9jkVt5l1H8
	b5gnUiyHlOh75Wo37W+E6HpEY=
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898705c88.11.1795164181084;
        Fri, 20 Nov 2026 00:43:01 -0800 (PST)
X-Received: by 2002:a05:7022:3c14:b0:16f:c9db:c5af with SMTP id a92af1059eb24-1b5568a16c2mr1898680c88.11.1795164180537;
        Fri, 20 Nov 2026 00:43:00 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:59 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:33 -0800
Subject: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=2640;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=JNWAJxwzcrnus/v8+vUlNw82d/v9JsIYdbkw7ZHl8Ms=;
 b=TljHYvJ8OgaTx4ZE7NZKHFpI/Q3Tg+zCoWfHBI6jepsjPn0wejHld5oa77qQzKUEBVkGG1i5E
 9FrviT3dU5ZCpT1TWemoC/YJRq6EJ4MTJWFeiBlVa1iB5C3K/N3DTK6
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxOM7+X5a/6ds
 qtk88xWI3C/sxAroeHhLmxGCO9jS22t7ijKANmBVHbyvy1WjVzeiGd2gNsJbcSIycQdQLrT2GTA
 DM9AIdgZrakQo7hxtRU/c9qyspAKKKVDIVJXYTL3VidNLjdgvKfx7hvTH/uy3GrxUcfbHZ99DWb
 jvhrDB+t2x0JuqVcGpIFk9O8QV0gRQ38xORSEjY6w9vcXzUQcu0aEsCDncBodJslp2MpUwRwXMm
 FQQYasXTlHz/rE7tweSK9U+Tr4QMvRzEUcPaxqAKKhND7pv0sNDoHMkcTbFruZYBLYr//C2/SUr
 Bz0LdqNLIsHxbvqaCKyEEjHRR3nOap+WXOhZ6TG20LgwzLlxXRGQiWDkHZyzupXGOQrptmDu4SK
 goJ1PW7kluvZvBenvTceigIVcv7jNNxJFtRDrO4I3DJGCqiSbRSN6mdY3dq8tzKQAI7yx603pQF
 WusFXbYq/HS0LTN5gXw==
X-Proofpoint-ORIG-GUID: 2J1WWe-xMkXJ8tk1pnQg-kHlO1uj_x5O
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b000815 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1mh0D3slpp6jLL18LmcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 2J1WWe-xMkXJ8tk1pnQg-kHlO1uj_x5O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX2/8OXXvqgwYy
 2qT+hxSd6W6egXpPfj/AjcMF3aQy+1jOdhu1MRaAec3s53iZUwSu5pXUAv3XGe9q8sevfDHzBoX
 UNiHkMMMZPlN021r/7NN7PcECZP6Exs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004302_467123_81B02A37 
X-CRM114-Status: GOOD (  13.22  )
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

Start recovery as soon as the invalid bundle count is detected so the
HIF is reinitialized instead of waiting for the firmware watchdog.
ath10k_core_start_recovery() does nothing when a recovery is already
pending, which would leave the interrupt storm running, so also mask
the target interrupts.

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


