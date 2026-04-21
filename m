Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8321FF327B4
	for <ath10k@archiver.kernel.org>; Tue, 21 Apr 2026 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPqpfOWqyDYIF6DBaSd1/JPEZbu/kYvM6kZKGAp3xwY=; b=dYGDGvxqUGK2NpR4i6XbmfncS4
	suPFHvfAsO1wB0eUoTo6p7I3xVmd+nIE0UrSX2NHsYxJZrwp1Fg3kxAf3fWzavlyQakMR7N3Afsao
	+a6U4YvPHSZ24Szo85FEJyanri67yD/6/HDDHesnYmhyuxZXS8ATw1dHXcPh4Jf2p+ZADHO7KFsW+
	jiMq/6L036Ju4hTdlus2DkJffiJTq9NOi0su3arnnFgVY7C/DwitB0E9xJ1PcSyW+Ct5RhBBFV6DY
	mRUxVkOmN9r600yP9lElfMQY22zgrRoVu3j6f0QioU7sH5JzPJwN1CvwEDeV79/3eRU9o4yzISpRj
	y8Mc5f4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Wg-00000008BOa-3vyv;
	Tue, 21 Apr 2026 07:28:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5Wd-00000008BOC-27az
	for ath10k@lists.infradead.org;
	Tue, 21 Apr 2026 07:28:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L568d21013380
	for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 07:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPqpfOWqyDYIF6DBaSd1/JPEZbu/kYvM6kZKGAp3xwY=; b=dJS8Plrxau9v1LtM
	TED6JlR9l2dmEmicOOl+M6v+HIidrrXIoCMz3/1Hu4646wxfL/Gb88/r5DVhvJ2w
	S0g5IJBcbZV/vU8Mk6TuxtaJLkEB96PZISIQbqYd8NwKQI3yjV6NVnfQFPIDVtX8
	0blZcPA9CdiMrSwvBj+s96jTefISiDmwRC6OzH5RTehA5z+mFLpUMMYZOGrQjGba
	F2x3RyZOmF10cqPSeU7PtrmbeJKdOZzAySZGX8XOkildEN1iNU0GUFDszs/K8lLE
	hma4aVAIGwB4EmRF/KAKH49AEJNBl0RVLZwjvJBDjHIfowPKjIs/K4prlXi74tan
	+wijGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt90229n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 07:28:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c798ace3d02so861668a12.3
        for <ath10k@lists.infradead.org>; Tue, 21 Apr 2026 00:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776756482; x=1777361282; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPqpfOWqyDYIF6DBaSd1/JPEZbu/kYvM6kZKGAp3xwY=;
        b=LKPkM5/YGqhjUc+LTWgPN1++UM1mld61AOUlmH7vW+/8SsQtqUPiFF2eVVtse1CHZh
         W7wj2Tpxe/H0c34QOJ0JfQIIDyFUmjXyMLC7rhumv4OeAhtlI9r6u2OTw+OG6a5JRDBb
         A6lrMHQ+WYt1v14H5uj6W2B3IGkRVBze2AM/dvlLSBCb2FRMkNyhM6aISw5Hltj69PkQ
         SsC2sM6JbIzGXjjNT+A0ymLErRUNjf5G1onp7YyZLiyv+c4xzqYGlQe8KizbKgTIe/Ft
         JGqIetWR6zeZtlGyIAfrilrrP24B86JcTrViJRjOmfJhzbiifRSgd/9LkHQuIRQ5bGgR
         4t3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776756482; x=1777361282;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zPqpfOWqyDYIF6DBaSd1/JPEZbu/kYvM6kZKGAp3xwY=;
        b=cu0fJvDGdxBzifD2rTolvYPozd73Hl0IW9V3yMa8ycrC4MgUFlJ5Yw4YMitX/BUD3C
         uCktxUrKeoDd2+VZpgeR3Hsgpz41Zfo3uubrE4fOBtkSbi6Ja/AJWkAgWDwCENBcfKpV
         FihLvdoEo7NQyD8+em6UDoPFkkDOeCd9b/rqseW4bYQCAy2PU3/d/S6ialg/eHKiiOkI
         SFMOeXUp9ouvd+CATfqMy0hnhpGERBn2YP7Y/8TdFe15LubjwP/oh0jpPzpgEK8wId2G
         9DRiDV+qcVhBsWHSlF0iCzD6f1A0k44OuTID/e8Z3T+4xqQW1fgtcRC+B2ozxko98Skm
         NfnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S6nVQmAKZzY9ilsNYRcjsbboL2gTLznx1FKkC9Qgzb4RVPfbEmpboKygK01rejojsvxxBIYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwW1eBz+kyjc8IozXrrxE+0QxPKffJ9q3cRaFZ2rzaS+gy9sC43
	OzWoIb8AUbpWtHhyX3bu8zF0DqAXsAJDwyDvMX95kiyU0Kf3Tf8xrmcQ8t4F/FnyplXQeIW9on4
	GOw9y82mcQ9U40GpMr4N4C0O0YMYydFtpCe5qf762ju5PFf07n5kTJIN0lGLMd5Oe
