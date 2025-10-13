Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D0CCD18D
	for <ath10k@archiver.kernel.org>; Mon, 13 Oct 2025 15:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=Oybd1iUUASkXpC45FucGMXwz0K
	zMOvJV/bFlybZQs98qRxU8a9VbEruxonA88R6PWrvf98cObL+RCL+GUowGlUL74hEqnEVO7cwaHmj
	G47cnKTsx1ZTfvIXIlY6JrOuP0RxomQrdXaJ+QY0/yAg0rBvEmmoCaiuIEQQ3K5vzxzThZDNyYSg6
	ULMM18Q1wMNaslmYKzP9CQ1WPDHB3rx6PAxriygm+QM5hdh3U9BOVJCgszGtWMCa8b2mY23NaqLmr
	DTn04Rnq8HOcu9OuBMmrl8nb85vZMPVJTQzIFKf7EqUOp7BBg9BrhfOUsg9KV9+Ds9u82AuVZX0DT
	xOizomNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeG-0000000DjIb-2lVh;
	Mon, 13 Oct 2025 15:39:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KeD-0000000DjHw-2XCs
	for ath10k@lists.infradead.org;
	Mon, 13 Oct 2025 15:39:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DAk9Dp022192
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=; b=F9j/NwLmz4Fbf0Lv
	A2kJotKX+VXn1eUmSlYnDhzKxqBC5XE48IsCjtZZ30/XWpM4dyMHBANlJqygJZxm
	gu99K5aLjf21rYg/CvZVnZMX4jvZ54cJgny4UL1GtuGXydsFOtPS8Bl2f17j08/R
	ruDr6Iw/B4PZhn9Zu/e0foTZFg6lahdYJnZXUjgkBJCpyjjv6Z+iFEUkAc0wwXHT
	CFuP6WPWHMrP3yjLWdjZIXOoi/8od7s1gKZ+ohioK7tbKwZrpN5sxlHlAUXqAvTA
	aWDSbeXWJab8h5N3iBRWivo0ajVM4zJ8IqMg8BCG3k7EPULC8bQVys1kWFs/aP0U
	MLo1fA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qgh6546x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 15:39:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f914b5a4so6675257b3a.1
        for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 08:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369979; x=1760974779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gFxfNALQj0kVo1nFaR/pZdz97+/8Uqorpj5QRkTfdsg=;
        b=nfi6pSwrz+XioczbACdu+XPZhAq5QhAwoX+8KA/hVaVSfcv4lOui2JThnJ31Nj8oN2
         kOfJyojgnQKlR+Sao8gilwuSD84UG0x1QPdHn8/q3evBX/ikNR8I9w9yphmIgSyeJ4ES
         I6oPdJ449yWWBHSOIh21Rc/exVZBosXwHkYTjVny4uGznYiJrRe+k3bSZ5ybhWEE+v2u
         HJI91kH3piaf+dng0t3IAOhPe5a5mY2wvNg/LtnMpN6XCzP0Tb1Bw+UbdKu/iwC1IrSw
         6bZTsZFY7Nq9prH2VhM/xzRbvRc64+UaU0tCtqKuht8rx9t+U/N7JIRylbD/pXOBMOUq
         sv3A==
X-Gm-Message-State: AOJu0Yyw9hqTm0IBe+OLHc2PE0Kk0Iy7X6O/2POx3vdtTLIuoyT6yvre
	mraj1Cf5bqL9CsxSn4g30XFlk33/NWUxdD4ucax8WI2x9dLRQBr6K6F0rSOf2O8vtjDBApA6+Ts
	DBFvqtcl34mbtcIqO1vVYCIFffj6vYqIGHocevc41GeWPOBEpMLHhJs6fPOt9+WqdJnrnC7FR
