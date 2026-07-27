Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956A7C531D0
	for <ath10k@archiver.kernel.org>; Mon, 27 Jul 2026 07:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R/cpPPDkMi4x5SQoHxbHCb12AP510lOhLC2bI2PQq+0=; b=k6rju0DO7fxKfGX2TuJnCC2HAS
	Jw/t69NoPNtdSPUeBwB18pCEX/NRrYQ0DHpOzcDGE19n2B8qxM7VC7ihz6Yml1LbV5RacGNok9gHw
	JOshtvr0/ySqUXxFfaSjx8WzjlO473lpYfj4IHh5Xb9pZXOQ/aabYh1/LDeK/YJ/OByrjSWNgE+iO
	CFnACgH+kZ0af0K9suFsb6/vKL9wfDcwC3oaHxaodrSfLKnGSuaebftaRzqY6rDVXprYQKYcBbVrw
	VEL+NQ+6nw4ofCiGQWWRglc4pi28X3YK3/x+gVN0vCjw3dDr+I+d9e5NQOUEfD1bPps5l70gprBnx
	3PQXEUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFjW-000000027KM-0scz;
	Mon, 27 Jul 2026 07:26:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFjT-000000027JQ-1eXY
	for ath10k@lists.infradead.org;
	Mon, 27 Jul 2026 07:26:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fxlC1768480
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 07:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R/cpPPDkMi4x5SQoHxbHCb12AP510lOhLC2
	bI2PQq+0=; b=biAXVulAft9KI7k7Pt6Rx+vmVPJu3QcuTMSnfW5ce19NPXlO19J
	UIfaJKEdX+eIi/RUsdpVAnZPqtI4mZqOzNfLRO9D7SrB0pBRwqXNB0jNDw02GHSF
	Fn62fU4z+ab8n3Nh750dgWKc5cx1lrncZsetc56dOFq3YsnLRHQ2up5HZiDEsPYc
	uUEd93zh3AcmPvXQ19bI0WDb+8dfzPy4mPSHGn4WnJbeqag+eufrUZk/XOd/Rx6f
	NsIgdDP5uNxp86YQBR8mQqHt7e1Fr9UO556lqGc6E8/00l5hs4sFQat9VA45aWlc
	ierr2np/D0yhSE3+SSCYwEygg4Id0Xs2jhw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmpajmsw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 07:26:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84a5fe4d3b0so227392b3a.0
        for <ath10k@lists.infradead.org>; Mon, 27 Jul 2026 00:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785137197; x=1785741997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/cpPPDkMi4x5SQoHxbHCb12AP510lOhLC2bI2PQq+0=;
        b=KNDL+/6q7FTXslYIwKTuz+AOS/k7TMxMc2gC+hQs6Um9U4yCtl+Idw5BI5QWVVP6nl
         PXCPkcyyG1Ylc+9NWb+TIHusW2G4Hl9Koe/4Ex3PIrs24kQn4VA1EyxWQCzRjnTlZV2f
         OiyV5UPM2GjIels4KgjikPXR/IfCljj8LMv7NAb58W1rs5t1jfmz3rq5Y+YZsam6dQor
         uz3Hkcw+IzjDOi7SdWPIOtLhy0UXEpcIzQkQAXOI3umRz4R+fkhR0mxAFzEOALDFl75E
         uDfpTz90XZb+cRvUBYMcXMGmdFoOHBifUBpevKead+mL0r9NURxpIYZb4GE3tN2ofo1a
         en4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785137197; x=1785741997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/cpPPDkMi4x5SQoHxbHCb12AP510lOhLC2bI2PQq+0=;
        b=L5OhlYGrFrDoPj/BhPMM2PkeVv0YW0qvUShsOv7Oz4L8Tr3imnTXpitvNCKZseyvlZ
         gYVDqAej6+LcOuVtxjJ17ulbCz/EwT+DZg7Q58yZtBMjyq0Bcsfq1HebVHckknHNuUCJ
         CnzDyRmfj9bexR/R75vjeqEoaF3yxq5q4Vz86dV9qWfXlEYK0h/7ZuT6cOpmvzePyFQd
         Bt7EQBl4ghuuIN4zOp48X70Z4FtT2x/C5BHMwxytISRls5FZMqD7R4RQTc/Y5eaka/K0
         SEMOSo624kljQgrxi1iJc4KSpBx0TUJDe0KhWrwStGGeXIjuEGh58n4PJwA64EFY7mk9
         RqLg==
X-Gm-Message-State: AOJu0YwBv2bgD/oDAd0obW75ler4jcUmwbVc3ofeiqMj66YW+y2i5B3M
	lbejp0jCBN67eKsG/FSAXUKckTK5+an9UjpRSDHryvjQF7byY0xTsBuZfLmzQz/r5ezEr4ukleh
	fLhKdy3mGKMyjcpdLXxZEM98zdiznmtISPdQCxDvC8ZRSfHr6puzEw69Vw2t9H7Gxvp8k/ywt
X-Gm-Gg: AR+sD12J7ZO9jCXqZzdBg72AUphOEkUp/bTMxMRWYja0xFkjwS9PsWgFtJ7xKVLfVNl
	ITqQ/O7GN7tBWkgl05YXZzAJTY83QjcVq0tds9PH8HJAPjl2WJp47OIlFreKXHfcqZaDE9frEz1
	cGEVAZ7sA7Fru/PC/hZbbSOgr/BL+C9rdXK8XDaiLhE0OiihZ8woYJQIsLZh8oWoKRH1+SFDqTc
	nkl2f1Nbg9PjBMRCE6zIkrxix+YLTxsv0clyjeNSlizsEF5huum0rBBHwenvkxqLxBQG9XdxSeX
	ZUAgNupe4uSifQ9Ei8uC7xlsacI3tY14kIKyYr8oL+S4+y+WvksulWH1hXvPuuMhgeSfZBLfFtk
	3SdZCt0wAF9TWEeQ4tjqwVBLiow==
