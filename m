Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB62D37E3E
	for <ath10k@archiver.kernel.org>; Wed, 14 Jan 2026 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=; b=HRey0XQfzFaInrqQ3y8umWT/23
	8qW5iV5MfqzByO3HWZRFxF+My70I6vZKthmhg4DzCYamz5qwqhBLpIxkCJnuj0BeYfo9wdoazQwPx
	oq5UeM/YhKs4ZhbT1xgZCLCneeAMP8M9bXRji7zrpXuBgCcQlMBAFuVqwI0omho1a8AYMRaKQnlx+
	/5oLOFocGiUoss91W/qYZKmulA6FchDjGG+jTUIQsGtZEVebIieSlFFfUEjUp6QbbJnaZSa9EXpy9
	V7Hrks5l2QOXJrlVNOzUoKmS8opiSduzCxtfhPnZ497ds8/aJVip2N0J5z25i6dkU/lmYQ/8kf1QF
	Y9dVJ2xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2ZD-00000009dhe-40SA;
	Wed, 14 Jan 2026 15:13:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2ZA-00000009dg4-3m5y
	for ath10k@lists.infradead.org;
	Wed, 14 Jan 2026 15:13:50 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EEJMmh2497501
	for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 15:13:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=; b=OfkRh90kkBzRfjB+
	TrHiZFodm1rMkrXeNAe/ZRfl9nFCqMA5x+w/OX/j9VXzxw3adUx7fFNkIA7vOGK8
	RwhDH/YsnVp5vrI/DQftnHelkAugA8RBHCNOndO1ddcdil0aZn2HTxZKmAMWZs7q
	M4Fhw7y6dY9bn1yd0VHoBi2VjFBImsQ2XU+D25h2zbuHvD3cF1ncnurPxy69kLRU
	FHHQg771egZN4ShHvv1aHismkVJewuV2BDumqxguDgjcJPjxnSfAe1UBxEQAPkoD
	ahuKOtzaJXE1QEz1+WLMbouiAZpXHL2nDuREMaHU69omPmhVnUi3ZyOfatN+ZXd1
	UfT2nQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp16x2upt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 15:13:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ae6ef97ac5so32499478eec.1
        for <ath10k@lists.infradead.org>; Wed, 14 Jan 2026 07:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768403627; x=1769008427; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=;
        b=Jqetkn8FD2yb/MRqCffUtJgGNxeKcvLU1ncGX6BQ4AC6uHvKS41ZQdk/hGuO/q50e3
         PglaAEYjyOViTN9UKurJvOefE2uEiQDshlRqck6y9czw17vMP0WMHeaSUwSR+cR4X1yM
         DDHrZ7rXBUuuFGjZS8c8wSR/pUebT1+5+KYk1Xc3mIgm+MxLUzoOUases5tqEPBxStsT
         ytxqCbu6ONyhVmyIm7ifz2zRtEoStHMGvhH+JbmnjGGmQyfvkqo/9WtC+W/QljQv4sdW
         F6zlPdVfGNmEdVK9tw/OT4GOjAM9J+e53dVSauu4hWBcUPOVs1he3RgFpLwMDg65c4qM
         JKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768403627; x=1769008427;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pAMa8b+pnjmawngmNFoBkoxVHrQu9nmKZxAfyT5nEVA=;
        b=ESl+XD50516AWtG8YJx7IcFY/Ontz5Sijf4WGqubuN/88mt5OLv2vkNHQez01A8pLC
         JPhZOu1SZbJo5L/tjY3eNf2kTRmtnzYGC0gexsskgDSD25fGL9MY+Cvmgn/hXtuZSM53
         MYWp2+xA0Z9UXtKNTGLWwFrn3PJcPaM+oCKNrAnrKE4vZbB141565Xk+0EZI19t7NBPR
         SJaUui8oGylDIqKf/+G5CN2yzxscEsOf63dTYAEBhmx0rBivPyyUe1pPW5if9nMDWC95
         z8Z2DYrUV0fcj1nsDNH6wyrRhm/yr7tfoLWlwF78m0p8piceS1FPEeuD50UA3dmvVJZ2
         ksuQ==
X-Gm-Message-State: AOJu0YwnoKKvfgKJQGuwCIQ9vdPGHvmEk1KBAujeBc/88sZdWW4Ld57L
	PRrfopfqtgN0bZRWgrk96KJItHT90bJ2BzEfpQKoZYa4Xbs7ThkneWzrOOGGmMTFW2cl2ITvS8H
	MLRD+4UPmBnVbo2dOZVflgZ78v5e/PA25kj+zgipfAN4GBKSZgtIUJk0lwla/xDBW
