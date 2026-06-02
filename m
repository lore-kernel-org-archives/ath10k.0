Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5561CD6E64
	for <ath10k@archiver.kernel.org>; Tue,  2 Jun 2026 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=; b=q/ERDSqh700xwTyb0fwGh4KKcR
	3I/jVSaf07+pDkWJ4lnzZd6lWCLADtTmlbkSPWI3yl62lxIIKizLoMaMFM3E/gpprgISwsjuZvmyT
	rDNmK66yRpl+MIJhNz92ih5M9YQU2s+8MfBXcfVqKgjuu5zzgsQQDrfC4g6+L6hzzek8kJL6fITBZ
	m1MmLflTtv/QigMKkcca/zajMobfqIAsHMvecNl4e9r1nMKYfCamomeDBttEFw8f/6jiCWY3NXD2P
	XJ58lrB8C4FJ/qWTTzbyffcZhulzvJ2yLqVhWnrTgkBE68pwfjD11iqW1pJ65M8AZuTJsKousYNtB
	M8kHZ4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ63-0000000DBKp-2z9e;
	Tue, 02 Jun 2026 14:27:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUQ60-0000000DBJS-0LgP
	for ath10k@lists.infradead.org;
	Tue, 02 Jun 2026 14:27:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652DduSW3302623
	for <ath10k@lists.infradead.org>; Tue, 2 Jun 2026 14:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O50jApDYHIgJb/YLiCc0da
	KUWGbnLsbEGopktQ8wurA=; b=BSZKg4doFi6Yc7w23PyEnxn/ermC+HXymQi7Gx
	MTU84Gmil9/HLIKmzjmEahYtYwns6qU+JfYWVddLJIGejMzJMGl2TRTAGo1t5C/9
	ARFk7VZljBobBnQG2/hebyoAoWfqsLjmD9bzxhJAZyBQ+q0sRz2OQQd/RxgWNwRd
	n84sqh+fDfOjml3+8tPdiUmRN7TzBw+j20fBbh3zPRup0CoYCDhDngQFnTmzn2Sx
	bsXxviE5PaMbGAsvWkjuTQQajnvsyUW0NzWTlrR8rALOokUoRrv3mxg4Q4LM1ntX
	i98okuppxifQNnDcQXYI3leyR4weTvds3fVh6D2EsSqp+aoQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18hj6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 02 Jun 2026 14:27:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d8e9563eso6259709eec.0
        for <ath10k@lists.infradead.org>; Tue, 02 Jun 2026 07:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780410474; x=1781015274; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=;
        b=TXLtmMF38foMbPY3syMZL2SJpSWQtNXKOP3vsH8bEeFxWEDGJ7ofLksm8nWVki54v2
         KsCPeeTeS6aQ0JxFvW8NuP2xxXLv07/yzsj3FbwT59RTwTQ/8ZUyifSuuH/JAvyN08CY
         iSYABXvFZmYBe0hEev0+EQSrdxdY+cAFeF/gHe0jLFL9Ja7eYnTWLbWt4RnLJE61D4Pz
         34I9V5lgkdPxSon/JIpbpWi7fLvo6lSvA72/pfPbO0t4lL2NpZ+3b5EnwALKLDQ4538T
         bq4DE+kmEMFeEaFXMgHzf7FOjbCRV+vsWDUELDfdLR/PZbobdJIhjJ5eh3SWBsxpImgS
         O99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410474; x=1781015274;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O50jApDYHIgJb/YLiCc0daKUWGbnLsbEGopktQ8wurA=;
        b=DIwUVSOoH2QnrpCUe8UbK9aBSa6ESYTOJDXJaRQlM1kIEm1H8x4fzxzmOYRCE40CGN
         vWCULHC8wlALdq7PvwZzwxC7uCr+gd9uiFEN1s+yPimIGL+EJqLsmdwvDajZYtpqROy5
         xjCU/SXCt31UOc9pLaOcNjwPlyQqYivCLgzUAKg2Txm43d92WA4AoOwkzK7ftvhcSQt+
         L0klGBMvV6vyzYJMp8FEmQw0CWckiunmhPHqeTaWT9A9GJR+M7onnZO9BE6hbHMuhXQ4
         IMMvmvUAQ21HibCzYln9P2lIYUQVXEhbwYSK1SDjeSvEusG6Kninoq6Xn57rMDS2puNJ
         tpOQ==
X-Gm-Message-State: AOJu0YytbHzUf2wKJsk63i4xOWfqvIGzF5H0c1/wqWNtYzcaj+kV+gVq
	pRDNfHsbDeX6wy0NRfWwxdKb9YOtpBwOqPXz6JVOUdCyW9TPCaaXJ5d86u50f+v00iXviIPQJvm
	ITnPws3jpgTUjze2sQNvLa1nKBMk3EzrOLvP0VsoeKA470vpTdTGqd+xlP8Cw58RI
X-Gm-Gg: Acq92OEvfCe+Ub0LMn2QgmP7OMdv3tIbYUQb5C/U5R+o4aoLOxmsE+poTxqJ05OxTXZ
	dXSZiZAWFwWdh6NaWrGteaXDUzXUZnWtPLm27HnKvgo/ZJAqMxyik8R4hHGbScaXXtlzxJIz/1D
	vN3SvLcOkmDahbJHSnLgNMceR2j9qT7ptcLPq2vE8rtYKJJ5/CYSjqx1vMaUnzLWWDSugikIUzR
	0F4Fp1MA2AEvqdq/nu5U8ycCK8/1uE6AJ3Z0NphFC2YzyAFARGajxdrTbDJybojv+II0sowpThI
	dRolOKr4b/8w2gt+kUisa7J5d7uYQN+yG0crULJTvoZPSVjWB4xN4TLhRHci7CvkHnKRzz5ZnAL
	fDdhDgvDTW1UJVHkx70+yr7AXrKKwmJlV66kbu5ZOsqKYQMl9Ey9xQ4WrAyiiQwf0Anhg
