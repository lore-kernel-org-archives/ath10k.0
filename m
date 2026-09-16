Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DD8C982C4
	for <ath10k@archiver.kernel.org>; Wed, 16 Sep 2026 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=; b=y2oQwgAofREEicWQRepQbtSb7Y
	ETVO0GY9Epz8fXaKsPnnbF5JfNpQHWX5y2p5uM1n6/KvhbICI6pd0kkApVm0vuFGQh0cWjwGSQTBC
	G2Oq/qd5P+aVQC1MvFWXrhkQDdcPvokwyAH207T6t7f5JrsqaN78SEvolmiPo7kuOXdGjokVci8MH
	5MtoaSsX31Mb7XUN44X5k09ayJhm3DfFmB4cIfih/MHR8uu9hAOfwvnj/bqnZjfHkKav7bsnU9El3
	gr6SHzX2s92GI5sQ5UgXwb+efV6stXEB8vs4GMfTRPcdlAqypn5sboL2ZVbRvgNmrJi8HzQXqpoZO
	v1+GnztA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjG-00000009R0U-44FG;
	Wed, 16 Sep 2026 14:35:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjB-00000009QxJ-2LvI
	for ath10k@lists.infradead.org;
	Wed, 16 Sep 2026 14:35:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYhO23079370
	for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tK73FQp1Mf4ROUthjYwNJv
	g6RzgXr9daOQTchTpQz0Y=; b=L0nQhZkF76DbWVUbzThVh8vB7xUgbcm0FtGT/a
	rxlY1dSRPIUll5FY2PqxadXEkiCERctY65OxkZZUdACWNKpv/4GGVilCFPGiz+C/
	RwfqYUrYQ7wIeYMm7UnM3l72YIVjb/aeUOA2ZM91wqDfkMvykSkgqpyozJNhC7gz
	EnSHDx0P8Hhw+Ejv8nYrwTKqhkwgzTxC0nHGJY9FBwj61OOb6QHlKVD8JeGd6DSK
	nX/SRhPO9HpWZ/jpz7aqgb14tKWaREcF6kNUq0gaQg7hqxdkJYVXIhkz0UibmTm+
	vaKqVcizSf5bgONd1Zu6gYWYy5lhKC7DJli31FefwN9dUQSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywbqka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so88167875ad.3
        for <ath10k@lists.infradead.org>; Wed, 16 Sep 2026 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569312; x=1790174112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=e6YnLtmpdh4gl0Qa5Cj1SGm1nCgqpT/tSefoIxYdpb7iZnF5W2CG+OJl8IL7lvjSxo
         5I6jkwPvio1P1mOorppsBkrUQ353HD3Q57ygXSuCwfIDm7PLNNZcmWVio3yf1zhVkKqT
         IBhNrpP89IZtl8AqLKZzR0tP+GvouP8NpBjgAlIz/XxaROnIHuxBdFf70Kk9bjUDhZAN
         z3NZLlKJalDowiM8Ybk6/ska0/sSAiKMJlqwEP7DJvcmXB3LxgkTWso1eK/wQ/KN8BEK
         9NkEuZsT16BY9tvp9S8pWvYHL4B7XWosLF3vWArPx4/926nBlS8o3jrvCVKu5BQXceqq
         xM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569312; x=1790174112;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=wuhFctFcwqgG8/qtry86vd6KDwockGmaelUISV0TmwtWfy9b1dA7C/aBxNyLlhSjqs
         h+fdGcgm9FeYX9vBupbmv6PRxJtT701Q5JLHJLr/sJFALZxzlMYrpoet+bfKxplAPASp
         egW0ZBLKcHUuJ+eQId0PS2IbrS7mlW74uMbpqxEDT4cZocnR7HT2X1vRSJZOTwVDGKJu
         8B668heFYxb6wa1GvTQ6ic4rAZivWeEtdX4y5f2z8nw+G2hh2DNahyFd+CvSHM7myVzL
         NJhcepAdDG/iOQDIpwJcr1VaeoYFNNeXGl5W698vRB88fsVRqSKKhrOQ+wR76qqqiAp9
         DIJQ==
