Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49EEC43458
	for <ath10k@archiver.kernel.org>; Thu,  9 Jul 2026 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTtNQqjhetqqm9GWeBDN1s3Bjp7OhmjhD8pX1Q9Zqgk=; b=NvSkIGkxx5AThdCMGek1KPG/rt
	o2KvmtN1dM1rsPgZibNS+XDGJ60tc/D3GlPS1vWX1l/5LTA0fDH81YaFbQOlPJMqqtMFo/8/ImDvO
	P3moEGZSRS/DEknO0UreZeuQe1/TsfGOFRRN1mJJUeXFhVAkG8OnMseuWHR2NPzKIXY77djtDg+SJ
	qcPjEwFzFZSULlj/xEftZxIdK83UUViJ9qaLVIpeJM9uS1KNtHQYV8u/OwRCRCCFO/LKB0mFjLVp4
	0wKMcI9wd3vKheCR2Zxb8Q4EkmEqrSsby5rUR43FCgwCMIg0odip7pG1+KGK+XkFs+WM1okvRvf/B
	kAGK2h+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4Y-00000002paE-2r38;
	Thu, 09 Jul 2026 14:49:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whq4W-00000002pYy-1iWh
	for ath10k@lists.infradead.org;
	Thu, 09 Jul 2026 14:49:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Dw6pA2012995
	for <ath10k@lists.infradead.org>; Thu, 9 Jul 2026 14:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sTtNQqjhetqqm9GWeBDN1s3Bjp7OhmjhD8pX1Q9Zqgk=; b=c/QNLJ3DEmUr123P
	GOxqVCx6sXevhkMjObzoor32Aa0ElQW1qK8lVlG0+/NCAxwM2VIDw+VSN16OYW50
	s8hr3Qgk5MlfkVvDBmec6/5YpzoQcQXLUEwi43bjdZ8JZY33x8gvO5i4yiiB1nbQ
	lgLTjYdeNfbtbS8rEH+d4QfFRiEDkfpS+GRcHCFl9UpcfbdbSGn2KC9EgebMO8N6
	h1qmx3jadzG7XleyzzOAP85XxWxVddxywSGapSbuGrr3vC7HY34BKyTF2Ysi8Px3
	EZFdod/My1isp3SqwXKycnIQmxUskeufSfQnjuhvo72x3k0uc/kSt1dhPSctnvzN
	eKC3MA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418jsvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 09 Jul 2026 14:49:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81aea53d559so18188977b3.0
        for <ath10k@lists.infradead.org>; Thu, 09 Jul 2026 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783608591; x=1784213391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sTtNQqjhetqqm9GWeBDN1s3Bjp7OhmjhD8pX1Q9Zqgk=;
        b=FfgSYJpung9zkCpEmASyPbWG31B6ncgGGonyrUvVeZE/ee4uiU9AtuJaN1tQH4ZT7Q
         blGg65quN6w+rNm53Od/mUKrTKixxo32St5TM47+/UlX0gL5iwkS45jJzA4rg+HuRUNL
         PBYay5wzfbBWSnovuO/QTclsErlloYRIpJO9owNkoa1W+oPCyiush06A8cDCVMpcgtT8
         HSDTwZagfiREii2yiP7siuYaBeeU2rHTo5Shd7ocTaF9T902lbe3KTp00KD8cvOxI5pm
         FyuQnYxb0LUSfHidRP5JErRfexFaccOaRKg+3ZfHKmYm2ISrlPiLK6ehsfwlo4+NFTQu
         cfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783608591; x=1784213391;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTtNQqjhetqqm9GWeBDN1s3Bjp7OhmjhD8pX1Q9Zqgk=;
        b=Ip7ybrkCSHkfRiUp5yCDgjNYkrHxTYPuJuAFQ9wXvLo3tZYTW+x3xJq7Yq0hDy2gju
         xyNkXxaEDvigryaMemq7GZ1fTUdQQNxGXk0ywS7mTEB+cE2Qj3nFuR9ZA7L5zMs/++nN
         8kq+wF8b7/yiJaDPt8DBMRUeRBCdpAJy1SdBPStvYgL5mtj7i6rgDTzdVZ60ZuKSt9fo
         +AEvI99pfGnDRQ4q+3V9BbyRstGQPQOovZTpGcmATV19ighYrB4gZRCkm4dH7edLC/2W
         li3aGl9f6Q8npoFfvF6NZuA+ZESWFNqVUJTGYWDzZeidhOKclmMy/SYoXrO9IEihOVgO
         nedg==
