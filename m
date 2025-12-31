Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB43CEEB565
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 17:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=; b=XrLoUMPhQuky/CiGuU8wXk1a6H
	x4S/fs4vZ73v4XJplLub3xOjOLBnX3TT/VpKgywfHIHPMUPdJ+7U+9xs/ZaVNNlpJVrCvOlzWLe2n
	W+dhq4mvaMQ3DjFM3ZJCcTZ1eps7HEBpZrCPxm0YVBAK+4T0B73YcLpzM3U5xA3nshvv06SlApW5T
	OVLVDvL+TUI8x/K1PYz7z7T8O58CB0Kt1cxKwGZa1n3vcvOxoGYo92iVlxEJ3rlSsBOre+r/apC32
	WikWVTo4LvNkoCepGzWc04rO2e8QZujDih2fAy70H/sT3sblHsctD+wj/P6gbJ/9hYfQCZT+2TOw0
	Fx85zFfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazls-00000006BWK-165R;
	Wed, 31 Dec 2025 17:14:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vazlo-00000006BVi-3wb9
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 17:14:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVCSn0n3214469
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 17:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=; b=D9V3Zag2lvaVxOzU
	S5i7lzwH8gi1OSBlWtBWj/ef3HRzRAuAvZkXKQ1mcY+kO109qmVP9zoZzQbTe3VK
	EdZEfkkKf8d+du5koWWMb6RjKOcdTFXUZePGKbrRVfC1SE1FkLEpBDNjvO4px9df
	Ty+cwZ3cOQuPVsLPmdr+1t/xX3Pw+H7kD+V1kkQopPgogBV5/OnVUxuxawWXdzQ8
	g/zu9PVu0OCHAlEoGVwDS69/JFHs3ysdXnxKheTPYfNoSpanauw/XF1J33+Q1HvE
	Yfa07/yZy1zzqb9g3Ks0jcnyw2rTvv3vnazjfOWV5xL4uENPJg6ifYSJS6+HRGTz
	0nH1aA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd3v8rf2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 17:13:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee07f794fcso43399091cf.2
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 09:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767201239; x=1767806039; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=;
        b=DNjOLzbkd0x13asN//cCTiavoJCw3chfu5L532z33xDHepLa+zrW49CFa+WXQb8rbM
         qriOAMdxU1kFRq19Cnhn1FcV/GFZ24ThHkckQQ11wdpE3GPIkci/okBbQLhvJQOpwZ94
         aMZ4Y/jr1odKvL4Pp363gmEZLDDsHHRQUY9d5HzqFwyXbbh/M2FmxkwGZeNhLlJVXNgD
         /ZPz1JHk8A04sxJ9ABjSIfkjBQxd6Yjzt+7SW71O+J1h+r/aFT2c/Rn9Xy6q/W4QnnVq
         SAUlH3eE2MvTlqacwjMJuQ9DvRpdDWn0gboY60WPTtSmTQcqej+jHvgRTLORetRkuy0G
         GdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767201239; x=1767806039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvGkotcXkh2XKvjIcpEZmzKCU518o2x8b/soOzSzzL0=;
        b=Kclw651/MgSBWAvGL27mC+xLPAfxgt/7q6nqKYzkhO0ylJnbYZzzwF5Cbrd+8g+Jei
         p44bfDQ6tM2WrVbcISLTkkFmk1RDhkkzQY3IeVHHUvFtzejRP8pZtW/m14Mr/nMJBRs6
         8QNYXa1hzS/N+DTXGUpaAWYXWpmVP/WHYSf5GIbp2c3zJL5lO+JeMNqHTGv14K2RCMxj
         /Dv0ngjbsNpSb2jfG1ehut6Ll3+ikvD78WGQ4/KqZuG7XuCNY2qARAC/k29I4lN9UQEf
         fN0HhZ3inAZxzshFY1517Nm5QcltXDSt5aEaDMHGW+wAgaNvaI4CjtSFB88q6ddzSpIc
         tktg==
X-Forwarded-Encrypted: i=1; AJvYcCWdxe7kcSPMGgL89YNBOjG4PGi2P05Flse6aUirSA97XsqnNE0o5hzZRJBAB8G+XobtdkHxMHU=@lists.infradead.org
X-Gm-Message-State: AOJu0YysFrNFF6fcm/bw49cY3bPTov7agX8SftIlgHP8gkKBj3VlYHts
	5KK3RijGFWIhYMyyGw1iqIHPz5hS46WFs2vZyuNGivirCj6sxHHnRts5fgBfXY/pqmjpNfEP+am
	bVaJ6zip1LgG5QyCwJaskOf+8MkVGUKdIKuXiG7JTAzTIpZBJwiJ0fSE0Bw8S+M+i
