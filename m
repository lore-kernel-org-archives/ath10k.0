Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91123C5B572
	for <ath10k@archiver.kernel.org>; Wed, 12 Aug 2026 17:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=; b=BnyaDdkzSifyaQ2/R1PEZj3pwb
	rvXu+yoWxguBRziPZtd1DUh3F1ygH2OzQZb9j56A68EfbVAHdMIt9RKKfTk+tXmChpNWnvE1EDDLy
	ScGZx5DKTf/k/EJfONSul1hqq/bJTzIPhVqSRJodq6tGfRJfPDyTpf0uxyIhtdw9cEmfPVUU3ocu3
	SErwemSCBvxS/Abn8tqtPEzkjxZvKIWgMMvF5GY1CJBg9fPgNRh5LmlM4hxAM/lH7msK1aiv2ZxNE
	1/eUZRsOWprsM8JJf/Ih9zlgHg1OPSElv29/slNRSjTG15+PNB1a3XrqxXbYjWYohuwT2a6zbmWXm
	+h5NQsBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzr-0000000GiCn-3aQp;
	Wed, 12 Aug 2026 17:44:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzo-0000000GiBJ-3Jcp
	for ath10k@lists.infradead.org;
	Wed, 12 Aug 2026 17:44:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGpuq04071940
	for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WPrUe1AHxk8839bSM8P8eF
	DTJ+/fnhI9uw2/dmjlgD4=; b=bmyaQwomX0028YIjqP24MgJYMgs88YwzsbdR2u
	+T7RI7MyNpTaNDbpHDSTcNimEmT5jUBZIKm6A8RznJU6gn5Xt1qgUVkm7etEK1ol
	eG6vKMv9gQ/WKdb9BDI6HQwq0OxMSC5anSpaI1olVLYhu/fgcYaLWM7xlfe/mFHH
	qf33+xWrsYM2meKe8wnuyQSnmCS0SzzAHTZEWW4ZBjiqTorwh4Xpm4c2wMAviDaf
	Pc7VBegBx4ffmE+JxRe4IxjIv9SbALVkyLsGhccYuntk0Fx+aTmwIgC3YzrADn9J
	jgTp4aUvglL6kwEK9qC6cGmlXmEVwypjFRpq4eKd1ZK5JQig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d296m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1638884a12.0
        for <ath10k@lists.infradead.org>; Wed, 12 Aug 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786556647; x=1787161447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=j6BJjWhWvfa+PB/ix+Ev7N8PMlbo3TT8gn8Jy9lFLEreTGqT/0pvHMO22H8QiPJTzk
         uIg1tj7JApBlhng8JcwdDxR7dlH8LKR4dhPOf6PF47mfeAOBppMdu6YWFgQWaM07DjXf
         R98ca/z8r7zJVGgK3VHD7C2AlErs5jArlSyC5MdeLK1rKeQOPrz105QVtPsLkjVrXDlr
         wmrCc+1tepPEFSpOGzodKT7QkahWaTb0sRqDvnRkaQb7+HkFjJjq+DDWb0Luixo3blya
         VuPHVMpobILJX9+JZ/2qZkwcrjnsRP08BXhiF0JH6m2NtU0Sdu0A7Hg259Cd2YK7zs2S
         Wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556647; x=1787161447;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=eTC641Cx+Ul92wE6XfieAC/099jWP7Y58vq0AggfEH4+piZgMJROpLHp54XFX1N6bT
         kFdeHeyCIs5BLLTRKr0IIeiRf1ar4v/e6kPpkgAJmHM172XVrgmhZ3WNhic+EaDlQ99J
         Zea2gAaVE7HemKLUpsPg/kwoUCWGfrMRxcGdWxgE5NRUKOew5YANKQ8X6gCI7puEEr05
         vquXii4JgbrRpsF6qA+iEziXKbDhkq5PjXFcFZw7VO3Nh5B9RZDeUXLMsVo0lgfqt8BY
         VGzh8IIYeOhiwoVgMNB9TaHWUiT7xK5tMpA7HkPn6yhEEaQBRnZG8NfBVjo8VzYPD7qc
         G3mg==
