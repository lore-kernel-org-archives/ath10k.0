Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892FCC4450A
	for <ath10k@archiver.kernel.org>; Wed, 15 Jul 2026 04:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHLyLy9xJ9opQ7XzFo2f42ngzaMXGxPCwphpvbA63nc=; b=KBDN1f1sxvUqk8HuFJOA2V7fDR
	8PbS4zurFlLJ//HR6ZSVrwba87wkMYmevYz5ll+KemwV8lKIMUhDYMsTtIWpc8ApHm4NHXjD2orDQ
	CcEEOzj7WI+w+d+DRp/H/LUMl1z74f3XjbGJlqwo1p547HFVCaJz5LrrKZkJJfn1NASpF4Pfl+bpR
	qrmxyAndCc6V1nfnY/B7t8HyGx6ahXYy04FyVfOHXWkPVyk/+YHo+HUv+/SBzRs95NRx4DiIQpVPv
	g0oSG1jhtogvbxOYf/BBr0wndVv9XK2NpbDk/yWijA5Jf8iI3/cLf/7lakdRCh4+hA/5+F+ZqT5AD
	IJ4mSYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrWZ-0000000Dkaf-1Xby;
	Wed, 15 Jul 2026 04:47:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrWW-0000000DkaG-2XU6
	for ath10k@lists.infradead.org;
	Wed, 15 Jul 2026 04:47:09 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lHoh2621111
	for <ath10k@lists.infradead.org>; Wed, 15 Jul 2026 04:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHLyLy9xJ9opQ7XzFo2f42ngzaMXGxPCwphpvbA63nc=; b=n5ZCNZjel4lcXrk4
	1F/5Rx2sk7fLwooYlb4VBOJyPAigQi6sErTPzf/h9xZMPXAcrM+MeGE7nVNml+SM
	jsb26nvcGgu0dMKNdySuAWUnzAKk4bauivC7N6+OQKQPn5iOFneYICPoWAqmUht5
	G/H4AX3PtcGPpVlBNls/1s7xyJNPmf5vwVHteDDgqkjRbao/at7vk0T776fylM1X
	88+yBGES/EPEMf4RfZflIbA5QsyzFjkY/c4rZWQgDSpNAhqbcrOuqoH3nY2v5Lj6
	YdS+VYQ5gOCCAMjAk4ZL/mUtzFG1c63CCC3Fkyjx/doXotMSq4VkHO2VN7uzpAs3
	IAy4YQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vgk6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 15 Jul 2026 04:47:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso18463291cf.2
        for <ath10k@lists.infradead.org>; Tue, 14 Jul 2026 21:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784090825; x=1784695625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHLyLy9xJ9opQ7XzFo2f42ngzaMXGxPCwphpvbA63nc=;
        b=Aa8KzjO2yz2Tq7m4INTkR75ZqWG6BKMFkHxtK5JxuoWHWR9bnZtz8WeFE+Guvft3qs
         v5bZbmwf+mf2bjxCoHzm5UZdjZr0VM9NGqoNpwjCfMo7/jLT/vGbLuu/jrYVx+5b8oR7
         SNUAhBIqLaeE7NHfQHwOawdDaFuJoP3d18swysfQ9r6MXZH0ymvYsTzAH0opBVbcwdo8
         IcEoX75qS9Og/KSDIVjVvXvFF3voEYepvwNoosuWhkCngxAf7LvCxArFPHXWKQc9GEkm
         df6fcWWGVLJmFvSFiv1upOpkYsgP74x8Rgs8jJws3ttlJJ4khFBkFEHViPv5mjaGFoND
         r4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784090825; x=1784695625;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jHLyLy9xJ9opQ7XzFo2f42ngzaMXGxPCwphpvbA63nc=;
        b=LaFp8pVG9MIHNSB31VOsmalYit8SBb1K8CjBNsz4md8XY+DyqaJJTB1qcE8d2Xu4vZ
         gTwa+vIPTz0XP8CSX6I7xCfvjF+i4jesSuwDUFffMKsHmqGfvjiH30Ls2cGUiVRBXgww
         CKRaluf+aJhCnPDRYFofGX01aPk2BVk8PKoSpdrAQwI5CoCgqX/6nyqoA1UytrAOWBni
         KVqBrdgjsFGrr94L3HGe/qHlziDiTg/DFWJOvYlW+8Zi6cK10xQva6Y+BjR7P7gqQYRv
         jp4bRkLUr4oDycH5Bz6Y45uzEXes9PFF9Po882y9SGuQpFuVeIZEH50DrmPniNw2ba14
         cRXA==
X-Forwarded-Encrypted: i=1; AHgh+RpGwhNmxsWUQO/lSZHKsqV7qOdXa2WDQaOFcCvWdyMnQr1hMl9wNST64LEi6NGaemQNmzvYqmw=@lists.infradead.org
X-Gm-Message-State: AOJu0YysRvgnZ59wv2ZQ5jEIDc1iVEThsGEku6aZqqhT1cdSqDujswN5
	lRXkBIHg5onmHGS49iH5YtHDhb0bSzdxHHCG2RzBi7Mwbfvz9CC4CDa5LS/z+vH33umAIC87uIh
	PgVm2ekWouJ2DEJX8FaReBTraPeX3U3OM6Ip6+ACOSemll0qevdF+akRn1KVO75pK
