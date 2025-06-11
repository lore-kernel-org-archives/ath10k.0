Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E6AC71134
	for <ath10k@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=M2qAvPs2TJ0lydtDXRz70m3VO/
	oCPk4CavNvEhHMklXxFKBv0xnP49uoqWjUNVvRk+pZ7cuhb8GaMaDKYKDDEUQUwMxFHmNFOEM++rW
	7VpovpL1aYzSL/5aB34424zReT41sbhcy5Hjg7CvUe0N5G6GQvwyoJOSLMO8x1lT6F6oE5r8BgcPO
	hrD2MFBPMyUwIuLtAWmsJN0aLcOvtlBnrjHGfK1nYVxm1i5iKAOl2a+OVOR+2oMv6tDyWHPiDDGDM
	cyBSKxLO0o8GBlJ0/5s1cfJMI+r8Dt0zDLYZT6BweqL+rJk+0dWwIH7N8rQlcmqt3lASftZCIm1lu
	yNS8hqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW8-0000000B0nl-1gAP;
	Wed, 11 Jun 2025 19:53:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMFk-0000000A4hP-18Us
	for ath10k@lists.infradead.org;
	Wed, 11 Jun 2025 14:16:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DGbB026050
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=D5rR6Lo4tH82NjFO
	zo93parf46fMAkn3Ef8nfSo4pkKB1jWec2eL2rAceQayQMoPmusaAAPCXOOVphka
	NO4HWsiBQkmWXKsttGjMsPl8s0y1NczDz3vGOWrFbLKGiFH5kBaPrPq+8rpaXPdh
	5pTLsLgNlZu3JxrkkKKLh/5YfS1zHwCuTE40BXqW+vt22TqKeatk4Uv4gjUrRRHC
	uCYpxNlh6QvhfkoSMf37xr7grzMuWsFp5WLtd+ka4h0g5buP/1ZNr6P1hb3qpVvg
	7ZM++kv1T8HFahGUXWlSolJTUycLX5LoHVc/7qTylJKFHCtLtU5DsmsT91S9UNzK
	qXAWSQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2y8294-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234fedd3e51so60393595ad.1
        for <ath10k@lists.infradead.org>; Wed, 11 Jun 2025 07:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651390; x=1750256190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=;
        b=KTPFmoP1I88BrhBC4xs8388HJ6nYBIRg0d7Y8abZRQMVXiQzDGXmFMyNKi3Co+n/IN
         ReofiEhWj2Ig0w4AlHlyd6OuxeG9bPUK0Ub0Rq5mdNiYKOHktaBNJXiIBlisGqxifqZn
         30Cnq6XneLkOB3IuTXQGAxDzC52WfF/F6fIwwXKLQSd5Z1p3Mm9Rduz4cllWSkeuU4wM
         5GdbYrdRPAt1Tjl/vtT/ukQ3Ldbm77nrqta9CuUSqNyoTQb46LaRMeEOIjZNJqfe+jLd
         rtFWsFp9sq/sWI1zWLJzAWCSmk8f7Uo6y0g2i3imfXwPQelmOUnw/l9k9KmiZ8xDJWfJ
         VD4A==
X-Gm-Message-State: AOJu0YyndpBkrBP9vAFgBW1/2fVL9lHjvAoGMUFKQ28eyWzdoclnhAhB
	6/e5G5FXuh1dD4boz+yZ89PPxIvev42o+reqL4HO1qpXDlKNeH7IH5pAXUfZUIsGI9M/cXAkK+9
	0u51GJqt7M1MEJFZNqsub98XVjd2Db9eqpKTU/VoKu2A/BKn6r/e6ihh5M4SM2RKA
X-Gm-Gg: ASbGncstduyv89wJkiY5MeJwt/P7XkY3h4QDE0LlvVOfzY51B0D49LWRzft1Iy2Em8+
	uRDVZumqC9pVSva4+6IVHU7FsVSDaqPbPhq8Pc9GJM7KUievXStd1whuhui/WzBNhOjxpQFpDJa
	JGdWhsM+4VvjwOV89Tr50kRQ85bRqMDHHSYT1MGiNUf8BOVEaVmsKvRDY1uCsmpT4J//xbidHZc
	0/5Vy8he/AvmZhd7/gGHZkhS1OHYxq7ayIQ3wzJqhSMHD/MhjpuSzOKUER7ozr8qTH0IQJQLomM
	Speu/kMYU3OKsY3eiCVxnUqyiOVijSfDHPva7o5Vj+WrxBZeDLNMIHfgxOhoLJ1qIPukxkqU5qj
	5lA==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36093395ad.33.1749651389466;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2uDBQ8igKkYBTsTg0Ikh+u0ovDEWJVCVLhqrSErAiNGtYCfNi9+9t1iCO2ygTczxCDh5jCQ==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36092995ad.33.1749651389013;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410b4csm88301575ad.212.2025.06.11.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:28 -0700 (PDT)
