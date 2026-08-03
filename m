Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4928AC55182
	for <ath10k@archiver.kernel.org>; Mon,  3 Aug 2026 20:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=; b=hIekReLSf0WyofftKNC/2mHc71
	JZ04ap81CeqfQbLgyTG40I0uGFnPeZuiejiGaurCaUaN9Dru2SIFUq48i42CcvRBWvV3aQWMCUBjb
	tpho4E8cgxn3rN3jOn8lqssWOGdlSVDmMtRsK1lesA+POrrqKy/R/CdBVLFYXaTEraggHbpUu6HrF
	44vlwI+xcbVYUvbh2wZwNYuKsOwZqHss97kFVtZS5YwEW2T0xaZgr9+8s8uMYTQa0GOLLWHe8TjsF
	+MAeS+xtAlpV5ppHUOEhpsGTIJcNJY0C62f/49l7SFRsHcs0IA4TNMR/lwH/N0d+BO4rSpFcTeDqq
	SghofKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzKz-00000000VPs-0Bsw;
	Mon, 03 Aug 2026 20:32:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzKw-00000000VOx-2kMD
	for ath10k@lists.infradead.org;
	Mon, 03 Aug 2026 20:32:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673Jkc8S1347855
	for <ath10k@lists.infradead.org>; Mon, 3 Aug 2026 20:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awTHV+0FHJTetu7VAFUruO
	wJMsi/uWQRW6kJiJoR04s=; b=M7UU3bv8jvmuGlt360SYvXSL97ZgGhu6ieMi1t
	aclz1S9hmMS5caX8giNmy/akI3PsNwfP0lCQWC9EiUb59Q7vWwWiUnej+CukvsFU
	Ajz4Fi0NbGmR1YEZ7VIFxfBmyGip6jD8KKcrtXN7ucV6L5Dpd2dI/C5P58yhsEdE
	m3h73oWRlD+LayTt7RkROzos00sbiLErn078JI284DMr9mo2huaupdtZmlOF4Hat
	iaL/k63bBeso3m31wbyLs63p3jI9Puf+KHy1zPfLHpUGGAT11SclHBvuh45E5wAP
	x3mlXkYJvoO0kq+BMiT8i8C1MtIkV1COyMWk/pzgjRy1EUVQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb3nn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 03 Aug 2026 20:32:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so3854258a91.1
        for <ath10k@lists.infradead.org>; Mon, 03 Aug 2026 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785789157; x=1786393957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=klVtPER06/iPGq7lW2gb2ng9CExOsfJy0EO6PDQE6XBw8ZxLFO+UTXTbdgz5Sbv0AO
         KzKaMj4k0c+jTO8/qQZJv9GSrpCmNT8AKj+xwQhXjByQMr2QvDgrtFGB6bg5OF5hrqnj
         dK1URM3H3CqqSWjhIetTl99ha7laQjyHiQmrpooVzHDcuw9jSnh22eB+1AN+eDSXwlwD
         2X8XfbmWWFbM3slTB2NqGXTG4rySD3aE0khXYhG3d9nSY0qjOaMQXOpLVflGZvgyurMp
         QY2ixI+FfjAwseklfvxH/QbeATmaCd+x4SGBzfGQILWcbDwJEoEHXfsa4uk5oU3EtxmH
         lL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785789157; x=1786393957;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=RVc4IlTI0tbzSyWcPdX2xH2ycP0JQhDUBIPAjeR6Q3P8moIIVFKIe0uUwfmQStQ4dc
         B/+AAvuman70CC2aC8GaLoL5lRywKErZc+zsPWWzEY9N1r610EhUWkFzcGIqXa15SQ4b
         pHpF5zo42WiPwjeFpco6AdUvDkzfLd6Cnu6INqC/2Joh86YSNCjoHpKSW58Dpk55MXvr
         mSb6qZaxBabRS6+NfHf200rzlA+sY8FQWjFKxhc/3JegE/O5CWeWhK6nPG6EUsPukBbJ
         i/3h1fu2UnUBIcZaDsEo51En590yVj1j9f1Fiq7sBNWKOt9DbwGKt40g/n+3CakSeVOe
         gahA==
X-Gm-Message-State: AOJu0Yxd2GtuI46EnPx8DHxMfmk7uvO+HV1vwB/314MBsY9dpu5QgfXb
	2R3sJFUjcsbnXoDjtwX6aFgEL+gqNHL6o23fLtnpIr70ZuVT9BNqjtilDJagalWVEy9Kwl6rr9F
	cqxLxqzHiFxKs97q+dC0bYyLmnPGLS4+9V2uqPxywwyj/ZaDg3NmVOhG6ErAM8rIy
