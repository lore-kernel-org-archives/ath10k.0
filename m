Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E7CCD185
	for <ath10k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2y7DvilVSsIpj1n+xs4x4u18Kici2xqROvNnjvsjBE=; b=Z3N++kIsKhZ3OXv+lCUp+tQMyg
	guCu1XuUkyo6XWVZXSNMUrXfUlA1BSnHdZ+QQpBhck7+xPc+AW6wNNQIZUqqP0qPDKDY5criBdwnE
	pgRQgYx5ZHtd0cinMT2iH0OTSIW6FWx02ZLmORzapjxFTOPb9TSPzPwsTFG23idktNcGJMZZ4/q+g
	KM/LoUr24YDb598Lx+6pRxpt+5B42RjNrvKDjwrFiAktrOj0toqIQjAYt2ilOKoo8DnrjmOKhNBxX
	DpPQN6MLUsY01DEyuXou97skIuyjlhVMixQlqygKfIlXOw6AhM4KyPBhazZS9x+Un8SrHZEUTV4Vf
	g7lXnCJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6c-000000035g5-1gXn;
	Wed, 15 Oct 2025 23:40:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6Z-000000035ez-3wxT
	for ath10k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJf8DO003457
	for <ath10k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2y7DvilVSsIpj1n+xs4x4u18Kici2xqROvNnjvsjBE=; b=T0DqI0jarZ1dLMzQ
	+w7OfiAM6p7N9ipl6ZzVwpd0QR5h7j6c0FQZc9zDShol0a5F+vDK1Rc2Og2i193F
	oQBqBteRiTAzJkLiwdO9xIU1SY7QDHHtE7+H1a73L6O2IdI4ATzMVqq8vbN0+DRy
	Q521YaInCg3o9LJwlX4/IVxdsJKV9tvUKcImzUkHVNOZBy0n0cVRNwHNgYHJDBBU
	HeoZHBiKz9uFLKwgw9TP4yOrwawqMpCgmZHts4PEC4WyV2Vvg87wGUrwaIbKKDkO
	mknLuWNQc9Ya9Cm4xUUeLAgiUQVqnla4Nr0PxaB5nvHVoQD2/tn5JPvSyz5ctu4Y
	uSxPZA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfa8eatm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-286a252bfbfso3392215ad.3
        for <ath10k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571626; x=1761176426;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2y7DvilVSsIpj1n+xs4x4u18Kici2xqROvNnjvsjBE=;
        b=DbK2mmR6i7AEDVtVG3lvjwJhbiV9vB73xCXgoaaO327EZ6+1nTM1xVDGs9kHQmj5kf
         wjJ3FnhzyhiaJRsiGY9dCqT8wfq7EzB2c+mzjkSMHh+JncjwMYHu+qUkzK3bKIi0+s3Y
         RifxVkRq0+aV35upxwc2galMP7okBUEA68q2NXdvCoAhSCVyteodWMnRiFm9+ielapuK
         cA2TBQBDWWfoNQNdxJAHTUaPemxquC0JeQWfDdHC1Gt9GvZ/KsRHFHdRPOcq7vNHxj0j
         DxAqLs4MBdU5dxLNktVgjcq/cORAAgmQuN9wvnLbDCVBjTLwH6KSQ93tr6abjyIqyYK+
         lbOg==
X-Gm-Message-State: AOJu0Ywx1X4qhdqUjKWTlITYD1A9yAUbiYNvpCbbwuSff4F+dd/wfMHH
	9g2WvKYZ3G4P63go/M/wx9j6Sn+A1XBO8dcL6naakwfzGAHlwBvJ39WgQiZA1skcMZdgWm8L+H7
	9/6v4HSL+UZSSlpynJmHc1GedheCMltazoprqLXwtMzls2v36o06C/aRubmUMnhgJ
X-Gm-Gg: ASbGncshr3Sd87nEinZXSR4uYwUgy5vV6Ed7kmUz2kNZcTj7RdkfMrsy8Kysm1JMPhi
	iLVumziKIYQnCatQsklqq5KaFNOhAmw2sAkk9c+AJuCVb6XEGSCPBcNIsQTISyn6DsEdIa0hz0U
	jVK7LKTCdn5GoOpdksEvcTKSc5l9iCwwo0Ks5ui67QpSyb89cm9iQ6lL5KpTKm1nVFCZLe6kTZJ
	cyy/B3KasUxnwgIqVeRbW7HlRhJEc5M8/5QEfUsM42NEMjg0vaYJcFCUjAdmh6vIbUjCf9W3yes
	pGeAz7BGvqpiLsIp5zMy3uTyVIFa1nnURoC+O7KL2nL5FNMl/lo/B4Jfh0DVT19Ct1CvaGZmMDu
	wbvscrN/nnow9fap3JpmJE5S3IjRLl2H5xYg=
X-Received: by 2002:a17:903:3c30:b0:270:ea84:324a with SMTP id d9443c01a7336-290272c1898mr387721995ad.38.1760571625752;
        Wed, 15 Oct 2025 16:40:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGH/RtVbZvlZEuWFJGvIgQ26gYvjD+I1WmAco+magWc/UkmUXCHWYCnn1m7pgJPkBEYE1/vRw==
X-Received: by 2002:a17:903:3c30:b0:270:ea84:324a with SMTP id d9443c01a7336-290272c1898mr387721885ad.38.1760571625355;
        Wed, 15 Oct 2025 16:40:25 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251014110757.155-1-kang.yang@oss.qualcomm.com>
References: <20251014110757.155-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3] wifi: ath10k: move recovery check logic
 into a new work
Message-Id: <176057162473.260563.11516806197165920162.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: zYKWney0z40r7jjMJMtQc3CWDgksRYmV
X-Proofpoint-ORIG-GUID: zYKWney0z40r7jjMJMtQc3CWDgksRYmV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6ILNI4D+su2f
 SuLZ/3OzYS7Jjky7OAOIvSqxcqMWI94GMS18VSlxnHB3kRU9XCWfh3T2gB7u7A4vanOJ5n4/iu4
 R3+ik+EUNzqYEj8cztTI5Xm39HeJFmMFnnSMndJ+kaMWSYXBXKXDPpQOrP1NW4U+7qkS1MI20eQ
 UQSbYfHvPsrIZ+audz+L+xgW9jMRXSfjGS8rXnpDPqaFeVgAXVAyhOi5iDdfDUkcJWofAtQVh/O
 K9X+NLSt2udrtEnvY66E8T6xYY8d2CtKcGzIzjgQrfyyf4WJggnc9uM3S/K0i4j2ktN68RMD1AM
 Smr/Z9sbnkZdKz+2unQYsSlp18JXFTCmH67YoZtif90DP1PU+m3boyUuliifXx8Cyk1K5u5wylt
 g+hlt5Fdg6mgMT1hxAdC8oFZHOzrlQ==
X-Authority-Analysis: v=2.4 cv=JLw2csKb c=1 sm=1 tr=0 ts=68f030eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3obmPjyOJz7ZQHQ8r5gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164028_106348_BB34808C 
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


On Tue, 14 Oct 2025 19:07:57 +0800, Kang Yang wrote:
> Currently, ath10k has a recovery check logic. It will wait for the
> last recovery to finish by wait_for_completion_timeout();
> 
> But in SDIO scenarios, the recovery function may be invoked from
> interrupt context, where long blocking waits are undesirable and can
> lead to system instability.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: move recovery check logic into a new work
      commit: f35a07a4842a88801d9182b1a76d178bfa616978

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


