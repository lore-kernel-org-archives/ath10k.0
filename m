Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8497CD484C
	for <ath10k@archiver.kernel.org>; Mon, 11 May 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=; b=3w/y2Eki+LX7TA0vqxtae+igYk
	qHfV4wLoGErDr+X/FNYD3gCWbbRJtgtSqJWbbTFbSijgHrxJDUCbumXO5yX9dmi3sgyE6x8Iuvxio
	NYKlrXEA2h69+ewrn4NeV9jG2/qlB7y2dAkw2YU2m9frsub/xOx5hUXgxd4d98zm0Co8YLBya6g+c
	9TsD1GPX+PSB37vBM/5jGqMQXm4zj6N+fehIQS3f6G2DOGIthySPG5fGlIy/X9Q2c0PCS6lGdr331
	bI17T4mSNr/FP5n/lABdnID59FdExuG+t2B04JzZDV9/KtfbDhYBZL+U3ptXXiGBjPn0340br/f6k
	QOAEWDLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA5-0000000Dzcz-1sii;
	Mon, 11 May 2026 15:03:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA2-0000000Dzbb-3CTY
	for ath10k@lists.infradead.org;
	Mon, 11 May 2026 15:03:11 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BEsgUu017644
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 15:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=; b=YApZwCjPaYhXn1mO
	v+0n0Sdpjvehiq1To/+/ivPBwksE1AOgwM+btFf0MYtPHBBgEmDpJ+hWDndZ9ih9
	TX3neOrQWuqPc6Nf5LKed+Io3JgM4FFBQSSoLegjoUGjK4a6x8iu6wLjBOY6l6dv
	GgO8URKPSiviZZnvMvH37/VvnWMJ7TSvjOxx4iQ0+NLm78aCrAr2v+NYWGFCy9IF
	iRMEZM8UBQBtrw4rzK3Hiiup+kxLVJIoheokDrZsRMaEZe7szLfGaXnCDZGTQYtp
	TvPScqPec2l5Pt0Vl2okkqkwmMQ7Z/5F2vZeRPSAdQgD3J05zxqvalIbw6bMThEN
	4QlZ0Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xftbg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 15:03:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2fded513994so2813616eec.1
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778511788; x=1779116588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=;
        b=OZUiAlc0NEdRuR39ssVaC+o5Ncf8qyYYAiEjFhzmEpMiRHI+6j2HvA8gH+5pjSoaDG
         PwIx3EuscQJpQvSlONIRe105xzCBlY9A1um4VtF5O9Qa9fvgUCmmckkQ7e0zOAmmAIEC
         FAQTal9pKvG1CTAsHNEc5irWgyLi1GeXvpdHcc+OlkJRVK6iHu7+5IyExFXN3h2i8/xa
         +yzcuNoWugUA3M5NobtHBLjbvNLVstAtH3f8fpMqRqNw+WWQ6Emzvy4JcKDkeYYozESz
         0/vm1QdfRUPBXyvysqpKpHlg1cF/G4HpCchKWxqmtjHoKAsnWJD/t5dNgGHipsgqo2lS
         qLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511788; x=1779116588;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=;
        b=TQK2X4st1ymgVRDdYDTVtGHSeMj7csssFY58ZseItdMdh9M3/XQCoyiQ5AM1UwHzDC
         UP+IdjXeoepm8UF+38HS7jJP4TQO50ppsmqazNXLkv3o2mzhivt8RE7So9Zql52UjMuJ
         kIHl1mEp71XGuSw92SkZsI0yvudCmLNAdCcu3wLdqtcZ7CnaEaU9UhSL1kdKOY6j/Xjx
         B0uKSKGGNq3Cuc451wsgiCtOILhuEK1f76oPjpoCYks6nJzNNBHcxM/iPT95zA/jOQ/u
         rM2WP4qzVhwYqdiSyuNw2MB+MXsgniRWI62mIBPZiF5BAQb3miB2eQrW8AOkUSPGqhZT
         H+ag==
