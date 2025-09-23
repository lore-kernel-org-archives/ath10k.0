Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99BFCAC5A7
	for <ath10k@archiver.kernel.org>; Tue, 23 Sep 2025 01:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1JeDdHV5OMjMXXGqdZHluKS1DigxdAJFFXWIOS411Uc=; b=JaBA00YZNB3J+SwKB7rK4M3qR4
	sgNs2SNbifbj4+hVLOVu/ulbeD6dp5FT4afgG55tKcWs0UFvzurWd93lbJwVu1AMrDnCRz2iAG77J
	JLpCnIW2+Kdxi+P/X/BdZ7HWIcOPTg7ueYAN20FB/QReliOGH3YCI5wlcS4pdL6ZejgRAkIABAmKO
	MoYbgS4BpWxqpgEELbj8yypEm3SE7KSmd27s9i5LC/DxPIutZdIhaeY4xBHo5UB/HsxslcT8S/lO9
	QwwP6cElZ3iD+DGIKcl40tc9rUghnSZmXvQpXCBWGYBQemu5Qm/KS1fMCgx4qeWZNmr9Ad6cz9NK0
	D9Q+T/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rli-0000000C0IO-2mVM;
	Tue, 23 Sep 2025 01:24:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0rle-0000000C0Gf-3yOv
	for ath10k@lists.infradead.org;
	Tue, 23 Sep 2025 01:24:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG5wvD007448
	for <ath10k@lists.infradead.org>; Tue, 23 Sep 2025 01:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1JeDdHV5OMjMXXGqdZHluK
	S1DigxdAJFFXWIOS411Uc=; b=m8+EyJsc8pMhq433LzgFis92OjtNP4PJxb3je0
	rucHf71pTa1V0OJkrJ+aHTL40uzMN9zz0HWTO5nxHr3hIqVAM13QmKR9mXodlx//
	J7sU3ENh2os/hlAKPBgLJVlH6tuyHxtY83dV1N3NUuv55Z/HrCRXh7Ym0Zor6hYM
	TiFWtox+76biLOwvqnrFwewsvGlcZC/tTOjpTeqOcHpooJGSnPVFycQ7Asy+8L4T
	aNCrEidOy3VgRrQBMSjiqOg0pQyjmRJx1xfCushhN7mqGG/qoA7UzrzxRBIHqMFk
	lFPkhxXXfpNpKELN9Je01cpbGnOoLS9Ar0KE3kx9y16MOpkQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyepyav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 23 Sep 2025 01:24:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27c62320f16so6423545ad.1
        for <ath10k@lists.infradead.org>; Mon, 22 Sep 2025 18:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758590669; x=1759195469;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1JeDdHV5OMjMXXGqdZHluKS1DigxdAJFFXWIOS411Uc=;
        b=uES0WrJk3dre7iGHj+pXEOGOIofsURHA4yoWukU20XKqVEP4PLECa6MmYDbo3r3SNe
         b7mfR8OQ8GrmV0tJ77Yim30c9scveiglO1IIn4vjXcICNYVXYe5cRUAmjpybEncADV7e
         TT2Qp/sH9Vn1/YufhZAa1fj/xxRGfu392KcdGkvl4Jk8EhuSQSgs5eM13ZW3yQcn/mki
         IwMdCZNJ+AiFsTFUiL/79n5GwPpsgIrQtupzhqtt6TSGx6ZbzzgRjXuZCEzqg3Vuf56Z
         hjqzDvzuukLwXBZ45M7P0cwWyWklDGYcYEKsExHrdNvc+6DsGeffdEOBF1qDM/P6wJfB
         gkGA==
X-Gm-Message-State: AOJu0Yx0E8OJd1UOa4pFHCMtAq3LXidCajPr1U4X1jhLbHeMkRP7vxCk
	t0m8BhEKlIyWE1jqeYRfbhTM/mWMeSUb/qrCoWt/MKHLZC2rwciJTEWfVwK3aEVbRrnya/89EKR
	i1B7zTosRBae0708tIx82pWP1TWeT5hH27OHpKx54xIwtQX4+zsrJ79qaWVUMHSWCyXQ7ZtQq
