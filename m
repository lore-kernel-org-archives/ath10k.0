Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD5105D992
	for <ath10k@archiver.kernel.org>; Wed,  8 Apr 2026 01:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=; b=mOkfx0N0iS0yEkVS0ki9dJYVom
	4U1mu0QCbJjs6Jvzc/yCpQg2v9/cutJwGarA52LMBcIy1g9nLGvfm5zrSvX/LbiUE0pZlYJrsXRSw
	CGi5MMsQMD7oIyXPIkw4+yTjCfkN1maZfu5pWwerRlAqYiuUCNR7cmbnYvdywBT9qGHbhGZeK80hf
	eY87+Dx56khvxAz73EnjfvdZU2cMvNyXncFO8po8ESitEBIaQgOcwDIymo87nK2kl4O46hvQe41sy
	vUeojDUykpEbnK9utJVOyfosAzX5zxGJw6e5oUXd3iXiWdpdwynCaSwG0zvehovVSwpuqO09JbflO
	LxfYlX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI55-000000086eO-0M5f;
	Wed, 08 Apr 2026 01:51:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAI51-000000086ct-218a
	for ath10k@lists.infradead.org;
	Wed, 08 Apr 2026 01:51:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637J8DZR3362962
	for <ath10k@lists.infradead.org>; Wed, 8 Apr 2026 01:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=o5QbSAw7nIknHBwFapVmOK
	/Fh4hNDuSq1LL4DtnwsO8=; b=nuykG9vC6NuaBHj/cDAqarRqsDeR8cd1+o5LuN
	EPWjf8t/iL2VGWAWaVw+0gJKeRVFgvE3KExRF87sa3WYZPfp4s0MHjwcUZIK1/0m
	v30kjBMOegQoL7SvdB+Nh/ec4+iy9O/3joL3GfQgE7yGTSrDIiQMiCI09DxTaFMK
	XEJ+1blKTyD/AY4RAGb4Jr55hkN49Tirk/G1imCqH/7xrr/Q4xJAhlC4MqU2YEzW
	rinlz8ULcrReDR++BSgxRAgnmUKoE9hIuZnWhbOX2+05DaJfkQViUdj1ZSXqHVAz
	Oi+VMi4dnW1SqLXaLw+kMPWV7GRqOUtawI0zFQvgI5CjXODg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tkh1eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 08 Apr 2026 01:51:43 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c4cfe08c9dso28729963eec.1
        for <ath10k@lists.infradead.org>; Tue, 07 Apr 2026 18:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775613102; x=1776217902; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=;
        b=PwuncTlpPAcb3IyfOrlOKxfAQrAYyEatZBZ04YzbFU6RXKepPoEmiiNnrE5Mwcq6fs
         YP1nVH8+ymyhrlKbMP6geRZv0cdmB135G9Dw5qTezPbpJn4nMgE1SBGbmkBVu2H+1V27
         NoN53TSJX37ZojUDhQTCrCUgoQj1iLlVn51PsZ5fpnW0/nFl0XLiM58N1kSJSgtfhfgV
         X0/tnHfz3/hACzUnQJe6uGDYTL7VMvlfaK/cSDQbMA03PXptzg9CuOI3u2w41MG+eGpM
         QxejGWO9By8fp6YJgdua5mCNf0wc44qUCX78bcYdnykjklu9ZTjwQH6cPbmyhlFwVLJ6
         4YVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775613102; x=1776217902;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5QbSAw7nIknHBwFapVmOK/Fh4hNDuSq1LL4DtnwsO8=;
        b=Z65i34xN7DN0UwuE8agCiP79wQ5LfcxUpMFyPhWXmqlLPMNNXdl6ZWqMjAT2VVfhZq
         0zBfAU74THDaUUJfOWR9RwqzYe2jgv9VVxpDgt6zoBl/ZG6sWD0PAVc05MDtCqgwnRUW
         19h7suzpZIUv9l+oR9AEn8WUqGjRzzkFAeGC1NsoZZsGJYWtEvuoI0BXIuHHi8CGwdCd
         kpF6b+KPX7bRZIB/Jl6W1+WtGUpeZSHqOomLnQxUPaA/4RR+YhWv3gkieD6cBeRFmovy
         fZMLzu0RCpjdwrSNQD4yQ8oFtbb9C4YDqmzixQ9uk9hp3NItrelxI7qXGwAmzTlKPz9t
         hw5w==
X-Gm-Message-State: AOJu0YxnBre0dZrCRCIfDQxEMg8uwy4V9AYr1IvhvYXHEV9oImTBho1n
	hYqJtCW0I48O1QqFedmsSSWUeQPomy1AVVdL8MeJ8CU+x2TklyiKCfRoSBxjXcY5LcZNtvFOSVP
	UFo4U+3K/Vc20TH7g7OxdOZW1Oe5wgHZCKhReiUFhitMctwsCWlfDV1sklMvjv8MKjsEvzYqa
X-Gm-Gg: AeBDiesUrng955w6xExW5UBr4iB68zzuZzIsGvs/24TF5dgJJ2NYadLwZT9dwQMEsfV
	6/NSfHA0ALBZD54lKLU1Xu0AIv8T3oFPM547TPjg34DB8zvSq96orCryeWj+hDvcbNXT0djpIPT
	uny+NcmYK2WwBVeXpMvPZ9DWJvZ/G+jKnsE0x7d5I04o9HoChfWDB5kfMyv7F8ZXvI24NEn/uD+
	RN/XWVBhcyTAlwgSZ8EOq2Jnb4KA/BgiLQyGEZQGL+8xoAZhewbuuNxpG7VPmmiBbL5S3J4Jc12
	NtsE7e5mRVZi+yWb/FAXDBEDoSmnDea+eT9tacvIi6OdQqjSQ0eCiDD2Whux0bk9BMH4HSeCsQm
	RJ5ciOdf29qzKI/rA2KZguw9IDg3KVqHLr41jlUUpPHaQGq7cAzFYIHmZ6w==
