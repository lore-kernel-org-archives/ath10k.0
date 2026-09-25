Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78117C98324
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 12:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bm46YzSdldmp4+oNTJBO+W7nwg5CxRXmyqvIauGB6BY=; b=O8y5n9EEl6aJSc
	qffa7QuLgAtX45uUxJp+kyW7iRJxGNSvLfhfzxPZsGkayM0S1k+VSau90EugrnFfteo3VuPfWkDvj
	QcxWcSapfMog0QAmQZDqh+AlLVrxk1aGQKYQdpKxbCUPvsvtS95KcKsZ9U53mZXgywyvwntDmPCr3
	2+d1o8szln3IhMsHlFkadL138W9e6fLKbzEH7YjtH5LQxK5anGkP8VPJvJQSIjxPw9upWgcUmHRZB
	5d20ReHvAAKkQqrb/wcF57vRQWhRijOwU8oEXwAIBBb2cWIQyNQoa0Hn1rzxOrtwMt8WBWYg3yXrn
	ADeSbL2o3aI5AaOc5bSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50s-0000000DJR9-0x7I;
	Fri, 25 Sep 2026 12:26:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA50p-0000000DJQn-2VnL
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 12:26:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YMVt1055331
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bm46YzSdldmp4+oNTJBO+W
	7nwg5CxRXmyqvIauGB6BY=; b=f78eA2bLUfoV5Ok0frAY9NCvRECjhjUxK+CyPO
	JBwyq6/e/BOjsMPYFgkfuCLVLg1CuP6G1ZwAoyGMTt6+yUmqCATuD65ROkYdKIV7
	YX5/UuE1cknU1RtLVvW85rki0bq7+unOBbCWbjrD00BJnlSUHoZzfPmkokvFWtqx
	V3ODjp1h/YfP0buDNu2ljHiIzbOQVokRTBhr8e1Jn4FQwa8Py9NjoZo/c0vNK1oj
	hsdrGdslgn/tnTWZRMuk23jnDuvc5x5zgc1b+8Yeu0kW4spEeSuLbVX13TDIUgZ1
	iVYkEO+tz8H5hJn9GonuH+p3lh3UftGL+lDdsANhLsK5AtGQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7ac0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 12:26:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1004329a91.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339206; x=1790944006; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Bm46YzSdldmp4+oNTJBO+W7nwg5CxRXmyqvIauGB6BY=;
        b=fag2eo3AXlT7NPa+gxsxWMG/dGyKc8/AQu/zCL7cb7KQQZMvDZvcMr/t64NkSOm/9L
         +kEWt8QCIivUvaaTxsN0XhtY3QmujNNMdVgursLQ7w2BoITdl4oWwiuYhbf7pH9PD+ic
         CiFdqjFkbIryLxeozUUFByfsV+eVW4zOCFipo+PMof9VZruEWKX1Ujck5M24eGFq/+IG
         3ilq77yv+R1eiLsQCrM/U0EupimpIcW9UQYlOTULWHC2Ycdb07NW6zzdzjfpq3kNfyMv
         DqnB0oq3w36ucbkA0Y7+37Nvxc9HjOHDIcF4kMfJoS8v14npiX1Dpazl2/CJixaRGOrB
         ZT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339206; x=1790944006;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bm46YzSdldmp4+oNTJBO+W7nwg5CxRXmyqvIauGB6BY=;
        b=qxg667OAgtXNkjbIAwnWfb63ARLfzRS6PROK8dmpePMfAPC0Id0fOKzcqlM7FzDK6X
         1AIIaUsWJm1ZjcI1lyVWGNqdiqoiaAPoT4CjkmuUikzsEt14XzXdJa5PGmbOGwtsmXc+
         Qt8uc9CjTpO1iifW521xadLw9oxIHchx5V7zJT0MC9pKGYrFtBOJ36KMnl6xXwepj4DZ
         3j8CSoJ7qqzpu2ea943dKlKzn9oxa90lUwn6DFQBqIa51Dsh4lnklNacvIZ4ayiG1vQ3
         FG/cSeizsmKIXCGH1H+WTZ3+s0MWuxQCCQtyBy4tjyqiSwmbqHHVbvwo2WwDDkgftiPh
         1LOA==
