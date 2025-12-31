Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE7BDEE6428
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ljd4mva5mujjUnqpJoZXVoIX85H4ZpUwFFA6EsmB5cA=; b=AIlpSCfaqeJByx1JcdYzUtzQDq
	O40j+zH0NkQtVfoOVdho7yqR/wCeY9pcWhNIgIWxBOIHywTsTFHzht4R5RA4oDPexq8AdxFFHfpgZ
	3ov8XDyGfG81cXaSgNZ1oKAjNEi6OIMqnvurDIXJ7Kajjvdb1f4xzT5fU9/2Xv4M37dHUUXfl0Ip9
	uS/qKYgNb8gYJuvr/dT/h0RwEUylHsbsZNZH0MAeKL0npyfydY5ElWpK1rlPDvTrBe1WvDzEmJxhY
	gi61/fbTg6bWqiyRWZT0kaLg2jgBDCnTpoPJUgzgSbnsAz808JTJKfadS3wO8zwF0KfzXMsOPDTVe
	gJt+FQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaywc-000000068By-3fMr;
	Wed, 31 Dec 2025 16:21:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaywa-000000068BA-1Aup
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 16:21:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVCgEio3405290
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ljd4mva5mujjUnqpJoZXVoIX85H4ZpUwFFA6EsmB5cA=; b=fx+zSRLFZvxLc/Wk
	sxuk/y9OxkDf3w8pJdycnr3xa8KYdDRiWRYflDNTDWXm5l/t6L0d9y9lyO002xO9
	yiH5JZ3hOlYUgIjNoITvvtIjb60nSMk9lOLMc6LPaY+J23qof6JKBOX97B/PimSW
	aPRFSdKQZN1iCN7D6XAZV4C0+eV336hYi+/281EwtHp9hzl8TqlBpM8TMqVjYkNa
	bXY3nM23ZF6aSAZ76LLBdX14FiTcNzkB9AMsUFgEvZkvUGXpaeLJH7MNPe7So2ci
	3mkPQi2Pwo7rl8ipc6JY4olMcGtwnW7P5Pv3kCw2CBjTjMfLLNYaphE4sJkYTi5i
	SSepGQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdmpjf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 16:21:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1aba09639so32489281cf.0
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767198062; x=1767802862; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ljd4mva5mujjUnqpJoZXVoIX85H4ZpUwFFA6EsmB5cA=;
        b=HA6XgUDGH/JBTjz0Cm3hxFAz7QSF2Zzsl0Q7MEhog8I80+KCnoujQTPagAmyK+Q5Zk
         7hY+Z0HMNLDD9aZVFY8lzuu8CGyTVyxEjOKCh72xNyGalGiLVMBOgykMk6KwXrJnk9LW
         KgBjWg8WdfwUROFSHkt2MmJYcoIVgiqlZiRY5Xmx5SLkAG1sm1W/lIrXplOxE2grpcvp
         dHU/yY7IHAFMxt21TJC7nX24/mjZzT3WAUdXoEyus/+urY/D3ZwNQYnnV+jbJp0vWH6V
         JIfUu2aULce0PJGCGu6kuvGtoPCwEd43XiwKZo3+CSw5RRxuaz40WlhSRxEXHgItCzZI
         JqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767198062; x=1767802862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ljd4mva5mujjUnqpJoZXVoIX85H4ZpUwFFA6EsmB5cA=;
        b=mN2wfW7UQ9BdZ7m17N+imcL9VyI0u84CEQ8Wi97IDtwxUK2QxEY7mwdjQZf/0YMVNK
         xfGtzckZZQoUgIdKQCuzaqC8Mj1ry3dou9ymANGG3oUOvbd4LXAIN4caWxcQtYlMT7NC
         TvmoXNPHSnzzpINFVGbavN87oPd6ToMV5cqcSCXwrzv2MLBMzDQ3jTdTN+Azrf9JEHtG
         D0jDBSyaLXMpWXlhJxag0H1Wi8IOz1+Rzkn/IdgVACJuZ6paLv+uxksFn7LzeYWXO5mT
         WrrHN4MdVincgWLlGCWGz2RzFf/QWnD3KNEvN54jmDzFK5ZjpkwIHTf/ac9BGLKrZog2
         fPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxFKn0/j+p3fd3budM1c0ixIJmFvY+BHYD9y1Oaf2ITdCdg2Q0SF5UvP5spPXKeVBvxZiHyEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzwqPdjrmMlfZcCrTOpvssBJeCGg6jV4GKIn5ta7wG5NnppcGER
	bnMOAiXddorSN+Y2BD2J9Ub72iPGzWtdYRZ03SIbwu56AMuMmKKmF82hEpgKTpmG9Tef135F23T
	+vHHwDuZg8K1jcnkZQuhlDdmoqKuNhFRHM/rUZV4lok5FZzRaCgGgtybPXHp1KJpB
