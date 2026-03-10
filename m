Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C37F3C27D
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 10:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=b/Pyu7hex/5TmUGxbW79leeSwN
	q/d167zObCe0hcT4k/291f3vuYDJErn57HXZBn65AqwTXeB5+qGZxsHqmZxkDnfig9DctIACK6mRo
	jCl+QX5tji4wLRwxMQJ17e/fTHjR8hL4/fjnL6f3X+JfmOJAgn4sFEmxbKKVD3HT/75hNjsKVUUXt
	dWW8fmUWOfL4rWp5gFvdJUB1VH1zfe4Btk3WK0vF5aKWg0ZaR0NWFdEWFTvCUjwusyrFAOyGT5OB6
	cmTQHiSSnOp2UQX6Iy7heDbTSfFZcSTwPl+zQBnszDG1+8vD03vNx8ukUITTY48xvvoOyd6eyJaTl
	osbwHmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztzE-000000099xA-0iUE;
	Tue, 10 Mar 2026 10:06:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztzC-000000099wc-3EI6
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 10:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=qn057uR6uc7ekv3Bm+t85q6/+N
	NXvBfs8IlFjV6PUjbncKLotChiJKKfo+geHaTbBG7xlNdG7Nce5SSlgalYfT/y7efhr5kPRM749aH
	QbmRIHne0AZAvlevo0G+ALl/3lULVLSxbIvH/P58uNtO8eYL2EUvnymgEgEFeqC20WcYuzpDwGHLs
	y50GU0ktE4auymJRNPOjJmGDg/vnfF0IvnL1DDrRg1ANsruYEfKoQ0TZ2FhU7Q8yANgiKIkr/5YcO
	OeYoZ/2BV1htA/987qUkkG/VIJV1VbN2dK7FQ1Y0O4A///hRPg8eXvZVAMyj5KVOhA4AcDxX03tLB
	++Z70AyA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztz1-0000000ECza-49Ih
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 10:06:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8vGM72020757
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=; b=hxFLJaPzisZZN+jE
	+7Pri14DDd7KUEvIaQZDPIXFcX+wCQndBf/2rnxMD3KjDF2LSRo56TcYutc88uU/
	vRgGWaD4jQRkDk3jG+MV1j1IkaYJZp3VdS8bRHr7bSXu6B3yME9iAtPKWgcFTrPC
	YHCjdpoIoEpVEDbNd+XQ8QpXs/d7MJcLwMQKH7hJabjPmitf2vkM5quy3YlwPx3f
	NEHENaRFEFR8Aom5OuVVbSZ82XJUu8R6EcvuTeoRmkjdHj9Cw1u9kfyqyX2cNsLY
	Hvj+bMa4eU1F7DnjQrK5jiyHp48hiSndNP4UqB7+sVMSKIZnTDilIS0OpDBWzNPf
	Th8iDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbupvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 10:06:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd83cfb36cso1576173485a.3
        for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773137184; x=1773741984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=Wf3VY71ndpI5WXsjPWsM+QLMNViNA6h4zmjbgM10R5GSYfTBCNWw0dAKLELc7jnx2l
         mEaIzPgCgRiRSBO7UUlX4xT0dU9gaxOVEwINr4ZeNi4BxTuhKcmjOmDisD8jkeqGt7QS
         HwWayjOIqF2p/IbtLMPnJr2e8+9m7JE38AKLXknZ9+xgbhU53D3HZVghhHdK3X6r4X8Y
         Vl26wJatv2fdPyAU7+LpM9SuPz24i4ktkZvK7L7S7v3GBJWUlzhjjVj1rfGhYk0e/9Hq
         EKI+dRVTGEeCNBta3BfppcqE3XGojf1Z88Jr2vdmBrChlyh08OKN7pt4/RiGmVS7FpIH
         ozZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773137184; x=1773741984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zym8eQRUnoxy0/BAjJ8cuqc0CkUIHWRkqrzGNeSb23c=;
        b=rMW+eQ39E5WmJsGAjhGilMXMID3G/seIerbDT+ffkT3pXPKK8EnkRH3BOBVhAX3i7x
         YavL0Tnw+6Qb+LX+oepRD39HkgwYqxBY7z0XyXiFOMrse7Kgy0EWz1QVpzLmHBmE89Il
         JhmoyU9LppWQrPZ/e7O8pBqVoWIq0GEfFNTtwZ18ES1nSxeSVkTa0k9rAmoFkqHj888v
         FKjTcIffuy7wPGZYr62zqhilU3udZ+8w/3JXZnKaacWexhCqbRBgaefao8oOUHne1bG9
         MWdizUbsPEhXQatIc3RuaN5QRnBK6gz4zOhLQFGaAMSA5qsrmZU6/PeDCr551J+Fb26h
         b+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVSnHdFo7ZMPHjKFFpD/9yS9mw94iD8QQnbSwEuEbjDWaaBTQ2ZMiN62g4oBSV61v0gqaz7Tk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwLtmUsENXc0iIGcx0IKTuiFkptCAZ7PjlvLxoohncTwelga8R5
	6IrBU3IjwCcsJOX8+Mo70LV97TeBQuwkfE3PCSn+lnK7/RexQajy5NyLT4lgqDYxlBOWhZ9HlNv
	FQD4yIIfRazttryoLk+4SVAbDC6t6JN0hpojA1WskGOyDF/r3Hk2FfDVYj/i+hzM8