X-Gm-Gg: ASbGncuyIoTvEl3xoUteWVfM/0RqHDQ4/pNqrXqlTTIFbRVY5A0aqiBbZoiTpZPaBfj
	2EI1rUTZOYkaUZaivv5jcGf2SsV3miSkxU0gIcwwTi0JWtQo+h2q6C+yoppQj6QnpbnzJyWMN+v
	rJRJSvvbLxmfMHZ2/ZIioVSjb2FjlZLpaJ0vg1ej3AjExK7YcpuKJye2AdB8NGKWrFqsaJIk+1B
	yccfME/O7jV7/TWvouquK7Vk6OaGpPkWDa1kKNblb7kYr2x9DwFFlbn9f1CQhrZt7nIHby4k1ng
	39Ct+CX3KLyMymaaM6ul8jMtC+eEJyndIbwVlmTycqz0lGMe39kxuF1WEZ+KN5V5cJs9EdkwAKx
	gtB1RUxiLkQaQDnXTclzHBSKj
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218487b3a.21.1760369979396;
        Mon, 13 Oct 2025 08:39:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4kxqkpVz9sQusAyfzIDLIVnk2b1584b0w/ts/XE/aPdVbk1/Yuuxpe1N910zi6UxYAFwSQQ==
X-Received: by 2002:a05:6a00:2389:b0:77f:68a4:a88 with SMTP id d2e1a72fcca58-7938762f6cdmr23218460b3a.21.1760369978948;
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096527sm11927416b3a.44.2025.10.13.08.39.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 08:39:38 -0700 (PDT)
Message-ID: <1f47148e-30cd-4698-8b1b-3a22a6c1fefe@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 08:39:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20251006
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H/zWAuYi c=1 sm=1 tr=0 ts=68ed1d3c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=WHy267Qvh4jMVSjEg6QA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyNiBTYWx0ZWRfXxUoBP2ljbu/3
 hYOdYhKScCirS8MUTtdh9QiCljJWMUMGRbzrJVfFN5t8+hv/cOjn5D3rGXnMkrl0vEWohY5maKu
 /FsO0/xwdnu96/LvPn6ZlmAEJJ4KDMXBeUdjQCVUhL+gD+bkvhS/3CvmOdl5jFbESceoIO1TQbU
 lKiMnMGXNoY8JxTUVcbFdn6i8ATe0A+D65bh2222BYjcuYUUUwpzOAaTey3lUqPUYVs6cUAYxvS
 CcTvHjvy4m6ezOpQzYbyQjOmVYKxPWaJARIy4AFuhr5Ajd6Adx4G61mdzlJU5AqwuHIBIRNt+KQ
 RV/JDpX45icA/oTTnY8M0B8BkzXhKkj4qTKRjUpZKuTCLO+ZDI2woXsJJvGvrcHtEZK4B+xsM+E
 luCTudQqfoRpUke7E+ImxkwGCVywGw==
X-Proofpoint-ORIG-GUID: JTuJixyiadNMteLN4OZAThnxIjvQSY-S
X-Proofpoint-GUID: JTuJixyiadNMteLN4OZAThnxIjvQSY-S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083941_676436_614B26AB 
X-CRM114-Status: GOOD (  13.46  )
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

On 10/6/2025 10:12 AM, Jeff Johnson wrote:
> The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:
> 
>   Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006
> 
> for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:
> 
>   wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v6.18-rc1
> 
> Fix memory leaks in both ath10k and ath12k.
> Fix a sparse issue in ath11k.
> Allow ath11k suspend/resume to work on more Lenovo laptops.
> 
> ----------------------------------------------------------------
> Karthik M (1):
>       wifi: ath12k: free skb during idr cleanup callback
> 
> Loic Poulain (1):
>       wifi: ath10k: Fix memory leak on unsupported WMI command
> 
> Mark Pearson (1):
>       wifi: ath11k: Add missing platform IDs for quirk table
> 
> Rameshkumar Sundaram (1):
>       wifi: ath11k: avoid bit operation on key flags
> 
>  drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
>  drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
>  drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
>  drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
>  4 files changed, 72 insertions(+), 27 deletions(-)

Johannes,
Hopefully this can get picked up for -rc2?

/jeff