X-Gm-Gg: ASbGncu6528wBZerV3tZF4ua3yf4tC2S4KTJZ17OpPwIvGsE52PSDuXR8By8yWWZ8Ff
	G2fswp3M0IYdT8RujwljghKKreShZ1gYlIKS5G2zLk6P6KsZ/wfW0fhc59gzpzgl0RL2tBrQFaB
	lEcXytw1MSdMbvGZwbdJNaYsLWggJtZ8Bg5dvWINTyp9/K1ESDKUYSD4xK91chwqRlRwSUfbeV3
	Q6y7g6tETJsu4pxytPHZqJCmAS8VYrttEslQQKmPJteqKRssLQrX8tZjRWCWtctJTJAKvUOVkv6
	qxLSXhvXCPHWBDD5eb6UiWHtOONcOeKMOJwX6aZs1M42s/Syoo/yrZPvHunwENCGU0GPyPx7Mzp
	N
X-Received: by 2002:a17:902:e5cc:b0:273:1516:3ee7 with SMTP id d9443c01a7336-27cc9f5de0emr12493405ad.57.1758590669008;
        Mon, 22 Sep 2025 18:24:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKB1EHuApJ62SDwqDEhEZkHar/JouNGNIFwkq71/fiO4fenMyW2DpihA+6BHZq2wbmOIIZ4A==
X-Received: by 2002:a17:902:e5cc:b0:273:1516:3ee7 with SMTP id d9443c01a7336-27cc9f5de0emr12492935ad.57.1758590668549;
        Mon, 22 Sep 2025 18:24:28 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800530b7sm146509445ad.18.2025.09.22.18.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Sep 2025 18:24:27 -0700 (PDT)
Message-ID: <06c5cda9-6e0b-49ed-beed-ca73f6ce8903@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 18:24:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20250922
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jc0Tya7OgttT_mR17QtGYIslYy_bz_Z4
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d1f6ce cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=l7PpnQ8KDgTFq2VbNpgA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+t9TP9RXYScd
 +HEWWPa4oMvHzHdWnItvJqycV5nETuT6NUtXzQFA3sOu6w7KxADVoqzP/BR8FFzPuZjtbCnnt0J
 6SQjuFoWQZWLgVt1wjVYMjF04xOLACWXZ3L9qIJbASjDrV2kYB9j7+IEQvWb5q8mgbTTzt5fjf+
 yUpoUu8CikWRuGTBrjVpQ1UEXxEoEwym2mzRNHO1/zPZMVZ+eCCxpgK4GeLsGHXsdiHNuWYO3eq
 txHv+JPk7WvDveqU1aS7TcLSvoIOM2w611hZXUVaGvcI5VQYJiplkUeJwVcFwyRN+QJiAPRN2uo
 ilAU4pEh7i0DCqhgdTh0/df5sBbV0x2iFj/mckDXODnpUtg0LhCEK7+QqqV5sCOoBhRolt1Vdkr
 3diaEHl6
X-Proofpoint-ORIG-GUID: jc0Tya7OgttT_mR17QtGYIslYy_bz_Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_182431_002001_643F4975 
X-CRM114-Status: GOOD (  11.73  )
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

The following changes since commit d103f26a5c8599385acb2d2e01dfbaedb00fdc0a:

  Merge tag 'wireless-next-2025-09-11' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2025-09-11 17:50:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250922

for you to fetch changes up to 32be3ca4cf78b309dfe7ba52fe2d7cc3c23c5634:

  wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again (2025-09-22 17:54:33 -0700)

----------------------------------------------------------------
ath.git patches for v6.18

Highlights for some specific drivers include:

ath10k:
Fix connection after GTK rekeying

ath12k:
Fix Issues in REO RX Queue Updates
Handle inactivity STA kickout event

And of course there is the usual set of cleanups and bug fixes across
the entire family of "ath" drivers.

----------------------------------------------------------------
Alexander Wilhelm (1):
      wifi: ath12k: enforce CPU endian format for all QMI data

Arnd Bergmann (1):
      wifi: ath10k: remove gpio number assignment

Arulanbu Balusamy (1):
      wifi: ath12k: Add support to handle reason inactivity STA kickout event for QCN9274/IPQ5332

