Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD7E6BF10
	for <ath10k@archiver.kernel.org>; Fri, 30 Jan 2026 20:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=; b=lmH7FUif5R9lV9P04T6lOB0Fd5
	/OXKCSw4aGLH8JwWltZ2S3ZHvksOS3c6bADcRl9P2lU4NBNo4kK00GSPHbEvXhdWiX1MkU0B4tqd8
	BC+2Lm2A95MrebUhH0DTofL27lPz26s1FUet6V0BshM58U8vvCtRNLgMHKBO1HLSvLbWEVHQtOFKa
	GVIgRC45DcirngiKHPoeHbRIhNMGlgaUJACxaMtWms2BhIfx6zBOfZWytH/Z/Wpf2rFd59/7vMxN8
	qBDpPLoB2WURnOTNjUjosKlnYgokQbSiz4S5TNWGL3vVkleMlo7DZ/K3fpN3NZtoBwESpltF+wJQD
	5VkdOqTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlv7r-00000001w2U-0v3w;
	Fri, 30 Jan 2026 20:29:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlv7o-00000001w1R-09dR
	for ath10k@lists.infradead.org;
	Fri, 30 Jan 2026 20:29:53 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UFEOBr2418534
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 20:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gKtVDmhXmolTIN8Uom22wN
	d+fElMtxvh9JofuLlixjA=; b=FQXCgx1ufEA3QJD4xNPENvAhS5CWK2fL9cmRCY
	XSRN6ftPFqE4mAph+/5oGAQWBg0G4dRgBg1B+oRwSnNVEQh2yll5Ql9g2607M02l
	kHnLjgjdZajf4Lo3VmC/35oywoJ6CjvCTfQSEgjODPBzZN6ra1yWX9Gs2V9IbeRv
	TBWL0NveMPnUHbADWAK2AE2xc2PE76m9AhoW2k2dMxrr83hLUGOtPW/VfYuO0l8b
	3ke7sLgfWH60olY6omWuLb9+WI52KcnMHvuFn8fFv4pMDh8/ZVfv4wN3kBTJX6MN
	Ea8x0+SEdhgM8Yy3sTpA0T0SSwbKeFZ3u5Qc8bYX5aVXNN8g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0r41jege-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 20:29:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so17836490eec.0
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 12:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769804990; x=1770409790; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=bVyd/P27hh4JAq1uvwvbY4UJptpJZUkp12VteroHdTw8irLiHSR2Gb0LCdLfmuF8Jp
         dODnqa2l4jdfvab2i3TP3s1l8T1N8isJTGn9ZzWoAB9rHm6njunkmHkHCOMFTZFGEjb6
         b8fmVypVhOVhXb3Ctb3pdT4p++wJdBo6b0LaiB9+YVl+IDozqk8+C9Fu5g/ahwq2CG2K
         4QpPjINSTcwj/9QDyrUQjAOxj/5vAsEpfeRim23DaCXFHP7bgDOr7y03qJr24dAZfNVX
         eNpT7qHW9nW1lzYkQ8JQIOHiiixUE01cCwxegRX6pHnjjfsJJiFpZCSwcG5h3U9gMfiH
         GoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804990; x=1770409790;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gKtVDmhXmolTIN8Uom22wNd+fElMtxvh9JofuLlixjA=;
        b=kB+8GsXdRedm9wgnduLYhmwctH93Pg5t09ZEvC4Oq1XV4FCkrbsOd4AMlmQ3H0EFO+
         EqtpwzqrUZGrRqNzz8Zt8Z2ZcP7PuLFq74dvw1Az0ELa3U+4wFpQQ6rY9zqQjbtCpTgx
         8dlOHSSFi264riLF6VzfrrmiDsyIPLI6T4Thi8gXZYCcKcgNoB8PmuX9eNTIz2UZSobu
         MuPIbY+yKBX61R7UKcx3qm9Gz+qXIi0cfQZrb6SVAeMnbWkP2sk9BaGROicLINvQfDyn
         o+TT5RNyiYRumtUr1InodlpygEekWUt5COv3SPwTanuxMINpPraqipE/l+m/zjHA6uh9
         jqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJyhuDSYMWpebz1KSReR4MwXcgQfl7RURS5+kZFJzxM8GsOlY48Gl+ywDEh2dP8AVQ9rLcnDY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2jo5tuZERHgN4UEVqYOrOUgDU5Bkc0egKg5XXg912a4KVX/AZ
	6o2Wyqv1DcSrUt/q4xmoV0fS1snCd07nmqqijE8Fwoh4inaKmZ5c7RemSufKPMPT12FF5Ngshdx
	w+WQv+Z65dpNkwGXO0K+2hG1+dqfA1zC6DoZw8ewtMXTSVtGMweu/PUXnokR0ISzwiSB/Rk6M