X-Gm-Message-State: AFuF++mFfHEf8oInVgX75nG+lZptXPsDDzFFuqlXG3cvWuF4VSl2V+A0
	ffXsm2T434Lw89c9lDKvXF632JLjRK8e4aB0ENAJwq69smNNER2AgprY5lyyskpAerAYIt7stKS
	EOLZ2bH6rx4QmF5WpInqqz4sFO1rytJMWmKJ1N4GxLuaUYeeoDPPJJmZxZbPBQay/
X-Gm-Gg: AYBFou0w1tFG2sfQY/2+aakdB2QFrz/rhONX4jIMsJBRXlbGAvRSu6BBSHE3F3LV0SH
	vTvCwQDSDxGc9k2JejLUFrbxQustdEa9Z78AyqKDUcs590jHCTkBxDABJtriq8lFEFtUBURl+oW
	0O/Uly71KLwzLAkDsskbylWmPaHepEWlVd0JGnsUyaaB8n6ASEJqKZ34D69Jjpr5g5sBwnHzk0u
	434Xd3EkPHxBLSE/1m/NfBEF6wddzoBYNLMxr6ESV7LmIKrorZE+/QlK/axg+BddfMuFsUwRSKb
	bLtQ0mW6VFYN6oEqc+DG5RjRp8aWZARJx2ExYA7CQQk7Z17QJamjtjl29Tw9qGgKm2f22rcvRae
	GJGuKUuMWy+LiLI+zQMfq4o88ol26LfkubirBsG7RCisKUE94VwM=
X-Received: by 2002:a17:90b:4b83:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-3a0986ed065mr5067321a91.9.1790339205967;
        Fri, 25 Sep 2026 05:26:45 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:398:990e:1587 with SMTP id 98e67ed59e1d1-3a0986ed065mr5067308a91.9.1790339205432;
        Fri, 25 Sep 2026 05:26:45 -0700 (PDT)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b998dbf2sm4401671a91.12.2026.09.25.05.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:26:44 -0700 (PDT)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Subject: [PATCH ath-next 0/8] wifi: ath10k: fix recovery and WEDGED failure
 handling
Date: Fri, 25 Sep 2026 05:26:30 -0700
Message-Id: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHZotmoC/32NQQ6CMBBFr0K6tqSUgK0r72FclHaQqlDtlAZDu
 LsFt+pmkp/5/72ZIHgLSA7ZTDxEi9YNKRS7jOhODReg1qRMOOM1k7ykBbtRNNZR7RV2VBhuBOw
 rJk1J0ujhobXTBjwRFTo6wBTI+fPBsbmCDitv7XYWg/OvzR3FtviliYIyamTRNnUNWhfy6BDz5
 6ju2vV9ns7miPI/Ra6UxlTKcFaxtvxCWZblDW3ws0UVAQAA
