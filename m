Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD98F33817
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=4mJvGOlZXEs+2VgUS45qFcIO2G
	KB+zO/C53M7izf34o9mn8zusLrJaHyg0ylHyiKvjrba83RKdcIQ/gSkbdYjCDmmYw5kHkLHcEOXQQ
	neae69lBod00KR2KQEmXsbyMyNiFIfwdUVfYuc9JgSCMPpVCmRZPP6PDBeJV21yS6SKu2T5BhKp6j
	pdNno/Ok+ZfIRhLmkZruFPzH/i281eNVn8mQrj2ilwaIKgMBpn+dawaB0NGYYqYEOo5yzCROWzdOC
	ojuiYwzrmOb6qUcfU5L+pL+5rJ6RyVPPIsvdPrOo1NyJB5ota97nFVg47igjqq+1R/rBvP8n6KrU4
	+OZ9xEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9N-00000005lZj-0o0X;
	Tue, 17 Mar 2026 08:51:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Q9J-00000005lYH-15iW
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 08:51:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H64lcD1623660
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=; b=ASZ/MVVeGtJMu1Fc
	XLhAANnTMxH1a/V03vG/LTkSxc0F4h1bFIMtAPhjCNfhnr3REamoVzaRvJ/Ifm5q
	DWpnOtIKVZ2lztx3+oTq0s6N3eKWOBuea9uI0iDZ/3DENDJ2W4IrKaTj0qitnYsP
	PTKVUSzhCM3E4DrZZcryCru4YuPS/gsXqVf5pYvK1u5TnwI4y6JlvXMSeP2McicD
	+oZUlt7pYG43FnWbT6wLNcih1Qj/3DZZC3c8zJFvrpMgtwdfF/FtCG5S9fRhbnGF
	JD5kglBhyIBwiy5g50f9b51gKOOlJnxwyhF91X4sV0+pn+xbASdGOs+h0EFSpdzf
	YmkcHA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyeks0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 08:51:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso19493385a.3
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773737495; x=1774342295; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=Vk6V8gR2EkNmYYm/Z5YkguACDO03k64/+6ntRgPKIx/n6EkzwoXcaeGk7mLwhPGDlJ
         S/p6TI1VqaJSEGI4seTqJXc6srPegXa4SrmfgCAf+lUcFFVaDjy0A5NPDSUEgqMq07Rk
         qtTlBzuLK5iGnMCycBy/5dJYDAGq5mVHSblqKhgL4Iers3im0BSq4etZjKbFiebtmfcy
         6fybeLt6xpBZz/lhMUt+spjZ5aM6CPUcz6KRO9Iad1dJU/t1atNQYMaq5fdl3lmI4ysh
         hzuqBnKI6J+SstB0gz6p1aW0ijfLxaCn+fG/5TfDQQXTnij09jbvrwB2x+S7r9mV8+th
         ZFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737495; x=1774342295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxITSj4z8OO1NrLzEXCXkSrkOXhqxZm0zTAv5L09paM=;
        b=mfKUYup4yU6WnMUgnYnv5ECvAVLM4JVBLI/hXCBh3N7AQiCGhb+ubVE8ZYkQ6XboXi
         G3Tth3VxJK3BL5k6owiqaoP1w8/1gTRhL5/GMeFTPpFu+RMH/GZxiJVSumVG9FhUBHoN
         lr/T66XQoAlTr1Lx9p93Nqhl1hic4zeX5FOrxS4FCImmMlYZP2aPa1AnObdue2AAZ4N7
         LeD+n3sMQG4wPULwqVqhgmIn5RQrdqmYv0PyePCt9jm3jM7+A8/ZDhSkt8V8dYCLaoKx
         TNNuUQhpibZinrhxfiMwCfX5mpQLUg3zxLKphMuSuD245n79rY/Vu/PwxZPh66GFRCHv
         JuqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUzGMxAGETNsuTa3+EHAo0n0Qiz9lQbbkpYNe+TQs8cBS7fKuiMBMuIlb+N6eCe/cDArH/JII=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPGN3MlPBbpLAaPT9P7ZT3jIIbumErBvXKi6SZRrUK3K1IHgK9
	E6zPWqjdq7uvejBb1HlvaXKj5ORa6dLj8vzXO7QPkjSt3r2huMNc50dGOrGwqvheYKjFsHbuZRU
	qOtJaVryj/a8a4+4BAdc+0joo56xHH03CBeYrw8NEeSOi6HGRSpJ8VLJrgyWJOOVw
