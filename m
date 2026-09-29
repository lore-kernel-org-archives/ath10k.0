Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DA5CA5FA5
	for <ath10k@archiver.kernel.org>; Tue, 29 Sep 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=; b=L0ZfTJiIVIv2qLs0bRLaqtOQb0
	GYwGnR8VQoYiyrdKOQi9y/5rHtvOOEVXDXslNa98+WspYoq3V1/MiZcfpWTuqtEmDJMByHXAR0f4d
	ccvvM5QYh9Z+nGIS1sPq0nA5u1JP7pyst0rp3t6DLtkNjH3a7iTBt95mi/ayx92/N+ZYTH+TUQlZg
	cP5mUiwce+JlwFyneRFLCm76g4mH0jvT3xwLfFbqDbmUp9WxNsH9lcYK8psvwMfDhyCvx8s4AF679
	5mBEuzsCwOr9t4zRk0wuvfJi9KJ5j37sHinb187C+Xq2+1qEscg1hITbOIv2TOgMkuv2xUFN/YcY5
	aA4HP5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHf-00000003rE1-3YYL;
	Tue, 29 Sep 2026 14:58:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZHe-00000003rD5-3rV8
	for ath10k@bombadil.infradead.org;
	Tue, 29 Sep 2026 14:58:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=; b=Tr5/4XsPoOLZe7WsT4un2gN9fj
	BeCfAzLzkpen4z6aRC/0aB0Y9Vn1XGD4LtJfyI1KMmNLYwmRg9L0f5JjXl8tmvXOsgTusbcWiJiQJ
	58wTyEY2K5qfMv/wTn0h9VZuAnjdSz1cq6TvmmqZViUqroQCQG6xn8qti20jDNArdxk1jVbK6d7w+
	PXYUkvf1Rgnuqxc0fGGdVBvM7om4Idn1WQJSVbLXD89rrc37PCiu9HxnwLvzKQuH3IQXeBl3z4F71
	ZocRwF+zez72PsgUaQgHLa2fwsTeNra3hPA52c6InNKwXN5uN/cyHXP5ybWELbynYrpXsUBsKwZ/1
	dkU2d5Xw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBZHb-00000002lMD-2hmS
	for ath10k@lists.infradead.org;
	Tue, 29 Sep 2026 14:58:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiAZ611688
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=y3FAXes+v/ckFLFxhg6vzm
	hXV+ldag2L1geEzXuvTko=; b=kC8tdC+O4jGkx7MBe1lGJU9fylEBoj41LNFXyy
	fFaCe7hCOkXfH8lEiLtdR08HY8xOWhAxPrNoHXhe2gTuVahIsgEXj+X1jAoli5in
	Ed/UNz66CtpcwYUNbDpyJz7syVqHlELEB+EYrGkoQABaVB1jbxaw2ZRuLdufCq2j
	jEKf5CpJi1YfyGFqFb3lT8SPp0EzLFm0FHnvECsP7Iisn9gnqTjD2i6Cnq3I0iJl
	00WH75mDgAGF2Ts/mnanwHPqxhaJFYOQVMRumX8iP+ZUM7zsVkJSBYeLHfm7Mja8
	0m/goyvW57TkwPiIyUQNNAJf4bvPGV+iKstdyXqX77GgEkzg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4uqqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 14:58:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso1642647eec.0
        for <ath10k@lists.infradead.org>; Tue, 29 Sep 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790693893; x=1791298693; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=YTyuWve1aF2QzRfJipkzHzFxw/8Bd5QCIozVhgbxFgYIrGxQk0RWthbB52VRgFb/Mu
         4EF093J9xJtSIizBdL+6QxqlWp2yHlmMyguGaeu0urjymdv9i0AWZZ4fMS6tk/bSvQ5e
         5+LqRBZ+kvasNtb7EMLbd+hzxoCL3aCW2YJPuT/hSEaNOg3Oj9QF3IdNAjmfNTvsa9SJ
         rLpXwDCuokAWKdvhmAm/KPKpc6Z/RvWtlWB1nvFCf7WAosTI+BrQtG0hus37VQunG9k8
         Na6Ys1W6MrkOLgTt33/Dmhnqw+KxT1tkRSpfmXsCNMSnqq5sIa7POsHHNnHgy+0XSPrh
         G78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790693893; x=1791298693;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3FAXes+v/ckFLFxhg6vzmhXV+ldag2L1geEzXuvTko=;
        b=pgAmMsXxIR/skQME7+XKK59R/TWu10JuhZ1LOkD88VEipQrBCDvLh1hPglREOEX9+Q
         s9rO9lswfOBjzOdqHGn5svTZjKF77pjPyQA16/j3dFLtKw/0bc6Yv0zOCwGWqizVgLkq
         b9lgDNWllF/lH6L7vtf3RK5PY4VhYB//L66vyaWZXMYGjvBwPCLsZ/QlcwO4byeFWjK5
         CUUc3b7wwkawpgNaaURc1DU3ZfoWoI99BkfJ/VLlmwdPy78H0rnzbyzsT/1XltTaEr3v
         VoOjWeLC4ClzZykGt5hwXP/axMyAS+81f4TJ9A8RmqgQel+v9CM7qlUeUKwl/eDusUOS
         1BKg==
