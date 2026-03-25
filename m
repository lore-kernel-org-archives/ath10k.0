Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D429109C052
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 18:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=; b=n48/T+Q9CEnFj28EdMr5chhT2s
	UFsvN2pzcv62l4KR9fcqfYs0locOe5FEv9y1+zfpsN7PVbAsVCmY3sBGpvFlS+TUjlMFOYLnVA+Yd
	QrzIg0uYyBf45Ocq3qcJ8dmRa7gvQzGQg7ZaihLBu0QLDC7Aroxzd+GyMc45Kso4jgv/f3z25mR0B
	yGTp9/HR/a1oxiLDIhQBY2qvFxRJ6UwC8ww0KlHJLbEN0pBarp2ZXoRuypzoXxCFtc/6zyiIQDLPw
	4s425yXPPbOJdxN9XjPsHQIjWOpmdS7uK4rJOsQsswGXzq5frnEoeSmUQL6qRP1/LS/m+l7Ef90EL
	UkRwjffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWY-000000041zI-2gzV;
	Wed, 25 Mar 2026 18:00:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5SWW-000000041yK-18Lt
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 18:00:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH3YZ1257983
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=M2igQvo0xuhoDdesLA15tF
	kb4vPga0Hsxbg78nCkoEo=; b=Qbv5X0HbVUZz+vewgHuF9ZN8NA/EpeX/qykEMP
	nf07y7SUKqHGQKCiXfclA2j2MIo4SNlLok57ay7OwRmTa+XB1p2oXh2WyKnpSVxp
	bGvAl9kYl2Ou+U/BgZEk5ZZ0160XEAa2bGL7vsXHEwsV6fCe5v88flhlnUD/1Urt
	qE4cI270bk9H1lPbYuasIVtfS1HdcrT/0wYAWOYpfoP+qrZou3p+h5Q8+oPDHL4l
	syoCRgv0x9FxzyQ/tod31mWf0iwn8CY9XlzQ+cV+YFO4Kauc5wmPFwgl/Lw52aY2
	gcN5eoyfgU6Q4sKA1hXGuijWiQPcwe986ydsQQzr1w3TgdpQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2srq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 18:00:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0ba59a830so171130eec.0
        for <ath10k@lists.infradead.org>; Wed, 25 Mar 2026 11:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774461607; x=1775066407; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=Ex1n1UHfHvUiCRx9opk5Psw4CB+raX77MZE8STPppfVaaIPc5NbBwA+Q+SLfcQlkct
         LjksjSlpXHL/AC4zwTDq1HC1BJ+LtVrQcJPZN7SYk7Zt1VJitKMNMuvEriW0dbXRU+j9
         thuiCKrfmY1Lnw2QBqva/PblqMnskltjzjtfhBpAExP7AWdQ/ecKRgv2ZGZLZGVXNev+
         nHWQVUhLQoubwktFGN/vKhdT/whbQPEmUU7aesWRFh83Jo5zNhq5W85mAY/hIXsmZfHO
         kTeaP4Q7Sb1Yx2J8yxeDrS36NvRr+SMJtaRnBhC5uxdNxn1lR0gd1ViX9bgbI5E//IME
         gsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774461607; x=1775066407;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2igQvo0xuhoDdesLA15tFkb4vPga0Hsxbg78nCkoEo=;
        b=NB6UAqKSUebt1bhTR8y4gwAxt+Hog/f5vPTbsVL32HdKGMXSgPmPLrzHn4sZRYfm6Z
         RRr7qC6kQLjOnHf2kc9L6hIGQL9KmBOyRzz/6889RWZv+mO8nMOF6HZ2X72xH0Dqswzp
         Jsa5Ynwasd1EPc65/vRcC+GSiy8Ywt4nPk1X52+n3npw2fRmN2X82nJBfrVTre72Lz/7
         fdrSRjQYmAbmZW6A4LpQHHRXBGvL5rxEhrtkh+5QomnifhR0fSY8v+QQ05nV+EoWeRFQ
         Rra0W4rLoXJ7LFJOKHkSr9y9SkghBN5LcS5Zyyujv53ZVXkYRkN86jBbHOLehC5Hb4Fx
         bvLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLXvqI/omO/NPs/+Ap/1xKlx2OE66JJSCSj+0i95voZHSSxwy9E4WkVskeAIJn7XTR8HCetZw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJM/ONaQGOlphKsI96Qc3x5uqQxTwYm0nneQLr4mjMx9kgarLk
	3F6S6TJYRAB1ABZd9mX+Z89x+tto0rB2Q0Ww4ROELoPibbdyzd2s1BXZSsekpQ57fNOhq7NX86n
	fdqQID8hJPB545u/rRkeq/f9UJWj1TC1qoGdpvWnaOaYNXKRll4vCf8LjqRt7KToXIo0xWka6