X-Forwarded-Encrypted: i=1; AHgh+RoLkIbHbDay2A9l+fIahDiAz1IeUzaQgzhKuTgG8slkj6ISqbRxU633fGh26hosqayYX0hyGfg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfe22JwNfkFdn3pF+g9AF8coKzuPg7qYy3E8Ddj+GHbTukr3yB
	YsHV8weSgaWQF0eLT7OmlIjfNN5BEwW+ZeXp2y4vAgiKe+LOSDjheSTNNRf0bdkwowxjvIIRp7P
	4A5KTWq+Ec53XR+X6OGyXAk7mTJ7WohhLU8vZ6+70aC16Tzy4mRe5QZv0Bd2cNJk2
X-Gm-Gg: AR+sD12zLzSU+e6x1pR/A4YbxebVWWGtifEPT5MDDlAij4Zoyd72cC2tILzj9IPywiq
	OP7KPsLHlkFTe+htKd7CR+DPEoG3JzfmZs405yhCPL+ieo7DM62v8aUrIxT1K30zIZ9vYU2JTXB
	mcxrDY7Xs+R0A7p6nOJ+xoXV6AO8THlHiJ4jqW8B7zdlCFkUNqGEnoQK3ht5g88Is5fFHRiyruB
	S4wl6E+qAitP6uzR2Q0aTcVH1qBimouVwtMCBWALH/TWL6WaFuRxzicYLvzYa1HrhKJriBxSMYx
	+7AnQ0V/wO/epLSU4I8VqfGdztxYOuLKSInFAoc/nRAilkUxmZCQv9SONLBxSOUIhhn4YbQsNyO
	erXMkG/+wsOSYMuYQWuzbqHoNIVJbSbWAZAVw
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93763637.35.1786556646807;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93709637.35.1786556646396;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31e65ffc056sm966106eec.27.2026.08.12.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:44:05 -0700 (PDT)
Message-ID: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260812
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rM62DTDb80AWbX-9yKXq-6RIa2h-ttm4
X-Proofpoint-GUID: rM62DTDb80AWbX-9yKXq-6RIa2h-ttm4
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7cb0e7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX4IR3NU6/j4k5
 EBQT5hF1oCwadKOnRJOGhXv+u5IUbZaCxvnGk9IIxRcE28U8+AR1jn5jTevajcaplg520xMTwf4
 AzdJFDtVfFGBkxHzWWGO9xCc8jpK7kLPiSQqMgw9ptkA8zwx0ek2cJaA/2bm7T+I0aGDj1Z6V7K
 vQEL10X+29QoRkAUkgsPCLVNJa02zO0uha7KztFd1AaDcprO+xcJCOR8NCQH5Wzte4k5HzT98OM
 fBXZBw45/JPQFyVcZr2ggeFZ4aZKNrMg7b+wK5ZZ39590dnsW7DWCHX3EIEGFMjN9tFvLO8eOhg
 MwdAAh4JDfZRjLj6VQhCigLuseWIFJBtfoYzk/VepM5fp1FhC2/c2L68gcQR4lgK8zD0ofO6rJq
 h1NkI85aRvI9MG+2D0kDL8kQCjaKANUD2Mcl5dSquwubeZpAir16+DkjzLGr2aOB+bLyMQsfBYt
 fK6rVnrTnXvkDCG2ddg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX7TYrte7vgN3u
 8hu0aRwdDwJUBGJeGVdR+WruRsC7fJQSeDCFjaXL5FXfjFPOKguDQ2gZYqs6WiBD/54PLTk7kYb
 pRBpjO+AWjcE/mbeVASmmc4qAfoM6OE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104408_938491_2841F32A 
X-CRM114-Status: GOOD (  10.09  )
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
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:

  Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260812

for you to fetch changes up to 25c06030aa434817928ace452c06f095f14729d3:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1 (2026-08-12 10:31:06 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7111860 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

