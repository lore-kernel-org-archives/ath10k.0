Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98213C88E40
	for <ath10k@archiver.kernel.org>; Mon, 26 Jan 2026 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iy/DdxqOHIDPsTQIWdLrhaiBD7ZBiKQeA1fJYxO8FOU=; b=Vkw/WDfMd3VusOIbOlSbS7kRVB
	AEf27OREMOBUTTH3NA8z6Mwn0cxOWEOtwCcO5GWtLur62LCo1Lm6WG+RaizxwUaUNE58F+2d2eqDZ
	P4C31r0Tw1ZD4dqhBoYmXW8cO2ssOz4mAH9aCfLotZa3Fn4DWD8uoRxkim+pj2pbHO5TugCEw+oJ2
	P5fGJKPZZW8dwrkgdQaqz9d97IYksXL51YYpSX1rsOB+o540Qqkx14tDG00xUqhiB5PMpIHv4gV6a
	QJ+bF7PRcxcEj+oenGCopiUo0pFnC7F4PCJmxEBHk9ojMx4XvhKjy9Vgd6im6LyURd/pBvanG8zSi
	G7yRoN/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC9V-0000000BmTD-1drg;
	Mon, 26 Jan 2026 02:16:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC9R-0000000BmSM-0xB9
	for ath10k@lists.infradead.org;
	Mon, 26 Jan 2026 02:16:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKNtvp354539
	for <ath10k@lists.infradead.org>; Mon, 26 Jan 2026 02:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iy/DdxqOHIDPsTQIWdLrhaiBD7ZBiKQeA1fJYxO8FOU=; b=R72ArKrGv4UaF+fY
	0euuCov1cE56U24RcSo9nwNTs+Ywo1zRdQVTnUkUixoO243R0fAEA7BLu3kVVszY
	spJ1kLWkIpYQIGQRiNxhDznuCYQ0oQA404SgCQXDfzhlUqDC89E2on2Nh5DwuvJF
	/hPBbd2ZLiOg1AVV4JI3kSTG5FPm9QdcihUCR8P8s/oQJe52j4vassmgdsHcHoRH
	mU45U8SDZi9E4hyWhkPh+BmpncLarVl+/xvfNAp5dOL9RD5SS8mESTq/5tn7YY6k
	KauekLzF3FV/I3Dp7XMSDbChqPoK0TDPyytJMHXCWD1hrPX/ANpqXT/eP5H20/qK
	nusz/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qk39d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 26 Jan 2026 02:16:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f29ae883bso27820995ad.3
        for <ath10k@lists.infradead.org>; Sun, 25 Jan 2026 18:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393782; x=1769998582; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iy/DdxqOHIDPsTQIWdLrhaiBD7ZBiKQeA1fJYxO8FOU=;
        b=iyCwEmKlaGCGFYKz9jw+Zf35CZVzl700yOx1WXNVLNatJ+5MpRjL/BT5KIFGyJI/71
         1jhZlQ0LZNRNFjHHZk6Rg7n9JekXJJ2n+IMI+eV9ljdMFIKFVJoh65JYuEqw6wQJcR1P
         Ex0ebzAo1HsTM2QNdOyhMXtXPwr0YXD89Zaf+b8LYz4/DKxCLOcVQPnAC4Jlgz/vPrXN
         4VbP9mvJejVbEDiOWUjEGAiPL3F0MevGpdutfMYHcgFxw6zjxoKz2I/D5fCfZjoOD9uV
         iQ1hBVE+3hoV+yTmwJl6U5Mx0TEhEeMnXI1uqYxAlSIO+mJz2SKiUEk1ZMIAHJI1eab/
         HQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393782; x=1769998582;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy/DdxqOHIDPsTQIWdLrhaiBD7ZBiKQeA1fJYxO8FOU=;
        b=CdkdvEKCLXygPrpXVwaxS7nYmurAKF3TovmQ+NAPn/Hx4iQXOHP9FP41Elb0msXF5E
         yVfV7T203t0r0IUhngErkZ9sYL+LKXxQNEq35qAMv2ZBA5I0zdjzQRszlNJKugWbmKGi
         gumHIHe3LqFBiZ2xZG2h6QJOjnKYdS2vkDcdVsyH6e8gRBVklI/MfbmsOJ1APR9xAaUF
         Qss4Q0b8DXTybwbCeT7uoJJVja2jIIgSr/5lNjqU6h9BiRbywQAG7207rtoT1QR2hyio
         JQ04dZ2+QazouXa3lKiXk/GOT7gVl5dzO8PEamHetgDwT1/ecnDw2xV1FFvwZW/tT40b
         TkDA==
X-Forwarded-Encrypted: i=1; AJvYcCXfCEwhRXlt81WrPyPZ/RbaY+jUCwiWVnoc1vRJ0Epy0tDMPOWjiH6JzpSjYs3OrBhZW3pe+0w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7UMs2Yd4Fb3aPKwcTY5y/WWOG4+UlXiS7PBGxlPTnK7tQkp2r
	NnQuA3q7L8ZjUmxXKKZI9rjl4wzw1vH2EjyCvVswi3nRtl1qC6+67FzRMijukX9ucEbbDA5CPje
	4HfrAxsSnBZn1hPBHIGDOCi+tgLOscdJCEyotS9sGuDB3RAMgolZLPY8vhexGIHiy
