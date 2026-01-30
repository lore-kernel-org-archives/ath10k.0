Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFBBE6BF20
	for <ath10k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDBUns8QdVZi+Ok9YKzcXeyCwOvpVb+XbSmFY9coZ58=; b=dwEsNTIoauisIBaWeQs3+ClT8b
	FaXMbuy5BspVzTaW5jPBCulRs9nhKGbH5aBXniG+FnWY98TJiBXSljDK3q4rLKYNMU3HX8MVtb5w8
	zLuLdn1hmrvs2pTYldtb6JdjictVSYaOK3PC7I8XoPcyxJP5ZAkKQMj1E6yGAokuGYYxcmHstZt1g
	x+6i8174JUv5fx0ACdlbJeus3betUq1gQLkc73hFgpuxPsVoC1aQFnTd2afAYdx1HbTetkd6uJtYX
	ovEA8odA4Di9V8e0mNsGtjbBNfCx7roV2+20aY2Y1Mufuo5THOQV00W0TyGRy481N5/2macbDaWQJ
	vNrcRM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDl-00000001csI-3o4N;
	Fri, 30 Jan 2026 15:15:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDj-00000001cr9-2oMW
	for ath10k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U9VFTl2675693
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDBUns8QdVZi+Ok9YKzcXeyCwOvpVb+XbSmFY9coZ58=; b=o5WJZxsJnBZ5o7gr
	OojhQb8v3eMhzwcDWNdtKEEeBwlKHEYik3ByfoDzPFs3pzYwPSb33BBNfzOYZV9i
	FdMvmwOnA8HayUFQU5Ve2paJqLPON5v/U7aPYMZWszuUE36NHXqZcyw1TZsYzBRx
	6LBjuaNBrJU4viY2mNRTe/IHwLHlCfOyZG0EoIc0UWgeAKkBiNGCo+bHSX8p33o6
	DSpWIp/8JOr6BCQYT13X1IHb4rOsyETVYzXHhVcJtU/ZbPNTmheip9xd4tilnVrV
	p3NVwUqQue5LNrlxI70pN9EqVuFgEU1KDGXohDG2UshAbSZ0hHsNPED9IFeSRKpX
	bbYdzA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0t3410yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b738854780so357811eec.0
        for <ath10k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786138; x=1770390938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDBUns8QdVZi+Ok9YKzcXeyCwOvpVb+XbSmFY9coZ58=;
        b=Tzmn1GCkdkJqbv0H6+VBz0hVghGTRrWT4rYCLUUKTZb0M7ij/GnH/G6hNp114tsNDR
         TjfV1p0zpU5VTaWRDlp6stZPyyVsRQZLDe0GZjfpyAQz0FIh4kwtJis7phUfl4g39daY
         RBgA8+XPh5oH0UceWuHrAZleWMgEW99wj4CmB8iUGQLvRP4Sv2cfK43cIqROAaEgRlJS
         A7vY/z5pqsUQTG6zRLgghvtRM42HAxJqUGJ0I/ihXNENb5QwQsSM93PwToKAx/Y7Zx7g
         Q5evU/Ut1xThbsGV1rZyeBTNYaacGAuAIyW+JJxOR6BVjgxkK/jIP7gQPNHiLi7/5Qz5
         3Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786138; x=1770390938;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDBUns8QdVZi+Ok9YKzcXeyCwOvpVb+XbSmFY9coZ58=;
        b=F3jSfPpsMhzM6aDMOBECS/urBs98HyEwjug21umVM8p4YJmSr4P33Ja3FPvRp3f2Gp
         BWe6fa0rKKGPItBAcVAdTqtpTh4c/CAVpuerNL0SKQsPp64PejX4APAxVoACZAnegTab
         cYaElcE01SXVe4vvHLiZ6kVhY+TCJGECSzfvToV/EKSAIQCmGb6PkdgRrEtJccrM0Hvv
         m6qPElZRtxEs8OfBLtaZU20t0jArX4X7r6fZr2PfJ1TzfAX3jWfEmWwHP1R4q0uwGl1+
         R/nEOl7yL/qWCFqnL+iCalas5dOMiY4q+Pp2MTHOUUinQex3amxJN64Aka3XxJ8cbvpV
         zkOw==
X-Forwarded-Encrypted: i=1; AJvYcCXJb0E4IX5kPpGcAgQ01/jn7ZMFFpXQjqrIdvHpy8XvrO2aZ0CGRcIF8BpfbGHsiZ5afdm2LJI=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrp6xQCL3Uu/kUeiwl+gbGUpDEJEddPUFU9XlL3OxmMXgvk/Xf
	Y5DtUkERIDJHrGM9ra1wzQQdOMXFaknAHJ7zVeHlhyy8tflOF5bWHwwhowoxLMZf0xsxyFC8fCY
	s2m/+yAsR30fYYHunuhSPRtqWBghbhKQfqW713EHhtBvzMsw+fKiRJSUf/IfVSyMz
