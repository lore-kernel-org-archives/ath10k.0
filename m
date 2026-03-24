Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539D2F54AC3
	for <ath10k@archiver.kernel.org>; Tue, 24 Mar 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=; b=ryfEjKHWQulokA5aY37v2okea1
	0FPee0mE5601F5MLndq1PgEvXr8VCmpw/S5Chx1muUSJwnOsj3iHS84H0jYAE9/Rmmeft0KDewcw5
	o8tw8nppWlTxfLoMsJN1FjyhgQqd7/n9TStoh5AegFA9xspNIT64s/IwpRDXkVwltcHDg4BSDBCwD
	C2jzXxPrEegih7MmF024DMBEHFtuw+g4MVnCLAEB5GxwY1jDeTHndcGHXmXLIFwMUxBs/6RxelzPg
	+dRrJW28rZH9noDltx04o11yozk77cYSsWiykoEK+MEsZEhPut5GCcmiNVOvNpXwsprH/+jVMpLXr
	o33gqlsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b7-00000001cjh-1uJj;
	Tue, 24 Mar 2026 14:19:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52b4-00000001chk-0gG2
	for ath10k@lists.infradead.org;
	Tue, 24 Mar 2026 14:19:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9tvM93903733
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AFEWlTNSgwy2TspeiD1fvF
	mTtd2MiDsPAba4aSIeMGo=; b=ivg/mWnZ400T0g6ggTpY1VKzyWpyN1gi43+q7t
	Fe5Zkb9eT7uOCj9YDH+/dVwrE4YVL53hCq11dKbL7coYWqtiQVcV6NzH4s64L6T2
	6Y5TTprvUz3EHJa24vb5yVw0gZRLy0nFWrbpzEWYbHZIWiXS2qMPUlUMWBecEHa1
	T6UCWTTejkBXHaQ3xD3xfJhA1QcxUHnb5GcYIb3n47Bh53T09/wbZHe1CBOAqIT1
	lfNaxLH5ZpS8XBpob/JnBs3tN6pPNrexokzt9LG/Uil1px8Kmopbl6DG7U9ecB5w
	Aln9Jwf60+yJMZ2FEgzOHwLFdAn6xwTSPeANDEgMq43WJUpA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0jabk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 14:19:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c0d15416b3so19478393eec.1
        for <ath10k@lists.infradead.org>; Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774361944; x=1774966744; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=hNYgrBAgQQrezrQLYJW2gOCFa7VWRd6BOdr4phQ2vzLYelgiLrPwVcaKa4rlK2ZAhM
         zivvSlme84Es+hB5CgPd/CDUESnS8i2JkKUFbQGWznjIKY0Aefw0UPYKzLuikr1tg5Q0
         cwws3TkPo3Pq6bnPAaIZXs/Okd2Gm4vUzsU2vqUFApTqOHZCCgSLND4IA+S7F20lcSsA
         EH6u4zlvVcZjeL/16nbh/gBvOEirx0oUyq3dfIewYwoE0dVqSmP1EXYMBXk469LOhb2C
         5t18wLRqhtLCrjBZnw1IM9ZLbmb8pwJSIre4QuGsC9tVSsVWO5lg5v8uOiDcTt3QaVQG
         FhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774361944; x=1774966744;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AFEWlTNSgwy2TspeiD1fvFmTtd2MiDsPAba4aSIeMGo=;
        b=p5Q5ihCUjkI/pVhX/jgsK2m49JJPy2Od4fXqbzrvCH5gkuUH3m358SlFnyqMtSpA6m
         NopNcK4gvHlU3uDFHlcIGHbnAXZ+1NOej8Frz5fPDjg2txqw+QxUds0mU8MHwDOWeG+1
         nBgJkM+L923qmayFwb2GaF03OJcqOh9+e4qV1ImMR8tQtztJdrbgsonptzt577I/B1Pn
         zcmSLo/aHH6H14VcV8vMFubXCPVCzPY9VX9oYk4zWwFc5GcOQNo2ItDpm1EtwzjRKKW4
         CXgmhVo8N42VoW988xLIEya/cd0nw6s5+DNNIOPhRHQKfTvxau15ENHY1yKh+0WUdbsR
         q59Q==