X-Gm-Gg: AZuq6aKnozGanK2bx/yY6SVB2KWnlAvSR1AQgIhWbDPvyEk5ldRKmDBP0DvZOGFEgrV
	1Nb//keonJ2fvkUW9OJLI2Ua8oAQOysuLYWXSa4EY6P+QMFjT12eqqLNnxVc8RVJQy7kKQViIf7
	E/cmY0cV9RLEuVZm6gSWZ28FMgUrWlzis4BFziAs1nrYo3c8R+0TdxmdHhCYPOURvUwAixGSp01
	fkTnUYmsw2FMciXrbJHahVKo8FrTzmG0+80jUgH5RM+i4/92BK4Rwh47D3asfwtRHBFgbEUS45J
	IfqEPGrOkHH0SFOs/IfnXZTmWeumEdU8M70QA+EQuiJ9esVCUvuk6lsoIY1349+OzWTrl1THP/m
	csT7xN0D4FHKt0f0Uyyqcvd4HPLM/n+tg5WS1X23lfNUez3JjT1cM+4lS0sso5xA/GRVU2N34qR
	mYFoL0KgM=
X-Received: by 2002:a17:903:32ca:b0:2a7:5a8b:fa53 with SMTP id d9443c01a7336-2a8452f0aaamr26325755ad.50.1769393782501;
        Sun, 25 Jan 2026 18:16:22 -0800 (PST)
X-Received: by 2002:a17:903:32ca:b0:2a7:5a8b:fa53 with SMTP id d9443c01a7336-2a8452f0aaamr26325515ad.50.1769393781986;
        Sun, 25 Jan 2026 18:16:21 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd123sm75883185ad.96.2026.01.25.18.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 18:16:21 -0800 (PST)
Message-ID: <b28dd974-829f-4bfb-8111-f1c676b7c840@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:16:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: sdio: add missing lock protection in
 ath10k_sdio_fw_crashed_dump()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260123045822.2221549-1-n7l8m4@u.northwestern.edu>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123045822.2221549-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DOmOZhjmDG4snhUOcNhI4EIY38PkgZ98
X-Proofpoint-GUID: DOmOZhjmDG4snhUOcNhI4EIY38PkgZ98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX4nDgN7qW/6i6
 0FVV/GvgKZmGAcO0k1L0kN+fQSQ5zjuSsLZyy7V12XCtMaRB8Abe9rTn56fo3qsugw8See77HFK
 9zEBhBVR0piagi9kAT/xpyOrJhaISE+Khfdc8zcltra2WedANAEvEqdqXax4dMsG0+AXNxjcRFo
 CBYFiJUP9pad0ZeCta845xr0XJlRzZjDVIBxHRfLNWrwKJOsj6AXzy6GGAvLXoiZ6QvGjWmQCDm
 1xFJKOc7ByEq1Chok4kzHmwQVwgHD3pAIESGiankMelV8FZXZKNW+u4XFjERl/dkBq0d2PWUnop
 02Cm9E4WfTJUYBq0vdMr2ua0TQiTqiE/GXysKy+E6q2ZsqIJUczbx1c46QMUOj2aeOIcyRzCGzu
 SFcLzbj9OvQiaJKPyxhn6ydBTCiVzpIHcI1SOQNjaqwM8QurEtdgX8z11yurONGR3vMvghrD8/Z
 A/8ehlJiglqhf8/LfhA==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6976ce77 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=e9pQcI1gHFx6xeePYlQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_181625_393041_EC1664F4 
X-CRM114-Status: GOOD (  16.98  )
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



On 1/23/2026 12:58 PM, Ziyi Guo wrote:
> ath10k_sdio_fw_crashed_dump() calls ath10k_coredump_new() which requires
> ar->dump_mutex to be held, as indicated by lockdep_assert_held() in that
> function. However, the SDIO implementation does not acquire this lock,
> unlike the PCI and SNOC implementations which properly hold the mutex.
> 
> Additionally, ar->stats.fw_crash_counter is documented as protected by
> ar->data_lock in core.h, but the SDIO implementation modifies it without
> holding this spinlock.
> 
> Add the missing mutex_lock()/mutex_unlock() around the coredump
> operations, and add spin_lock_bh()/spin_unlock_bh() around the
> fw_crash_counter increment, following the pattern used in
> ath10k_pci_fw_dump_work() and ath10k_snoc_fw_crashed_dump().
> 
> Fixes: 3c45f21af84e ("ath10k: sdio: add firmware coredump support")
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index c06d50db40b8..00d0556dafef 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -2487,7 +2487,11 @@ void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
>  	if (fast_dump)
>  		ath10k_bmi_start(ar);
>  
> +	mutex_lock(&ar->dump_mutex);
> +
> +	spin_lock_bh(&ar->data_lock);
>  	ar->stats.fw_crash_counter++;
> +	spin_unlock_bh(&ar->data_lock);
>  
>  	ath10k_sdio_disable_intrs(ar);
>  
> @@ -2505,6 +2509,8 @@ void ath10k_sdio_fw_crashed_dump(struct ath10k *ar)
>  
>  	ath10k_sdio_enable_intrs(ar);
>  
> +	mutex_unlock(&ar->dump_mutex);
> +
>  	ath10k_core_start_recovery(ar);
>  }
>  

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