X-Received: by 2002:a05:7300:5714:b0:304:1fb6:88fd with SMTP id 5a478bee46e88-304fa693196mr8120236eec.29.1780410474018;
        Tue, 02 Jun 2026 07:27:54 -0700 (PDT)
X-Received: by 2002:a05:7300:5714:b0:304:1fb6:88fd with SMTP id 5a478bee46e88-304fa693196mr8120214eec.29.1780410473495;
        Tue, 02 Jun 2026 07:27:53 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53d06asm12573698eec.14.2026.06.02.07.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:27:53 -0700 (PDT)
Message-ID: <10edc8a3-4d0d-482b-9ea0-30d827f67b2e@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 07:27:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260602
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1ee86b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=lSH6NSywkKVUnX8X2cAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDEzOSBTYWx0ZWRfXzsswfMtq/Qh/
 Pca31w8xf4COJlNV3R0NlRC6Hg5bWyQ0gzroee4TXvTzHe/ZexkBNL6PUzW/oGkoB6VVhk/x4co
 s9XmZlxhncPUMMUtF7kvcwDrjnlIUq+UBYDzmEEoDjY5JMgMNGORrgvXcKs6suWh7lIxTDUa89a
 BWYwOFdQjJaPmUiOUj63begxwb1TsD1NgH/QU0tICxymWuGT5OIh93VOi1miAnqhLsoWEucAb8A
 XX+M0oWMp1cb3CgQm6XPAn4YEYVmv72PB/9maoXKjC8uxpJqsvyc0m7M/q+IImvw35riKtm+N2X
 6lBjBm5XzdeQa/WwPIVR7xQxu5wtZQPjw9To+k1LDCTXe8FnAriI+byQCTd5OI3FMfXLg9XdyCT
 3WnXKwnI1ti93QgbCqZHGPlLzer8hlbdSmDv4K0509Z09+yemlpgvo3O19UMidufjhGLW2KT+5/
 II9CsXO+LMp7fZj/g6Q==
X-Proofpoint-GUID: cxbwMY8gr6FpdIZsVEvCseiYyeZQrwzd
X-Proofpoint-ORIG-GUID: cxbwMY8gr6FpdIZsVEvCseiYyeZQrwzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_072756_256241_67C13604 
X-CRM114-Status: GOOD (  10.26  )
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

The following changes since commit e7d6bd24e883bf7c328d73c99bf6bcde19bf5e61:

  Merge tag 'wireless-next-2026-05-28' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-05-28 17:05:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260602

for you to fetch changes up to 565257a857690244211d85593b2cd490ce86783a:

  wifi: ath12k: Handle 4-address EAPOL frames from WBM error path (2026-06-01 09:58:06 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #3)

In ath12k, add driver support for WDS mode.

In ath11k and ath12k, a number of cleanups and minor bug fixes.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: add hardware parameters for maximum supported clients

Aditya Kumar Singh (1):
      wifi: ath12k: Prevent incorrect vif chanctx switch when handling multi-radio contexts

Hangtian Zhu (1):
      wifi: ath12k: allow peer_id 0 in dp peer lookup

Kwan Lai Chee Hou (1):
      wifi: ath12k: fix incorrect HT/VHT/HE/EHT MCS reporting in monitor mode

Miaoqing Pan (3):
      wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
      wifi: ath11k: add MSDU length validation for TKIP MIC error
      wifi: ath12k: fix memory leak in ath12k_wifi7_dp_rx_h_verify_tkip_mic()

Rosen Penev (1):
      wifi: ath11k: use kzalloc_flex for struct scan_req_params

Tamizh Chelvam Raja (6):
      wifi: ath12k: Set WDS vdev parameter for 4-address station interface
      wifi: ath12k: Add support for 4-address mode
      wifi: ath12k: Add 4-address mode support for eth offload
      wifi: ath12k: Add support for 4-address NULL frame handling
      wifi: ath12k: Add support for 4-address frame notification
      wifi: ath12k: Handle 4-address EAPOL frames from WBM error path

Wei Zhang (3):
      wifi: ath11k: raise max vdevs to 4 on hardware with P2P and dual-station support
      wifi: ath12k: fix inconsistent arvif state in vdev_create error paths
      wifi: ath12k: fix NULL deref in change_sta_links for unready link

 drivers/net/wireless/ath/ath11k/core.c             |  10 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  59 +++++-
 drivers/net/wireless/ath/ath11k/mac.c              |  72 +++----
 drivers/net/wireless/ath/ath11k/wmi.h              |   2 +-
 drivers/net/wireless/ath/ath12k/core.h             |   9 +
 drivers/net/wireless/ath/ath12k/dp_mon.c           |   6 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c          |   2 +-
 drivers/net/wireless/ath/ath12k/dp_peer.h          |   2 +
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  13 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   3 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   4 +-
 drivers/net/wireless/ath/ath12k/hw.h               |  25 ++-
 drivers/net/wireless/ath/ath12k/mac.c              | 228 ++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.h              |   3 +
 drivers/net/wireless/ath/ath12k/peer.c             |  11 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |   3 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  95 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  41 +++-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h      |   4 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |  16 ++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  16 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c     |   4 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.h     |   1 +
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  16 ++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  48 ++++-
 drivers/net/wireless/ath/ath12k/wmi.c              |  47 ++++-
 drivers/net/wireless/ath/ath12k/wmi.h              |  17 ++
 27 files changed, 642 insertions(+), 115 deletions(-)