X-Forwarded-Encrypted: i=1; AFNElJ/61eaJAw39udAy9lFxu73pgzfeCBdqiIRNmta0XYe0Qwqt6+X/+56d6IATH0l6Gl6mPPZYKCU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ZxllM4o9qF670wcP6yeAndxb5jkrf2v7m2SfEyeA0I/7Klzn
	xFE29YtK663xvtBMvb4wcS7qyz6q3pf2d+GaKPiOYXYfjmnHkcg2nAdueJfmzs0Xxsar0wz/8zu
	6qxq3loFMyE/SpEJBz5Q1GiNPowmQ6NvFc6NPt9dFehz95+iLf2ah9dVc0mgkELTO
X-Gm-Gg: Acq92OEehhWcY4UnzqILZTnR33bjU94Y1II2mbr5fe7Ca1oBQSY7SbZHNjztd9Y6SLq
	sf3lOmm+EVtST46xyJbDAm+NVprTFWXw5hgPWRj5fD9VbvpYh8fPIWaxuWuTSR02DpaPRCfkqOW
	yoSTrSoQDzJAVwENfjP0g7juynsnubkzecOLA+Kn6gklohkLwdInSBRRc+5rTr4yLVIrF+Vm71L
	IW4LpczmpsaIHEK0ASv5mJQ2iN/MWYvWWS6ukOAVrgpmeV6tWOwliYmcEOrtBCKB28LBtoKI6z+
	DmmxrmcBzCjzWbTfWwvQyiqqqnRLYOkYKYubYquJtwpbUnjCQfUCx/+JcjSdCPPSZfg3BFPxlTJ
	j/j0BPtTM9JaLp5mhohocpCh3HbOYTea10FOWYFswkG0dvc3Y9ltekU5EFvQgQMJY/XgO8tsj8f
	l7
X-Received: by 2002:a05:7300:8623:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2f54da9251emr11486695eec.33.1778511788038;
        Mon, 11 May 2026 08:03:08 -0700 (PDT)
X-Received: by 2002:a05:7300:8623:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2f54da9251emr11486624eec.33.1778511787411;
        Mon, 11 May 2026 08:03:07 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm17330453eec.6.2026.05.11.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:03:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
References: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath: Fix the license marking
Message-Id: <177851178607.1372190.16665093744685318001.b4-ty@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:03:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01efad cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: UJLwbEpGq-wPdqxgJ9Vf2g0bzwbz3-Rx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2NSBTYWx0ZWRfX3tHiI5Pq5N/q
 Tr6HgBe3apKdRwUTcB8ATTNJi5qK+ng/rg/cnhtFx0KD6dt7gt4YS/DUW/7/RZza/XI8XGJvA59
 0DJdlZ9cqIDZWEGXEJLgZ6ngAhvnKTd8tjhw3wu3ake6lNyG976TbtHkkHLy4k4DQaN4LSFvgmH
 9giqrobV+wNB6AX0eKQl2zevsBqzuNv6tiCVvX3qe0OicpYiSekmH+3nPHfU/tMF0nyS1UnX+IK
 c3rIPgysiOVAU1AsFktB5cfgaq0DmdsopE2AqOhTyz0i+ic/1rM7i6XLoWmr7mz+IeYNO+k30DC
 Qs54DApXEln2JHy6jDsWJkJk3PlSVdiRAbAS0I+EWJAyH7yRu4fqpJ1o5mLp1HudkI8d53ZynwQ
 500SoFdk2FA+cvwfsGFYuGMTX+YtARCMY1Jt5ZKzw3n4gcCly+B01N/aqk45rk1SwxNrqQ+V6dE
 x7+iMF+ylXv/KmnsWJg==
X-Proofpoint-ORIG-GUID: UJLwbEpGq-wPdqxgJ9Vf2g0bzwbz3-Rx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_080310_920839_F48E7835 
X-CRM114-Status: UNSURE (   7.39  )
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


On Tue, 17 Mar 2026 19:08:32 +0100, Daniel Lezcano wrote:
> The Copyright for Qualcomm changed its format and replaces the old
> Qualcomm Innovative Center by Qualcomm Technology Inc.
> 
> 

Applied, thanks!

[1/1] wifi: ath: Fix the license marking
      commit: db17e958184be9fe2b6242b7c5b7b261c0ce7110

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


