Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD4C44532
	for <ath10k@archiver.kernel.org>; Tue, 21 Jul 2026 23:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=; b=go4CPCIdY+XtryVdkAYeIMd+nm
	yQ60VbFUPDnLvCD5lhmbBEtXCPQ/qdN+Obt1u+6rdUTtlWo8gR6omN9bheTMcJYtfKgNUhKp4hRR7
	KQ4VAQOYZtPcfLlLfcNacaXzsmg4aTUqM9+fJZNZZc2HohVQ1j9ZAaA1KnuCCel01NanakO/41kU4
	l+GM4Gj4GWVnz2HhZxcg7QkMP5ixrtmT5OywBlAS3q3BbGRwSa5s32R9hYOg3t6R1BbybgadtUtq2
	Nt7ejORqX0LdgRCgM8HmD3J+ejiwqtRVeXJ995Zlh5ON7gs1OSJpCHb3jt7GvZYQEStK59v33A157
	0UCDPTMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKAi-0000000Abra-3hct;
	Tue, 21 Jul 2026 23:46:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmKAe-0000000Abpn-3zt9
	for ath10k@lists.infradead.org;
	Tue, 21 Jul 2026 23:46:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZZSx3196632
	for <ath10k@lists.infradead.org>; Tue, 21 Jul 2026 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zwbc3ZwNB95OyYbvd9mIfm
	FmpdIbDNip3CDUKn9MSPY=; b=b9osd8YlwiBsSsIMn/kZwdZFVq2e+l4AADReWC
	gK6o9FNwnZ7PgnDxJHC3f0inf+o2FfwFYlp7mNQHfoT+K9ukHDEGPwqCweDABEWe
	9Hcgq08WI2PaQ3bThQ03TCHLzqkOfFxm7EuqKcl/Vd2eRsIgPR/9otVRIPhQfksz
	Okxy5wcybr5781sgN5KAse7j5nx4zlx8aK8QQOlzWgfzTNOfAxR5eATvgjBMjbE4
	qR+QEwSbBdTwQimkpIxGu8ghG4OGTnCCDrNhUoZOCvKOW9nTrxwUFlQlxlzC4gWg
	/c41dNPZrm6cLHr/+HpGtwCjxi6r7h6cUd/iN0CC5eDlLvBQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6863hsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 21 Jul 2026 23:46:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so5078952a12.3
        for <ath10k@lists.infradead.org>; Tue, 21 Jul 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784677603; x=1785282403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=;
        b=AakNKfG2+FWQ8KhWDZreFXy3gsaub0Q1/fwcK5DY3ywa5D9uqkF/LwN/Gsf3xyePtu
         YLNR3CoKp4W4WlB0qqEliHcpS0s7awjSDRKKGZA3Sjco9BMOzsHu+EYaGW5oHC4Khg56
         ii/H5c2xQoxuwygS5asm66ray+T3enKpT15iJYgNZLgacafFxhRuoy27MgTDyscW0i0l
         3RA7Nw1nDEfgWJEs/CSUX5U0L7oR8vvn5YsehJRu3oxtGalvsAb9LsstSdKfIw6G7Fb0
         mWDpVe//EDsMM4MWReiYf6MqIeqSJzfvW1nBBYyA9l3e932DLmJkStx8xQhzgbxRcIPb
         mA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784677603; x=1785282403;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zwbc3ZwNB95OyYbvd9mIfmFmpdIbDNip3CDUKn9MSPY=;
        b=qhdbNSCzkIJcWGYlaofvi6jQM6147fY315wjglE/cYEinj9mAbZo8dyBWztNJm3l0l
         lwzStaf1cEG7y6fOMK5zeXFPAYC0InFrGOLxr/nFjS1ridhkkEcuuRQ4UivbrdtspwKs
         hfJ4Fgbb9VSDFEM1gkbmjdK0yelUVA87wb6nI9cfRmnzZ4WX+0MIq23g5seayjw5IzY/
         z78MkydP3zAOLzZWL4RAfRCI3Cx0UH7my6vGHzGx20NOsdhxmuKUycUZ5BbrsBjdwBDE
         +GPAGpLXEYad2reJimSEsT99pW48GI1sBkmn5Iccrk/gWbnsqvdmSRBVtkrDuKm8d6C2
         Q83Q==
