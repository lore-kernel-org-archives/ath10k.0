Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706E8606BA7F
	for <ath10k@archiver.kernel.org>; Mon,  2 Nov 2026 15:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vo+Wkhc+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=NFn20UEt;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jjKN8T31;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTfn5vKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=; b=Vo+Wkhc+93GJReeaPx4iHbFZNQ
	LRwOa54XwGPeIr28XRi3KiBfUC25ykYyPCL0eC4R4hwFvpRGQDgYvGJceQjsPrEg1UlP5sswxc5Mu
	//+NSGsQtaS1qsrBvUG91rD7feFO2el1leO1UBqbKft/4YsDV/r9iR2K3rVq42FNwhE8ztalaftmW
	p9KYheK74XvjLL6K+11d/WP7lG1ejTsBP3Wf0sDILBm+Q9Z4tiSFRU94h69zL12lDamXJ6Yfi8Irb
	iTq0wV9EQwYk3Lmegsa1/LMesFhz5UIcHvaRbj933KgyGsbR3mELNm0uRN6C5hMTmkcH+WVYhaVWe
	LeohmM7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6g-0000000HAYR-1u01;
	Mon, 02 Nov 2026 15:37:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6W-0000000HAMQ-1ikW
	for ath10k@bombadil.infradead.org;
	Mon, 02 Nov 2026 15:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=; b=NFn20UEtEnOmaF4NHXu5SmtAg7
	JkP78J48QDCxRKXJRI128oE94HlNkOoeKeKY/1E0tRkPkUp+Bwf6B+83m1nY0Nvs7NtK+Vtk5JOSH
	2+JC0hV9OjKJNN1uF2fNo+ylKC8LV34VZMDAMDqC5qBO3Y/Goj9bAdfANf9wCub7I8ftyjWALvQnx
	HbvNWD2hoE/0cP3l6BdAblUZVWwhEgFb2OPvWDbOM25Z37k9kfBgrJpES06m+irUFMmFqAC0eykEb
	Srxmcy7fDGI0afhpN3VusC5ZpidilXirkLaCCodSH9XOTKy0SgaiX6rUspev1+gAlOiMszhVwIawY
	CKRSuRoQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNu6Q-00000003ZcP-3SNV
	for ath10k@lists.infradead.org;
	Mon, 02 Nov 2026 15:37:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpAbH4033872
	for <ath10k@lists.infradead.org>; Mon, 2 Nov 2026 15:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oyfnNpy1b78sl00t26qycU
	kL8HD/T7BbVQF3a+A49i8=; b=jjKN8T31v+jIiZZAXA8JZIFGeabOsy9Dd0Tkzo
	ntvNKWQkCMHHHbOUjti0duD98kwwbS6p7Gp+Mo4VNIGUa+g1LJjqYDdUT+PmS5+t
	4ixW8M1HIp9TFv8gOLuyRkndvnon3WR5suY1FsiNIx9UjdnAIUvZAblAnx+uY/8s
	URUYuCjBFU2lOtZZo/zsajPPkeIPbeQcW3GnnN9iQOjBTaQhMUVVa+OeG3SL2XVK
	l9FpLnDjEEl8DMtELI41liqUjeb5XYpweFbdpNrKJDVbDfEOzqOIS8PXWqojKJFb
	0TDqW1fuuitMPDsqwTfII4/xSM0yCwl/00MjUIoYyQVpjoJA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9vfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 15:37:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso4415381c88.0
        for <ath10k@lists.infradead.org>; Mon, 02 Nov 2026 07:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793633857; x=1794238657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=;
        b=GTfn5vKN5CSerbpyjqiR/T56zG15AJoCYWshhSjcAaKoIFLlmtWoo6l8jmjiiBhC+q
         7Mda/RTKLS6PZI38ZisLbhSJS+I82OcJ/D6AQvPAVG77urQfPNwgAqsOI/tODvhr2v9F
         0UW/4Vy961UO9IL0edKuVC7k3KjlvxHo/v0xJC0Ehz0M/1D4xujAnKjzVct4z0/RT2o1
         y5tJjs22DxWtBzG6InZkJ2pTTJT4tSHDhPsfqcyqC9/hLjBRVIEZ9IhN3B4rHDCNVHNH
         viHz6zkRp7/3yIc4TNaIuoRf9FMdjaeNdCzUnbQdLsXXLu0DocUAZvSOj+CDYcHYN5Or
         wb2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633857; x=1794238657;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oyfnNpy1b78sl00t26qycUkL8HD/T7BbVQF3a+A49i8=;
        b=W3QtCdZxTxnR4VXtKejlFr0s07Jbmtg8uKgq12q+Vv8OJAQTfMJGR5jiQGIyEPMf+B
         kIIcPnVfv/86toP+I6wEY+RJVJSgAUKc79iLb7JQAz8r8kAwirx7+IO2CfI9qOCrxg3O
         XzAXwriV4rnSxiSAuSiv6RPcO6XC1D7jmSOKb1oqrB8HWCHf4BEQQXSsEGqBaYSIPnNy
         E6Q3iEaz7x+XWfJ0G9g5CoFc7ZF6N8LY3e021bWzCA67Sppp1vyIfQwEmnd1khx6WGvl
         uRwDY4yWOiEpCKvKkzry7biUJAg4eIXsersmFtyz+tG6ywL+kE5P5rHg1UedHfDwCp2I
         aegg==
X-Gm-Message-State: AFq9FYIhUomYksvuBSwwZsmBXVmw5AF/s8L1wuMXQ3WnHT6nzJqaXrcH
	60cRnCN69SV5bV2yY/am9CV7T4siioI0ts6gTf6+AQyhCGENmsSCu+8p5n/my/dgNnmcJmxNrgr
	59wDU6dPAFSXObWNJX33N9yibeBb4DLY7STLN3NTonPbfqB4ceIc7QoHJIdJeWxzU
