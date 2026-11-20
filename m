Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7446660A5BC0
	for <ath10k@archiver.kernel.org>; Fri, 20 Nov 2026 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZI4ipZ01;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O+4tpFQ8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jkk9HqG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=; b=ZI4ipZ01YUvq3Q
	oEU1cp1fBJgDsu9AOQJOr0qt89u4HsaxH9YQRkI0WUUFLHO7jxkvTBPvMVKuC/QSL0lqfWIvrzQX/
	jIBA0pJWtiugWZEPkXks5/PBQHmhR2Tn4AMmwDULaVXSjUuQlPgpY6oIY2F5O6NfcimdgKPFNo7R8
	rhiU9gBdz9lW2P0Xo/Z6InzZsf0SaeYKcrNKoSnrLguXBURklB/gKuf3mG8iNPQhSk3NIIgHIvZbg
	xpWQyBByu2GPW1nwzgly0c4IzUQa5I5p155Bh+2js/7mclgeBf13VmoV0ZFFCummjEjjQEOn90WHH
	rqfK9SX8p6I5M+MKe6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCz-0000000EMYn-26h4;
	Fri, 20 Nov 2026 08:43:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKCu-0000000EMWI-0439
	for ath10k@lists.infradead.org;
	Fri, 20 Nov 2026 08:42:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f0G1606014
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=; b=O+4tpFQ84LvN5Gsj
	gbjLHlkdm8c+7O7h5XGIplVBZGTGBv/jMjYpCZO+JbFzeQVYxgGz8umXvXEV/1Z5
	lTuXqyH3kOTpCXesus5lHKnzHZ7wu6M02jpgDyjkMSq+ooRcBJehN7OGGomr0ckP
	Jpz5eb1Zk/8XqV0y2Bx8Og9RXy3rFvpe/Fg/oIHICbmabB29mVu1C90eHMDtlm7C
	w4knEl1bbrxfs1RkV0iMWU4GaygGj5S4/icagr+lP6ggFy/5DtLRxXrfEPnbJfiM
	9WS7aOsl0yVSht0S63KWFj3xMBay65ruRD/tErxxNmN0NCB4vkGdOgEkjKsdA6QZ
	oPd7pA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrn4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 08:42:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3846d5f54c1so781566eec.1
        for <ath10k@lists.infradead.org>; Fri, 20 Nov 2026 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795164175; x=1795768975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=jkk9HqG/bPBwqZx7taa0w76LONl+RSQV8/9VjPs9CZJ2reAOvaN+E5HbnRwMto8DiC
         2OJ055b2yxkzf622eYW+jm1gXEbKYVhbT+4Vo0LK0Gs/XR1NBNG2CKrCCpu3xTPlUzT5
         ri8d2VS1+A3K3l2ang0zC8KGOWNFEgWhRWa6CBr/1hgG9tZPYjR/Pm3IpQTIOomXGTC/
         /U/fd1A05nIHM2Pq+MrUDSc4EPu5l4m9KRg6G2UQiMtkmkRO4HwOcPePfv9wLNj1fcHv
         NjLKlI+iKAk/aYAdmbyNs8Fk8NmhTZdC8atYp2iAwqEX8Mcc2bmCGjvPrZ90H20a7dWO
         NomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164175; x=1795768975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQzjPZqx+hpEnhqdX9simGvWCX2WsTh7NABMbYyMPjM=;
        b=Px6QmYa30jStyVw6TP7qqCjMs/+jsWfctIHo1SrclRkRj4/nK/GAvB3+VtsGB+rooW
         rPmPU3IFiM7U2rTxRVWPdNQLpWup5HqWMH0/ltnirgM0L5BKG1uwxH4tq+H+OYrFbXfd
         FylmQysLn6E5vbPb08F+tvhYSSc87UdJhYLZvVsGbfb2Wdkf8liNR34RNpebVFec6ahZ
         ScSc1aHMb/tqZYWKawabNu1lbxucDMnXkc9AtcmPzrmYZkrwaMYpB+DVIUs6ZXAcmNrQ
         NBqAfjf61gFoiPZNMFehF1W4L1Q1UHkLN+JOuYuyaD5Jn/mDBj2oMQRPpvUYqj2OKCda
         BU8Q==
X-Forwarded-Encrypted: i=1; AL+hErG+1vCO7pA83m03XAOn9rtsfUbWqw3aeAuhcSbVzg7YoAMzsiUWnSZkmmJDjBtxJcmwGL1sYAs=@lists.infradead.org
X-Gm-Message-State: APuU4Z+A3piFpKfwoNaRpkeXSxqzeS0CkTZ46nJ5Iwm6JAo8ITQTjCn7
	8xJqecgeBufIPKQo4gdgVt5ZqvmlwgBzUYhgGjGdkUUDxMW8kNHmAA8jVaNXTu9W7T7fl9SsWKY
	YmqONRg8GFsmz60BViHwOnSAFc5iVbJCv37+N0cxG7qGp6/6OXCMlWmJnBxiUpZWD