X-Gm-Gg: AR+sD12O4oFSQGhecyI4+sczK51jlaWgBlyl/3A8nUfRsfCHkV6ZLr40y1NbExSG49w
	ztYweL0Yu/MPg1mcd0GeMM5wzPJWWxMkZPmskrD1Q9mTOmJlXcy8LgQkNUOCquDcFYQQHAsfOc+
	SRs/+WpyJF1g/cuYGWdau477zyRqppIqG+PBf3P5UkZo7hTukCtVMSRYXGVJIJqG973oPomxIZJ
	YPuAA6l1MEaBHUp7lpAo3fPEs3KxXvb9NT31/5fWtJn7jHZUt0YgFxxrit+1SpLfHmZ/qVn+1bB
	bPGUc+SEdpMPvhTrgYnscfguWIEjSIiKCreg09x0vKhYvpq9Sf/548Sa63lgwl5EJs/lSha1o78
	fzIuaTTkI8u+MgWxygvwk/xBb//dx5gz46zbB
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430251a91.28.1785789157421;
        Mon, 03 Aug 2026 13:32:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430228a91.28.1785789156974;
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm37948142c88.1.2026.08.03.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Message-ID: <e3d855a3-94ee-496c-98f0-efa10e0138c9@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 13:32:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260803
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KUUVwFoe6Meb42491IiN3Z_CCVOSEeYF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfXwc20p7NR2flT
 4r7vJquzHb2GBFWeaddbXGhfi3iQ3enJ62fj5RC5tCi56C4mobFI6z6fgWYMJFQ6vhP/XwHr1J7
 Z+CO9WUwR5HIDkv8KzuvN27Z3vKYmn8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfX4gWs+CscZYgb
 XWfuMkPKn14L8c4kmIVb7vy7TBJeUtQZc6huN+qTAwTHuzhQAm+LuZqc2rAvwlpBvO5pJRfSvES
 vJ8ss/F1Oa/GaSn0JHUyEiBjbArCg4Km6iEoqcF5pAP7Y2ycVvK/13wf1gToPv+0vYzUUZo06AK
 Fwv14XQUQjaKizFQ8QGShZqCup4RMMd6BRkgdzluE5DydQqG2F2Fi+3sjcyM2wt9LmrnLuT1Oxk
 msP8RFn1XjbVHhQdISGwNUfjB5arf4NYe+IPbSW7Hmnh3QZ/u/3+9YQfHxjJ+SlehHptLlJYfEd
 QuF/Ap4IZ6ZLoO8tUswqwpdUy7KTec8pkdcTtMhK4wzhPKGEXjvHT3oklD1qBkK/6InHFFgxNik
 YE4dVVdt/10wijOzU6KKAzeRNOZvEroGKW93oD1J0Y6a3xcxi0kfvNXjFeReTzwGPJx247emNs8
 qODkNRdMbTbduCXNaYQ==
X-Proofpoint-GUID: KUUVwFoe6Meb42491IiN3Z_CCVOSEeYF
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a70fae6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=M1n47RuBD0lxbceSDO4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_133238_769474_74E55BFC 
X-CRM114-Status: GOOD (  10.97  )
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

The following changes since commit edc84a9396acf1a0e78c46230dd0bcee1b84ac53:

  Merge tag 'wireless-2026-07-26' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-07-27 16:03:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260803

for you to fetch changes up to 4f25071afe9218aaae1c63fbf75e229aa6405319:

  wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump (2026-08-01 08:50:27 -0700)

----------------------------------------------------------------
ath.git patches for v7.3 (PR #2)

For ath12k, add MultiPD support for AHB platforms. Other than that, just an
assortment of cleanups and minor bug fixes across ath6kl, ath10k, ath11k,
and ath12k.

----------------------------------------------------------------
Aaradhana Sahu (2):
      wifi: ath12k: add AHB platform descriptor support
      wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate operations

Doruk Tan Ozturk (1):
      wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets

Jeff Johnson (8):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
      wifi: ath12k: validate TLV length in process_tpc_stats()
      wifi: ath12k: move firmware_mode enum to qmi.h
      wifi: ath12k: rename firmware_mode enum members to use QMI namespace
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix leak in ath11k_service_ready_ext_event()

Linghui Wu (2):
      wifi: ath10k: filter non-UTF testmode events
      wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump

Pavankumar Nandeshwar (2):
      wifi: ath12k: Use different RX release ring sizes as per memory profiles
      wifi: ath12k: skip MLO multicast links during crash recovery in Tx path

Reshma Immaculate Rajkumar (1):
      wifi: ath12k: fix encrypted EAPOL TX in encap offload mode

Sang-Heon Jeon (1):
      wifi: ath6kl: return 0 explicitly in ath6kl_init_upload()

ZhaoJinming (1):
      wifi: ath11k: fix resource leak on error in ext IRQ setup

 drivers/net/wireless/ath/ath10k/snoc.c        |   9 +-
 drivers/net/wireless/ath/ath10k/testmode.c    |  14 ++
 drivers/net/wireless/ath/ath11k/ahb.c         |  79 +++++++---
 drivers/net/wireless/ath/ath11k/wmi.c         |  30 +++-
 drivers/net/wireless/ath/ath12k/ahb.c         | 209 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/ahb.h         |  34 ++++-
 drivers/net/wireless/ath/ath12k/core.c        |   7 +-
 drivers/net/wireless/ath/ath12k/core.h        |  11 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   2 +-
 drivers/net/wireless/ath/ath12k/dp.h          |   3 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  46 ++++++
 drivers/net/wireless/ath/ath12k/dp_tx.h       |   2 +
 drivers/net/wireless/ath/ath12k/hw.h          |   1 -
 drivers/net/wireless/ath/ath12k/mac.c         |   2 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |   8 +-
 drivers/net/wireless/ath/ath12k/qmi.h         |  14 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |  90 ++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  64 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c         |  32 +++-
 drivers/net/wireless/ath/ath6kl/cfg80211.c    |   5 +
 drivers/net/wireless/ath/ath6kl/init.c        |   2 +-
 23 files changed, 550 insertions(+), 120 deletions(-)

