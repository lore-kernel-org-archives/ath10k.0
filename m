Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244B6C0218B
	for <ath10k@archiver.kernel.org>; Fri, 24 Jan 2025 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBgzsddn1AaQ6ApTxidChvIRA2JVHU72+jsfbcvmvuY=; b=fas3EyFIbafBEj5aYNHA86OGJ9
	Jm4+IGp1FK2usvIq+FLdRqBSQcr90GuxIA8G0mSRnvUw0hzpt5Os8kJTezDG2MgjJdAXon23sdP2E
	WipMWfDUkXGmbd24QVDh3sg1dsGOPbBn09oZ6IFeNh52gsAYseEVeM6tNOYfktzS9zXPtY3vIu9ZH
	wVGU4coAU5QyQb3Cl/eJxHkpptP7QxZAgx3lUZBVevKPuROulRWfc0SnCvHAwMPp2FUO5aXdKJxsA
	FNf7VWoxuD8BRjn1J/wr0191P1Dc6Upntj1zUwqv8TMfiQdH4JK3rx/fCVjnwjyjW4EzyjBOJExub
	766Ogjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPS7-0000000FOlL-3CL4;
	Fri, 24 Jan 2025 19:34:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPS3-0000000FOjK-3t8r
	for ath10k@lists.infradead.org;
	Fri, 24 Jan 2025 19:34:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAgufG015667
	for <ath10k@lists.infradead.org>; Fri, 24 Jan 2025 19:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GBgzsddn1AaQ6ApTxidChv
	IRA2JVHU72+jsfbcvmvuY=; b=Q9B3c2MHUslsCS7b/mUwsXl1s1CZoNMmHtk5CW
	eyfoxW6WbU+8htqeZDJrWsFrtmWX44cdjGrKvFGOK35qjHD30DNmEbUbh20C5ZZn
	yasf/SlG+ctYUqtodF0vQcqtdUX73ZOckul9ZQJyWvjdYqYudzYIYuNKUsa23uue
	Ou3bbxy3jrNpij3A9uTi0g95/R4wp+Ip0P6upFWvdmex+LTxX4/QPwUXKH9yPhwC
	V0JR1RlzKI9HyXTE/dU9HLBIldZ1Jj0JHoVKF69B9pBKCYguNqYI/xq1kuZJHGYN
	XKEvVsLMFoR6SF9udJgYWV/gqEsbdbEeUpjYYolod9O8PFYA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9bt18xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 24 Jan 2025 19:34:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21681a2c0d5so44028895ad.2
        for <ath10k@lists.infradead.org>; Fri, 24 Jan 2025 11:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747284; x=1738352084;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBgzsddn1AaQ6ApTxidChvIRA2JVHU72+jsfbcvmvuY=;
        b=jg9u/JQ2alwk8xEb0aAq5C8BeBYA9Bm2ElSoHRh8eD7KOsJgytCRdb9b3LBCwsEMLc
         SrCeQF9onTR2KtzzY61V5ZjDb6RGx4boDq69BLHVr4SM6X7j+wUPaTK08clA/0s8WJf3
         y2PXtkU56sNDoSS9kFzd00zsM6NRNRywinSgMfOhfrGAdfnebTBQYLqM9K1HgQUJLbw1
         RwFI5AXylCPi3wYXQQcbnNl2PfD1TNg7zBB0B+c4Y69uYkZfGy6oMZOx+JAHZdVbAzrb
         ie0xvJGK3Wy194RrU6p2tGchiUiQKw8j4TzD9pa4lEr0pcj2W0b2mXZ+SvLWpuvjOBvf
         xWyA==
X-Gm-Message-State: AOJu0Ywb5u8+xE+VJEx/CLINd3uoiz0LNzoc68TJ1OpEhvJurAzyeqgg
	f2f/b+tIxhejMubrmIvn4jxbBDaQHTE/wuyOOBWCtmYr4NDu+KWs7Y2JOWVPaSFnwLVA3z+ka55
	NyPy4T4xjIQ9iBmiH3JQHfYgJsn64RLSojsMx3hOwteQFjusITbDlyjioYk06Wlbl2ZEF
X-Gm-Gg: ASbGnctmpL8cIfSmMJZQSsgK9EZ7wyZe3IaQBA6q/aLgeCHBosnf259IGsOHXBDzorU
	UH//kKQ6Byg53kAccEfOD6g9Aqzd8r8iGOtRqGPcbGF4IOuawzps/o8SMlCFgUju6rh7qDddkb5
	ylQTa8fWEJXuVetI5NlzUOiYkCEWn/6St9wduzF2GeOsyAOhFqMs5R1FXPOLs5EmaMBD52qUeZB
	Y9nOGJOAkdx3zw2HtC6OXNgqA1bx4INtbgvGhtidcBr4VOm1NKKYKN+fcMKM1DCuZPaMoa/CEGo
	MInR2Rs6d7EmFhTnB+jZkNo9AbANFuU=
X-Received: by 2002:a05:6a20:2d2a:b0:1eb:3623:5a13 with SMTP id adf61e73a8af0-1eb36235af0mr42494890637.8.1737747284141;
        Fri, 24 Jan 2025 11:34:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSJA+1ljjIJRHkf0iGymCofgHmiawKyhAgfKNlM81XtiY2GY7mfJyGWC+MmnJGoRYnSLZeyA==
X-Received: by 2002:a05:6a20:2d2a:b0:1eb:3623:5a13 with SMTP id adf61e73a8af0-1eb36235af0mr42494861637.8.1737747283801;
        Fri, 24 Jan 2025 11:34:43 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78ee97sm2264332b3a.166.2025.01.24.11.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 11:34:43 -0800 (PST)
Message-ID: <3311fea1-c7c0-4929-b92c-16ab933de33c@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 11:34:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org
Subject: pull-request: ath-current-20250124
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: My0jejDOh-8IeS-4dzcut4d3UT2Ftwpv
X-Proofpoint-GUID: My0jejDOh-8IeS-4dzcut4d3UT2Ftwpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=972 spamscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_113448_090868_1BBDC0CE 
X-CRM114-Status: UNSURE (   8.36  )
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

The following changes since commit 146b6057e1fd28fb1a38d300bf76a38dfba7f9fb:

  wifi: cw1200: Fix potential NULL dereference (2024-12-18 19:58:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250124

for you to fetch changes up to 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64:

  wifi: ath12k: fix handling of 6 GHz rules (2025-01-24 10:32:44 -0800)

----------------------------------------------------------------
ath.git patch for v6.14-rc

Fix an issue in the ath12k driver where 6 GHz operation no longer
works with new firmware.

----------------------------------------------------------------
Aditya Kumar Singh (1):
      wifi: ath12k: fix handling of 6 GHz rules

 drivers/net/wireless/ath/ath12k/wmi.c | 61 ++++++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 -
 2 files changed, 45 insertions(+), 17 deletions(-)

