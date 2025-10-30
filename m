Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C13CCF9FC
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1RdG6M8abF23iPRfGT5yGy3GEha7khLmMinYZRnghAg=; b=wTR36hKCVATU6AitgCoVQHZb6D
	gU/EyunWlY1VnUTfpk5tbHfs26D7jfOWCumYIwYTthhbRTO7wDUrC8G5PCCWJqGE+QukWTtLklEqV
	Cez2oAUoZ1XQnQZrgOvpy+85suOhpTCdjpeqkGeNJYV8JeclbA0Sw6IqxPtwoGSkuA1SCnF9MWVsZ
	h3SBUSe1UTPm/iQFomquEpd1N5XJcPdpyoahR7v04WI7sf6zJ/TzroXKpynFoRqurt60pm8df9Oar
	BbJjpc6EkdmjGGCd1+BMn6m8/27EFa/9t8VBMgRC+awygqA4bjciRt7bUjMv3CilFkdG0derYKtJ7
	i7aluq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGY-00000004Aag-1YyC;
	Thu, 30 Oct 2025 13:00:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGV-00000004AaB-3cF6
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 13:00:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7Qnkd1501736
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1RdG6M8abF2
	3iPRfGT5yGy3GEha7khLmMinYZRnghAg=; b=oxP8d/dAdHoMKvPnvbICpF7j9tP
	37Ncrgzjspz3/cIW2vSHaf6ye/tPH3DuqFiZRQ9rjr1en9ptMdb/ASuqaQy5vwze
	IbnOoVcpFd2N/ZBjqVwEDIx9E1mZhNET7YkqW8wCqxsSlm/6PaUahqOZ2qOcR1iY
	grMgyckmvQ7yuZ/s6GH0J1PDc2NaEaA72xPmaZE9EksCwJlzxyefBEhJuSyivcWq
	ewI78k2YtDXU74p2bMyKP6ABHy245WqaReGjx1Jk209G7L4w6rOKO4G+G0R39dNN
	jCdbhWE8pNpKGdwGz3UhNvh2ZUYsd6mlXAHFzqwCjJJoOYUbQVm7Yk2SF9A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3t1jtgwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a153ba0009so2264685b3a.1
        for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 06:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761829230; x=1762434030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RdG6M8abF23iPRfGT5yGy3GEha7khLmMinYZRnghAg=;
        b=E+KpeHFZugeU0Z7sqofRB1xkkF6GHrlfuo+a5IwF0LptpoihZD5JkIrjucj/B+yVb1
         hmbC1CRhCB3FjKN8O+K2C2bjokUVpDY1C8lSs+EB3z5cELvJlWDuTmDKZ3eTk46h6KlI
         LOluDFCqrKW4hoiaHuU0mt4iAItZOhXynyfUFCn3eRlXV5fGtRKMwW/mZaBPo7LPqbKL
         zPWvKBwW4lb6YQIMVI348gm8VLkurGg10iMsms0QJeNFC8sry5DuvHLKOHO3l0nqOwz3
         PZi/fCgpGPM+czS6MfxTs2iRunlDI4OYhy68SG6jc8KArbJdOtd2J/leZ24oUUu+BNnk
         dTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829230; x=1762434030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1RdG6M8abF23iPRfGT5yGy3GEha7khLmMinYZRnghAg=;
        b=LdL0sZ5igi4PyW6qqQUOhNkCVsNisd20QD+mNwl8XuZktLOyPmiOs19egu3knsD+ga
         8FqwlwslraIMl6X9vzLNhB52KXJQEWxoDtdFhwT2OnfqholSCWNErHvlEeiXLbI1YV7l
         RrR1Z8StCHC/O0SD+rk8sfukQeXkNW36FxtB0UhE7ItSfmmnkQuKY6/aCEcYqfHJ61+r
         sFNCz4FJm/WpIunu3HlhVOHkgaK+lZhUvQC7HifnFAfiNgXSurN4kljGtsuDadIkskX5
         +PwlwRpROzvin/wDwyoT6Y06g0w+zKQyisc8Rt42L4lOXZ5/bThl1ux5IZclS69bJw1p
         3tog==
X-Gm-Message-State: AOJu0Yyo8CE19AcixdLjA/w4oHN55v0HmCHuIH682MV9Q1A45mYgbVhB
	66nJqTYo3rZ2suHbSjOswDul09ac55ZEHizBriCkdAud4uKElxJpmUVwHoWeF6PQVQdAdF9JxFx
	n6D8da7ACL2HnlWHzj2d+/eRwSwn1MmtlPW04Mx8+kULwcX6/xy5oWJYCl9llR5f5
