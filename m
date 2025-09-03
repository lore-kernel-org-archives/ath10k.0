Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B64CA1005
	for <ath10k@archiver.kernel.org>; Wed,  3 Sep 2025 00:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=; b=mLKecsBbWEiKkL21HFgh8OmwTN
	4id2SCX4EQcJmXj0dXhvT7jCLb1pdLOVu7kd8K3F41yfQhXO9oMLpq6oQFKxlf1zF3d0kzaYd///q
	vztC/4O2/LZfMXo65HipmvLekIUqo62/0v0gI+ntXU+yMBa7yLdTgX26wxJSzoDQaLM91779eKoYV
	whwgtCxVhTg8K0rO37RtTBcQSyH0LR9WzBTGf84P7Icx7m9is/mmSLXzpZULAQo+Mr55fNqIlO/fb
	uyNpjLglc6I11AM2rqCCdsjmgd6mfF6Ndj/AXcXCn2k16boZlFi465YgbkGeI8b61Ug1bsZs+Ci9y
	1TEGdZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbf6-00000002uEM-3hEx;
	Wed, 03 Sep 2025 00:47:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbCG-00000002kJm-3H2S
	for ath10k@lists.infradead.org;
	Wed, 03 Sep 2025 00:17:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqCwW025309
	for <ath10k@lists.infradead.org>; Wed, 3 Sep 2025 00:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cTlL3s3wU08p/sYLbsbZNw
	CeQ/WfCrG0UOH18y1enxY=; b=Qw25cgHAnBYpc2vYAjDlzDvnXCGfa9sQcSorDj
	iyWVdZBQyPq92VAedW3V4p01QufZ4y/qYw9gnfBHAx3arm66gkKMe5xaVNlYM9ms
	nRrNnLIER/DpYNN5L8rcH6GBQ03pQXF3WQwmdRXZUtlFla98ePghyjIIGhOuxkq9
	Bx8fx9Ljn8/oNA6RR9NvWtyox83LHosH+uRR3otVCBTsugTDpRpkzh1on2n6mHky
	B34AgdwNZCAYAaSP5Bn6OYzvTxvB/F/Y0O7t4AFLZUqtwih4CPX7u3el3S0KaP02
	CcAAaPuhgK6UYazKptefvx1rGAWu7BWoB/9fD3cZ6MLtizpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv1q1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Sep 2025 00:17:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4fa4be5063so249393a12.0
        for <ath10k@lists.infradead.org>; Tue, 02 Sep 2025 17:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756858674; x=1757463474;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTlL3s3wU08p/sYLbsbZNwCeQ/WfCrG0UOH18y1enxY=;
        b=gbOI9jNlIdomvaK5XaK5HhKaTUOBHybUUNob5hdN3FNpBEZNpYJzUa/QOGQgjYNCSk
         XaO7uW9EWwCqkHTXi9A3WfsgRT8M/F3OOK5825aslkmGDy3iLByFoAg3juXUrcX0EDpx
         yHUOUg6fXT71FO9Mw8rsakRvihvrxPbNXh607Xml3LSDZBbw2eMd/V1w56vGKKXdpIby
         tBP5TwLv5Qmz5qWVP+5FjSRaAxc4lqxJZGydZDhwBKGOEKUST6PcxF1D4pDFQZDnN/9j
         VplccpozxuFMW/mN+65KHpnLwZxZj52hG260JXgU5RKkh2BtMzrGcXXaOUBMlYfBosc7
         otFw==
X-Gm-Message-State: AOJu0YwgQu09JeOh6yiZ12JA2XEe9uct3oPs/ZEDFyxywC3XmdrVjO+j
	SFpDtobBQP/ehhrd7vnd6S7u68XHJOwW0HUdCjd0yvkJdveLPveWb3T8wJsH8StZYTx4Of4om4c
	Om43DA4OVKwbJ1CL7eJ//SBWcGKRgXGWjnyOo4dln2FQ3ZVrXTSrVJ2i3hq105C+U