X-Gm-Message-State: AFuF++lpTvuD88Yhx3iAp5Q4xLbKyb87u5eM7yvDWT6oZBty6eGC1f8i
	L93eW5lumJuvgjHdV1smX06vnBRwhMawBKqJt9PYR58ScLQp0KFl0y09OIEH5+tUnD3OtGw3MvZ
	en5/YSaXG81Jn01bPU6GDnMio8/o3U68si+gC9x5lEzgZGXGnRUqSUT9i49LM5hUS
X-Gm-Gg: AYBFou3s3O1LY8xnF1GFJbCHUnU9E3b5UsoP0WvYTTxGjEz1SXMBFsVZvCVIHVDUGqb
	DtYASlkP5tFWtVD91VBP+Mmxy23shUTuYbPqDQL+xJnDvkBrRH4mOuhohVNcijBIXl1E8nnuySd
	QAypTqoexhy5HykmwuDNHFnjABQoRdgQniywB4VOZ9HFW+q7GQd01L3RsNs/GEIf+6YK7DrDCCG
	U49Wl5EUiiPQ5g2KA10h8bk6JEh3omQ4HqTR3yyNgEnofYV+Y4z2K9A56VvE5kaGCcSQNjmIQHa
	CbOwGw5oRsQ+HTJ8wLfmGbU1o4wmQ7bcdFS4P0upI5iaLmUpyik2Kl3U7xTeJle89JiFsUt2JuL
	ErO3BxayZVjinyjyWWnKdLQjanAvePtjXrYU=
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297375c88.0.1790693892551;
        Tue, 29 Sep 2026 07:58:12 -0700 (PDT)
X-Received: by 2002:a05:7022:7f19:b0:143:342a:3d3d with SMTP id a92af1059eb24-14c18a55c48mr1297330c88.0.1790693891851;
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c60c55ed9sm163937c88.2.2026.09.29.07.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 07:58:11 -0700 (PDT)
Message-ID: <2b42b119-4271-4b9d-8a7d-1673c6ef62ee@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 07:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260929
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX81WGvau83Ni1
 W3NKMYqExEz+4DP6Ze2lfZO4XzOgVQNCXOPYS8de+XlPDuMIeFjnx7cb/9t1kKd3AXZx+jPYinL
 G8i/ooDK/XTvy6AVqlXrB455p58xX1U=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbd205 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=zv2FTJzYVlaOH1Dba7MA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1OSBTYWx0ZWRfX8dEkhnPila3H
 9iJhj6XrO7QeqH/P/+zhsUfiXOpFM6PoClHIYU5x2vAd+vIPHtmBNSBX7n3h+BR9dGQlb4FQpZy
 YHXkoww+0aG3O2+s6AnYcn16VLN336sU4G3svStHoRGKmy8mGtuv6KohO3p0Pp7wPnzA0q2W79S
 xlgsSXbdGNcY2ifVz6wQZVHwThu/IlnAQUs6+OXFbSmDKNeE8zqOrF0Khg9PHFKNLutNCmHzxuU
 KEogV6co7j8xOwgLCOD7+f6EhvCEjmNLAQmcX6QjuHSInj7It3kL3UQlKPeH6wNXB16rvxlGAuw
 TD1kwOY0/o/IzO60GTimvbpXvVYjkwoPqE2L3ek9f70jRap681eBnSm0iB/QVCAnLxqU6x71CKs
 70icaoog2HcJQKaJhcvEL51orb5wgjw0+xjze4VHT4oVAR4E2xz7jW0BjzQZX0WBNX0/Yv5YK2s
 jOFb+UYW8Lsk6257lxA==
X-Proofpoint-GUID: AyMN1EASKB6OH5zAW4fLzMvd-wTDtd6j
X-Proofpoint-ORIG-GUID: AyMN1EASKB6OH5zAW4fLzMvd-wTDtd6j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_155816_116371_A2A73347 
X-CRM114-Status: UNSURE (   9.47  )
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

The following changes since commit 6f63e919fe1e335b8abcb3a28bfd4804a98d875a:

  wifi: mac80211: fix slab-out-of-bounds read in ieee80211_monitor_select_queue() (2026-09-28 11:11:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260929

for you to fetch changes up to d52302171b61dbba6c9c15e80e9a5f02f1e9f95c:

  wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume (2026-09-29 07:03:58 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc6

In ath11k, fix an IRQ imbalance during suspend/resume.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath11k: fix unbalanced IRQ enable/disable during suspend/resume

 drivers/net/wireless/ath/ath11k/core.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