X-Gm-Message-State: AFuF++m9UHQBW+iS6g1/kPriyEd6ehPApurp81VMOimOBTDAkkWtn2k8
	3+KwJfJXoKoAfYjs0gqeYS+c6+Pih3nIBiMXgftYTRA2nI5IgluCh8c+hT0cS50gkbVxhif0Aq5
	8nNr88pJZrVDX4h7BQ+WDwvYQzlzpwwxos2mxswhBC/3ElPt/mxHatH6PayqJNlxvdMnMTplu
X-Gm-Gg: AYBFou0yZ0gLN4l8fKK8YH3hQZnECeQyu1kAsgCq00wEZ0CROE0mpjJLXJ5m3SedMcd
	k0lhbF5BrnmvEvc4w0rZ6g//Ov0jjDa33L34ANYRJDyFZxldtNJExZZse1itMiPWgWCUt/BwMOq
	rwZU9hacGt9s6tKAOu/YKcsdjmCTLkfO5Bl4GOnhHYA9UIuBA1Wpzuj6lIYCi9hB4qB10uXcSn+
	E60LDFZjaoYcJ2Bn8wsemJHZnM9cPcQ4mD2euz3kUaWBWeBKztC8qXyzQqiHX6ZlYLKVxyLFD5K
	TwPAFt4INoEt2KKi+Eujct+biMKBNLnvBKxGQ+Tvon26qGXx2XPsyHQ8jI2zNR29Wa1ZvDEq0sP
	rH7LldadwRRkmraT2cyB0BbOb8WCqQNSJOBnZ
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216685ad.0.1789569312192;
        Wed, 16 Sep 2026 07:35:12 -0700 (PDT)
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216005ad.0.1789569311628;
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb7496sm13023775ad.38.2026.09.16.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Message-ID: <ee7037be-6cc1-4bca-b732-42130483f469@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:35:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260916
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YBcO_4NNNzzHX5_9kg2fJz9c1w55I57I
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaaa921 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7zb2UhBhSU3A8DwyPNsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfX5Y0/MFMzQirq
 mip9Dkt/ylzmM4NxsFMTSLwX+NkXRMw5V8mDzfymNciojwJROokeE79x7oOaBQiJY+M/FrnPeJi
 D4UmaNV1j4ioWsDxMpdaD/vspMGQQhusYuE0+9aKfGbo5ImRU+KjrcFt11/k4aNAuKB8eZN0WAN
 MEN9l7yS/J+1oIVm++m4U560kF1WcqfmuRU8hWgiDm0Vnm10a+riP4zHXkyRgxnx9ZlE3Y1r5Z9
 wJNaZKGMEe0gXkY8A7pwIGVWHbSzR9urNLxvTlDotXvEPp7W40CBysmxWiTp0t3afWB330gB6QW
 jyrm7cdK5ikw86G6bLlV0D8BLAJL4UL0PoIgJYbbYN/vqm1a0r0hPYQ/59/M/aGmio7/bo8VdZn
 P54n3g+fj5gBHjq/VZWjgn8Stis+vu0SUXipK6iP8KqaveYTy3MEGmT5G/J1BmDujrYEkn/c9gd
 yEwLBPwK7uekUfOajcQ==
X-Proofpoint-ORIG-GUID: YBcO_4NNNzzHX5_9kg2fJz9c1w55I57I
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfX0ULoOjYIg+Oh
 X/2eRFzYWDcczfKWdhaROhnLvAqoEQArkWRAGWT33kj49xlOAwBhj7bDMn8EH8CAMOWDYJTnddl
 A74Qy/b65xIQtnCTT1O9vphbj/ebHFE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073514_143907_D67322FB 
X-CRM114-Status: GOOD (  13.58  )
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

The following changes since commit 1b78070aaef63512688aebfbc82365ef9d6660f1:

  Merge tag 'net-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-08-27 13:53:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260916