X-Gm-Gg: ASbGncvmgAhPSL1ENEWaP95/jxN2Rzcg3fUQHrEOVw+v3W3cdjYtbyMYHrTzPfksGcA
	2ffpTKkuWoBNEJIuaAz1hQfOGIC4B3vL4jv+O/dzZuzSgRGBT3zKJPXsQJSBfd/bAWILxzK/rmW
	Nwd+2xVOtdFDEYJCouJjrOoBFrr9Ic4fs1C3qQ/1v/kCZzy5qYFoXD4ZLfGGTUQoIqXQg+6HGcs
	lnk8Ks7N7YTvOc6SBeScMu2kj7kju4sO1wTy6EsycJXIpP6Awp1dFU8oMF4f5/ziOvIIddJAbpw
	5fSqGlt77a0B+WOJEQDfLuor1CR9151qikdfpZPXHaDulxyZgkKCbowyqxtPYOEKBsW8SHYln3Q
	y
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232371637.37.1756858673668;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFoBDXowFfmFVh9kvrykyPsnoguSqtBdlEPxuL91LPUOIVWBRu7O6kvVYOnwcBKK7zunER1w==
X-Received: by 2002:a05:6a20:3d8b:b0:243:b190:d148 with SMTP id adf61e73a8af0-243d6f02580mr19232345637.37.1756858673229;
        Tue, 02 Sep 2025 17:17:53 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772466e629asm10148491b3a.31.2025.09.02.17.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 17:17:52 -0700 (PDT)
Message-ID: <8fb26b97-f483-4155-af6b-493b2bd16442@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 17:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250902
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+p7YX6xsUklM
 10WtcWsd8CBDvDS/hm5tKoe52019nwKT5d+6SMi8vvs6op5zY7ef/T5MUwtrVJ8eFnw9P3FvClO
 uL8XWb/8GOepbHf73gqOT58jJ/UMEmSXGSjG6QX5gx40gCDuK4ZtEFfZH9kiorrKQhDLTg1MpXW
 60uM/N6dvTkgIr3v3OJg9NQ1bEhrZwyoMT2UhY1Emazb4t9dXnmZP/cy/54NW1p/r8Dcu0Stxie
 jJ0cB3cGHSOdL+dqns+fc4tBhO7hb6cHl3Bqa2KBg7RB8BwFNbvmzdy1q7ETgFftjZ/+Mf9UAEf
 9VZ7tnMIYAfrQGyu069cOc0uz6/hrB13AA8A+5wY9HOUWsYq+5bEj6oOO3JRAzYBbCpQdReQd3+
 TmrvXIm+
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b78932 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=ETpNzpHT8A4ojKDL548A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ZxvOyI-36MfcbGx5rVALsREZM-_sR_nK
X-Proofpoint-GUID: ZxvOyI-36MfcbGx5rVALsREZM-_sR_nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_09,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_171756_934521_DBC382BE 
X-CRM114-Status: UNSURE (   9.46  )
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

The following changes since commit 2c72c8d356db40178be558bbbd43a1d0b5bd0c27:

  Merge tag 'iwlwifi-fixes-2025-08-28' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2025-08-28 14:03:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250902

for you to fetch changes up to 97acb0259cc9cbfbd7ab689e25684f3d8ce10e26:

  wifi: ath11k: fix group data packet drops during rekey (2025-09-02 15:43:16 -0700)

----------------------------------------------------------------
ath.git update for v6.17-rc5

Fix a long-standing issue with ath11k dropping group data packets
during GTK rekey, and fix an omission in the ath12k multi-link EMLSR
support introduced in v6.16.

----------------------------------------------------------------
Rameshkumar Sundaram (1):
      wifi: ath11k: fix group data packet drops during rekey

Ramya Gnanasekar (1):
      wifi: ath12k: Set EMLSR support flag in MLO flags for EML-capable stations

 drivers/net/wireless/ath/ath11k/core.h |   2 +
 drivers/net/wireless/ath/ath11k/mac.c  | 111 ++++++++++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/wmi.c  |   1 +
 3 files changed, 105 insertions(+), 9 deletions(-)