X-Gm-Gg: ASbGnctaI5VLwFPFENyYAn4zIjY6Rkn2JLBN2Rqzqbp2atUzH+1U7r64fANcH6QvSA+
	hkt9mE/2CEMhh3Y0d5AYu3BqpKBmK140bpZBoeL3WjpPnuyU91ZnKllBm3CR0t84uF+23MMCRNf
	f3HSKn1EhjYdmKoCVK5AYlp8q4XIEwr3quLQfgKSmDYLeSW2QrLy0qHRYogzlp9KDaSk2hilT1W
	A9e7/TCM+LSDYUOba8jH5mB5v4gm/48r0/Xv/VirTePOkss5XIQvXhxDW6BgPuAyA1KBoThC1Vc
	jwhSEpy5ginqZAGqIfv6Sv+FrTI/Onyqvob2VysvIDfpRv57hrb+XbUFqrmi6hnpMNOg3YoX23O
	wu2Bp22mHNdhP3WAVxXrKBpTXLyexbNEIfILSrCmWyXIAr6ESnOh7gzZ39SqZddCOnA==
X-Received: by 2002:a05:6a00:1a8f:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a4e2cf522cmr7753652b3a.7.1761829229975;
        Thu, 30 Oct 2025 06:00:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9q5eFnUbX2on4oyRbuZgTJQukoO2R9eFR8yg08lWKVG/A0tR4UZL3TCr+G2QedSkdx1dXyQ==
X-Received: by 2002:a05:6a00:1a8f:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7a4e2cf522cmr7753549b3a.7.1761829229152;
        Thu, 30 Oct 2025 06:00:29 -0700 (PDT)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068addsm19078757b3a.44.2025.10.30.06.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:00:28 -0700 (PDT)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 1/2] wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
Date: Thu, 30 Oct 2025 21:00:22 +0800
Message-ID: <20251030130023.1836808-2-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
References: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 975u9Dg9UL2rXAApEGRW0aleoW5Ya9GN
X-Proofpoint-ORIG-GUID: 975u9Dg9UL2rXAApEGRW0aleoW5Ya9GN
X-Authority-Analysis: v=2.4 cv=M/lA6iws c=1 sm=1 tr=0 ts=6903616f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZsA58p3M-7yRb83_00oA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNSBTYWx0ZWRfXwY185wRc55wT
 F9ujjCXdt5ZDgkfoLBNaPiZRt83z7eYymPvov1U5d3EBRTVU6iOigWhN9ObjhnL1ElIC3WNB/px
 X4UMjaZQ1tT1tCrFXoNy12j6IQeiYLW06lRBPa0Yh8D6bz2q0dRYJf+ozr+YaKUYkg3VwwJxJPq
 8duJG4q7zx3B70weGVxBt6VnIfjihxEVhyTxLuMTus3whXxbQW84lI9/I+PG0KO+Y22sYpXf5e1
 Etd0CdxBzaj6NSnO1qHjPK3X94lD1c7dKM09oBXRnbNOEWWqz5WSGQhDu5JdEB/AM4fa1Bxmbop
 LCzFfsDubRvZdWve9rf5tNrQ8MoN4ynUqvSgDidIqcYvP2pt1MUQvToJM2p1QziBlk5R+O8Dt+k
 r8X4eebJUEFGeeG4KK9w1EjCEtoQWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060031_904720_6EC5300F 
X-CRM114-Status: GOOD (  11.95  )
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

Initialize the pm_qos_request structure using = {} instead of memset() in
ath10k_download_fw(). This ensures the structure is properly zeroed before
passing it to cpu_latency_qos_add_request(), and improves efficiency by
avoiding an explicit runtime memset.

Signed-off-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 9ae3595fb698..670c31a52a12 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -1186,7 +1186,7 @@ static int ath10k_download_fw(struct ath10k *ar)
 	u32 address, data_len;
 	const void *data;
 	int ret;
-	struct pm_qos_request latency_qos;
+	struct pm_qos_request latency_qos = {};
 
 	address = ar->hw_params.patch_load_addr;
 
@@ -1220,7 +1220,6 @@ static int ath10k_download_fw(struct ath10k *ar)
 			    ret);
 	}
 
-	memset(&latency_qos, 0, sizeof(latency_qos));
 	cpu_latency_qos_add_request(&latency_qos, 0);
 
 	ret = ath10k_bmi_fast_download(ar, address, data, data_len);
-- 
2.43.0