X-Gm-Gg: AY/fxX4lXOv1s8WLNnknq/k8znHmq+Cq4VEkc6EZGBZD1y3LYzxSNRMXP8SxzdUn/8B
	Tr88pIdh9+aSIEwymyggwSrwBerHGawRCjmWZUuhgdM1y8Qe3uAMbFuAxJkE8RlwX301PEs0vy3
	xFAA9pMUz+0ixkc8y8w7QmCxhEMUQpMuFLDezwxfx/EHxwBT1Yk8YgFclTFK//sVzA12e7DyogX
	ZYjyuAgAHbuDrMNRv9382apMEKJgmv0K2LJIJq0ktqjwVdx8sMGkCqAKCAH40QvUQHWg6A/Ou48
	NO2NI8woCgRfolSJOZXBIomkWAVDNUgvC5VuLSJ6HR5XwXTdl+4nZTIWXhGXVnIAr1jRNJO/VPS
	opZjKdx7Xr5jyif/lqsUsrkE9lGoO0eF3Ng2MFkkbRqk43iWdBgDJZvulIpfFv/a2Kw==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr387024061cf.11.1767198062255;
        Wed, 31 Dec 2025 08:21:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMs7MfskDvZ0rub/w1y0ccNjJcVrFegP0hECmfEFgKIU6B08slw1DpmpECfkYr53xsN6+lWw==
X-Received: by 2002:a05:622a:87:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4f4abdfd1ecmr387023611cf.11.1767198061751;
        Wed, 31 Dec 2025 08:21:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80464e01d9sm3907587966b.42.2025.12.31.08.20.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 08:21:01 -0800 (PST)
Message-ID: <00b59998-33e2-450f-bdef-db370c5d6e59@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 17:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sdm845-db845c: specify power for
 WiFi CH1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
 <ab7d6780-4328-4c77-9133-402dd1c4fcaa@oss.qualcomm.com>
 <brzdqbu3uiy3gd5a2uyzcgx24wvuhjrrs3fs5b4qbnj5jvmra3@rfbiy5kgwlbn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <brzdqbu3uiy3gd5a2uyzcgx24wvuhjrrs3fs5b4qbnj5jvmra3@rfbiy5kgwlbn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69554d6f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Q4P5HGrx6TCjuT4AK04A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE0MyBTYWx0ZWRfX2ujfE7HRFVk9
 5nprzir0s0gmpR3H2IMZTZ7VVjczRuXMehrwvtbN8dyy5uhg52ol9TyIfqSDJYG0UY4CRXzELRX
 2EMTGSp5pfQOPUuz+d0cxNBUtAL0oF+KYJunHbSn2cht4mqjD6bl8KTyqoy3aErnT1hMZ+YP5oj
 u0k9vOtuVunW9QX6IKPYvqjht2eUenc1wDyVvlA6zx0uooBP1NiLtPuN98rDrDWal/IkNu4erWY
 6MfqQ1/Fk4n0VA725HMhDTb8P2s3N+ez73Sm6c4I7cbiNwGGNzuNQb76Od7w7e0is0v5P+to7E0
 SOELlxPYEMp7ZyntfiW43pRWDGJu052cBNRNkcYjY7pKxdsjRGr1KdudEVQAKRrp+htUJnPkP7T
 KCNrDIz8F0E31GpU/oGc5krHuY+fLvUNGCYSq+mA7ML22hQvlrvvgKWZOaJL5AKC40NMf9zcSd9
 L/whqmI6D/sfg/VZDGg==
X-Proofpoint-GUID: FhxoVsEX0UsIYiHbb04oY5PaWvdKKUfG
X-Proofpoint-ORIG-GUID: FhxoVsEX0UsIYiHbb04oY5PaWvdKKUfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_082104_448137_37E0FF38 
X-CRM114-Status: GOOD (  17.99  )
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

On 12/31/25 5:19 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 31, 2025 at 01:09:49PM +0100, Konrad Dybcio wrote:
>> On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
>>> Specify power supply for the second chain / antenna output of the
>>> onboard WiFi chip.
>>>
>>> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>
>> I don't have schematics nearby, but jfyi downstream doesn't do that
> 
> I checked in the schematics, it is L23A.
> 
>>
>>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
>>>  1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> index ad283a79bcdb..5118b776a9bb 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>>> @@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
>>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>  		};
>>>  
>>> +		vreg_l23a_3p3: ldo23 {
>>> +			regulator-min-microvolt = <3300000>;
>>> +			regulator-max-microvolt = <3312000>;
>>
>> Do we benefit from the 0.012V spread?
>>
>> (i.e. is there anything else on this rail?)
> 
> I must admt jere, I just copied defition of the ch0 regulator. I think,
> they should be the same.

Alright

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

