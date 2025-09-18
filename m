Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89059CAC597
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=; b=gun0HKVFDl1H7wgiSroKOhssYs
	aeyeAK3njTNxwz4mXGe+pvL3VJu/LZkzWcml8Ag9+9xC85wPrkLH2mhKD1c5X3H+w2EUicPhu7WX7
	2/HhhfiRn990bmyWbj/ihzRZv8MlOrNKyvU3QLxCGkFXUKZSO1AvC5gEx7714/Yk8VBdWl3NiqFP/
	qh5ZDnteT9lSYhPDYY67CQsibHpsYQh1T0+Wbe9BTWVVb4CW+APVcZILEa8N5Y5P0WZO9mLCM5xRJ
	oV1hesmLfwKVQEPHdHzOC0ONQWTBpbkVLczAl09kUF7770Gt4mds7aDbLwLIdb7SLsY0XZKkcfsgv
	igpxObDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLb-00000001Rpm-2bo5;
	Thu, 18 Sep 2025 23:47:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLZ-00000001Rm7-0dCj
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIV1x6029614
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=; b=cdoEWxOevFYldDZ1
	7shFqLJcVR7S2J+1BMaQp7OlvYeakOfIyJPZOvLm9wGWhgyPpKhpho1Msr033Ysu
	r+3R5rxVcRC2kJmIBIftrpLerlAWuUq8bKl0MsD5cZ2FpepLI7M8+3dsdodM6W67
	GUXb3GiyLb6nx/mTqSbErtC4fUA08H8/dXU7eaMx+lsvvTetoz8Cv21JntI62ogL
	RPlOKJGNpHNhFmT7+8KUavB7b1UhP2N+9xpeJRrMqyA7D2BosuaPv478uZWJx/En
	8J/AucA4AUhZ4xXJficUVjBKTmF2lBoU9RlUP0p1y2i9ZF0tH1lad4OShjcBM9HM
	5x//Tg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy10bg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2641084fb5aso16004505ad.0
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239248; x=1758844048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=;
        b=CUSjh24JD2RL2Qdazsh45ZaO+UWdSTyiMnld4CSywJyWB13X5TlvMjuE8rp5liAAdK
         Q3ucMNzcu9xQvWTdhjFaXDcEpjU2T9pD8aVDhY5C3tPrqKCPAkLrQTJ0+nkMgXBNPWzN
         S8gQ8b6wrwZqO4WB4nIHakO8VjiXxhUMPzx5piQ6ftQYr94evzKrKI2AxNYQeGpRGSwE
         /g0bKq1XOBx/igJgNyvCQMdNYTJXiMnm3SB2Hrm6cT1EwBf9nEMMraqmx1maazoua4Et
         LZSZ4615Cqr77jsNyMNj+HX53BS6Fv+QVuEonzMqzXVpCQG4UjgcSaaDDFcJ3Ym4CT3L
         WhKg==
X-Forwarded-Encrypted: i=1; AJvYcCWBPD6JscXzZUSA3PWRHAsN0jJBtQU0d7+fDzxeMzAiKl7ieeBfTGGr2y0f3sK0mbLlALKNM2o=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt61reEgH76aM+uwoiL3SbvKXlzwATqYiMFpp+vTaZi1GkVznN
	vlsa3QVR1J4i4mMv6nOnYJks0iNNTh/Qd7E5x1Um76gzBoQblevl6B+gn7KtQjLjuJtmQsACmwu
	gPhqJbn2soZ+1V+3e0mGux5bYH0BdMgzw+SaivC1POEAV/GhsXgt74O5N0FGiNek6
X-Gm-Gg: ASbGncuxfUtLYCoIF7MUCj9z0poTWebU5olKf0C1/t6hfqWa5JiQEEufpK1vgZKaDpy
	J1c8859MGybrhd85QDVqPoCTSKR4POWvx2BVCYyk6OonuU5IaCGo+irDiqAQYy+XVRTXbZEmWHh
	8cxwtanx8rzacmmdR6PXLQc6lrELTutc0iEmCWFOFZzhmi/MNtq7/HdF7gzQc7dQgKSg3LKbgG0
	j87QDdI8sgbvCeU547OXw8j6kvUYjrH71JV9uaXVjtS7L23epZ0kA8x3Xmy9a7lFvEUOpQmHhBU
	KMIdOl6zmngB2mWRQFniLFCvF3ez/Es7w0oc/FEr94XB91AXzFXm3ghWiDp3O+eAPbXecIpokOJ
	g
X-Received: by 2002:a17:903:19e7:b0:264:f714:8dce with SMTP id d9443c01a7336-269ba5081d8mr19591765ad.36.1758239247939;
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6pdrrG/kT5DYHOezNz5h9+nn4BGxvAI5GesrnV6WPlcXl4zeyxLYLeOFQ2LPNRUv0K8Q2vg==
X-Received: by 2002:a17:903:19e7:b0:264:f714:8dce with SMTP id d9443c01a7336-269ba5081d8mr19591485ad.36.1758239247501;
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20250813214933.897486-1-robh@kernel.org>
References: <20250813214933.897486-1-robh@kernel.org>
Subject: Re: [PATCH v3] wifi: ath: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-Id: <175823924668.3217488.3526211732380687793.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: zb7xGOkvjj50TU_WRiOzCCN_JWbqK-Df
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cc9a10 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VjuCZWrZiTeoWwOd-AYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: zb7xGOkvjj50TU_WRiOzCCN_JWbqK-Df
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX4UaxI1xvdkFq
 ustR4z3DHv/rMWIzHT9jAeUB4Vgskaxx/OtiEdNDaoFGYQIVtp+Re9rJIrxmMi/8ziqIfDjWvEw
 GDmXQQDE+gyV8TG1iNYAN6qW7tx/Mq7ql4nM2PRbPYUSV0lus+bYXq/1s0vq93Wprg5dOoACcw7
 dyU8XMN74i3oQ7wRvVRyHGGnHZ5Av8Id+/WHaViDHR4WCcnVb/yHOqqaYjGuz9utI4BIyIkh5GF
 tw79Df1pnkhgnQSdOUQiPV8QrP24Ze8GcBaBeUESM15FeoDidAPCYiJGAKrLXEo7fjT2UvIrYwN
 TPD19FAOGh1LOnxQcs7hvMIsXS3D9typLDWQy6LqPevleNJKpSHFLcUfO2VUXhg9reXMGqZ6RRp
 ICkfjfrP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164729_199177_89A1C699 
X-CRM114-Status: GOOD (  12.96  )
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


On Wed, 13 Aug 2025 16:49:32 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: 900730dc4705dc78f9bf69c4c513ec018bffee37

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


