Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5470CAC5B8
	for <ath10k@archiver.kernel.org>; Mon,  6 Oct 2025 17:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=; b=w6N9ulz3OMuQijNnQA8WNOrfpH
	1fS0nB60ypWF/rI5NS2+NgLtME6q/c1pC8fDsgYxSJUSgkYt0cT3qIdjUDt2D0jN1GMRzp+NQLPrW
	CXjyOShfcH8odTYFWy0C5Je/XiOdjUneoIhzUHiivdPkLPa76jwQs4pkQPbIOQLjxUAxzUePRg1xV
	gpdZjVlTU+3whDARr1vyeuU/paYgxT2FW+8PQ4cUjsPGKuYiNYBgx6CXaZRXCVpTeXy5rzISsWOKM
	igloHk84FmwfFQuzO+kp/XSKImaU+bwJmLfCXRqsYQuOZLLUlQI0v+ttAoeUGIYiRrGre/gyu5Hjc
	+NClWYOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olK-00000000Tim-2smx;
	Mon, 06 Oct 2025 17:12:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olH-00000000Thm-3IZC
	for ath10k@lists.infradead.org;
	Mon, 06 Oct 2025 17:12:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EpnuF030297
	for <ath10k@lists.infradead.org>; Mon, 6 Oct 2025 17:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6uX8yMRU+RN3y5an9EtPvm
	iOJ+b25K/dHy7f3R3KmZc=; b=HhfEKCM7fnl6+pfb6gMNDtWYFwhTCpKvfexTHX
	/6/ZpRxP+xywLmYoKsHZAntTl94M8R/tQ/KqOBR7AYO+TWq8SnCLaaQsy0NyEGFS
	c414gNyua2Iax/hlGlP+oMNv4HDkX+cmyQleuPE4jNILGSat6IjSVP2/f1J76GPj
	FXr6dVGZ9nqiS7XGZ6WDGrC38ga7DNRYgrXfQm8PG6ODhtuSxIcVQKJhXKbhqFxZ
	5mcG3aL6Acadq+TBYu+FJ5jmV+iwOlSKUHMr2aMlGHqqXKf6a1N44H6ntqer11Ht
	FR8AxXlURGLwjkqjeyw6ktLpbCFXCo8U/od+WUQnmV5Xuoiw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dvswf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 06 Oct 2025 17:12:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b552f91033cso6071419a12.1
        for <ath10k@lists.infradead.org>; Mon, 06 Oct 2025 10:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759770754; x=1760375554;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=;
        b=hLayVgqWe7JQs9vf4mWb05Pfx6sktStsJP7t+9Z28uMT5rjOrgykmh08Eh/BKNXAQy
         h3wqzCXouN41Ea/iAC7GrjVowKYDayIfDBOsXH7j1bnAXVJEk712g5QJk2CCcb7yQeKg
         ro9+ugBzZMawrAIcMjPIgyjG42WoY2OuqVltzophLV+B+PP3Dxg5VX78qvRvQ97pivch
         Bs2HvKDaldQlD84Y0+DsvXc5m26GHt2K/O9OINCLIhvmGlsMcSu9Ea7yjOg1BCkNnFS7
         HnYxz6Z6JubBP+Ai0EaG044rZ4nb/YOt/qKQFH2KzorO6YUtpSmArETmCF2kN5Ho/ker
         RgAQ==
X-Gm-Message-State: AOJu0YxRa5oZTtriqqV77+A4ET+DOwYWLvFzrGPL9B/ayX/3N/N+e4iN
	nLK6mrL74thnAuZOkLBGHPCti5JGKj+FznKDWJ9N38QTrfy6sw07UjS7ZmjLD3WtsH9dkyn9a9n
	IApZ3tp/ARhgshE7Riam1pwSAyzH6mkfTnY1yc/1EUomH/S7D1px1+nFLEOh2qgQx
X-Gm-Gg: ASbGnctAjaWJNqNHMC2jp6ZpO0JDN7P8Pc8+KncHfSBoldXZNJT2dOBfyqylj4vuOyD
	KeDk+liY1KMe9Eeojin/UB4AzWG3NoJEvHTUhb7ewPQKUA0vNmy542IejWYv0+gk7vhp10m3FST
	Vc0abBohqLVd1BG7AkjqUf5kwizWFKPNW5CeYUzAS5+0ViUu2wxqPLocpYJJB6mkaWnU66fJrZB
	p7gSfSbT/L34+u9KTfx0n6M2OVMyYH4s3iDPWdxMaU108Kh1pbNuq1OjKgWwdYpOAbyJnXpKfac
	O35VgxBxFrWwE9EXmK3tklrRdvVcRdKKF6F26gEuTsHhkIuT9Bg3q4+K519QK7SduHg9bFd3ibC
	i2YTwgQ==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494039637.6.1759770754483;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcFsQ5Cj8EuYVNyQn76xpACvpnbuvWlGVRXDAN6Io60+FOAQqunJFYDQCHg/w+DzTzrjT7CQ==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494007637.6.1759770754025;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609ba636c2sm12363691a12.16.2025.10.06.10.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 10:12:33 -0700 (PDT)
Message-ID: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20251006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e3f883 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=NTglem7-DTcMTCxUeT4A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Q6j73oUfMntquBW3wGYhkE4VC5RHcdYF
X-Proofpoint-ORIG-GUID: Q6j73oUfMntquBW3wGYhkE4VC5RHcdYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX06efFpTX1Qat
 YNoNBQwrCFQNqcbdMgcsnu+7jvFUWqor9FMeMe1pIW1Ui57/5xhskWbQKHGKHes8XvnTeBxQX13
 1bnnhtkeP9Qcw/jdx+OoaMsbQUk3OpzqK1fQLHN+npwlN9ow6zntX28ptzW9aqQZd6rOm4bJc7d
 15kWuFEywnJ9L6rH2TE5+N8qsU/z43i+pi2/a8teRgYSmxc/NM8NId5dzDPZHkeOqbxwptwF18h
 rwtKUs5YnYcNEoHFZR3rKCV4cLCUFoP+BI2Oa1drARnhNfm6MceCC2NxYpN+yO+9J39zlTp/9Te
 se0d+U6it/C5LJJo1Xivd5xVTELj30CEAzVF5OYUenldceVOx1y27mnG3v3HYfEuuPQhE8v8RkV
 m8OmrD+PZP39WVBLr0mtvLHQn59j0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_101235_838058_8945BC83 
X-CRM114-Status: UNSURE (   8.84  )
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

The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:

  Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006

for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:

  wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)

----------------------------------------------------------------
ath.git update for v6.18-rc1

Fix memory leaks in both ath10k and ath12k.
Fix a sparse issue in ath11k.
Allow ath11k suspend/resume to work on more Lenovo laptops.

----------------------------------------------------------------
Karthik M (1):
      wifi: ath12k: free skb during idr cleanup callback

Loic Poulain (1):
      wifi: ath10k: Fix memory leak on unsupported WMI command

Mark Pearson (1):
      wifi: ath11k: Add missing platform IDs for quirk table

Rameshkumar Sundaram (1):
      wifi: ath11k: avoid bit operation on key flags

 drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
 drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
 drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
 4 files changed, 72 insertions(+), 27 deletions(-)