X-Received: by 2002:a05:6a00:4009:b0:848:7e85:f210 with SMTP id d2e1a72fcca58-84e59573605mr7416059b3a.4.1785137197350;
        Mon, 27 Jul 2026 00:26:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:4009:b0:848:7e85:f210 with SMTP id d2e1a72fcca58-84e59573605mr7416026b3a.4.1785137196820;
        Mon, 27 Jul 2026 00:26:36 -0700 (PDT)
Received: from hu-lingwu-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533ce1f7sm2603424b3a.34.2026.07.27.00.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:26:36 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump
Date: Mon, 27 Jul 2026 12:56:29 +0530
Message-ID: <20260727072629.2297208-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1JUEOr9CvGAlpRQj7K6P69Xi8HTzadea
X-Authority-Analysis: v=2.4 cv=A8Bc+aWG c=1 sm=1 tr=0 ts=6a67082e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WRuc8sxw1qBzrRBfCfEA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 1JUEOr9CvGAlpRQj7K6P69Xi8HTzadea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA3MiBTYWx0ZWRfX+piYLYEn14T1
 Yq6jj7GKcZUAroSnjwdtJWNC84CpxiuZ9zpMhc2jT3Tl+SjgEBFkURH5b4RJ5c/T38eWifWURoT
 QgNvq0Lg3tblTZAUA4r4yXodFAP0Nuyseg9f+r3FOi8XsQ0bc8jMKm0h31WvJfD8tqtZonj126U
 15WPz22Lp9dgu/TGE7oXJX+PIvYsfobeRhD26tRKANJx5mbK0GM7+9fScGsQn/gvCJYdtZcjKNU
 u9Mhjg1p0nQaFxPj6xUzR8NgINARCcxm8mjgB65PtiBUPUVBtYJitUUDrcBMm3/XzyfKwpdsySg
 eZNGUbKZtrc1vnkiG3+FPUq90zid0sbpFa92Hs5uwLnYXeraXbVZPOJ0520iDeowIfpEnnVm4GR
 BZyNnANpbgzVos3AykdGqoegj9wvbPrcZPWyojNnCzukn2R2sDmj6Lox7RxiW+O7noRboFjs6N8
 +6EErOXWFq5Xl3gdkyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA3MiBTYWx0ZWRfXzdk3JojztHVe
 vk2x4cvX7G16M9hoQiOrYPLCFRDMvJeKEroHmEYV8EdHGfr4c8f82oUHe9IuzLrqSzQfXm5NDw0
 hGmcsIWehl5lv+wy3Q3XX4Smmy4v5iQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_002639_441182_07B859E0 
X-CRM114-Status: GOOD (  15.45  )
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

On WCN3990/SNOC the MSA region is mapped with devm_memremap(MEMREMAP_WT).
On arm64 such a mapping is not Normal-cacheable, so unaligned accesses to
it are not permitted. ath10k_msa_dump_memory() copies the region with a
plain memcpy(), whose optimized __pi_memcpy_generic implementation issues
wide/unaligned loads. This triggers an alignment fault (FSC=0x21) Oops in
ath10k_snoc_fw_crashed_dump() while collecting the devcoredump:

  Unable to handle kernel paging request ... FSC=0x21: alignment fault
  pc : __pi_memcpy_generic
  lr : ath10k_snoc_fw_crashed_dump [ath10k_snoc]

The Oops both leaves the firmware RAM dump buffer zeroed (no dump is
captured) and crashes the kernel, which in turn breaks modem SSR
recovery.

Use memcpy_fromio(), which only performs accesses that are valid for such
a device-memory mapping. The generic memcpy_fromio() implementation aligns
the source before issuing word-sized reads and stores the destination with
put_unaligned(), so it is also safe for the coherent DMA allocation used on
the non-reserved-memory path. ath11k and ath12k use the same pattern
when copying target memory into crash dumps, so call it unconditionally
here too.
The MEMREMAP_WT pointer is a plain void *, so an explicit __iomem cast is
needed; use __force to keep sparse happy.

Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.3.7.c5-00107-QCAHLSWMTPL-1

Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 310650227..695473eb0 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -7,6 +7,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -1475,11 +1476,15 @@ static void ath10k_msa_dump_memory(struct ath10k *ar,
 	hdr->length = cpu_to_le32(ar->msa.mem_size);
 
 	if (current_region->len < ar->msa.mem_size) {
-		memcpy(buf, ar->msa.vaddr, current_region->len);
+		memcpy_fromio(buf,
+			      (const void __iomem __force *)ar->msa.vaddr,
+			      current_region->len);
 		ath10k_warn(ar, "msa dump length is less than msa size %x, %x\n",
 			    current_region->len, ar->msa.mem_size);
 	} else {
-		memcpy(buf, ar->msa.vaddr, ar->msa.mem_size);
+		memcpy_fromio(buf,
+			      (const void __iomem __force *)ar->msa.vaddr,
+			      ar->msa.mem_size);
 	}
 }
 
base-commit: 913998f903fb1432c0046c33003db38a9e8bedb1
-- 
2.43.0


