Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAB0FF885E
	for <ath10k@archiver.kernel.org>; Mon, 27 Apr 2026 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=; b=T9znzpzJCQvLahwiOreQ+bsPgX
	++cFVxYOKvkqBUeM/zHua6dQDIf7aXwR+iDDVHmqLI25t2kPe6KW4vAtLROkiHEQUcdM1pZZ0e9aB
	q8rRo7pjDj69Xd+gu1pSoiwXtiWZpErY9W3p8NWGX+ShQ+J+jTCvNGB05huX5399yxaAqxvi4cyL3
	X1HaPPuo0TM0YE+IPfOH3/CodVOcvxXih6FRHH7vyxh62FxGRAcjbLbUC5qI6miKM9QSWSYlfdydn
	6ApRujymJo74YogX5bOKDaoqvacuqI8gWVxt28kY2nhPfNb9k8plUgcXdVcMhmm096Hlje5p/HB/X
	MfVKfARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMXA-0000000H2qh-1eVK;
	Mon, 27 Apr 2026 14:02:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHMX4-0000000H2oH-2Hc0
	for ath10k@lists.infradead.org;
	Mon, 27 Apr 2026 14:01:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RD5qUm665646
	for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nILNB2NfkxRGoIS1fc1qp2
	JXSYpJLFP16z5zIuaSkNU=; b=H0hbbVxgLqait/8cAo16Pjys5o01mh29ilPdb2
	hdaTjtYbbpV5oZcHNe66kjrEmjf+GtxUnrUj01OSWwnk2PyVdijk4FmOLr7dqez4
	JJR/dsbLAFKDQsib0xz9VXHEBjB0x/rsCTjbtvCLBQOCUg9DyGuZKI8mo5eoEZBP
	OkAfC2OHUNcWg1qvAmPDmPNENpWCd8WqE1XemimTC4saI/nFQageBpLcb52lmQMK
	Q+o1R2gPEFJV/AmDF93umW9SUT+90KF/8FP8AaLjRTUqJJwKogZQ0A4Ou+APoUJ2
	4sU/ATNjFCE5XftvZTbhgf7E7AGWwR+ArwE32snC4UuH1+wQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n1phv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 14:01:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so11078704c88.0
        for <ath10k@lists.infradead.org>; Mon, 27 Apr 2026 07:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777298508; x=1777903308; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=Is9Q+q+rc0T23WOcKCoyVObOx7dAw5AaMdfopRm+qJdnchAcLJ/3HM0irhL4hypkhe
         xrvUwknkUBgU8raKPsspB7znp45KV37LhD92TXCFn5LmQK/+XvfPyS2nNRDsHWHNPoIS
         PZ1H/g7ZWcHoTVF6m+hJwLHTqhPDzwjWWIRzrRhUw2o3Sh5nJQu/vi0ENPr+u7jNOedQ
         V9LD6dEHW0iXGomZMwsN01cPmK1QRnw52avErOFDHkXDyvICe8KMk51AoSXCN7oQa6RC
         SdTSP3UQxFIYdeBVKgOtc33HIuSBS7Q6jHXb8bn9SVC8tsOJ4xSBeSjr7Lwv3O8Gde8p
         OtFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298508; x=1777903308;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nILNB2NfkxRGoIS1fc1qp2JXSYpJLFP16z5zIuaSkNU=;
        b=m0ruPKe1sJWNTv7hwq9sI8EijCmQCQr7DCF1CYzm1kD7+7QYznvJOyXcrXeG+FWMkg
         NY7hJSlrTm/53fsyc8yH9i4siRJZex/iRBJAumTW4koQ7DO8AXUFFrXwxrRryq7GOmPA
         J3GUwJxCpaXaFbqxGK9etV7WU4BN/z+GOFO8R90UYERMdsNNeWj2dbwtk9V+Bv3hIHTR
         rOuFECYbjWaxJ2mnz4VIrLGMqIg/IaL5kbMTYKCvwgOZmXG5Q+3u3a8wimgL7V2ylYoM
         ScbjoA9XkNaY4gSFFa04olegwbfSs2H+ANy8LxYjocOnbNPEZ0ZlbOFiu7cQ8jYZJPT1
         3fSw==
X-Gm-Message-State: AOJu0YyEVvEMl75FmnYCBDzwKSfr01Vc/9AoR5UQBX6lBh1BSpfvOjMd
	MHCQ+Pt3O193xxokS0Go92kw8zDVcoukvej1PdNHtQvNE0JRWmFiPVOyUcssPQX4W4U7Ik6Afld
	P7s5R9QzfrfWgQL3DIqPcdBdCegyVcRNgdj4w/GCwbD2jWsE3UJTwTzQmjL7SFPRPBcv2TjMS