X-Gm-Message-State: AOJu0Yxlw5RbMaFhEuMEULX6y2c2FCkub8r7op/ESX76m80OC0D+DBJP
	f1Zm5cZ9192dqg3/q4y7kfYbvMpX3uuwZ+x8B0/T22TbWEtEtI+jpR4t/vJfMKxMr4eRpauBTE1
	31ph+Hs+Fmb120KPkUoAMnuhOvWzRvrBmavGiXpukwcfKCPdBFvUlvqn+lOwZFrp/ZF8jqEeP
X-Gm-Gg: AfdE7ckZcuo0SOKglf+1ZheopzJ7zKPgcuq1WjbhbpGKYvWyuC7xsND2FA5qS9dCcAQ
	fW/P9qak+MtCAGGYnC1bwBi7B8AtK1HMWFnz1Da0qHm9AiWda0eLbnGkkFuTzZRQ+EaGe4b+/Vk
	0xNuKzgSv3Ro/r0RW+KSoQR42mIb9nVCB2zOb0zHhSx1x4nvkPP+05TK3vkMXmhwrIyrRnPFm8V
	6uix7b2cbTEgl1hOBjYat/X4X9539UdhpQ0N+iNKqsChA+ftIerqf2uYwmim58sUTNkcfUGCpvb
	lrssQubBjkAyDqH87P56II0tQBcARd94/K7kv76x9I1sPYbufm06kdXoz6zeHNzzUOCruuWbHNO
	9dtJwiV8U7Fz2irhbw2wWs6FevUkjtCeNslmktomdomRp0L2g1JYIgUDIVT9HG+ysWQ==
X-Received: by 2002:a05:690c:c357:b0:81d:d43d:d358 with SMTP id 00721157ae682-81dd43de3b3mr47084607b3.66.1783608590933;
        Thu, 09 Jul 2026 07:49:50 -0700 (PDT)
X-Received: by 2002:a05:690c:c357:b0:81d:d43d:d358 with SMTP id 00721157ae682-81dd43de3b3mr47084467b3.66.1783608590606;
        Thu, 09 Jul 2026 07:49:50 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e7795988dsm4989277b3.26.2026.07.09.07.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:49:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath10k@lists.infradead.org,
        Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
References: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: fix skb leak on incomplete msdu
 during rx pop
Message-Id: <178360858829.1031194.14199001499185167674.b4-ty@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 07:49:48 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4fb50f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=PSAErUXHYyYb-UPQJNEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX1oTo6UaWvTfS
 ds4eV5l/M8dl/jFGyjQuf8QYaAEFhlWCA0YcZNvAXeuxSRHKYT1uAOpV624rdooykf+KtI4fjvU
 SsXWm1DeKg8NBMEC1VPba58Sp+POBmDmE231rVmmO50ev5q8yH40B3vvvNGGPgWEsrdEzfMakr3
 mDF87O+rSxk93cJbB54RG/kOlW9kviYvSVEOnly+TasK/Jd2WdgS7hAa019Vagh9wvxXwPjiZga
 EWhBISNoPb4OxGFA0rufyeKeTlWAmyWsyA/AEoYfHBudaNEhTZEi8JUBZYFJrw6EWxOK8BoOxXG
 O5YI1CdR7B6qlKSmbFF44qVhxw3AUNkAIAjcRKtPtv0yz/TQld7ZSm9OgE4w9HRiEHV6XaTKUsy
 kaCGGqPAP+nuUg5Fi4MlN2Sp+XvHrZ7DqBUI4vTVffM4AWCHHbRUK2YeiHfH3ov5KFkYvP5qXBz
 XNK2ToNATB+40B5hauA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE0NiBTYWx0ZWRfX/5PUDioZgCAn
 Pg47C/adgrwjfBXwlmHZE5a0N910h/XjkLvTE/5oqbBEUBrf+RqCZVR7WZbJo1CJ2qgjEIRyT49
 E1xDdARgFO/ihn0WlmaMiBbmBUaliRE=
X-Proofpoint-GUID: AjpiYH-brUz9yPJ4Evb2kLa24bkNu7PE
X-Proofpoint-ORIG-GUID: AjpiYH-brUz9yPJ4Evb2kLa24bkNu7PE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_03,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074952_461559_E767BFCD 
X-CRM114-Status: GOOD (  10.55  )
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


On Tue, 23 Jun 2026 12:13:55 +0530, Manikanta Pubbisetty wrote:
> When ath10k_htt_rx_pop_paddr32_list() or
> ath10k_htt_rx_pop_paddr64_list() encounters an incomplete frame
> (RX_ATTENTION_FLAGS_MSDU_DONE not set), it returns -EIO without
> purging the skb list built up so far, leaking any skbs already
> queued in the list.
> 
> Other early-exit paths within these same functions already call
> __skb_queue_purge() before returning an error. Add it before the
> -EIO return as well to be consistent and prevent the leak.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath10k: fix skb leak on incomplete msdu during rx pop
      commit: 7393878255e492515858f751ba4c260f248fb108

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