Baochen Qiang (6):
      wifi: ath12k: initialize eirp_power before use
      wifi: ath12k: fix overflow warning on num_pwr_levels
      wifi: ath11k: downgrade log level for CE buffer enqueue failure
      wifi: ath12k: fix wrong logging ID used for CE
      wifi: ath12k: downgrade log level for CE buffer enqueue failure
      wifi: ath10k: avoid unnecessary wait for service ready message

Hari Chandrakanthan (1):
      wifi: ath12k: Fix peer lookup in ath12k_dp_mon_rx_deliver_msdu()

Kang Yang (3):
      wifi: ath12k: fix signal in radiotap for WCN7850
      wifi: ath12k: fix HAL_PHYRX_COMMON_USER_INFO handling in monitor mode
      wifi: ath12k: fix the fetching of combined rssi

Liao Yuanhong (1):
      wifi: ath11k: Remove redundant semicolon

Lingbo Kong (1):
      wifi: ath12k: report station mode per-chain signal strength

Loic Poulain (1):
      wifi: ath10k: Fix connection after GTK rekeying

Maharaja Kennadyrajan (2):
      wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and RSSI reporting
      wifi: ath12k: Extend beacon miss handling for MLO non-AP STA

Manish Dharanenthiran (2):
      wifi: ath12k: Add Retry Mechanism for REO RX Queue Update Failures
      wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors

Matvey Kovalev (1):
      wifi: ath11k: fix NULL dereference in ath11k_qmi_m3_load()

Muhammad Usama Anjum (1):
      wifi: ath11k: HAL SRNG: don't deinitialize and re-initialize again

Nithyanantham Paramasivam (5):
      wifi: ath12k: Increase DP_REO_CMD_RING_SIZE to 256
      wifi: ath12k: Refactor RX TID deletion handling into helper function
      wifi: ath12k: Refactor RX TID buffer cleanup into helper function
      wifi: ath12k: Refactor REO command to use ath12k_dp_rx_tid_rxq
      wifi: ath12k: Fix flush cache failure during RX queue update

Rob Herring (Arm) (1):
      wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"

Roopni Devanathan (1):
      wifi: ath12k: Add support to set per-radio RTS threshold

Sriram R (1):
      wifi: ath12k: Add fallback for invalid channel number in PHY metadata

 drivers/net/wireless/ath/ath10k/leds.c     |   3 +-
 drivers/net/wireless/ath/ath10k/mac.c      |  12 +-
 drivers/net/wireless/ath/ath10k/snoc.c     |  14 +-
 drivers/net/wireless/ath/ath10k/wmi.c      |  39 ++--
 drivers/net/wireless/ath/ath11k/ahb.c      |  17 +-
 drivers/net/wireless/ath/ath11k/ce.c       |   3 +-
 drivers/net/wireless/ath/ath11k/core.c     |   6 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c    |   1 -
 drivers/net/wireless/ath/ath11k/hal.c      |  16 ++
 drivers/net/wireless/ath/ath11k/hal.h      |   1 +
 drivers/net/wireless/ath/ath11k/qmi.c      |  19 +-
 drivers/net/wireless/ath/ath12k/ce.c       |   5 +-
 drivers/net/wireless/ath/ath12k/core.h     |   7 +-
 drivers/net/wireless/ath/ath12k/debug.h    |   1 +
 drivers/net/wireless/ath/ath12k/dp.c       |   2 +
 drivers/net/wireless/ath/ath12k/dp.h       |  12 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c   |  56 +++--
 drivers/net/wireless/ath/ath12k/dp_rx.c    | 352 +++++++++++++++++++----------
 drivers/net/wireless/ath/ath12k/dp_rx.h    |  18 +-
 drivers/net/wireless/ath/ath12k/hal.h      |   1 +
 drivers/net/wireless/ath/ath12k/hal_desc.h |   1 +
 drivers/net/wireless/ath/ath12k/hal_rx.c   |   3 +
 drivers/net/wireless/ath/ath12k/hal_rx.h   |  12 +-
 drivers/net/wireless/ath/ath12k/mac.c      | 117 +++++++---
 drivers/net/wireless/ath/ath12k/mac.h      |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c      |  24 +-
 drivers/net/wireless/ath/ath12k/qmi.h      |  16 +-
 drivers/net/wireless/ath/ath12k/wmi.c      | 158 +++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h      |  33 ++-
 29 files changed, 669 insertions(+), 283 deletions(-)