X-Received: by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2cbfc365473mr10151493eec.28.1775613101798;
        Tue, 07 Apr 2026 18:51:41 -0700 (PDT)
X-Received: by 2002:a05:7301:1688:b0:2c6:cdb3:bd5e with SMTP id 5a478bee46e88-2cbfc365473mr10151474eec.28.1775613101281;
        Tue, 07 Apr 2026 18:51:41 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2cb4a7cdbsm2749615eec.19.2026.04.07.18.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 18:51:40 -0700 (PDT)
Message-ID: <5af2dde5-a1d2-4c72-bbed-f0a2ef4b9788@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 18:51:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260407
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=drPrzVg4 c=1 sm=1 tr=0 ts=69d5b4af cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=6cTdqrwTxAmorz-Q3qcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: AG0lxw_uQYhUoNI-sH1cw6twuihHDPGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAxNSBTYWx0ZWRfX3+hgBLzizD4k
 fjz9ZOxGrVHMMu/quScQpGKjp8sc5nvq3BlgH9wrtzsQUBb52ZMif6GzuA0wILkJ42tGucmNT4u
 zd9yjBoKJSBmIC4osiitY+OS8qcJv5oHnk7Xq+60DaO3Yt3ji3qfRYQBjV2zGUAa67+NLZkM/Tp
 PM8xybryeqCx2LqTdT40GfUlOUSD/wzhx41gMIQwASryBf0fc6tZvr779tYGXsVN9fOJKUrAI5V
 Ta8fg18Fe+iP9zBdoIPJLf4P30BZZJhA72EjknGyknw/5lUUiiwCV+DSd6vFEKS2F8ayUtOsbh/
 KwFzjbPaPWbzxQaXkB067iowdJSHQtqGQOuuXYSOh7fn4Q1rh046kqxY+vDTrZIMITdFrXcEAFq
 bS1a0XyQxIRoUGaVpKf1QCUMkle6KkAbxu/bRZ3F/SMqw0t4g2PSZNn6DifBA4C6PPf7AuGqzmV
 CoC/1FdQBMNIwb/iSNg==
X-Proofpoint-GUID: AG0lxw_uQYhUoNI-sH1cw6twuihHDPGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_01,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_185143_521644_3AD44096 
X-CRM114-Status: UNSURE (   9.81  )
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

The following changes since commit aa5e9884a2d63aa20fc3396d369382c1ecd16109:

  Merge tag 'rtw-next-2026-04-02' of https://github.com/pkshih/rtw into wireless-next (2026-04-07 16:20:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260407

for you to fetch changes up to 8fb66931fe31094aa2e1b2a5c015050b8b4cb2ec:

  wifi: ath12k: Enable IPQ5424 WiFi device support (2026-04-07 17:28:22 -0700)

----------------------------------------------------------------
ath.git patches for v7.1 (PR #3)

Add ath12k support for IPQ5424.

And of course there is the usual set of cleanups and bug fixes touching
the ath10k and ath12k drivers.

----------------------------------------------------------------
Avula Sri Charan (1):
      wifi: ath12k: Skip adding inactive partner vdev info

Baochen Qiang (1):
      wifi: ath10k: fix station lookup failure during disconnect

Harish Rachakonda (1):
      wifi: ath12k: Support channel change stats

Raj Kumar Bhagat (2):
      dt-bindings: net: wireless: add ath12k wifi device IPQ5424
      wifi: ath12k: add ath12k_hw_version_map entry for IPQ5424

Roopni Devanathan (2):
      wifi: ath12k: Rename hw_link_id to radio_idx in ath12k_ah_to_ar()
      wifi: ath12k: Create symlink for each radio in a wiphy

Saravanakumar Duraisamy (3):
      wifi: ath12k: Add ath12k_hw_params for IPQ5424
      wifi: ath12k: add ath12k_hw_regs for IPQ5424
      wifi: ath12k: Add CE remap hardware parameters for IPQ5424

Sowmiya Sree Elavalagan (1):
      wifi: ath12k: Enable IPQ5424 WiFi device support

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  1 +
 drivers/net/wireless/ath/ath10k/wmi-tlv.c          | 26 +++---
 drivers/net/wireless/ath/ath12k/ahb.c              | 36 ++++----
 drivers/net/wireless/ath/ath12k/ahb.h              |  1 +
 drivers/net/wireless/ath/ath12k/ce.h               | 13 ++-
 drivers/net/wireless/ath/ath12k/core.c             |  4 +-
 drivers/net/wireless/ath/ath12k/core.h             | 13 +--
 drivers/net/wireless/ath/ath12k/debugfs.c          | 29 +++++--
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 72 ++++++++++++++++
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    | 26 ++++++
 drivers/net/wireless/ath/ath12k/mac.c              |  4 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |  8 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  7 ++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  3 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 88 ++++++++++++++++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |  1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 97 +++++++++++++++++++++-
 17 files changed, 383 insertions(+), 46 deletions(-)

