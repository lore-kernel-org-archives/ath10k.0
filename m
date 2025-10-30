Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38132CCF9F0
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 13:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hB4YVQpNrgVLXtIFDYO2m3A6urjOI3oWMSt1zsIO0ko=; b=DIL0JXBvc/6eBAGLV4f2S2KRLA
	LQCm6Fuu0OUJtlC154Uom5k8VGiDnetviAKrECSBTRfCyACKiKHPMeFEbswh6WIWmv8GMFJMt8DE4
	YR+mWM5shSGIaoLg+XqIC13YGWWLbmtMCVe2p0K+mO3CnH/o31EduJeOnJGKUrVMf10n+nWPejxTt
	7v5OwOhbM3iGqISzzLE5yd4PFpwAPwQhO2zVu3o59hp9nviKBthjNNI/nd7xkSTWHcfzCyOG9YTCR
	E4d2NHP0LQN8A8Y8s9FyBo6JHGCwiZnbyx693zNmc4KLOikBVm1pvk5ZLgxHtgJNZU0PFwLVbPFO5
	ukoHGttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGV-00000004Aa5-29kj;
	Thu, 30 Oct 2025 13:00:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vESGT-00000004AZk-0frM
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 13:00:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7QYuQ1578937
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hB4YVQpNrgVLXtIFDYO2m3A6urjOI3oWMSt
	1zsIO0ko=; b=cE7pe2jpFUXafII/UxYCBRZ6JrjSRcQiAbPJefiRgvkAyZLPglT
	n2sWaOlxclAvSPLZsuxDqdnGKmgM4VATern9TmdcfM0FFgCf/XRKy8uR+uGFwMw5
	BBUyY5DgMS8NJQt3FbBJn8pj1ZvmdKPfac5Oj7q/K+CKYU9XVt6wZ2Afd5IIeAwk
	3HwHwWyqXPr4TCHTmT2X61bs0FqhUnj+TWsuHBKySqy94JwW2C7PwLkAGmg4uNDo
	lSRn1TBdgS+fhVbOoQnhyd3IGyeEWd6+RFGCWYLspqw2QUrFprUf1mD9jpvG6nns
	sH5Cq0niP3ElV6wfO1YTCmb5xdEUAGdEIwQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tjejd52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 13:00:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a26485fc5dso1012442b3a.1
        for <ath10k@lists.infradead.org>; Thu, 30 Oct 2025 06:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761829228; x=1762434028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hB4YVQpNrgVLXtIFDYO2m3A6urjOI3oWMSt1zsIO0ko=;
        b=YyF3oe7Vs3RGeAGFDsfZskJDtUe3/tae6rnzFz5GZKuxTg2oyZobIM02zllTocLGNm
         YjLeZ4GVVYnI2M52mFNj9juoDHvAeQNfWS+Rp/XzLzF2RSgKn0X0km0kNme6R+IgjY55
         QUtaWuyo0vefAMZkjqBCincJPyyNqMFz4H2GtiyQy+Tx9PJ+w/dTuw8jee5RND307I4x
         wd4SrWbeVgO37QtolCiTkJ00kKlOM932DdqOpWnxMdZ+Sg++H9DpDdTy0B4JSiDTueCJ
         0Uv7xSCU39WB7LxIh7siVqdMNGldcvKEjGhuNqrzuTihtE2qdY+03Ml4zbmpq2vOgQ9j
         x+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761829228; x=1762434028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hB4YVQpNrgVLXtIFDYO2m3A6urjOI3oWMSt1zsIO0ko=;
        b=bkpgHM5n04JFiK5llNfYXHithlnolHFYcCp/6hW3F6CwYVGMbIkmpi7gym3jpQqUjo
         jFNzukIDA5re+wFR+7Hs3pmZEJVShktWFlX+4MUCgqer1LFs0If45LHgfUooTXxK1Vs6
         qXZuQEzB5imjzJwmSDSlrtbkD5vhylZZW/Fv7i91htWJhft5ZlKB3ub5O/dlEB0Ll2gk
         ZEIiFYx77gm39JXGB7y1+rLmhNigw5Rmpn84gNeUzRAiCh4VxgbNPKKPRKnvmBaMN+yp
         L4YB4wqEjXru0FmqtRm+CyEl4jejF5/7EY3FEQQEiTQZsPeGf2XYeDBobq+2yB3Xul/8
         YDDQ==