X-Gm-Gg: ATEYQzz4l65qCNRD07VYDspMucE+Qky2AetoC0ePzKRSET0ZeeY7E2BBNTl25fheAeg
	Ay8K1N35AuRSucpxUUu9ZG3YYr8n+KIyjAV6oWZsAIItFqeahfjSKkMXwndynL9Tl5l3xOTsv1c
	+h+Q0UE4YOyCVoz70ZyCXmTphy5V/DHBDhH8sBbhpSk2Fw/LyUkZoFmTT9OlsA6xQdXR0Pevi2a
	vRWA7DiLLJ9PbQs4gwMrj8TLmVGmDtUCfoUZL0mSUR4PmUE9UnZ0TBp+4r3owf38+M7oeCQZlvU
	zD5BpOfLeUH+l7+pS21f9XSjdBSA0Ig9p3mi1HuOQKZWlwamWCK7NO0VueAB1MbM9cB5sy4eqj6
	dycMA0wMBMQcRAOWIaiaUPqX1x4BTiaGrd8gNFVTYCbfI9XrO5FpQVWFo5TsRFiMDnwEnb2w4Mf
	E4QfqOkaLE
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966585785a.41.1773737495222;
        Tue, 17 Mar 2026 01:51:35 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:8c6:e224:d55b with SMTP id af79cd13be357-8cdb5b0a024mr1966583785a.41.1773737494732;
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:67fb:53f6:20ba:ff45? ([2a05:6e02:1041:c10:67fb:53f6:20ba:ff45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm46732245e9.10.2026.03.17.01.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:51:34 -0700 (PDT)
Message-ID: <8757aec7-8c36-446a-9a34-f0717f64202a@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 09:51:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
To: Jakub Kicinski <kuba@kernel.org>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316172251.2d57d0aa@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260316172251.2d57d0aa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: arSP9HdsQd76YLgBR7y1EkpO6z3UrAaC
X-Proofpoint-ORIG-GUID: arSP9HdsQd76YLgBR7y1EkpO6z3UrAaC
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b91618 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=rySjVtX6Rl8zv02YFYoA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3NyBTYWx0ZWRfX3UO94FhQbzu0
 cgMSLbiq2EyZRsfYAADgJ8Bwj0XkycmTGga1XtcY65ZqgT6FLATGNywroxn+uOPQrbos1gapq9l
 psfyLF4cmr4iXT+Xrgzugr8ixpGEj7aI/FoepgeU0goLM89G/tFp5BCrPAdeq+NBeBOiitSMNZT
 zw/Kj+7aYz74paxRJTElxpO36Jrz5l0u8j/avITbCJXHUFUN0jB02tbqt8AsvYfOisOAVBxbhGG
 SDlSjwoXzoiBp2zQWt/MmBL8nM0ThQYC4i82nChaX/s68SIjlZ2zgezDJKFpfP1ua22DpyASTIG
 CXu8NcjaHOGvZdrpbgAGTG/Va/PrN87jMAUkdfsl2CR2VrQKHpxICC7purtaPuaidC8zF6H9kQH
 Z7PMJT5ZDlNyXk5dVSK5ePmhk4BmMjupp3FOkVqp+cq3atXVvLgfq2pshovQ3rq3EKb3/mWCorw
 tSbAM86JO95nA4xGK1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_015137_407307_F74A4C39 
X-CRM114-Status: GOOD (  13.82  )
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

On 3/17/26 01:22, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
>> This series is based on the immutable branch [1] containing the QMI
>> service id definitions along with some drivers using them.
>>
>> How a patch can be merged ?
> 
> Wait for the dependency to appear in respective trees after the merge
> window then repost the patches individually. I'm starting to get
> annoyed with all this cross-tree QMI/MHI noise.

An ack is simpler for everyone, especially when they are trivial