X-Gm-Gg: AZuq6aJHFuZf7H+lrZbnV+EQNNJPwF8dpP3fpr6+H4TbM6vRgALl6QnogGKzuFm7YbD
	onXh1GcFWfuvwvUf4GJD7IxmJIHQdj9N2t6PrDOqY0C/7i8HicSvSlMWcfqfZ4OZrdWA6NRDnHW
	OSONp2U3D6onve0Pa1BPNGkC+gBKFf8MzliUog5Ojvf01FPKZIr3Xp7xAP0jI94mTdC1jrBQTij
	7nCPNcXZNXUv3vJDKbegTEUuDDHvktdjOOe0IgyrpwCSMJmUXj92xd1GlXuutXrveqBy/68C6wF
	D4B4t00lJuqP8iWnQL99xdGXgcPwLshu5uhiqLNNMhOlvOOyJY81Za7PVzYwEacOpFXBE8XUFQi
	XcAasyf+FK5U8zfwXJWRfK0i2gwYd5Hm+0v1R2HOX7bEyw+T1p9x/QkVtlTBJ8N+8
X-Received: by 2002:a05:7300:e825:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2b7c87e1abfmr1540045eec.26.1769786138134;
        Fri, 30 Jan 2026 07:15:38 -0800 (PST)
X-Received: by 2002:a05:7300:e825:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2b7c87e1abfmr1540019eec.26.1769786137396;
        Fri, 30 Jan 2026 07:15:37 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:36 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Ziyi Guo <n7l8m4@u.northwestern.edu>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260123045822.2221549-1-n7l8m4@u.northwestern.edu>
References: <20260123045822.2221549-1-n7l8m4@u.northwestern.edu>
Subject: Re: [PATCH] wifi: ath10k: sdio: add missing lock protection in
 ath10k_sdio_fw_crashed_dump()
Message-Id: <176978613677.3951544.12305626465860433221.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:36 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfX5qpTNCJa3Fj7
 LiotJ2QVwlYn2v3qXiGizeAkPYlgRCVWEdnJkCiQYvK8uyza7g0Wveir3QC9jnT6q86gUd4Vvsa
 3udyD8siOfX1l/SRhHEzxTO1NYZOIG4cWY9i4xqBnvfuPRDBPhHvxYkZPZuUAe1ePs5fWq710/9
 jSn+lA11c+pH2em3TuLrcrCdQoSnWFyuA27K+J802Fklojt6XvkOl2yRh+l26chbTYZxsNxSUCW
 wthruYEW8a1/E8FGbRaAaGbdwCINJHzejbxhv1D7GUKJz4aWM3W3hIr8ccTviXH6QsCYAaZsxb7
 F+xLcuKyPNSgkR41nqW31xWFnB22zEHO4nCPyFU60utp/Bc6m1ucSGcsK8mff+eslhejkpiIQUW
 6fN9XhcHWJ14EJVJ6O9X5KABBYXKtUAm9qHO2DZT5oAObmQQivYBZ2VvfhjcnusymMlbNRi+otL
 uFIX4jVPdPQWKeIetBg==
X-Proofpoint-ORIG-GUID: tsYBFr19bKx2pKwcCjTwOnHs9E71ydPq
X-Authority-Analysis: v=2.4 cv=QfFrf8bv c=1 sm=1 tr=0 ts=697ccb1a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GIVhQpxbiHrW4ch03kQA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: tsYBFr19bKx2pKwcCjTwOnHs9E71ydPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071539_713087_C8B0F5B1 
X-CRM114-Status: UNSURE (   9.78  )
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


On Fri, 23 Jan 2026 04:58:22 +0000, Ziyi Guo wrote:
> ath10k_sdio_fw_crashed_dump() calls ath10k_coredump_new() which requires
> ar->dump_mutex to be held, as indicated by lockdep_assert_held() in that
> function. However, the SDIO implementation does not acquire this lock,
> unlike the PCI and SNOC implementations which properly hold the mutex.
> 
> Additionally, ar->stats.fw_crash_counter is documented as protected by
> ar->data_lock in core.h, but the SDIO implementation modifies it without
> holding this spinlock.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: sdio: add missing lock protection in ath10k_sdio_fw_crashed_dump()
      commit: e55ac348089e579fc224569c7bd90340bf2439f9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