X-Gm-Gg: ATEYQzwrNfs720y0NHOdOTAUn1L8QYHi4y2Z3KkE44uyYsEYlt2G/O5QbkXcmtCTV8F
	CEPQ5PtfOWzBudr752RAzLccJ+6rCypYyU/PDjjJHt/FPhiVxP9pAJbiHIVVFasSipI+tV3iK0H
	Nx26IlAZqCzJXBqT+TQuMvszraXKbueZ/8DNUqnXCrhijUcpga1ZdJxQ+rFYZ+bT8FyCGXzVgKN
	udkW/3K7AOOYkEe2NYHOs2ZkaIIHWTSNId1CW01Zy2PRv5oIKUL/+ndnolCdVpZtiVbtOfMjAVj
	HrQYAB7ft39Smsy7QgDNLmYERaczk7qISUj5gFV4woKiS3vd3WjKIMLs5o0SrUjYCtcefm8t1Hr
	OXpGm+6Aj+BWa0vioEkrI0muHG1ialZ6r8S4SDb2OQVnsOd3DcfuIJkY6eiVVcSogkveT04ACV6
	K7B8CSpAr6
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705195285a.42.1773137183853;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3943:b0:8b2:dabe:de32 with SMTP id af79cd13be357-8cd6d429895mr1705192185a.42.1773137183406;
        Tue, 10 Mar 2026 03:06:23 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm32447848f8f.3.2026.03.10.03.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 03:06:22 -0700 (PDT)
Message-ID: <58f49fb8-75ee-4dea-b7c5-28e89711f9f6@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 11:06:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
 <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69afed20 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7MBKnE05AAAA:20
 a=EUspDBNiAAAA:8 a=M45qCTXPNjoLw3xkhRYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NiBTYWx0ZWRfX/At3VElbN1q3
 yWo2QzHZMa9o1MiGGjXMKXTLVdALDnHWMfz5gV1mWqeKrZJW0s3Ml7iBZy1FnN4+5qMR4Mk9tGM
 hU+jsrrF0u68yv1rfgH1eBDongTGDQX/V4qMG+54O1w2/aZ+rZfI0ljjL9zgZHGDH7aL68TP5p6
 OmCoJtseXPEt3sFEQNGKWs54ZJiIiCeCYhPUu1BlsVf9WTeTLHEzB1T4b6JYTnYQkGyo8GHu7Hm
 Sds7Cg8FolOGZreCXWMqPpJ4t6D0bSRa9GfgZlUvoxuw1fKF7YhEGg4FwUEtiR2z/Vo6dS4FxXP
 WwrLT2evMUztQTYIBnQ4G0+K8y+eWfBvmZl74V3viMd6P5l7PAszBYjpXCZecmxob7yUKi+lXy4
 4zCw6cNYa4JeqnQ9DHB3//oLvrwZGFvWnTO2mVZOUV3eA6mOGbtBR7/EjMxw3nLwOl85oHiUvhs
 VBsuS3tuYz+zb2Bv5Lg==
X-Proofpoint-GUID: jeQyQ2QqJzQVfp3hLYsJpqyb3AFwTYPe
X-Proofpoint-ORIG-GUID: jeQyQ2QqJzQVfp3hLYsJpqyb3AFwTYPe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_100637_255891_D9CFEE29 
X-CRM114-Status: GOOD (  17.20  )
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

On 3/10/26 10:57, Konrad Dybcio wrote:
> On 3/10/26 12:03 AM, Daniel Lezcano wrote:
>> The QMI framework proposes a set of services which are defined by an
>> integer identifier. The different QMI client lookup for the services
>> via this identifier. Moreover, the function qmi_add_lookup() and
>> qmi_add_server() must match the service ID but the code in different
>> places set the same value but with a different macro name. These
>> macros are spreaded across the different subsystems implementing the
>> protocols associated with a service. It would make more sense to
>> define them in the QMI header for the sake of consistency and clarity.
>>
>> This change use an unified naming for the services and enumerate the
>> ones implemented in the Linux kernel. More services can come later and
>> put the service ID in this same header.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>>   include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
>> index 291cdc7ef49c..b8d07f2c07e7 100644
>> --- a/include/linux/soc/qcom/qmi.h
>> +++ b/include/linux/soc/qcom/qmi.h
>> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>>   #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>>   #define QMI_ERR_NOT_SUPPORTED_V01		94
>>   
>> +/*
>> + * Enumerate the IDs of the QMI services
> 
> In case that's useful:
> 
> https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Thanks !