X-Gm-Gg: AZuq6aKj9AqEgyDWkmPkeCF4gN8LfSHgvqAlQLCUbYThHgCziZ7YTQdAvAZfu09kB2H
	8pU6LXb+SIaio+lHomosjK7cxUErUQMGc60i16rdA8x2j3ihYqfvp/zncYjytEesa4ldDEkqq/2
	YpsbZ0tQz3SSK9cNnrKpaP8JfmAotKhR+T1XzhcCag9dwvwsNg10Orn3HVVle5ISA35pHAY36++
	GlZm40iulVQZri//pScmD6JNxQdjfzD2f7x/Djli1N82RD0XR5al90IjDdU2KfBkd324h9DlW99
	+QBOXUuGbl20QwSYygmAAeY7uCjAHzFS3hxjm+EDGVSyrzfur8gaeduOOOS7t+zqIQ+D9XxNRv+
	bEp/1XpkSxXYLOuLoibzdAEK36oxIfKZa++JqmgmH7+d33Q==
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953652eec.32.1769804989666;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
X-Received: by 2002:a05:7300:4306:b0:2b7:f7f:69c with SMTP id 5a478bee46e88-2b7c88ec6ddmr1953639eec.32.1769804989195;
        Fri, 30 Jan 2026 12:29:49 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cf8d6sm12595008eec.3.2026.01.30.12.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 12:29:48 -0800 (PST)
Message-ID: <ecf412bd-7bd3-42ed-bea4-d7aa837ddcae@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 12:29:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260130
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sHEI-3qIliJDQOgVJ95NyzPLLMjh4h62
X-Authority-Analysis: v=2.4 cv=W541lBWk c=1 sm=1 tr=0 ts=697d14bf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=xtntLAz0KcNX19M1530A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: sHEI-3qIliJDQOgVJ95NyzPLLMjh4h62
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE2OCBTYWx0ZWRfXyy9OeMst/bSn
 5mezR3eCGfSZsWFSxiay+gH7qVLwYisIWxj82pEQqEWDbgcyLiJpieVIxGXzQheRAy4jlGqUgY4
 s4q1sUpon7/H6dqSAq4VEZwaOfJxV46E7J/WUzWxdFkKhnJ+G3ssO5lttwEBM/Tw9kfwKOVN2tL
 W5zy2VnN/3RcRW9Y2VZLn8NTGvALJrwyfj/jVsJV8ZpGnLELuYiJGaDNWTQjXYI7vhaELjfuLLu
 Q7EKCCsLgysuKYxOjnKPuWa9uO6eK3tZLXy9FwjUZX/6KhJy7rZmrwHEJuPyAJ0U3hbl5BzTpAj
 eObK9z+BdUV3znCqKWi7N8sWgYlRfe3/INKLj0UMBrZ6BNm7tP+7Wxi4GI5+vmtHgJ9H4wqdx4A
 6JvTzYaPIWa9GYDy6bMNbNs3DJ3GXARji3VIH+TD1PmlBlY42ZSm4CnPemPQTQ1E4sqbq9p1j7m
 nnjmilgOQNdgd3JoOGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_122952_185952_2E19628A 
X-CRM114-Status: UNSURE (   9.99  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k.

For ath11k:

Update board file for QCA6698AQ/hw2.1 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

Update board file for WCN6855/hw2.0 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_SA8775P_Ride
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride

For ath12k:

Update firmware for QCN9274/hw2.0.

Update board file for WCN7850/hw2.0 to support:
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8001,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1107,subsystem-vendor=1eac,subsystem-device=8004,qmi-chip-id=2,qmi-board-id=255


Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 0882248d05045565bfefe1f07cbfc22276c9f058:

  Merge branch 'lenovo-ish-uspstream-clean' into 'main' (2026-01-23 19:26:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260130

for you to fetch changes up to 09167289ec698099435e499e45c5788015d26783:

  ath12k: WCN7850 hw2.0: update board-2.bin (2026-01-30 12:17:30 -0800)

----------------------------------------------------------------
Jeff Johnson (4):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update board-2.bin

 WHENCE                              |   2 +-
 ath11k/QCA6698AQ/hw2.1/board-2.bin  | Bin 986384 -> 1046928 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 7056532 -> 7117076 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15183928 -> 16035896 bytes
 ath12k/WCN7850/hw2.0/board-2.bin    | Bin 2253732 -> 2253964 bytes
 5 files changed, 1 insertion(+), 1 deletion(-)

