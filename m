Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD61CFDEE2F
	for <ath10k@archiver.kernel.org>; Thu, 23 Apr 2026 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5vE5A5hYUqya9JT43F/8JpKCASx4QJJNcIhw3GSShg=; b=A/jCN98xMzTdlp+TzKDNaewpBc
	xG0GkbLqRo3czrlqzqd0tJJyFqOPB+7kBWL3DQjaoCaUZzZx66/PlZSDt0roBsVo0OJuPs2zHaCYg
	E9fOkxBzLUJZUjFBUu1o/E3qrGxQ7YBr7Mu0mCgX0vtBIKu+ddrc1tlkB3sWDFOPRAqpY7H6l+tjV
	9D4iZdrl35L+GgDQ1xAnpGDJSgr+dvCY5+Mbj3+Kx9qwdY6Cu06c+0yF+x8iiqI0/8MAJMY/fwGvG
	MIPjcoOJmeJcRoo5qeja72glOi8Z7IjcrJ01zZHkxzKIbjrc1sa2xERNRYFJD2aMc5J+snrvAQpUD
	0Lz531dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMQ-0000000C5o7-0S4n;
	Thu, 23 Apr 2026 18:01:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFyMJ-0000000C5lO-2MLg
	for ath10k@lists.infradead.org;
	Thu, 23 Apr 2026 18:01:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NHREsV2710099
	for <ath10k@lists.infradead.org>; Thu, 23 Apr 2026 18:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s5vE5A5hYUqya9JT43F/8JpKCASx4QJJNcIhw3GSShg=; b=IKeR1wC7thtZuaqJ
	R0IHKAYUShtuM/kDvdm8YS7dTJIlewmnuNKQEtoNGLSj0V9ouwfH04ml1CAW+ld8
	2WJIZkeo8GMfx+4mi2Y2QMWjPdzcx3YJjhESmXulfGKVJsfo9jb7X/kVLpezk49l
	3i62RsUSGjIqdH7lLTkk+kcM0pMedUKg19Gpp+MkzZxeryVQAS9sKKM8AVi32+zA
	mqEaCo4Q3nygzXjvzEY3FRqqLOks6bonR0IGEu8ACuB7y0fMPf4VMlbPGHe2pJDC
	lXAhyrktMr7MsoSSyCbLGEXAE82QZvhuSVUq9F3SLLBzWJ8oSEs/82iA0T6TPkQ4
	uCKnRg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9r5ta-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 23 Apr 2026 18:01:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2dd1c74508cso11339546eec.0
        for <ath10k@lists.infradead.org>; Thu, 23 Apr 2026 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776967261; x=1777572061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5vE5A5hYUqya9JT43F/8JpKCASx4QJJNcIhw3GSShg=;
        b=SE1e4ptTENa5AC2reymUrVrO5+ChthYjnP9+0ohEzO1KArl72cSqzLu9p0laMcHGff
         r2h4DT4ldRbCbnUSeQ4B/pcrrtHr/Ctjq33aM4XoMtIHxitcqI8ew5043NGMp4eOUxf9
         bhYXQSrwsoHScCmqnMhoGjAIBwZvNyQvP+8wouD0Rc3ZpKCDXeInlCQIQMI/lcxnq/7E
         WiSeTIi1EJQs+hBZQISARVnjI/KpWLu+jikWYwNafSFDuP+TdMEnF+u/c92JWO3A9TFk
         o9pv7IsgqC0lRycl2kUdlQX4d/N8yoBE+OKfPBQbWTBucKf1jufT9keZ7GkeZziPzMZi
         jdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776967261; x=1777572061;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5vE5A5hYUqya9JT43F/8JpKCASx4QJJNcIhw3GSShg=;
        b=gPc3Ts8BLq8nOitRVjNRHetKDe0GczmprLRNyF/oryep7ia6GiTwA9YhR9hJq+vPAu
         qdJsUoDhLZqU9ZZKbSxUeNUUw/I7fxrAzvZnraZMt/cBSHMGXses/MKNEXVNRt9iivh7
         1s78qd0lE004rtyTp7dnkLGp/8zQkSgJMsGGtKXpGHBt6sLv5ROf/IFex3ZFG6Cw4yjP
         Ud9hf5ByI4bxuBs8AJM1yovj3weyG6XHjFZUVAykMmF27JKflWseRiJ4z4Cb7VYde6gw
         cTXNgqfx8r9SMDOiAKydy/kgf7woeRAqh3wpqXpc7M5N4JZ5seW8rtREtEF/BKJHIYZC
         hdGQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JxNZw4Os5Qbi3FiODycL/27SOBx16ryren68lsD7pdgI18YevtENbH+oJtw1nZyBOrZPJaR4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwArEeKljKc698B13egVRugio4e5YnGsdTBGCuUyd6jtfcsjKmq
	yFey8ypRM5hmMSVcQoic269TwlOBWONSSg9BzLEKlt5gu4B0+y/lVFy8dovnqQs5p57AjVAqBqu
	YKvM/+VtFmoE6g0AoibweyHtqYzQX/jXcFKkZlMC1ubxNxX1Ax2eYWSvtfOhTwdph
