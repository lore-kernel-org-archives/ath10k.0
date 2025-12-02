Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D30D12668
	for <ath10k@archiver.kernel.org>; Tue,  2 Dec 2025 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=; b=MXVtSFFvZ6jEEZglgm9tBHSfHs
	FifsRsFmECnCsP32UByjdm8zBJyLt5hDLMKcgmKmvk+V6PZhUyNyoIu2DrlLPMTbRonlAY9Q94pke
	PjPG3hUaTyILGtiet9zqqwdoMPR2g9z53QMAW0hWgAH1GS8Zu1eEQ0KrR1+i1rcANqxusTKz3Ybbt
	Oo2E4HOkAV7LJhfuh4V2J6UXmPy3aOyNn+Gt+oKHnZ+V0PDEYX35V7BS1yrHB9tMsqJ8NGtjSuejn
	bJQCwewfacrNtWXuXQRLXhnznnzSq9PVT+ZV1h/czd5rGwrzdiTZv5nORVK+AGP1xdFL4dsCAunUa
	uoWB2+Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUlm-00000005hNJ-3ISZ;
	Tue, 02 Dec 2025 18:06:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQUli-00000005hLn-3ziv
	for ath10k@lists.infradead.org;
	Tue, 02 Dec 2025 18:06:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2GsASW045418
	for <ath10k@lists.infradead.org>; Tue, 2 Dec 2025 18:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sdAs0dnDIogQLGWCHgQe2H
	rkUPtRZeYZMCUBii0siA8=; b=DZ/W2OoGO+EwpgHVbDwKw1ewM8mFMu0Od7VBIg
	h4SVSP56eUYfq3Cm80ql0MZ+wjt7shMnC3aDAVq96OO79jwAID2ZpXPTZkrpF9oC
	gr+6OJvBeRUDYeqSaG27bNbgrZ/xBMgAMQqFTFZMNJDer6KvSZc783+9b63PIpif
	M9nplnu9Gy5YeeuKiVTWx37gemCmQ8XszFwyqip4HjV0GIYSxDtuQpv+d7PQPbDy
	hjjOsRC7gOmklFxwMbYjbysBl2E6a5jUouAT75LUeIFeo/NjH8WGVB78oS22jEl/
	EdEbEveYeoxwmt/4sl6Yk4EeLd18Uw61T0zckMA61KWQRnBQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at41tr7yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Dec 2025 18:06:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso9691041a91.2
        for <ath10k@lists.infradead.org>; Tue, 02 Dec 2025 10:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764698789; x=1765303589; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=At8okLzKkRyHEJjMJY5nGMKGLNIhne24HcZMamQFN2/x0aAoasJ3XWsBPvR6ErtVUg
         IkcchP1k9TbEJs0TA0vaDgDMKvsB0IevdkCFQCyllSugEuhwXBLBSxGsmlUtntujyyd9
         DmSe5NelDZodTt1lupgvp1D1RmJG2+mOKO1MXJmyoYEBInQOXi4P8IyvUchnkCGdXR8y
         2avCJ9SQy0Ed2UjyBNgFkSRiVPWod2wjGoUe6L9cm5FFvzznIuazY+vp5w8kao6i+zj5
         YC1RrA24+vO1bq7oEx7EqpEFbs5RuDXcUyTR2vsU7uH30rOhhdQHoA3LesI2sqrYbais
         2/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764698789; x=1765303589;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sdAs0dnDIogQLGWCHgQe2HrkUPtRZeYZMCUBii0siA8=;
        b=DL2F6iJKSda6GlShgTy+hIg2Vr7+72tynyGQ3BMePxwmt9TutRYrHqlMOoguEjB5v1
         bIRvKPXNsxesXiaaESWUsF7vtoGz8V6hosi1XpDj/J+71ApYmF5nfvlRvijUOEmTOOjO
         53jFCOqZ7VE8F0IEKWFoDM+BotHoe3TBwAIJ53wK+dqLB5oas1AIdNNBAxJ2XkVCuGJr
         wNH3soh22zVEo1aH/c5MDqkiZu+HeytLD5CVZVMaOSQSYpxSXWeMmgBtwUkmpQD8KNkM
         kY/i3gq9Le2//ir7nloOzOsFLurlNxu8yaE6nBeMGw+6aK2+xazKdkBj0rUnaKk4KpcO
         OJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZDaaV1bKH8UNSt518eFB4qnTza2Sb+Iogl3SM4VeKesSGN8RnuLu2mzP3lD0TlMFz7ebWkM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTtKpKxnReei2XdMQ29MB2zORoeqo69sslDk8Qxv5SoVEEfAr
	/O6g0qei/IspDO7fWJBetqQoz30WxTo11YHqYQ9UFm/uB9wj1SlL2ujr/pD++OLxOETE5riTr4k
	m9igmIJTAT64lcDharKmui7sS5mrCVifkUuMrSsZcLJzaBF3KiJU67ciQRwzABipHpDuxMBQ6
