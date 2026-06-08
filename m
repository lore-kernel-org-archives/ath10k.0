Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07240CD8C9D
	for <ath10k@archiver.kernel.org>; Mon,  8 Jun 2026 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=udg36NeJ1IG30ads5ML+BM28Oy
	DTzNORoJL24n8im/Il08+nnFkK23EU89VPYkUAsoEbPBWcfKbkyREk0mRsf3do8mzDjMvnvMTExBE
	cL+p7J1mBvwwWePvbMRp49RZYIePP7v7W+zHJTNjS1FcYE8Xf6N8DVeAamwz9Tx9713Yp248oMP0T
	E0z1Du7StjQsk7pRh8sD8v7y08tcDEnRn7dmH8tUr85puxKyGYOxwlZ88plIg2prVF6UjZQFWFECO
	TS2xZYixAo1H2MpRhQSLSCA7RvWbVf9sLKHO73tLCuJHxQp9Aa1s32pFo5PNmc9fTk7xxtprKS56D
	IR/1pWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvY-00000003bxM-1XZe;
	Mon, 08 Jun 2026 13:22:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZvT-00000003bpS-1X3q
	for ath10k@lists.infradead.org;
	Mon, 08 Jun 2026 13:22:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658B9TU52965423
	for <ath10k@lists.infradead.org>; Mon, 8 Jun 2026 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=; b=dmjFTONZoYj83Me6
	pAY7niq9uXjobmrkbbOifA2pJVVWZIsgJnHiidXr93blZZDg5Y/7u3AYcPQFJ5WA
	xxVQoKb6zjwqeikNVGv0NJQfHtpvkxAM60FORdmTUrOC4VCr9qGSvOEjWuIcqOWp
	Lrb1jfnjAyMylL3aWXMiCWEtSAWExxTo8zxlgUu4hYsmnVqRH2iinZSve8w6stWI
	TMTzU5ZeZJk/WoPwTy4iTQPT6sNjuuBjZjEgvBwZnEvPrPP8CKxu2DUdHyFv1w4t
	zfnTwc9YVUF44OhBoD0MJZHAxNveiXnHfyPmJIYBCkgzkLvWPqsDc5nPggbg7uIe
	+wfJOA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entrks3qt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 13:21:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3074797dfa9so5902037eec.1
        for <ath10k@lists.infradead.org>; Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780924918; x=1781529718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=KFJz007d2gBHHMDZGhOdlwsp2umZfcLu3p8H9I5na6x/Lgl4ifWVFYrZTxnGPF7P8W
         2Nv1J0p2+uh8DCgQFG5cDQcO8qQMh3SUnCCVrZfavF6dNqKSxltCZa6Lim0vSNKXoWP+
         Dx6uDPAR4VTfub9pqW9DCKYMBAj4qWiR/y9XGQIXDqCCZSeRJ5uLreLgyEmdysVijcXF
         WGy4p02axoWGuvOu40jnjVhdjt4+rUIKmc42QVWjlyRZg4uz0kahlSnrT9PPuUtM0sJw
         BGlH0x5iVOstUFhRKcKljgu3a2E0Vp7gpU4/sc9uLwfq5BzIjZfq3hh+dGJKFjrGZcxe
         nmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924918; x=1781529718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+1JnV+L2QiJG9BruAfU9DnSDRh/wgHdKyo+tpx3iTvw=;
        b=OqlLu8U8c9GlSHICHT5kYinyc7kVld29V60THaVvVQO+jT+noiOK8dpGGr9H8Npg2w
         833EgmX/vTlDrYsdhm8FbSaXKityCtqR0Mc0I4uYBl02JFvnxDywdKdB/HBGorlgOg60
         7S55uGI4iyangyjdSozzLfJmgF4MaUysXX05YZEwqK53MgoMTOX4umdj8JdzrY2scbfN
         6NPDAsFlf+09n0LfTihywRsE43fGuYClUiQPuXvGIhNWvWAL2lJKZeARNxUttu4vcWgl
         J/APmrD+6IOZuSF4m3cOXD1U8MpHyaaftTQmanr/O/JTGkWqhMxart6E2w2jPUJQ0PD/
         TpZw==