for you to fetch changes up to c3bace8584ca707e34ba837f65c2e9d566af4c2c:

  wifi: ath12k: add support to load shared firmware on multiPD (2026-09-10 14:29:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.4 (PR #1)

Add mailmap entries for some Qualcomm Wi-Fi developers now using
@oss.qualcomm.com credentials.

For ath12, add support for the qcom,calibration-variant Device Tree
property and add more infrastructure for the IPQ5332 platform.

Other than that, just an assortment of cleanups and minor bug fixes across
the "ath" family of drivers that aren't urgent enough to go through the
"current" process.

----------------------------------------------------------------
Aaradhana Sahu (4):
      mailmap: add entries for Aaradhana Sahu
      wifi: ath12k: Free allocated CE IRQs on request_irq() failure
      wifi: ath12k: Free allocated external IRQs on request_irq() failure
      wifi: ath12k: add support to load shared firmware on multiPD

Abdun Nihaal (1):
      wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()

Andrew LaMarche (2):
      wifi: ath12k: support calibration-variant from device tree
      dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant

Baochen Qiang (8):
      wifi: ath12k: signal regd update completion when reg event is dropped
      wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
      wifi: ath12k: protect new_alpha2 access with base_lock
      wifi: ath12k: skip setting country code during registration when unchanged
      mailmap: add entries for Baochen Qiang
      wifi: ath12k: use kernel types instead of userspace stdint types
      wifi: ath12k: fix stale skb pointers after aligned TX payload shift
      wifi: ath12k: fix truncated TX buffer DMA address in MSDU ext descriptor

Jeff Johnson (2):
      wifi: ath12k: remove skb->data check in ath12k_wmi_process_tpc_stats()
      wifi: ath9k: use rcu_dereference_bh() for sta->rates in ath_merge_ratetbl()

Julius Bairaktaris (2):
      wifi: ath11k: implement CE interrupt enable/disable for AHB
      wifi: ath11k: disable interrupts during firmware crash recovery

Kamil Bienkiewicz (1):
      wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332

Kang Yang (1):
      wifi: ath12k: preserve PPDU state across monitor status buffers

Linkai Gong (1):
      wifi: ath12k: clear dangling channel pointers on error paths

Manish Dharanenthiran (1):
      mailmap: add entries for Manish Dharanenthiran

Miaoqing Pan (3):
      wifi: ath11k: fix sporadic WLAN initialization failures
      wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
      wifi: ath11k: unregister PM notifier on QMI init failure path

Mikhail Lobanov (1):
      wifi: ath11k: modify null check logic in ath11k_ce_rx_post_pipe()

Nicolas Escande (1):
      wifi: ath11k: fix locking problem in ath11k_dp_rx_tid_del_func()

Rameshkumar Sundaram (2):
      mailmap: add entries for Rameshkumar Sundaram
      wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry

Sriram R (1):
      mailmap: add entries for Sriram R

Vasanthakumar Thiagarajan (1):
      mailmap: update email address for Vasanthakumar Thiagarajan

 .mailmap                                           |  13 +-
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   7 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   3 +
 drivers/net/wireless/ath/ath11k/ahb.c              |  16 +-
 drivers/net/wireless/ath/ath11k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath11k/core.c             |  10 ++
 drivers/net/wireless/ath/ath11k/dp.c               |   2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  19 ++-
 drivers/net/wireless/ath/ath12k/ahb.c              | 166 ++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/ahb.h              |   9 ++
 drivers/net/wireless/ath/ath12k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath12k/core.c             |  23 +++
 drivers/net/wireless/ath/ath12k/dp.c               |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  45 +++++-
 drivers/net/wireless/ath/ath12k/pci.c              |  55 ++++---
 drivers/net/wireless/ath/ath12k/qmi.c              |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   3 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  23 +--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  17 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c     |   2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |   3 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  16 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |   2 +-
 23 files changed, 346 insertions(+), 98 deletions(-)