X-Gm-Gg: ASbGncufLa+sP5ELnhYWXBhQM4fI9b/XgUJncD41pyaUKAF5j9iK4JFC/xRWdTl8+6d
	45utX5CRschu98eZLRtDJXpZVzGkI+ba7MWCO2vd2dA+k/zjm4SnF3Rb7oz/bGywKpAdYP1KJe2
	aRkbhkLn/bKEg7N3rDmlgk8YRHZV+/idn1QzjpMW1SwpvsG4lhy0wKogrvc21Jxv45D1BCTzTcO
	2dvmqjphWaXXf1pfKBEMTCqPm5ycBwgBL/i+GRJIZYEdVkLWo0Z5fyisp3KwvLOWRpjSJGSPI5/
	p5oPUTetATs1xoYeUKctUMaUPabPBgPaUCPHWQGGTjdIRmg30P+QcVb6bpBWcStBAGxh6LcMLpU
	yES298PdAVgen2SB888ccnRkZBHNGlhK2SwBHvjSlNJPBPw==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259209a91.3.1764698788548;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6+xbf2z4wsfu3GDzVS/La6L3U61jv3f7dxujiiHLeJ95eqqcLPHTONyg4VyfeA2+arbvgg==
X-Received: by 2002:a17:90b:4b45:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-34910775f8fmr259180a91.3.1764698788018;
        Tue, 02 Dec 2025 10:06:28 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910e9dadesm41153a91.13.2025.12.02.10.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 10:06:27 -0800 (PST)
Message-ID: <5d522aab-9ea7-46fc-8d46-00bd60bda496@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 10:05:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebswvrEH c=1 sm=1 tr=0 ts=692f2aa5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rMWBp-HL3mJ3BiuJKzMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: wqp9DPyWhkWva3OUDW7P4zknABf-wvzl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDE0NCBTYWx0ZWRfX1u3GSn5BkK+1
 S6H6SaOhy+zQ3gu3h/9lJwgpXKQ8SOctraFfRgAzqglRI6Z5ponqHwTR9ARa6qGNbnjkhtdjpg1
 YpZj3NRt1Sx1a67gVS1J+t3noVHRfwfmolFuCNlxd1u2o5xsQelGrbhvffdKHA+4PKy9Z16X1cp
 2e/m4TZhTJv7qNLijb8BKCzRZemKprXfyYPXcEnX7On/T2mHIEQs+MZXEJuzML05PqlekeXoo9Z
 FSmWkeeNvJyT14yIc9AkUn75yAT2zlvmsT+BJqJh818/BdpPkRVnYVG6rUBzkRg6+Z9fzLtTpO2
 k3CI9zVRu1RMky3xfUGVvcyVgf0UYww3ku5CXbP7ponGUg97lyBgAgPS/sszpqxlIaLEGJKCBcm
 n8qP2q0wnktxRIdJWrZoKcZQnbentQ==
X-Proofpoint-ORIG-GUID: wqp9DPyWhkWva3OUDW7P4zknABf-wvzl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_100631_101013_EB801A6C 
X-CRM114-Status: GOOD (  10.51  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath11k is included this cycle.

Update the board file for two QCA2066 platforms, and update the firmware for
QCA6698AQ to enable CSI/CFR reporting functionality for IOT products.

Please let me know if there are any problems.

Thanks,
/jeff


The following changes since commit 38c82f07a964e27c3e71224c1f038a4083ff58b0:

  Merge branch 'robot/pr-0-1764573234' into 'main' (2025-12-02 00:54:05 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251202

for you to fetch changes up to 15f8543684412387ebfc97a4b99ecd18afdc5e0c:

  ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-12-02 09:53:54 -0800)

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                           |   2 +-
 ath11k/QCA2066/hw2.1/board-2.bin | Bin 745408 -> 745440 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin  | Bin 5005312 -> 5083136 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin    | Bin 266684 -> 266684 bytes
 4 files changed, 1 insertion(+), 1 deletion(-)