X-Gm-Gg: AYBFou05wW1M0r+DJuMHPxPUI68wdWOg0zcsMjWyCLUCbrhqL7fvjJLVKx/XJh1gSCL
	FlNXXT1X57UoSWXSwZyMhkxQBU09udTSaQsNPGVf0MIFqo89Dmm8fF9SM78Jxp/W1sMzquc3q3u
	ITDAbwwkpPJim3RGsj1XQYffwzSihSG1cyYLGhGrDJCLVPavgomQ3mzt6sE/Jnv6DvL8PPD1pkI
	JVFLVkz/9n97hSPJOC2jD01UM8ougAkttBa5C5+uJirbjUnzZcY9JDicbCFnM6ZZsT9t2z9S4RF
	lyiUldcbzBAY5ZQcxwGyGVzaK84UBGjfTvZnsI4K494x9w6ry8qWK6+8yO99ZCshQqF0hH5738i
	V7/fAoKj4ftvFGfLbW4/vdsPOvAOSSeKzDeLSCybajGduYAjz0EYCkC/1IulaOmSTCLXmV3fRXo
	dZYvNux4k=
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr15001762c88.10.1793633857092;
        Mon, 02 Nov 2026 07:37:37 -0800 (PST)
X-Received: by 2002:a05:7022:29b:b0:151:94a6:6f5f with SMTP id a92af1059eb24-1ac5c3699aamr15001712c88.10.1793633856334;
        Mon, 02 Nov 2026 07:37:36 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b0a628bsm36987053c88.22.2026.11.02.07.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 07:37:35 -0800 (PST)
Message-ID: <8e38f8dc-88f9-4974-8f98-687795fb360a@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 07:37:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20261102
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8ae41 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=qsoVpiIQ6ULyzOpuFuoA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX909ixC9xG3oC
 fAN9EQerI+6B3bzYErddufAWsmv/bEcZB/WdVYqowbKaYTb0EW4Zo/w3ylXoxr+bmsJ/V9z4kFh
 T/UlzgfXPTE2YyaFGP7218rfgR1iF3GMJcjrcJq8molSj74Rr18cbmIBrAIQv3wefv+suY9OJSC
 yYf8vbM7RjVcffkMNbymRN5Rs38/wzbXNSgd9q29f6be5CbZj5cc/kRh4zdvtLrBsv4cxVIxEoY
 lya/hI1lD4E9gGHl3BT3Ak+sUYDkLKtJJ7BCkSuMGMFOHyT3idKd9zYEyAqny1vK8A6YgrO/g3K
 Z6dtRX5sR7KcqLH+1QjcD1VVKz3YOY1PChvClu5MYHYvRg2ItxpIobQmrSHb+/kZ2xk81szeFfm
 oQlPy6socoLlcAO5v419dvHMaAm2IrHCiU18xtcK66KbZ/naGBys+ZMfZAvUtJf3UAxvJHMUXeO
 bbZmMy7kAPfXhbJCNew==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MiBTYWx0ZWRfX4EwPekMpeWHP
 7GjaTFuOFLeTqzSoyKtaVHgi3fx++G4X0M3x+z0iIKNjBhgpwOc4XFJV0357+BYKAT7P6dQDpwu
 Qt3FdAfxDbdSNb3JKLo0O9r7PnE3XMk=
X-Proofpoint-ORIG-GUID: T56pCOgSLSMN6kBLoQCCd1o8wF8Wbno6
X-Proofpoint-GUID: T56pCOgSLSMN6kBLoQCCd1o8wF8Wbno6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_153743_162393_01FF0C91 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 25e73f1d6868c759c8eb56cad4e411692c5341b4:

  wifi: mac80211: reinstate IEEE80211_TX_CTL_AMPDU flag in ieee80211_tx_prep_agg() (2026-10-26 12:20:45 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20261102

for you to fetch changes up to 83d689bbe8f90ce39961bcc3a64f2ca2ec184019:

  wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it (2026-11-02 07:16:28 -0800)

----------------------------------------------------------------
ath.git update for v7.4-rc2

Fix a few user-visible issues in ath9k, ath10k, and ath12k.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it

Benoit Masson (1):
      wifi: ath12k: assign device id from the WSI index

Filippo Falezza (1):
      wifi: ath10k: Stop unanswered temperature reads

Kang Yang (1):
      wifi: ath12k: set MSDU payload correctly

Lorenzo Bianconi (1):
      wifi: ath12k: fix decap of MSDUs spanning multiple RX buffers

Mehmet Fide (2):
      wifi: ath9k_htc: do not start ANI before the first channel is set
      wifi: ath9k_htc: start ANI when an AP interface begins to beacon

Miaoqing Pan (1):
      wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect

P Praneesh (1):
      wifi: ath12k: fix IRQ disable imbalance in AHB ext interrupt handler

 drivers/net/wireless/ath/ath10k/core.c             |  1 +
 drivers/net/wireless/ath/ath10k/thermal.c          |  9 +++++-
 drivers/net/wireless/ath/ath10k/thermal.h          |  2 ++
 drivers/net/wireless/ath/ath12k/ahb.c              | 11 ++++----
 drivers/net/wireless/ath/ath12k/core.c             |  3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  8 +++---
 drivers/net/wireless/ath/ath12k/mac.c              | 17 ++++++++++--
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 30 ++++++++++----------
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 32 +++++++++++-----------
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    | 30 ++++++++++----------
 drivers/net/wireless/ath/ath9k/htc_drv_main.c      |  8 +++---
 11 files changed, 88 insertions(+), 63 deletions(-)