X-Gm-Gg: AfdE7clsojy3IL0pn6Un4gXNH43HtT6xpEXX+gDqLnh1zCcAh/R49PHMHoA/j6eraCv
	9cy6l/H8z7+9s1DdmBiHBxe9Ii7qJNHf8cO4ILZPNORi+RYRFv3XL9fg88N3Hp4roik19SQlZKG
	jc64WCisbJUgIxd8JR6SO+QbVfxXnL7k1fEWjcopauoLcko6wJjlRfloLJt6q8YGPtfDfsykvME
	PEyh3CWNBlIKWh62+KJzh6yPeVL3uxVXFRf8h2UR56BFoNPy4R6q9iU4KDfk/66csHyECIDZsZU
	x2bKzGvre5hd8nEtZPnEbu02mBuKF6RslPxcGOQY42Pmp3RgwJ+0EN0z+spkQRdUG5b+0Cp3p7r
	EwgS8p6pAKCWtmg9/66rbeRhzn8Zum2ojsXuQ2WAz
X-Received: by 2002:a05:622a:346:b0:51c:857f:9bfd with SMTP id d75a77b69052e-51cbf21096amr147710731cf.41.1784090825348;
        Tue, 14 Jul 2026 21:47:05 -0700 (PDT)
X-Received: by 2002:a05:622a:346:b0:51c:857f:9bfd with SMTP id d75a77b69052e-51cbf21096amr147710621cf.41.1784090824912;
        Tue, 14 Jul 2026 21:47:04 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a322dc6sm129267505e9.10.2026.07.14.21.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 21:47:04 -0700 (PDT)
Message-ID: <5cb62eb8-f8e7-4425-9e2c-2ae400bee031@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 06:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: Drop redundant NULL check on devm_clk_get()
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260705172405.119084-2-krzysztof.kozlowski@oss.qualcomm.com>
 <75ef4371-b66a-486a-8555-e3a3f6ee5d88@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <75ef4371-b66a-486a-8555-e3a3f6ee5d88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a5710c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=WNKottax_SZD0szvUdcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DfetySmRItOYhIBPq9NYhfvk_MDmoNyE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA0MSBTYWx0ZWRfX0w1PYjn1AJDF
 iabhMLGZ4y/fOghuS92qVyEJdeaqqf3ozf3Nv2VCCfQhFjWbrFm53Rv8nEi+uemqWJDsISxn1mW
 Rtno7yNYKaQGyTUgh7GlO56f7T4DA4yGq5QfRldfh34wFTfzclB5xPdGh1sqYsRyO5c8vnmxWAi
 SkjS6OYBGi9Hpi3UfiMBjcSL3XAR66R208uLScvsI5720FthGWUx0Xo8mxoRukjZQX13ujT3PdE
 zmXV8DULR6XovcFocjvqhV+k/lP6LW5qUhCRHYlVcYS6yMrLOQg9Bz+1QTLCUbwoCiSd5wPx+Nc
 yRxE50vFwFuQAbfFi2NqSLi8EgJRIP+ctTJk18wFykCVVg8IapR0Erh9YXTDSoXC9SPSjay6NmJ
 8XTMyKlsomJcBPLeNMnkIL8ZByEl0aixZS+e+8pt7X9YAc6cZv1ybpUoUQsNK4OB2Q+ke3JlaHZ
 LegpRonuJkXr1YK/KlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA0MSBTYWx0ZWRfX+JoH8VBDjId/
 n7/w57qmZkUAiylW1tGc4OzN6vfrX15ENbA6tnfEx5hSculSCrIevYcMtmVP1RNjhTIPPLAofjL
 r8QQfFy3FXWRq1sc0F4on6wNKchrDhU=
X-Proofpoint-GUID: DfetySmRItOYhIBPq9NYhfvk_MDmoNyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_214708_771285_C23E4D7F 
X-CRM114-Status: UNSURE (   9.23  )
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

On 14/07/2026 00:31, Jeff Johnson wrote:
> On 7/5/2026 10:24 AM, Krzysztof Kozlowski wrote:
>> devm_clk_get() does not return NULL (only valid clock or ERR pointer),
>> so simplify the code to drop redundant IS_ERR_OR_NULL().
> 
> FWIW my AI review agent says:
> Under !CONFIG_HAVE_CLK (x86 COMPILE_TEST), devm_clk_get() returns NULL;
> IS_ERR(NULL) is false so clock_init() returns 0 with NULL clocks stored
> 
> Perhaps the stub function in include/linux/clk.h should be updated to return
> an ERR_PTR() instead of NULL?
> 


Yes, that's on my todo list.

Best regards,
Krzysztof