X-Gm-Gg: ATEYQzxqPj4MM7VnI7QYWjomj6kYYA+FGQCf6FMfxZJvQPp+97NBjJR+QLNUm2NvDJz
	kN/o0YE4BoBuRzG8tfFz1BQ5Tw3sidGkGwNzmGQZtsaaRuzjwTnH1td4gFQtGKmEKECtAJ7ROsN
	4bMGYsvf8Qp4fkd86COTf6tNOuEMpl/dYHN+aNJE0fxnFNWNvbj2ChjU8qbGPhzodRY0mhopNwc
	WKIesIHswN+97apn84QgQRUGuWtliq9w5mZblkuJSmLqDijbVbXr4m6onxxIWdsVkL1sBtFnPyx
	MJ5lBY1dVJdZnWxUKrM3xEKjrKnPzK0Eh+n4aDY5U6et9QYDNXGwLdHuGTJB9fAW0/vm9tKCTRN
	Yg6IBOdC0ltOJeRW61s7RAvHWG/In5o4PXk4Rs1hgYlk+OUOU/AELUCgjiQ==
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650445eec.16.1774461606799;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
X-Received: by 2002:a05:7301:e22:b0:2c0:c152:ecc7 with SMTP id 5a478bee46e88-2c15d3568d5mr2650432eec.16.1774461606183;
        Wed, 25 Mar 2026 11:00:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec2690bsm428056eec.5.2026.03.25.11.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 11:00:05 -0700 (PDT)
Message-ID: <32af006e-265f-4239-9b5f-be3d52996e10@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:00:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260325
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzMCBTYWx0ZWRfXyP0aiQWiGJrl
 uPBMofYKbBfQETYChhCIp4zbugxVRskQfnZMK6M/BH2GrYWEx7lSN8WQCa0WHgbbFnjwvG7dmbn
 xZy/2axfU1IIG90fYoUeJ2T/QUZkNAOJoBuJw8QPDIjjKCx/heSa1nNOchqi2JuxstfAGsh6L2g
 sLX2QZfaKiw5dnznFPYMhdmlQY+jT6AK8Hyduo1KcGw2uET17l6LnaeiGaa+lb5e+Z8XQvYEpEY
 sWB3G4E7Y0swlkU3HnIXPxq8VfTQxWnUC4PIK/79Vm0Cc4a0duV9X6/2JQrxi5nTHBBxDFgow0D
 rlrT6D88BPuYCTqU3+YWYd454W9borrjH2QyzjqLlSAakSR0s01uM99R3TWnNU5ZtyXYLFYDiH5
 LqCZah0fNjLbkh57Pb6IQlS8tNOYtjJPWsjJIwcUi3x1HyI/eW67sPC06KkPa2R2MNFBpzkVPa0
 a5E0kadAxZdfdJABmJg==
X-Proofpoint-GUID: lpUkgkrKo1oYRIYtIX43ZYiZwXiYZ26Y
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c422a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=6dYnDcIryfdnK3l1ooUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: lpUkgkrKo1oYRIYtIX43ZYiZwXiYZ26Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_110008_305021_14B981F2 
X-CRM114-Status: GOOD (  11.50  )
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

The following changes since commit 51d2775ba036b0dfbfe44c7ba0a1350ddaefc058:

  Merge branch 'qat_4xxx' into 'main' (2026-03-23 21:17:08 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260325

for you to fetch changes up to b56c03b621391558627e3aafe5a8dc32d3997680:

  ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2026-03-25 10:53:18 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:
Update QCA6698AQ and WCN6855 firmware to address a WoW page fault issue.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: WCN6855 hw2.0@nfa765: update to WLAN.HSP.1.1-04866.5-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                               |   4 ++--
 ath11k/QCA6698AQ/hw2.1/amss.bin      | Bin 5083136 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/amss.bin | Bin 5005312 -> 5079040 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin   | Bin 266684 -> 266684 bytes
 4 files changed, 2 insertions(+), 2 deletions(-)