X-Change-ID: 20260923-10k-sdio-crash-8d2d8e7509d3
To: ath10k@lists.infradead.org
Cc: Kang Yang <kang.yang@oss.qualcomm.com>, linux-wireless@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790339204; l=2070;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=99ZhWm5ib2vFmSynbfS3jK4Wjk6UiZl22jnPjdGpxQA=;
 b=xTluDUbPL5s1J+gzYcE+movRY6wWWqtCZDBCvvs+Jl7T5PygQHVcaXO54BB1JL1PV2xwnZuzf
 pBewMXHddt/AwMbGolt0lPi40duMOUf558WTHNBkJET5ovuQD3l2so4
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-GUID: 5twiLAU78CcdWQMaGjSP2j40I3iHIwl3
X-Proofpoint-ORIG-GUID: 5twiLAU78CcdWQMaGjSP2j40I3iHIwl3
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab66886 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=AsZdo0PIdGKIJ8m7CAQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfXxoymok2PWokm
 JWHfODLNegluUMkA6BVKkAkNSqgDUwD0WTROol8sz+v4COclGIx84unSPirpgRQnjVz0axDqbcJ
 l1C5AXuNMkIVPpDAD4G56x5lBEz9X5zVQKGiMDf/rj0lclmnVmJ8TWBoauGiP7ZevnYYD3Wf5cQ
 yfVCTxPhZ4nDqAyUF2SkYY7KPRhhrxRFCu0SOiYq9uXwLCDzJxnTFqmMw/CmQZb8zxDPKSyjQKd
 TVwp9zC3tV2IEI4wrg45MNzZmVMcqBtvm6ttMUlx+Im5r17Qo7JfNteoek6Xjl+nIpNWySNTpX8
 vYJYYFwzkVa3+4UmIv5rpYKuuoD8YWE20MDH5G1J3TQg+6cbRCoPznk6JcdOohXZmoSj5M1X4Ok
 xGW5FvrpH/6X2T1+nD5YqopC5qEjwl8Lk7ycHdp+Dv206bcY9/ziJrv/8mIxAzRGdkCJHootfRc
 S78cVfvwMWllEuumGMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OSBTYWx0ZWRfX85qLCs1JwXi/
 1LgJSV8O5DQytJcDdtwQthUji8YlBQ3kI66hwnZhvvYIPl+d7rzqe3J+h/vvlzMkJFQGd8qUAQ6
 id0P+UxP4s+eW4A3MoTY3XhIla7jXR8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_052647_649585_7D255258 
X-CRM114-Status: GOOD (  11.14  )
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

Recovery failures can consume significant time before the
driver eventually gives up and enters ATH10K_STATE_WEDGED.

This series fixes several issues in the recovery and WEDGED
failure-handling paths, including recovery detection,
recovery time bounding, waiter release, and PCIe error
handling.

Several patches fix specific bugs and therefore carry Fixes
tags. The remaining patches address closely related issues in
the same recovery path because the fixes alone do not fully
resolve the reported failures.

Taken together, the series ensures that recovery either
succeeds or transitions to ATH10K_STATE_WEDGED within a
bounded amount of time, avoids unnecessary waits after
recovery has failed, and reduces the likelihood of watchdog
timeouts on affected platforms.

Google has reported this class of failures for an extended
period, with more than 4000 observed crashes over the last
month.

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
Kang Yang (8):
      wifi: ath10k: fix SDIO aux workqueue starvation in recovery detection
      wifi: ath10k: wake blocked waiters when entering WEDGED state
      wifi: ath10k: also wake peer_delete_done and target_suspend waiters
      wifi: ath10k: bound recovery time before entering WEDGED
      wifi: ath10k: check the recovery deadline on its own timeline
      wifi: ath10k: hard-block the radio when entering WEDGED state
      wifi: ath10k: remove now-unused driver_recovery completion
      wifi: ath10k: trigger recovery on PCIe MMIO wake-up failures

 drivers/net/wireless/ath/ath10k/core.c | 136 ++++++++++++++++++++++-----------
 drivers/net/wireless/ath/ath10k/core.h |  13 +++-
 drivers/net/wireless/ath/ath10k/mac.c  |   6 +-
 drivers/net/wireless/ath/ath10k/pci.c  |  27 +++++++
 drivers/net/wireless/ath/ath10k/snoc.c |   8 +-
 5 files changed, 135 insertions(+), 55 deletions(-)
---
base-commit: 10cfa109c880092df32e396647b4afdca9be8350
change-id: 20260923-10k-sdio-crash-8d2d8e7509d3

Best regards,
--  
Kang Yang <kang.yang@oss.qualcomm.com>