X-Gm-Message-State: AOJu0YxH5Tm+tVnvm4XzhBv4RyEi/7rBYf35mieeCoIqWU/FUnUhqTTU
	CCc4XUqCHOt9ssFzAax7C1yEYhGFnif5R4V6pWt6IKtjARBHdok/lMn1N7LyGNnZUMuhegbMpxF
	2iBhCAl0eAIIkutn3WDrO5qZI1F1aXjqLNWOnqg0hCmyUTi/RkpNN8XmL0OcSK70t
X-Gm-Gg: ATEYQzyAdHWqom44IBOKU3pXOfQMxtdi4hvNUFr2Z6HjgcWIZaz3S0HxFyh7kNdQf6y
	VUHk7HCCPqHDqtn0K/A0MVUGbmEueQYriW9XxbsjADL1RDJyqFEVwgWkgYEWGsAparY2WUts+Ht
	fCZzIEb+4QDoMK77q6Pa1mSE0X16KIkAg/obzR2h/tJCYcuVrpJs+OUFSvo1Waht6lVarRniqZC
	E24yNU5IKP0WtfMD+gS7Zyl1oawK7lvFkjmONBQDAT3brQy6rTSwinyrkKonjb7t0AG38LMwk9K
	Rv1Yci6qeKMER5D6W8X2EDmYfYs04jm3WA/Lq5RwsB9aSnHMgAhw3BeHl7zILZaLeaHo+3wYK07
	knuZQlX9KSJIUFUKG/KC7CIEpPRS0ybT4zqWeWUgvEmANhaeFUZ1Y44sbNg==
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850339eec.26.1774361944026;
        Tue, 24 Mar 2026 07:19:04 -0700 (PDT)
X-Received: by 2002:a05:693c:3005:b0:2b8:64ad:ad4d with SMTP id 5a478bee46e88-2c1097c1a0dmr7850313eec.26.1774361943372;
        Tue, 24 Mar 2026 07:19:03 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1313bf5fdsm6899720eec.14.2026.03.24.07.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 07:19:02 -0700 (PDT)
Message-ID: <1d9e6d43-6014-43c0-bf47-843ef08738b4@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 07:19:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260324
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: b0_dfEX1cEKVuf1qsj718hcvCe7b_OuQ
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c29d59 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=3k6IHe8u8opv2P9pMhQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: b0_dfEX1cEKVuf1qsj718hcvCe7b_OuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDExMyBTYWx0ZWRfX5BkQcSdDaBnj
 q10wA3oJ1+ptkUgSKjut03QTim2Vnah4lqyBajcxdKroV1y1xv2sc/Cj7FmneEgr089P8dI1/G8
 qgvsc1OzRGMxuPQLrqbqdIf5cj1ggLhXlyFCeDrVyGl9RrZumR3za9u/NTzXcv0JJmI3c6sumJy
 lggQtUqP6dosElilGMYnLEzXeSPRjYIX4dvMU/SW1NEhqJtIgwbn0yraGkwJON0OzxZ5i7pAjex
 J4IaqJllG3CQzmxZpSqSjygzOOzHU7+pCkCDLzs6hUkhgBSm+r3yvyvmg7SDfyi3r/n9MrA6xqB
 yK2d/4mSVxH6HPZMCsyn88CEyXxZ2yDuLrfnCl/t0vt5/nQW242s029X/e8qsoGAIA+fBX3DkST
 yLdPZCpIWLxaiE4+efzliMQKw63EwtJSriyJzE++UsiPDiAWYzkLnb3ZicC2Ao/qrylkVeZCA3T
 DwN/0jUJFrTAe59M8Bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071906_387660_CB90DEB8 
X-CRM114-Status: UNSURE (   6.96  )
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

The following changes since commit a1d9d8e833781c44ab688708804ce35f20f3cbbd:

  Merge tag 'net-7.0-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-03-19 11:25:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260324

for you to fetch changes up to 4242625f272974dd1947f73b10d884eab3b277cd:

  wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session (2026-03-24 06:44:00 -0700)

----------------------------------------------------------------
ath.git update for v7.0-rc6

For both ath11k and ath12k use the correct TID when stopping an AMPDU
session.

----------------------------------------------------------------
Reshma Immaculate Rajkumar (2):
      wifi: ath11k: Pass the correct value of each TID during a stop AMPDU session
      wifi: ath12k: Pass the correct value of each TID during a stop AMPDU session

 drivers/net/wireless/ath/ath11k/dp_rx.c | 15 +++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.c |  4 +++-
 2 files changed, 10 insertions(+), 9 deletions(-)