X-Gm-Message-State: AOJu0YyJKngJuNaTu5qQy0S7wa800Dr9SR2bc1yXvUyZ47ZDx9mSBF5d
	j3qGAgT5jcgtMiwZ/51r/WoYk2Ey9ygr7KMqjDVH7e3Pom/lClaKFA5yNB8tpwCfo5lbOFm+0pW
	tqfWw6c808fDH1LSDxYBuuQ8t24yrbbN9bFoo4fJR4f0wCfJmmyD5YVaEaNtvsckg
X-Gm-Gg: AR+sD13j8hbizUsq4JPcJfE24Az9Bw5rRLKXMlQuqI9Z4wTVd4JzaYygy0k568VFoKR
	Cv1cZolG3JebfMoTyuQomas2EZ9IrODHzpPKKk8PS6wuH/7Q9Odgq9AFp9CPnAP1nut139f9xII
	ecystOoel0pF6/rypYAmpqN/KHB23+EGBTjx3agU0CyIki1LCEzMof0MsBD8jm12HFusDib073H
	47ZnRw+oZDU2Z+CvGOaoQnIXqRwtRM1vXEKRbAqeH53JPQ4VfrnjvAH6rnNmf7/ZoZuvOTfCZ5N
	NKmbaRa69Zv1uzUwHGEo9fNj68AAYadYD2+gSWwct1izlUiYzU318iaN7czaZ6t9P5EdfZdBS8O
	nRR138nDlssgaQ/6YA3feIrHHm6+lbQOWMGks
X-Received: by 2002:a05:6a21:2d4b:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c3ad9d1b96mr22906806637.45.1784677602610;
        Tue, 21 Jul 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d4b:b0:3b4:85db:1bed with SMTP id adf61e73a8af0-3c3ad9d1b96mr22906781637.45.1784677602134;
        Tue, 21 Jul 2026 16:46:42 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm2503310eec.25.2026.07.21.16.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 16:46:41 -0700 (PDT)
Message-ID: <f73b76bb-dc27-42d0-8e47-b617eec766a6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 16:46:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260721
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDI0NSBTYWx0ZWRfX2+/RySu8/JBO
 SVZ6HPUvA6Z5ngxHxaGUk7wdawM3mL/LzyGobyoQaeVo7hnoJgnpsz1SibjPAUpSAQM+bg+DBMV
 mFbi7wkyflt9nNNpSW7+U03yIqtlhms=
X-Proofpoint-ORIG-GUID: RmWMikQ-DpDByeLqeNlYMTNJkrTJaZQp
X-Proofpoint-GUID: RmWMikQ-DpDByeLqeNlYMTNJkrTJaZQp
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a6004e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=h0gdpq4wJxyY6LqPCyoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDI0NSBTYWx0ZWRfXyLPk9SifyQc3
 dOV5iZYEGczBRfgeO6FumTOP8WF1WxkDPIKUuTB21ni3gXlGzdtUBKWjfMMjeG/5cvRxfwySqPi
 Oe3c0vKV6PP8T6WxZ7yy1UcV+hYioLXAf5+NZWHHhA6x1c6y/zc3aiT3zmXFQwNjg89S2Jup0bE
 aNf2qKJ3cNzLb8f/iM59aFvPngQoJTuk2WTE0AgzY58Jie8NbzaJsg4CksWWEDoEbqCMhtgZ3Dv
 xTUfEdBgsqsUdtUA5z0PgS3AGBh0fSvciup5Bate/Hm5OKC7Io34XVW3oXfUmGO7vvAWD3AoROS
 uhVynC4zczoMDOau/+S7Uo8KEKgczwO+JNURi+rIa+GyCp8KuIjChHyU8uNLJg49XuXR90teIPO
 6+kK2s+XQMAYZQezXv6uxYtsv8dnc+sxOcMHI2X09C8Ku8q5YIcsdt1NUro+59+QK0mHzs/43Jk
 p+aMYO/Ys4NBcBstQXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210245
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_164645_125120_CB138E3D 
X-CRM114-Status: GOOD (  16.08  )
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260721

for you to fetch changes up to ca27e3c2284a7a43ba390ed5ce0d68b3c869c0ce:

  wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table (2026-07-21 13:00:02 -0700)