X-Gm-Gg: AeBDiesTBn7QATvPdYl118AwCJ1MSARoCb1s1JYjQjqd0MJbX4c5fApq8GboNUD7Wts
	0Dhhj3vOtjMMmhCCBxidSesmt7OZ/eu0zt/B3OE+v5fk6XEXHVjIMjKy1m9KsQ7QaNH75SQxsix
	X5jkxyAh9m20IKcN1osmaVYtIsFuVblT33heEv3knjEBT6Z49qAhsMS6mtbLxf5ue+iiF6PzFgN
	8mtZNYkiH/O+giNqwpNaeYR19nkTnbVl0TTKF10iJPsMOWi9rxVKPcYFJMRdK+OYNe+XVGtn3rb
	mecFq92+o9qvazVtKM8OG46TACM+DxmMBqnC6yeBWUT8ynrh5e5Y0+pPK8vu9IGBkaM5GsHUnIy
	GVnnO2SDM8qN/4i2GwUt5jEsRrXqP7OEDflV5IDCTgWos8cm73WIYnXDNHFyRhG2NzRcLUBtW
X-Received: by 2002:a05:6a21:998e:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3a190ef81c2mr9209471637.33.1776756481561;
        Tue, 21 Apr 2026 00:28:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:998e:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3a190ef81c2mr9209438637.33.1776756481128;
        Tue, 21 Apr 2026 00:28:01 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976fa40b2sm9026838a12.13.2026.04.21.00.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 00:28:00 -0700 (PDT)
Message-ID: <7c89f639-fbb7-43a3-9bc4-668c16631ef5@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 12:57:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: snoc: select POWER_SEQUENCING
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
References: <20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260418-ath10k-snoc-pwrseq-v1-1-832594ba3294@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e72702 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=zpRtp0WXrNfT6zHCYYoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: g37LNktxyPoXhCf5XZh-MhPzcToQR-b2
X-Proofpoint-GUID: g37LNktxyPoXhCf5XZh-MhPzcToQR-b2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA3MSBTYWx0ZWRfX2CFMV8n/AEKO
 PMLOdOkTvVaxlbk85/zVbj8dzWrpCuMx2/3IDfVFJHqY4KF/wboFBEhpf0JfTGq00XGdS8hfdJl
 QUdA6V+LrKCuQpzD4ycp7QFAm0eFqNlJacA+IktL43ILHP9HVMCFlFCX7pRavS6Bzs9WG7MyBxp
 M/4+4Og3HdUrNuBEzW9z0iTFGYm563nyW+KX7WNeW5hNa1rtNJfTWjxYEEdxeM3zVl0diYSq75q
 BJLc7LLKnzLQO0y2oOr1aJJJs28DwzBJq6Czmh9D6hjsAUMVsfb8h/Y1ALSkJq2z75psIupYLw9
 Ci0XGKciJtQJO3uB3Q+NzcEcnIkCRUwY5ZkvIYB39EchaDMtjewPI4NJyBRDA3ZBs+PrUvIOp+n
 MyjvzkwcTmSAMEb5pHW7ew6Y+03wBa07oguD4fyfyzI7pSn8QVMw3eoQS1hR4onCJIeLcyQvV1j
 9MzYUcn7WZHxaPgIRbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_002803_582935_1E0D2FD8 
X-CRM114-Status: GOOD (  10.06  )
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

On 4/19/2026 1:07 AM, Dmitry Baryshkov wrote:
> The commit afcf3ec615c9 ("wifi: ath10k: snoc: support powering on the
> device via pwrseq") made ath10k SNOC driver use devm_pwrseq_get().
> Select the corresponding Kconfig symbol to make sure that API call is
> always available and doesn't return an error per se.

  “doesn't return an error per se” would be clearer as “doesn't fail 
with -ENOSYS merely because CONFIG_POWER_SEQUENCING is disabled.”


> 
> Fixes: afcf3ec615c9 ("wifi: ath10k: snoc: support powering on the device via pwrseq")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/DHUHU7UIT487.139L3KIVRVREU@fairphone.com
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