X-Forwarded-Encrypted: i=1; AFNElJ8rstGKZ4JQsV9ucRo/Rbw9CZldWGu+gn1pEg1MUBHLvkeSTM635JkiBCeJSHbWba3bkeoPqwU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBEm1S48O1ed3fLB60QNZCkfuhxPuMkm/oea50bWjXFxIS+nDM
	Z3tfZH2KxT6saRlByGwMO0+EY9JnymlNE6SLd7ZKgBwNue1sAFCgbxXgCKSDn5PK3FkXIfoPTwI
	vwN23UwVvauAQRefg3kT/WYEMmCYahEVJB6fO8KLk00GLhc/HlDpnZNoM67NrS/IH
X-Gm-Gg: Acq92OHneGKBbPcpWvFOAT1rl1xlApJ0LJLJlkD0LFoF1WwAidHKYBhFvQxckS7ocVH
	3zESqpcpHaVWJte5lQixRYs1dsPJ4noaLqbUDguvGwgKkW2mrvZ9pNohULX5SU8r4e+1pQx+hDc
	jzoLkQ1Ve4cHxGoJ/MJdgBkkedIiIE8LKZJWbC3yydOyaPYwAKMvf/ijo6Sh+ziJbTWDh0Cciel
	E5N8l0Kf/eSQ2Pa6ac2hp7pjIt82aQR8EXzShVp+Lw3p4NJzAC1eYgobxmSthEShDbtogg9BcMi
	qXO3+UimKzluDVDKTSsjQuwN+4Cv7HtXxpwm48jyPuxIR9Zka2iNq7sxalRzs3OCPc4gPbZpPL8
	9t1NHMYkGvFntlGYsJdoJ1jOgtbo1ROir1+EbUE6HiE9CJjCeAWnMZDZ30LiYQrsJPziPaB18dd
	tHeaxPDJCkVqI=
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016475eec.12.1780924918018;
        Mon, 08 Jun 2026 06:21:58 -0700 (PDT)
X-Received: by 2002:a05:7300:8cac:b0:304:ab8:f87c with SMTP id 5a478bee46e88-3077af051efmr9016453eec.12.1780924917534;
        Mon, 08 Jun 2026 06:21:57 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dcbe995sm21607280eec.13.2026.06.08.06.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:21:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 06:21:35 -0700
Subject: [PATCH ath-next v2 4/4] wifi: ath: Update copyright in
 testmode_i.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-ath12k-copyright-v2-4-37504d70b03c@oss.qualcomm.com>
References: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
In-Reply-To: <20260608-ath12k-copyright-v2-0-37504d70b03c@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: EBLtjDywGpI8VU88znhZfrcSHGFDLmRe
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a26c1f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=E4j0M03IeE_1wCd7Dv8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EBLtjDywGpI8VU88znhZfrcSHGFDLmRe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyNiBTYWx0ZWRfX+0wduoTe/8T/
 TkjKxFBOyUnJELTaHSb2BRavaNVkXR3I8JfQpWMME2ejWtrpIqDMwUW5s/0a6HPKMpSHcKZgBzI
 r/S3j/+cVmUYv7oVGQRyjdikzf+bc7B3u94WjU2Ny5v4TlYsHyhL7evtWiE+QxCzy/CiUAksJ9U
 gVyDrunJZkIv/0PkQoaOFk75iIobitMXe+l+rL4vLzBshimo8v+l8L77sEF6cL+R/mXAZZH1J8O
 T81h/ZOf59GVndTzA5M3xaecidvv9QIKnkeAMYoxY6ynw9i7Jui7PmxW6Hi/kxJ59vgWxyHk43/
 WfUd0meY5jKYkIhMiP20YDN2RLM1CyP2WLQpjweE4yr1CEuCCZcj9v40F8/VMuXJBU+Lspiq4Oz
 sEa1GlkvjIHnTmp4BZ+e4yq7hRiI13YcYueLWrRwHBiOIPI2GwFkx5pAiROD59dtCLXpCnHRflS
 5tBG/z4qeaTGkLseLqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062159_479554_8BFCC388 
X-CRM114-Status: GOOD (  12.55  )
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

Update Qualcomm copyrights per current legal guidance.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/testmode_i.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
index 980ef2f3f05f..78109d21a655 100644
--- a/drivers/net/wireless/ath/testmode_i.h
+++ b/drivers/net/wireless/ath/testmode_i.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /* "API" level of the ath testmode interface. Bump it after every

-- 
2.43.0