----------------------------------------------------------------
ath.git patches for v7.3 (PR #1)

There has been quite a bit of activity across the ath drivers.

Significant changes in ath12k include:
Align with new Qualcomm generic Peripheral Authentication Service (PAS).
Ongoing infrastructure changes to support the QCC2072 platform.
Ongoing infrastructure changes to support the IPQ5332 platform.
Enhance datapath statistics.
Tuning of datapath parameters.

In addition, an assortment of cleanups and minor bug fixes across ath6kl,
ath10k, ath11k, ath12k, and carl9170.

----------------------------------------------------------------

NOTE TO UPSTREAM MAINTAINERS
This PR includes the merge of an immutable branch from the qcom tree
https://lore.kernel.org/all/178362521364.2422497.1305957434056184382.b4-ty@kernel.org/

----------------------------------------------------------------
Aaradhana Sahu (8):
      wifi: ath12k: remove unused QMI definitions
      wifi: ath12k: expand UserPD ID mask to support up to 8 PDs
      wifi: ath12k: correct monitor destination ring size
      wifi: ath12k: add QMI capability negotiation for dynamic memory mode
      wifi: ath12k: update IPQ5332 BDF address offset
      wifi: ath12k: switch to name-based reserved memory lookup
      wifi: ath12k: refactor QMI memory assignment
      wifi: ath12k: allocate HOST_DDR and BDF regions after Q6 RO region

Aishwarya R (1):
      wifi: ath12k: reset REOQ LUT addresses before firmware stop

Alexander Wilhelm (1):
      wifi: ath12k: fix scan command endianness on big endian

Baochen Qiang (3):
      wifi: ath12k: fix dp_link_peer dangling references on AP vdev rollback
      wifi: ath12k: fix MLO peer delete race
      wifi: ath11k: cap out-of-range rx MCS instead of leaving bogus rate

Christophe JAILLET (2):
      wifi: ath12k: Constify struct ath12k_dp_arch_ops
      wifi: ath6kl: Constify struct cfg80211_ops

Daizhuang Bai (1):
      wifi: ath12k: Set DTIM policy to stick mode for station interface

Hangtian Zhu (2):
      genirq: export irq_can_set_affinity() for module drivers
      wifi: ath12k: enable threaded NAPI when DP IRQ affinity is unavailable

Jeff Johnson (7):
      Merge qcom PAS TZ service series (20260702115835.167602-2-sumit.garg@kernel.org)
      wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style issues
      wifi: ath6kl: avoid buffer overreads in WMI event handlers
      wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath12k: Avoid buffer overread in ath12k_wmi_op_rx()
      wifi: ath11k: Avoid buffer overread in ath11k_wmi_tlv_op_rx()

Krzysztof Kozlowski (1):
      wifi: ath10k: Drop redundant NULL check on devm_clk_get()

Manikanta Pubbisetty (1):
      wifi: ath10k: trigger hardware recovery upon rx failures

Manish Dharanenthiran (1):
      wifi: ath12k: advertise ieee_link_id in vdev start MLO params

Masi Osmani (3):
      wifi: carl9170: mac80211: document spatial multiplexing power save handler
      wifi: carl9170: rx: track PHY errors via debugfs
      wifi: carl9170: cmd: downgrade transient register I/O errors to wiphy_dbg

Matthew Leach (1):
      wifi: ath12k: fix survey indexing across bands

Miaoqing Pan (7):
      wifi: ath12k: fix TLV32 length mask
      wifi: ath12k: refactor HAL TLV32/64 decode helpers
      wifi: ath12k: add HAL ops for monitor TLV header decode and alignment
      wifi: ath12k: add dp_mon support 32-bit TLV headers
      wifi: ath12k: tighten RX monitor TLV bounds check
      wifi: ath12k: fix ML-STA authentication timeout on QCC2072
      wifi: ath11k: add purwa-iot-evk and qcs6490-rb3gen2 to usecase firmware table

Nicolas Escande (1):
      wifi: ath12k: avoid setting 320MHz support on non 6GHz band

Pengpeng Hou (1):
      wifi: ath11k: validate regulatory capability phy_id

Raj Kumar Bhagat (2):
      wifi: ath12k: Fix inconsistencies in struct qmi_elem_info initializers
      wifi: ath12k: use %u for unsigned variables in QMI debug logs

Sreeramya Soratkal (3):
      wifi: ath12k: Use runtime device count in dp stats display
      wifi: ath12k: Add timestamp to dp stats display
      wifi: ath12k: Show per-radio center freq in dp stats

Sumit Garg (5):
      firmware: qcom: Add a generic PAS service
      firmware: qcom_scm: Migrate to generic PAS service
      firmware: qcom: Add a PAS TEE service
      MAINTAINERS: Add maintainer entry for Qualcomm PAS TZ service
      wifi: ath12k: Switch to generic PAS TZ APIs

Sushant Butta (2):
      wifi: ath12k: Skip setting RX_FLAG_8023 for Ethernet-II (DIX) frames in monitor mode
      wifi: ath12k: Skip peer link info update in rx_status for monitor MSDUs

Tamizh Chelvam Raja (2):
      wifi: ath12k: Advertise multicast Ethernet encapsulation offload support
      wifi: ath12k: Set IEEE80211_OFFLOAD_ENCAP_4ADDR after tx_encap_type vdev param

Thiraviyam Mariyappan (2):
      wifi: ath12k: Reduce RX SRNG interrupt timer threshold to 200us
      wifi: ath12k: Set congestion control max MSDU count

Wei Zhang (1):
      wifi: ath12k: fix rx_mpdu_start layout for QCC2072

Yingying Tang (1):
      wifi: ath12k: change MAC buffer ring size to 4096

 MAINTAINERS                                        |   9 +
 drivers/firmware/qcom/Kconfig                      |  22 +-
 drivers/firmware/qcom/Makefile                     |   2 +
 drivers/firmware/qcom/qcom_pas.c                   | 298 +++++++++++++
 drivers/firmware/qcom/qcom_pas.h                   |  50 +++
 drivers/firmware/qcom/qcom_pas_tee.c               | 479 +++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   | 335 +++++++-------
 drivers/net/wireless/ath/ath10k/ahb.c              |  12 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |   6 +-
 drivers/net/wireless/ath/ath11k/core.c             |   4 +-
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  30 +-
 drivers/net/wireless/ath/ath11k/wmi.c              |  16 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |   2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  29 +-
 drivers/net/wireless/ath/ath12k/ahb.h              |   2 +-
 drivers/net/wireless/ath/ath12k/core.c             |  34 +-
 drivers/net/wireless/ath/ath12k/core.h             |  13 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |  14 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  14 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   5 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  70 +--
 drivers/net/wireless/ath/ath12k/dp_mon.h           |   4 +-
 drivers/net/wireless/ath/ath12k/hal.c              |  42 +-
 drivers/net/wireless/ath/ath12k/hal.h              |  15 +-
 drivers/net/wireless/ath/ath12k/hw.h               |   1 +
 drivers/net/wireless/ath/ath12k/mac.c              |  96 +++--
 drivers/net/wireless/ath/ath12k/pci.c              |  12 +-
 drivers/net/wireless/ath/ath12k/peer.c             | 130 ++++--
 drivers/net/wireless/ath/ath12k/peer.h             |  14 +-
 drivers/net/wireless/ath/ath12k/qmi.c              | 429 +++++++++---------
 drivers/net/wireless/ath/ath12k/qmi.h              |  34 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp.c         |   2 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  66 ++-
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |   4 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  13 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx_desc.h    |  34 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  13 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  73 +++-
 drivers/net/wireless/ath/ath12k/wmi.c              | 165 ++++---
 drivers/net/wireless/ath/ath12k/wmi.h              |  26 ++
 drivers/net/wireless/ath/ath6kl/cfg80211.c         |   2 +-
 drivers/net/wireless/ath/ath6kl/wmi.c              |  17 +-
 drivers/net/wireless/ath/carl9170/carl9170.h       |   1 +
 drivers/net/wireless/ath/carl9170/cmd.c            |   4 +-
 drivers/net/wireless/ath/carl9170/debug.c          |   2 +
 drivers/net/wireless/ath/carl9170/main.c           |   8 +-
 drivers/net/wireless/ath/carl9170/rx.c             |   4 +-
 include/linux/firmware/qcom/qcom_pas.h             |  43 ++
 kernel/irq/manage.c                                |   1 +
 49 files changed, 1926 insertions(+), 775 deletions(-)
 create mode 100644 drivers/firmware/qcom/qcom_pas.c
 create mode 100644 drivers/firmware/qcom/qcom_pas.h
 create mode 100644 drivers/firmware/qcom/qcom_pas_tee.c
 create mode 100644 include/linux/firmware/qcom/qcom_pas.h

