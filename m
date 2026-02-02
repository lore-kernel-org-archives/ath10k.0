Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AED2E7DEEE
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=; b=DS7dz0WvRRifXjN9zkYWru1AXX
	1Gr40vlbXKhAnFlcgBuHVSwLNiKsPLQawUX8h6j2fqRSoytzI526/CKbSspqgtwoBZVTDBBE5m8QU
	JFKAZEx4UDD+nrOefoQW7g6XRHVpYHUiF0mTyk7JDZcN7tKFNO3LytMyspAzckRM9DavEFb1J0Emz
	vmMv0g28aOiZ/eyMsWwVuL/ba9Hz/FgvGncRC3px6ju/9deKPoRq2r0wYmOPrHMH9NEPB71Kf3fRS
	mJ+CcqS/Kit/YbUk7ztLiR8MlPgGrK5v60SzcyTa49jr8pxK3lb7kIgG3f7VT4ROK8sj7Us3dBHTm
	2/Qs97/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmv31-000000056pr-0NGx;
	Mon, 02 Feb 2026 14:37:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmv2x-000000056oT-3dPV
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 14:37:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5RqD3459143
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 14:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eAWb4km5TleWO/t5iavF0a
	Qqzr8+qMuKOS8aZDkQyDU=; b=K03YTCDh88rDSmPGCDsBvsMoc7RhBbElFTVDfZ
	l52z6+FxCIoL283X3IfYkCXGFoM+ul5cMVA5NFz86voYlVvEpYoMIMuEWA7iF2SN
	4ZjH47I0tHAc8doVZhV0OKEGD7NvRLvpG0JOxELNRzb12mXPpgD4tEdCrUVaeCVo
	NpsxHxY8AagL+shDT3hHNjlyWi/BlDS+wbi00wVBn4TaY1/L/pVJJkeYDvDd6Vmt
	uCmI01BbTkvne3wsIaFNxDWa6Fy+bpfWh/CCm7z9mVRayp+AEFeNawVd09oBQ3GK
	2iiZh7xGYlyCZ9lzU8jcHOYqvjRsbZKoweyAi5ysi4d2Sqew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbghyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 14:36:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1233b81a92dso5670181c88.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 06:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770043017; x=1770647817; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=;
        b=SlYJnhXt93EXW6jzgda9PNT/mqvK72z+kFNOFeezmr4VU43AEkmTjGLXuH5oa9XVAd
         ROwMiUai3FEcpQu/xy4v55mJ48xkRQA8bTWoYFQ4iY5eKlwMlLHtQQdlAUviHFoPn+fe
         rQAUdZT4QNIAGZC0lojI0EwqiT7q89NmCawha5lEIkdeukjsuFsu+ld7wAj2GImtZFRq
         s2Ed7F5KAbAjDwGPcIGLjlXbhh2FhuLnTqF+RQG4Nt4v8TPPCG9kcyESmMit6AW5Pi57
         HId7pIJ8ERlVIrcRSp6rFPZ8s95DKCjix/OVH3p6OTRvlTX/GMaQvx44A41dRijwRJOh
         H2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043017; x=1770647817;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eAWb4km5TleWO/t5iavF0aQqzr8+qMuKOS8aZDkQyDU=;
        b=VTzW5wZkFqqD6pp6LR+q239qCv28FXBY/AT07ymnwsPl1cDZe1ZVrFCwk+x1c9jWLy
         lfTG8o5vCHNMIMRh+zWaQueGesWvBXWtCWggoTk4dKNY74R2TZ0gxK4686hyvwccNykz
         Ki/u14+3QMSrNaoJ3ejeCFVtSaWylfBHQdITXx5tLu3Z03pwNqzDlBen4pGxQ4+8iTRT
         ZJc4aTWOy4Xl5AkK/WnA6DHhF6xvLgjREtGaWpxP9jFLHcY3NAmfZN948VAalwOZqZNN
         OEvoVo6U5tBjGZWIpjvIawoy+K87HaIjB9mgGKcr7R2qGBqp9/Dgez7hFxJLT+Lb3e9g
         IWBA==
X-Gm-Message-State: AOJu0Yz9tVgbUe7I7l3Gmief08wQWfZcOjnyVS/9kmz3jVLhyeJUYBBO
	CPmk9e7Q/d6I06z+MBI9WagpyKtKx4kgG4E5PMzLFTc62Eqia6M8X2cJoS0nCCf2Y8OsnBT8QRH
	yCpyszCK78dC5M0lhNUKNgtSLszUXjmb3ZrG9UeVAP7MvcONCWNGVn0A4t1dyi8UtAwjMc0iY
