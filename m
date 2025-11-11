Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB095CCFA18
	for <ath10k@archiver.kernel.org>; Tue, 11 Nov 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=; b=caNFmczxXCp6quluKulvPXowLI
	5atG6D1Ac9E+NBeCyUx4Iweahkzpy1OSyZLNas3UayKWWpWX/00W4P04oKnojZ6ogZ9cfCtBVi/IY
	yVI4MYMnB+1IzVK61AYFsp7RWmzoif7OIHkMisueAY/jupzq1OnDRra7Bgx8hKNznhHmMaXwgDvYB
	CBTn+OkhWpU/K4+r90eDgIqL0fgdjKnfuNywlRhOL8SYvLWIebAlI9SprrgnWppzUzsmgIJvBAMjm
	h35RDiQeBvgxYllOFc457fO/9g+UVnxGp81HzqtAeYMaiRpKkK4NfphWHrD21YxdWAy5dey1qsCDd
	zF1m9ICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAE-00000007X2k-3qrQ;
	Tue, 11 Nov 2025 17:28:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAC-00000007X1e-1GT6
	for ath10k@lists.infradead.org;
	Tue, 11 Nov 2025 17:28:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABH2NAK2806444
	for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1yTPDHSc2XG60aIrPablLQ
	3QyMPBQoJr8FY38lTVHzE=; b=XbaScViBdNyZlvJaRxBTh1MRQ0m11aaITfv+7j
	JNqOsNxBJdpg7A1YVGJA8sWWsLKnnxVLnytsRzfgGP4PTxTLQIn+SutyD/8jueju
	fMTUQyGf5FDGN8e3MC6GgFVVotukYEDuG/Zuztu8IB31nKmRu85Bbat6C3Ch7qDA
	bMCWfeJ6Aqxyb2YieHsKOYT2eVSGF2WeV5NJECQdHZ7ez94T6c6tZHEucaT3Mzs4
	OU0dLnUHLnUb2U/4WlNEdYm4IxcdY8XXyRDbeHNwFOI3o9gPhW65JrLU3Oka8Mnt
	N6ZdOpW5zQC0th7teoBD57uURh/aXsZT1bS6Oz+ceULJ14GA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ac11x1pcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340c07119bfso11062507a91.2
        for <ath10k@lists.infradead.org>; Tue, 11 Nov 2025 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762882095; x=1763486895; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=atyEeZU11A7VgvFh94+jvQK7EQLCfjzakbI6vZsE8hbwhgskfoRK7u435+x8NbM3Ft
         tCU/aq7+121psB9pHFEZr6vXW3elhvGXAAFCyxvwe3CqwJsQyHIX3QtVfK+VgbcyroE1
         TWEPH8MHAzfRtioQ3zs3c76j9NSXXKvoPRUHUnST5RrmahIT582rT3AfknmV9E89VGbU
         KmZzaHRsMDS9mQvogtmCk9ID6X0cEnx00BL1lmc+hmGCAQZca8wsqbotC+G053IpD0/3
         JP4EvrVgublo0ewQrWCAkRofOI1vpgDzKQ8E5kkwM2bJHt7fU7fe4oN9Qx/OBuHQgVKi
         l2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882095; x=1763486895;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=v2LGUHzeikPAVQDT6mnAc8N4Crooq5pIYup6qEGMdYyuQxO/uy1j+3eaQ0iSQSqB+N
         LvBqOWOByzv9/jc/2Mfb2xBKf6a6KnOeuKF4SPIrxOw6Tocyfdc6BaTarptJPuv5RIHj
         k1jxN7jTROoG7iARSIDGKNdlf47VGu5SvopJ9VmFHpwQhUkUeimFzR5X2ZTiDyluaGNf
         LMQ3/L5t0hCieNI2u1T9CX+P0ciVbwG16KwI1vbS2EFz2mmiNPmXa4WTmwwv2s3HeLyR
         XodrM8MfUPKkUAr6w7oAfdrT7IeVgy5kJcJOVmTYA6z4gQzc3rE1CiqWx61E6C6XzzPX
         VGLg==