X-Gm-Message-State: AOJu0YzmrN7K9jZKVIAW0gHU0fkLJefPTE5+F1mOSleGl3CkCB8q9/3T
	y8xfNYvs/QcfHnf3yJ4piwkVsqIM+KzI7OYJknfBorOzQdlReI0mwx/UByTcgiKHUGBp7DOMcN5
	rQwhUJHLLIOpgYE+5CfDvtFgH4L3VedDFwyOnfXzzB0pJXnbdYYYKRi5HGz/yy3U1
X-Gm-Gg: ASbGncv2q1PlM0JXAssRAMrmEMLFbO4vkTqGZ4xzs9wWTD4ZATZgeZE107EjT7bB0ar
	jaW/N6IBh8QbpUt4z8vM82dd1aKaA9UpQcfLHmtne5lAUNF5CPYryjfjkv8q0yu2MAABSRncJMF
	QXjSxyP2aJv/XIfa1yCitPrqWFI/MKUpiGBkUkHXMg4di2f/cpPoscDAZ8VzehIiN3MyfxXxNpq
	9/9pcM+F9gzmWGp5LEcOnpDZElDSbLtFtFCEh5FSqAojphksu3Xmvw2P67GG0OszXBF8/HNld5x
	1OBiuI6HW8tFXDLsU17VsnqqkTLFf4i/97x6qERCLyYxhBUF2Xu398QNtz9//gG/pOCDBpyYGqp
	3LY/ZvPqHXCE2qxd7E4YNEUJDMWzBkxFnfCfSNRvHDDXzgeFF8ckB6tDxoh5xmz3jrQ==
X-Received: by 2002:a05:6a00:2d14:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7a4e59d272bmr8952753b3a.32.1761829227522;
        Thu, 30 Oct 2025 06:00:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7jPHh0c1uibK0ShPcz0qwGkhJCFIROjLJpHtxaloxQisZrlsEnpM36w+1oNBnie8yyuXrCg==
X-Received: by 2002:a05:6a00:2d14:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7a4e59d272bmr8952656b3a.32.1761829226853;
        Thu, 30 Oct 2025 06:00:26 -0700 (PDT)
Received: from zhonhan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068addsm19078757b3a.44.2025.10.30.06.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 06:00:26 -0700 (PDT)
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, zhongqiu.han@oss.qualcomm.com
Subject: [PATCH 0/2] wifi: ath10k: clean up structure initialization
Date: Thu, 30 Oct 2025 21:00:21 +0800
Message-ID: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1hI68-QboyiyrECr0i7UUPY8pGQxBwXX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwNSBTYWx0ZWRfXzgGcDJcrOJUc
 llqwG4oGfM/+M93txay91+2wEI7lqXiFBVfjzy6nOv2j3E/HQ/Y7q5FM1vOzEBrm/KRUiyo3mnU
 RXCDlf/jFdfnxQ+2dhxKB1isw1L1JSmhrywZYQpsgJVglNIX1T67NFvsIvshb26QI0qqdr1cvIA
 /K3iRcFwf/s9wCZcL+2uSGFk52Z8xyiARAQX8lKnZXrZXWstlKDi4hJfOC4SLh81AjAPu6i7Bls
 a6YElVcMc+w31ffu7SQrDKOIv77csabGTX+QrBi4ot1JLUBtd31yMTFfylMSr3Yhc9F0Rcki0Sp
 xxXmwwdRB1bdVkK2RoM1cgRcWUw0LdsgsMFqTXLj/sjx2KtHg99MAHhZZtWWFD9o4XZmTKMDyTx
 /p8KkPlk0KkpkZKQ4pVePePhcIHIiw==
X-Authority-Analysis: v=2.4 cv=a/Q9NESF c=1 sm=1 tr=0 ts=6903616c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=j7ZLb4g6lzcXWYqKbDQA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 1hI68-QboyiyrECr0i7UUPY8pGQxBwXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_04,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_060029_202433_E3678882 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

This patchset simplifies structure initialization in ath10k by replacing
explicit memset() calls with zero initializers (`= {}`) for local
variables.

Patch 1 updates the initialization of `pm_qos_request` in
ath10k_download_fw().

Patch 2 updates the initialization of `bmi_target_info` in
ath10k_core_probe_fw().

These changes improve code clarity and efficiency by avoiding unnecessary
runtime memset calls.

Zhongqiu Han (2):
  wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
  wifi: ath10k: use = {} to initialize bmi_target_info instead of memset

 drivers/net/wireless/ath/ath10k/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0