X-Gm-Gg: AeBDietQn0rfQTzXnMYsUOkrQyeQfSg9jgoNmYqYEVsW0tAZHh5hc8jNhUPkcQfkUn2
	0Zesehs7BQKsjn5TMwy1F/mWDXkZxdLjVM+hrKisaW/ls680Zs1eWdRZ2OUviOOotjyFV19Yj77
	AR9cHtwM59SWAx/rRC8sI4Jqzj5XJClXgtVpD9H/+kmuyvshiuuBYT2hek97AJk8hZx1vigE7l5
	dtXITPgLtP4+hmuwEJYK0DKv1zSXkN8fpmNlhaQfbfNQBz3/xzly5rkoG03KV03Harg8hqGAAcP
	OgFQraaf+8N6P7QpbXtWcLJ9aLJncfSz17SPbnDSs9WNBytKSD/NxDl/DtGGXTdbGnYJvaW0RM9
	/l3S9o8YhswIqPJkzkAx+y7GNdDYweVqlMz2vgKclPyU1i//vpiwcXunopOiaxbqgB4wE
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649833c88.1.1777298507811;
        Mon, 27 Apr 2026 07:01:47 -0700 (PDT)
X-Received: by 2002:a05:7022:321:b0:12d:b654:8171 with SMTP id a92af1059eb24-12db6548357mr14649716c88.1.1777298505647;
        Mon, 27 Apr 2026 07:01:45 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dc6f08eaesm19806512c88.12.2026.04.27.07.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 07:01:44 -0700 (PDT)
Message-ID: <411dfb79-9449-4c7c-af0e-d9d1dc81f3c6@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 07:01:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260427
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE0OSBTYWx0ZWRfX93heij12jOgz
 kz2J4oFct8BZ0lpFVkHIdePxVXTT8ZdEOPuvXKA2MmUfEIFle6eteuuRvPS4pI/XbAKQNA9XM4H
 Cng8cm+aJeTs4dRirwUc5XksDItxzW1hHawJlF+5Ytx+9O7ipaQVMUdJZqWHuNkGv9kQDBWdfFY
 zPT9Wr0ArD9zInJ/8SIp8AGW4g7dgK4qNXmUqJiYENj2FvQWIdsyjw3Ej30qjJBLGnESMy0T5wy
 v+rAVYYxyklqxWsu+kTgFAV/YhVTcf7WmUXkgwwQKM9YWk9kjRDiAhmSkOyYHNzPJSroEG8NI0J
 +M7RBfsJI9ckk++WNLuXrH1ID36ECzpJoejUy2QTR53nFUXoSJdazDiLW4mUMT/foR9ZvQX1oTV
 n95qvQinlA2Q07Dnuc69hQdYGPI2rA==
X-Proofpoint-GUID: 37elbtULHpuv7ePjP8_IsgSD014rPlHZ
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef6c4d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=9dYn0W3-_-pxAYNLL-kA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: 37elbtULHpuv7ePjP8_IsgSD014rPlHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_070154_581019_49940420 
X-CRM114-Status: UNSURE (   8.09  )
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

The following changes since commit 1f5ffc672165ff851063a5fd044b727ab2517ae3:

  Fix mismerge of the arm64 / timer-core interrupt handling changes (2026-04-14 23:03:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260427

for you to fetch changes up to 4498664e2d5888efabb96428196a926acdaa25ed:

  wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions (2026-04-23 10:57:50 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc2

Fix an ath10k build dependency issue along with a few ath12k bugs.

----------------------------------------------------------------
Aaradhana Sahu (1):
      wifi: ath12k: fix OF node refcount imbalance in WSI graph traversal

Baochen Qiang (1):
      wifi: ath12k: prepare REO update element only for primary link

Dmitry Baryshkov (1):
      wifi: ath10k: snoc: select POWER_SEQUENCING

Yu-Hsiang Tseng (1):
      wifi: ath12k: use lockdep_assert_in_rcu_read_lock() for RCU assertions

 drivers/net/wireless/ath/ath10k/Kconfig |  1 +
 drivers/net/wireless/ath/ath12k/core.c  | 77 ++++++++++++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 ++
 drivers/net/wireless/ath/ath12k/mac.c   |  2 +-
 drivers/net/wireless/ath/ath12k/p2p.c   |  2 +-
 5 files changed, 54 insertions(+), 31 deletions(-)