X-Gm-Gg: AZFdTZf0ycvMbWaWJ0MPtcPlTWSbPehGmQodZMkOAKerFumgg2AtzMwFvXDBFL6sPzz
	/Gw4cGQFg68VPr7mySWb9KYyL42YkPOO6lGbSFlyh74uMrt9oyYcMAwKvTcBSpIGEXwOoORgR2E
	UnRkvCP1Mf0OSM9/LxOdXXCswH28QyIhGTSsozYD1odrV5AGkm4F30QhFilPe9IwfFsHhq/TTtK
	Jfo247MdWx62bdZOqGA/tmhtPQkoCbhp3cldZ9UapmY9Q0g1CUjDg/4VJM/3jEqxycFZHy9cj4M
	FsViS8jmoQIsVm5g2HSYi2whSKJAsr7FwFSizDHqZT9LncnC3RRLS0LnOySmrdiKTBCB1nMeubx
	45irco2fm43IMMAIDVbR21jgSk9A9z/fuZqgJ3+9IEZwjDY6GEn1a0gV6quNaLLJOxV2/zPSk92
	O2H8EHUWRd/v4dsfkaxfjVa9w=
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663184eec.36.1795164174800;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
X-Received: by 2002:a05:7301:3d19:b0:376:ce6a:a499 with SMTP id 5a478bee46e88-3857122312dmr2663155eec.36.1795164174328;
        Fri, 20 Nov 2026 00:42:54 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm7326352eec.5.2026.11.20.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:42:53 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 00:41:27 -0800
Subject: [PATCH ath-next v4 02/10] wifi: ath10k: shorten the recovery
 timeout to 10 seconds
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-recovery-v4-v4-2-53d6a04490e0@oss.qualcomm.com>
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164171; l=1714;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=2xsTAU0BlNyklfGb1CwfGmuYHUyteh3UZGU+IoKePV4=;
 b=0euwQuzGBwsbZxmnsl7L+mmcCDxRGUfThed+VF8XGyh/obQDnOwis/dkK1v8Ajf0vriCFlpmc
 cIDstrR2fzQAaPIj3m+Kde3cms4hDpr8h3/jjbynQrxtAFz9mq5kIBr
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfXxP1uHUAN1hxQ
 /riCEBsE9wMVwhwThfqVScJVJKapjVUGMH89evJMeVtK016C6eGp7qmEnufQpPpPDontMOA6m7/
 2OvZN/wlDzzD7f+FR/Sp/Coms9lr5Plixo6ti383+LWQcGEKjwTK/8S02lXHuudaQV1Smi17MWd
 CYGxH2uFn7/Qh+AkDsOP+3aTqZtAvRsqRCvy6zvfGNGZL/yZWIzX2NHPugP9TPpNHw4JJsd3LnX
 xwpZZrc2swWubvLLxZ+A/CY7eCCxDqZPozie0LDrD1UGOvKwRTCfZicS5KIAM4Ia7+eeUP6Wh2J
 2koWN4ewMoK5do2yHbQUQCFwb6aRYfLcc2zmR/ePOsJg2uE87iP+wayaiQhoM7zJOp5/zChu2L9
 8L/zd5Utp9OKuwh3VSkP0GIfKyLc3gDcsKD7mqsw+1d0YSJ4SgccSOom4Hu3uxQLAqsz2+MeaeJ
 AeLPfI3BixPIbf8mMww==
X-Proofpoint-GUID: t0oXpcH_Azg2oUJPMaylp2Grn60kv1-f
X-Proofpoint-ORIG-GUID: t0oXpcH_Azg2oUJPMaylp2Grn60kv1-f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNCBTYWx0ZWRfX3PagT0zv0acj
 1LKCYTSHgLoZYVzRPIUtdYJny+3B3yGez0Y/QqK7xfaEvEsmvvT+M8c6I+tv1DLyEwnjNiXYMIx
 fGg9XnK7v8CiI0BahkUjV8p7t5uFnq0=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b00080f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QyRN0U5rXNGPXgRQ9SIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_004258_062019_49C98A1B 
X-CRM114-Status: GOOD (  12.45  )
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

If a recovery does not complete within ATH10K_RECOVERY_TIMEOUT_HZ
(20 seconds), the device is marked WEDGED.

This is too long when recovery gets stuck during suspend. Some
platforms set the suspend watchdog as low as 25 seconds. A 20 second
timeout uses up most of that time, leaving only about 5 seconds for
blocked callers to return and for the driver to finish the WEDGED
transition. If that is not enough, the watchdog fires and the whole
system crashes.

Reduce the timeout to 10 seconds. A normal recovery finishes well
within this limit, and the remaining time is enough for the WEDGED
transition to complete before the watchdog fires.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index 2e100dd246e2..75ff555173b2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -87,7 +87,12 @@
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
 #define ATH10K_ITER_RESUME_FLAGS (IEEE80211_IFACE_ITER_RESUME_ALL |\
 				  IEEE80211_IFACE_SKIP_SDATA_NOT_IN_DRIVER)
-#define ATH10K_RECOVERY_TIMEOUT_HZ			(20 * HZ)
+/*
+ * Some platforms configure suspend watchdogs as low as 25s; keep the
+ * recovery timeout well under that so the WEDGED transition and any
+ * teardown that follows still have room to run before it fires.
+ */
+#define ATH10K_RECOVERY_TIMEOUT_HZ			(10 * HZ)
 
 struct ath10k;
 

-- 
2.34.1