X-Gm-Message-State: AOJu0YxFU6yOe/OohwqEua8rj0yHtXcldRO9Qy5LmqaWMElD9xvbVR1a
	AOs0FchQzxSrHHOr7/moPSGu/HNvPC4PDXO4HIyMmVmniewTHhiIOqc5v+dw3YqQOTDomZy24ie
	rMUsgV/HtzdtWLxLpqyBPn9YICe3wgmYG3bSELP1AdMjKqQ+jh9H5fM1H1Hebg0AmFizAUeZa
X-Gm-Gg: ASbGncsCv0zpuEMnVbtHiUoQukPRUYHAl4VEvbM3rvjacY48vEZqhBvYAj+MnUeamD1
	tEf0pdacx6tDxvM/F8ekfodjC4YZ+yDPm4JbjPMsmgTbMM40vR/s2Z0krD6PEIIqRgcSjFIGCHx
	SwML0fNgqDV6Q6ZmJFTwn31ot3roUdWeSMoAgKi5R6uGTnOnaK3J1DPKRcXDQuQf62of9KpcoHB
	S6vlMIbbNQAsb6sqTW3lrLxNyEZw3v94q1nsFFCmnRpxJ601B1u66pyQybf1m3osN0AbuGSh1WE
	YnhGDq9HSpr8271eTWvSLA2fJAD+2hDlvI+YzsbkXyt4K9JnibY9+IxocqaUGzatKUyMSc46HBN
	J7EH9URT//v29b7guKNMLRRQrgBnMyB7oXPg=
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119193a91.19.1762882095011;
        Tue, 11 Nov 2025 09:28:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbddsu6FdKyudkS0lKZNwLRY1hL64MQLZC+zahT2rFZHB4c/OuxDy9ljnq3D8WemPe/3hrNQ==
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119160a91.19.1762882094449;
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff8538sm15987444b3a.28.2025.11.11.09.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Message-ID: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 09:28:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20251111
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE0MiBTYWx0ZWRfX6E/kb804BRbK
 No8azzwXCeWj76zOt7/f74WCZQN3rRVjxRsm/uJsbL0nDTYfWd0TMspwIJSN1QLA9PBkUj1l4RM
 jNelna2dw+XcYoiaPcCVCdgFNxd+OINWXrKccCa7SlSGryE7d8iosXOudle4/lVnllEXTPM3wSz
 tJ//gYjqlsg6yYy9u8nescQNa3BZ5dh5jconmmqwh9KTvC8Hs1Y+AMKUPJp76XZ8X1sKSYFFBae
 RpNlvtDEtI+4WD5KX4KRHnLGj+XDLBMCRNrBopl/gnmqAylhqRLuOS1p9DM0uxv7P07XE0BPG7M
 nHePKrtP0nUHcskBmKW/fP/rOXfqc9h0uXYNMmDBNKp/iIz844VzoVRXCfZD+dsKIqWdwmkg/Cr
 eS85mInx1k2FiiYrydeCvV6KQR09zA==
X-Proofpoint-ORIG-GUID: UUnUaxOkVNozMwykHzO4Ft1n0f6liNuP
X-Authority-Analysis: v=2.4 cv=L94QguT8 c=1 sm=1 tr=0 ts=6913722f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Z3JRDe02xMfDgAAcrXgA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: UUnUaxOkVNozMwykHzO4Ft1n0f6liNuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_092816_339705_6D9B7906 
X-CRM114-Status: UNSURE (   8.43  )
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

The following changes since commit 2f6adeaf92c4ea4adf5a91b87497ba13bb057996:

  Merge tag 'ath-next-20251103' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath into wireless-next (2025-11-05 16:29:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20251111

for you to fetch changes up to 2977567b244f056d86658160659f06cd6c78ba3d:

  wifi: ath12k: Fix timeout error during beacon stats retrieval (2025-11-06 07:33:31 -0800)

----------------------------------------------------------------
ath.git patches for v6.19 (#2)

Just one 2-patch series for this PR.

Once pulled into wireless-next, ath-next will fast-forward, and that
will provide the baseline for merging ath12k-ng into ath-next.

----------------------------------------------------------------
Manish Dharanenthiran (2):
      wifi: ath12k: Make firmware stats reset caller-driven
      wifi: ath12k: Fix timeout error during beacon stats retrieval

 drivers/net/wireless/ath/ath12k/core.c    |  2 --
 drivers/net/wireless/ath/ath12k/core.h    |  1 -
 drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
 drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
 5 files changed, 14 insertions(+), 25 deletions(-)