X-Gm-Gg: AY/fxX7wXP2Pjn2tpt+nXydREtc04I64fGV5n+eagkabF0Wn+K6lwmZp6vk6zJDWtL3
	MofjL9aXUT6WUl7S+JiDsjWLhnqq8fbN8K5FZhN1GPK87MDk/UwXMLQevEwjYrivvTSfo30HgTJ
	FNVDutube1/vWD9gkN88jJTFSUnPnRhEU+mNz1NX6e5WwLdpcr93AtG94ST1bAc7fMnyKHjVni+
	Av2EKT/80t6r5FWigTrwIzdpxbbw83KHUrxy+uAMUA5AKVEyfDaLuD6FTb/AdqPlR36uoJE8PZj
	WWXnfKKHKm6hc4k3wUR6wY6Y0HucIKf55CZmEYTl7HXQ/JJ0NSOSElDJpOPNyErNACxgGb8iy6f
	7GuLDpAGEc4ojCrRPTm85VoLjN3cq9+42tXvCeTx86XmG5M8jLjNha4npRDNDZBPWQ7uB+w==
X-Received: by 2002:a05:7300:23ce:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b4870bd16fmr4248642eec.22.1768403627332;
        Wed, 14 Jan 2026 07:13:47 -0800 (PST)
X-Received: by 2002:a05:7300:23ce:b0:2ae:2c27:fc0e with SMTP id 5a478bee46e88-2b4870bd16fmr4248586eec.22.1768403626617;
        Wed, 14 Jan 2026 07:13:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm17962169eec.32.2026.01.14.07.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 07:13:46 -0800 (PST)
Message-ID: <f12c186c-c76a-4d39-8591-4c8d7d04d307@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 07:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260113
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
 <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <33d998cc225a7aeef4731ebc53c28a32b241ca7e.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rt0sAlAgeY7HqeVh3SygCFHS6Z2yoVv6
X-Proofpoint-ORIG-GUID: rt0sAlAgeY7HqeVh3SygCFHS6Z2yoVv6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyNyBTYWx0ZWRfX+ajYlapAxTFu
 8NWUgtuPfoh0zi15p1gDPeejw1PcR9f8l7gLb5T5L3NCf3Z20exjJdpEEgK9Im9h8N3W+Nlf5CA
 zTYnqk6OoSstUjkqptegESpjEuGFZHmqQFQPsjlWcr6tTq9Sqncazlh3Uq3uvhULzmBS6QmTTK2
 RegZGaRrJIVU8p9P0lTa8PKs+XO4Hg6cOuDcWXKWTtjYQUX7xx9d4GLqsNEPxRvUirK+5vY/f0K
 acjFYMmzpmhGqn8YlruMOTbjVDKEr92j2jc49CDCECNOOIybULHIWU2kks+I+OAykvYtsfVIVQz
 xKEP3knFhFQx++q12EJFpXqBxXsImtwdXPOP5Vhiw2PRpcDqefNq7mebEPS0kRVwM3slbl5FRok
 /j9XCeK2OiDIMcO3Uwm9c7ZwFKVM/XFLotwzkxX/r7zwYYsHKPfgaeNWwYaOpjOIBU7i3YIOZJH
 6r/RsOoy4GUU3aVvK0w==
X-Authority-Analysis: v=2.4 cv=JvT8bc4C c=1 sm=1 tr=0 ts=6967b2ac cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=s_ggy6vDphFXL1rJ9sYA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_071348_977878_1289E59E 
X-CRM114-Status: GOOD (  21.70  )
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

On 1/14/2026 1:47 AM, Johannes Berg wrote:
> On Tue, 2026-01-13 at 09:33 -0800, Jeff Johnson wrote:
>>
>> Note to maintainers:
>>
>> This tag includes:
>> 31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")
>>
>> That commit contains the following:
>>
>> Note to linux-next and netdev maintainers:
> 
> I'm a bit on the fence about this, I hadn't thought about it on the
> prior -next PR much, but I feel like this is a process thing that
> shouldn't get recorded in the tag for posterity?
> 
> I do appreciate the inclusion of this (*especially* when I won't notice
> the merge conflict myself), but I tend to think it should be in the
> email rather than the tag message, since the latter is something I use
> for the merge commit message and it gets recorded.
> 
> Either way I have to preserve it manually to the next level, so it
> doesn't really help all that much, although I guess in the tag there's a
> chance I could see it again when preparing my PR.
> 
> I'll just edit it out this time I think since it's so long, but you can
> complain and convince me otherwise for the next time ;-)

In retrospect I made one bad decision. I modified the commit text of that
patch in my "pending" branch to add the conflict resolution information.
Instead of that, I should have reposted the "pending" version with that
conflict resolution embedded in the "basement" of the patch so that then it
would be part of the email record on lore but not part of the patch record in
git. And then for the tag I could have referred to that lore link in the PR
email. So this was a good learning lesson for me.

Hopefully these merge conflicts will be much fewer once the refactored ath12k
lands in Linus' tree in the next merge window.

/jeff