X-Gm-Gg: AeBDiesEJ7gAd+Ey8crCAM9goE6MtSOrb9Qx+etLwqvAGqB9zbfsUv+yJ+UH9O1P3ix
	to5rZ/ronktpOK6DYMMTmi/ZwaFoViQ7jC6xOEXB38VlAEs70qpeyVGjDmtsVmHJTbjj26ZEl/c
	H4WXEr60qYXXtTDfoNrx+ndxd0JWpZ1Y7rmUroRTuDum5YavIJrUH132bkGGaoXZePF4js42BTE
	+5Ym/M7mZICqJWIue2qBWffJcTUrtsGGpAbntudSrpuiPRXQGpcZrDn8/M2fh6+Y8m17aV5I+7w
	o7mma0vn562NqYgQSFByUspmxJECuZ69LJcx6mpAesSRS11zagyrn0mz7nit5dSbzKQU5TqgqSo
	L4KLFXAPP3SBHtJWGYlrtudCkCYCOaUOhBcq9DvQeBwcrBCIs4b6gx9uNwfw2sfL40hkIsAbspM
	L1EIzAmSeXRXw=
X-Received: by 2002:a05:693c:3007:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2ea5057b737mr6964259eec.16.1776967260865;
        Thu, 23 Apr 2026 11:01:00 -0700 (PDT)
X-Received: by 2002:a05:693c:3007:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2ea5057b737mr6964230eec.16.1776967259994;
        Thu, 23 Apr 2026 11:00:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e539fa244csm27867887eec.2.2026.04.23.11.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 11:00:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com>
References: <20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath10k: snoc: select POWER_SEQUENCING
Message-Id: <177696725731.2493545.1584090736302487540.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 11:00:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 4xaaP1Oyu9UQUG0yNXXu29-6s-iL_2cZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3NSBTYWx0ZWRfX00YIhHwLv+1x
 O0qZv9cVKBEVFEttKpNAL2I/tzjHlicrLDekmGAvmX1M9txSSfyw/Kivdg5oHldqQIqd28UqosI
 t+6nT1av5z9UnnA9NKDTtlf+wRks6SXJHX75d/N4IcktoHcDAuh03jUMfcUbMAvF7RH0fJJxhSD
 veDIRsTsYpEcd5MOSfPuaCU131oywh/SezoioxXr9Cv3AuLeKgs59n04jpgXPtMutm3VN0fJB2v
 bZ+lqtbnDfppkkSp3W231dAk5B+JSzTT9fXm0s1Z1a8B7gZySxeqlJuAoyPj8prgG0/Rcxm6LwT
 1C8UlWu9s2wmZzjY85wfduGy4YqerMkKJ9B+zJ7fjd+PedDNrSpP+ybZ+rR99rYWPhnsghBscY6
 gOkATTB9MEZxP+8K1s7vHw1XgtI26ZreJ8M40/NQSgv/2Nc62W9m/pTIi+OSG3y671gBSaXLH0b
 LG7vTll1HmObT7Grw2g==
X-Proofpoint-ORIG-GUID: 4xaaP1Oyu9UQUG0yNXXu29-6s-iL_2cZ
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69ea5e5e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=wcuXUMGJSOV-wyKThOUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_110103_758938_5E06EBA4 
X-CRM114-Status: UNSURE (   7.47  )
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


On Sat, 18 Apr 2026 22:37:00 +0300, Dmitry Baryshkov wrote:
> The commit afcf3ec615c9 ("wifi: ath10k: snoc: support powering on the
> device via pwrseq") made ath10k SNOC driver use devm_pwrseq_get().
> Select the corresponding Kconfig symbol to make sure that API call is
> always available and doesn't return an error per se.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: snoc: select POWER_SEQUENCING
      commit: c4b6ad0e14f5df942eed5ebadaff84b468bd2496

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