X-Gm-Gg: AY/fxX7attFbrmqURLrFjRPaC5ZbuwLmiPFx019i5iXPbYTZuXTSaezwAdNB6+/KpHh
	L7G65iXVwGFNRhb2hGYLYrGcKzrZFsJk6fXKbVIsKAbSI9MVSChdOZG6WIeIKOOVbIKiTFFXG4H
	N2RzWg6owRwDYeZ66GDd/horrEJliD7UGRys9r5Oo2tVXO82AG9eAHp556BxxRiTuIGPrTI99NR
	zP3x2wg2CbYFdObaUReL63MGxbWlSZwDXFUrinDOWC9KUJoGpajpghwHOgMjzREqsNTgUBMfy63
	Z3qr/01py5o9uHmyfiy014T1/QsDxdHstTzRAhIQTvnSC2IfVNT41J/StTTi5mSvQV983daUo44
	UOZP/eb0Ap+l59lNWmwR+4a1BJCcBFiZHrY4TNpK8BjVXg4pAf54T6eEsGIVQBrPZCw==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr424499111cf.7.1767201239197;
        Wed, 31 Dec 2025 09:13:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE38fyRnXbhNPBxOfY+OuiOX8uwu/dojYjGwqFDkNfLpKpBFNZnwSGv8NnMACyExBZKLj167w==
X-Received: by 2002:ac8:5748:0:b0:4d0:3985:e425 with SMTP id d75a77b69052e-4f4abd70338mr424498721cf.7.1767201238815;
        Wed, 31 Dec 2025 09:13:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91056731sm38489198a12.8.2025.12.31.09.13.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 09:13:58 -0800 (PST)
Message-ID: <e0f49b9c-331d-4822-8320-fce19dbb34d2@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 18:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: qcom: sm8150-hdk: describe WiFi/BT
 properly
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
 <20251231-wcn3990-pwrctl-v1-14-1ff4d6028ad5@oss.qualcomm.com>
 <59f3db15-77f1-42eb-97e1-31129fdf363d@oss.qualcomm.com>
 <df7qz7oz5et7px3ghdfteuyiyistbrpei5tq62s6uwmzng4ols@gklfvzhbf7tm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df7qz7oz5et7px3ghdfteuyiyistbrpei5tq62s6uwmzng4ols@gklfvzhbf7tm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDE1MSBTYWx0ZWRfXwwRzdqZ87d74
 rLp4/c7H2mIXiMc62oNIMXHvigoDF8VuBZT4tFWRhMSt2JI3Lm/G3hZl+09qD3htFMuqTkVWWij
 Fq7W/+ZkhvGg58ozegI9d/kMErCaGSHpeLw4vxpJN0KQ1v7ZpV0dlDivdy1kMnOr7bdQhol8sA1
 cLNgl/urRwb3dHxqwSi3xFyzhQQKMQZOuNnRWWUFBrh42AbY9CfhAKYPJgKieYp4L1fFH/smPQ7
 FQyFMFrB5SUdaRIN3+JZnvg6TPdED1BiPBjo8LBPgyfNFgPYMovH+wKJlYjScjr+E5+lSJlXLIA
 NxVbDkn5PDW05ltRO0gRuehIg3hqwGbtbu07zWYTZCV2auUFZU/HcdVJRjq3m9vc6R3PbEPBWs8
 dXxgOnsK2um4okK3qRTVelTRSff1T5qbsesQlYCZ4WieRZargPsFo1q7UMHho1H3iyui4+mNL0B
 Xw4EPkeUzUGYY49IIYw==
X-Authority-Analysis: v=2.4 cv=JdOxbEKV c=1 sm=1 tr=0 ts=695559d7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ElJ8wsXG5LtXk41pdqMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wW4iDrfojVE70ihdIcytyO8a9W9IIpks
X-Proofpoint-ORIG-GUID: wW4iDrfojVE70ihdIcytyO8a9W9IIpks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_05,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_091401_127300_BB2930BD 
X-CRM114-Status: GOOD (  13.33  )
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

On 12/31/25 6:12 PM, Dmitry Baryshkov wrote:
> On Wed, Dec 31, 2025 at 01:16:30PM +0100, Konrad Dybcio wrote:
>> On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
>>> Properly describe the PMU present as a part of the onboard WCN3998
>>> WiFi/BT chip. Enable Bluetooth part of the chip too.
>>
>> [...]
>>
>>> +	wcn3998-pmu {
>>> +		compatible = "qcom,wcn3998-pmu";
>>> +
>>> +		pinctrl-0 = <&sw_ctrl_default>;
>>> +		pinctrl-names = "default";
>>> +
>>> +		vddio-supply = <&vreg_s4a_1p8>;
>>> +		vddxo-supply = <&vreg_l7a_1p8>;
>>> +		vddrfa1p3-supply = <&vreg_l2c_1p3>;
>>> +		vddch0-supply = <&vreg_l11c_3p3>;
>>> +		vddch1-supply = <&vreg_l10c_3p3>;
>>
>> Again, please double-check - I see UFS VCC is on this line too and I
>> would guesstimate that antenna supplies may be separate
> 
> UFS VCC is L10A, while this is L10C. I've doublechecked the schematics.
> L11 / L10 of PM8150L go to WiFi, L10 of PM8150 goes to UFS.

Argh, I can't read. Thanks

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