X-Gm-Gg: AZuq6aKpTFCr/fthKKOnXLTuOOQhZHXErF+MyKEQMnCLc1u0IUPt/w1eHrs+HoNQfVF
	bUAZGKty5KQbQRVk+l9Xdsa36k+AbaDQoauk8pI+kNZdFyFUAnSo/xY1jS5p9bs9cuILTSFz/68
	x1gAD24UilSy+E0CyD4AKyCr06Mr9a4f/dv6nkWzbN6FPEKnfUpPCwjRlYqrRb8uJ8HbsP9QQAX
	DYkB9UdeiGfxIXGIM7ezdTx2yPj2Xr9ZWYJQWdjqyzc1QtO++ndIntsaTi2fcnBrPj/Lh1ogFvo
	9/ef/Bvf0MLNqdEmxGqBarAawqbc9gyXcOlEdfhVMcGdwxlFkmMdXjpAThljEh2+2Kf1miRHFL8
	CeGCZrrwwopB9ehsXbq59lFeLYxktQUKPL9kN4rzT3GUaKw==
X-Received: by 2002:a05:7022:2485:b0:119:e569:f86a with SMTP id a92af1059eb24-125c197f8aemr4890413c88.7.1770043017328;
        Mon, 02 Feb 2026 06:36:57 -0800 (PST)
X-Received: by 2002:a05:7022:2485:b0:119:e569:f86a with SMTP id a92af1059eb24-125c197f8aemr4890386c88.7.1770043016725;
        Mon, 02 Feb 2026 06:36:56 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9debe5dsm19571387c88.11.2026.02.02.06.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 06:36:56 -0800 (PST)
Message-ID: <28dfd5c2-9c97-420c-a37e-e43b215799c0@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 06:36:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260202
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _a4T7DoGphIZC9V-ELu8CurdySJGOGtQ
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980b68a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qSke-fb0mpNoTSwYOz8A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: _a4T7DoGphIZC9V-ELu8CurdySJGOGtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDExNSBTYWx0ZWRfX5B2ZCHqP2w6M
 pI2YQU1+ZitgQl7YdCmRMmMQfYlJXhAf+z1EnGG8/ebhKJ0B9njPjNiFuG1pdheED34PdYLqgYO
 hSQvhDcHdv8gvwyFN+EmLwW+vSPfpP96Qt6sk6NxS9mg6L3u8eRH2r9CfQ9OYL94u0ABrgE6Chs
 +8Uc4l5y8WFrC9h4tAjMiLNljze0Np9EaAeztxTyIhmfQGZKTd4EfSuL2hm+mt5LhCyssAOCI2t
 dca/lO8Tj+XszBHyp096xwvGwJZRujUXKRYaohyZZHvyn1IR/CoNaLMfZKDUrzzINR+9MjibtOd
 n04P00QK+f7tLWqtFrlqW/XQhomzlbDgPA529RrjtrTl9oIQWBWou95g5V0JBvQQv4eF1W52+XN
 5Eala8cZoIf5PzoitSIvnL8OT85l8q+gx5xaB/g4YfFtZy8ugXJ+MUuWvRiJKn4PQytiKp1bQON
 m8rZhnwmRZ0nRKPr6IQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_063700_029749_5254F5FE 
X-CRM114-Status: GOOD (  10.05  )
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

The following changes since commit c30e188bd2a886258be5facb970a804d8ef549b5:

  Merge tag 'iwlwifi-next-2026-01-21' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2026-01-27 13:54:12 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260202

for you to fetch changes up to 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9:

  wifi: ath12k: clear stale link mapping of ahvif->links_map (2026-01-30 07:12:38 -0800)

----------------------------------------------------------------
ath.git patches for v6.20/v7.0 (#3)

A set of small features and cleanups for the next merge window.

----------------------------------------------------------------
Aaradhana Sahu (4):
      wifi: ath12k: Fix index decrement when array_len is zero
      wifi: ath12k: Add support RX PDEV stats
      wifi: ath12k: Add support TX hardware queue stats
      wifi: ath12k: clear stale link mapping of ahvif->links_map

Dmitry Baryshkov (1):
      wifi: ath10k: snoc: support powering on the device via pwrseq

Miaoqing Pan (2):
      wifi: ath11k: add usecase firmware handling based on device compatible
      dt-bindings: net: wireless: ath11k-pci: deprecate 'firmware-name' property

Wei Zhang (2):
      wifi: ath12k: add WMI support for spatial reuse parameter configuration
      wifi: ath12k: support OBSS PD configuration for AP mode

Ziyi Guo (2):
      wifi: ath10k: fix lock protection in ath10k_wmi_event_peer_sta_ps_state_chg()
      wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()

 .../bindings/net/wireless/qcom,ath11k-pci.yaml     |   1 +
 drivers/net/wireless/ath/ath10k/sdio.c             |   6 +
 drivers/net/wireless/ath/ath10k/snoc.c             |  53 +++++-
 drivers/net/wireless/ath/ath10k/snoc.h             |   3 +
 drivers/net/wireless/ath/ath10k/wmi.c              |   4 +-
 drivers/net/wireless/ath/ath11k/core.c             |  27 +++
 drivers/net/wireless/ath/ath11k/core.h             |   4 +
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    | 197 ++++++++++++++++++++-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |  81 +++++++++
 drivers/net/wireless/ath/ath12k/mac.c              | 174 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h              |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c              | 142 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h              |  47 +++++
 13 files changed, 730 insertions(+), 12 deletions(-)