Message-ID: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 07:16:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20250608
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOSBTYWx0ZWRfX2EdEwb/nuZNe
 NIzEw1BbFmgi5vQXo1Gzz/vKa2/scDaKExGe2QpWpJU0BVW2kjIYTpmYM0wZrJfs5FIF2OpbF3c
 7HMyvdGnr7sRV0bVVxRZk9NyIgqDqb9QLFg2uCet19oJRp3s2u19ekLoF08dE2HDkyJMOQxa9MO
 26MtTGZMedW4FLcLge8HM3YohpX7XP3EQC5aiHnt7isVMsyyvdmcfrXag+FskAjG0xfv+wkS3VU
 92SvnJ53aITH15fyThvfCLBapIa6oGXr4H0jfR+H46M6Ee2OQQTjTqLKurqLv7uF9cJJHbi33Sf
 WSWlozWklfeDUUVz4bVfwiVsPVO4UR1sBxauYP2ODjZR41W0zEgXQfz162QIYR9Y4pdlu9q2Sns
 EEvRGyCWJdiTa+jqCozMSLR1+61EWRXlO/YGovANCuJVJ5IZdhFshYfRs4O0Ic+0V1zsDQlb
X-Proofpoint-GUID: owSck41PXiLRwcGn0xH4-t2xiEeQueou
X-Proofpoint-ORIG-GUID: owSck41PXiLRwcGn0xH4-t2xiEeQueou
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=68498fbe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=mf2Hrz4NSIj861Bm59oA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506110119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071632_317675_86290AAF 
X-CRM114-Status: GOOD (  16.58  )
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

On 6/8/2025 10:07 AM, Jeff Johnson wrote:
> The following changes since commit 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21:
> 
>   Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2025-05-28 15:24:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250608
> 
> for you to fetch changes up to f3fe49dbddd73f0155a8935af47cb63693069dbe:
> 
>   wifi: ath12k: fix uaf in ath12k_core_init() (2025-06-07 07:41:50 -0700)
> 
> ----------------------------------------------------------------
> ath.git updates for v6.16-rc2
> 
> Fix a handful of both build and stability issues across multiple drivers.
> 
> ----------------------------------------------------------------
> Baochen Qiang (8):
>       wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
>       wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
>       wifi: ath11k: don't wait when there is no vdev started
>       wifi: ath11k: move some firmware stats related functions outside of debugfs
>       wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
>       wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
>       wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
>       wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
> 
> Caleb Connolly (1):
>       ath10k: snoc: fix unbalanced IRQ enable in crash recovery
> 
> Jeff Johnson (1):
>       wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
> 
> Loic Poulain (1):
>       wifi: ath10k: Avoid vdev delete timeout when firmware is already down
> 
> Miaoqing Pan (1):
>       wifi: ath12k: fix uaf in ath12k_core_init()
> 
> Rodrigo Gobbi (1):
>       wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
> 
> Sebastian Gottschall (1):
>       wil6210: fix support for sparrow chipsets
> 
>  drivers/net/wireless/ath/ath10k/mac.c        |  33 ++++--
>  drivers/net/wireless/ath/ath10k/snoc.c       |   4 +-
>  drivers/net/wireless/ath/ath11k/core.c       |  29 +++---
>  drivers/net/wireless/ath/ath11k/core.h       |   4 +-
>  drivers/net/wireless/ath/ath11k/debugfs.c    | 148 +++------------------------
>  drivers/net/wireless/ath/ath11k/debugfs.h    |  10 +-
>  drivers/net/wireless/ath/ath11k/mac.c        | 127 +++++++++++++++--------
>  drivers/net/wireless/ath/ath11k/mac.h        |   4 +-
>  drivers/net/wireless/ath/ath11k/wmi.c        |  49 +++++++--
>  drivers/net/wireless/ath/ath12k/core.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/hal.h        |   3 +-
>  drivers/net/wireless/ath/ath12k/hw.c         |   6 ++
>  drivers/net/wireless/ath/ath12k/hw.h         |   2 +
>  drivers/net/wireless/ath/ath12k/pci.c        |   6 +-
>  drivers/net/wireless/ath/ath12k/pci.h        |   4 +-
>  drivers/net/wireless/ath/wil6210/interrupt.c |  26 +++--
>  16 files changed, 228 insertions(+), 237 deletions(-)

Johannes,
I'm accumulating some more patches for "current". It would be nice to get this
first set pulled so that I can cleanly fast-forward and apply the next set.

Thanks!
/jeff

