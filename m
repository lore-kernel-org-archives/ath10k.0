Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F5CEE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=; b=RlaZsuYMqFc/bLLkttBCIz9wsm
	EJaUQyhVusuu370Hmg+5jhzFr2aXqiAkW3tkrK2p4xFpYZdeI7q/N4kkQfk9A7b3KP1+aKMTOC+i9
	S9y/G2o80t+juCHHd5huxvnpN022yYKqveL3j9IbeQ+pBoV4pA8AEsENM40uIsaG8mi7qsl9V/i3L
	OclasVygDL5rvZsruWR4ai585i05RfSufolO8fngHrCC2ZXu/TTpREH83blEhLE4c2MFFmQJ9SY5B
	uvwFdJkPNRh6tOd6sz33BSOIFoyn8FSvINPWpUq/CKxql58ZPkqKs84BqvGi9G25cD8z5Y1i5GjvL
	FG0HKuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav1a-00000005woH-21zG;
	Wed, 31 Dec 2025 12:09:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav1X-00000005wns-2OYF
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:09:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BVAi8Ot3367191
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=; b=D/uBJnT+MgFVzrOh
	VcyEuTJ9k3SW65QA/vYvh6jlMZ1FjiJe/chMPajG/6shTRTgPbshQfu6RMD5wH4Y
	kXCh+qVqe3g+qjiF6Y/7a5Mm1jBccR7uZQRDk59rfAbULFYkqUz61qOX24HryXHh
	ix9LHHOliWO+wm1uEYu8RRkTGHHkCAYLLSrOmueK8NGgH3hMkObkRTK+UaLi9gF5
	xAhapq4+qkL5AAmaOUCKOi5UBpTlG24GVzFWKyx1XvK90C+JV0XJDWYuexeOE14B
	Tjy7lh5ZJdKOEq1OTYooRqGU0B17yNgcwShCmiuNKeljUYJoKtTcLfiue1wcOM2U
	fUGfGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb03x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:09:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee23b6b6fdso27741551cf.0
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182994; x=1767787794; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=;
        b=BTBWnPT5buVNg+50LjhSj1tmlox9Z3noIZ8CWdFYwJFHTUyLpMao8MS5GtXzZfkiZo
         FYjqjgw4hbrY3msPq1DHeJeVvzovw4sMPjjUvY0cW2Et1ZPFgxN2YXGxEb6t/z13sBUt
         zz4rAdTsQ0v59rYVCH4lcAdtxG4yd56z+2ClMYhBQc2nFe7DnugzS5oFpfskaY7093So
         0sODc/L8ay72On7O00AU4jo9qHoW05siAhA614lddYkJf3dqeJnK8nR5rRUrnfpG/n+k
         UbqIfWjQn8pyLqVtRgWplUMUrnlI54uYsBFDGTk+5p/bh6/1ej7ZdNSCEY2qmExqAvvB
         p7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182994; x=1767787794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IOnm9Ff2w1gpsH1R8vKSe+pdwXnYXE8q970eQ6bQ+7A=;
        b=gswdZ7vcAN7BnS5wrZAAiJ0UgYaOPGDhWh7OPsEJvz6jUWYHgTt5l9DOG2D5sqABRP
         iqKn0euyenN1qDMKm1ITNAfyosRjMgFhRvR1xCr7E4tVv39bQjNumHohPrJpmpkWiatO
         UwbNRcyv9Mrjr3LUIY1hrEhvTLSZnBTrIs+KCNjbL29zROKVTUwqIBth0zUIz9n+57Df
         tD2H24MaAhhK3kkwv5Js/eUXlRjDQpW85nDgvzeoRii8ZM2PlDOldp4/nquLPX2+Zx6l
         cQkmcmdj6M7iYRSk3T08kz/U6l0nAEq6YS4dq7vEIXrVPvSH7SMxOZ413Cpg+EWgYR6/
         F8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVYmWZF/mP6mgKIGjOOp4nv2VYXpaavFnR7RzxnxWIl6pt3PD1hqH+kWp754mQ4gnyjFR0U1Gg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKopnYPS/OfRsrbNcfLDT/xLT39S0/eJvCUpKD3LaI5epIfXoX
	J6csgnmI4b8STMjzldFDGHneFuaRpB4zsTIIUJMU1EXsIEaF3bVebRkW5T8KjhIOMhe3gzchZLh
	EX9LxbiPwrPT43fjism3uY0Wbg5upo5WyAI4ruaSJ7/7LoibBMt+a8JxoC4qT5yo/
X-Gm-Gg: AY/fxX67swrHhkIHBxrdhNb+ln8z+f5jqGO/e/JOrosB8elz5MPJL8rdG8SRyIJuMUN
	e6s3Ybj31pLX+iMg6MHVCFA6Rs9P2Quz88T8nlH8Bye0eXRuLWjo7TLwlbK7eT+jTy0bWrG4r4Y
	5D5J07ZTF4YYgMdW3LYbO3hA7peYZ0T6VXkY2M8fK/AZtgNs68sVED7/3FXHB0pUX89qBDfAli1
	fA76MS+GUBF19oWLjXn71FGRsqAkAVQXifh2i0rTJEuntboHnHxN9Bjs2BVpMiZaWWlBsgB8JU8
	iQmOc4MQPDWoym3bdFbGGiN2hE6dqRq0q8elj+8IvdW1iG5ywXJ1lPptle1DP3H1P4zZPTrYwSk
	a+TqOEGyacOaHeOQuwl/UC6CEXSk3pwlI/PtCpxl+K3JXje9XMOBbPO5NBU4oIzHj4A==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr414239101cf.10.1767182993982;
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFk5b3tqRN+mM2aHAUILacSKkmjbV8QkOEbDA4Iwmhx4ecguWLY9T4Kw+x6gPy1+6oUic5zVw==
X-Received: by 2002:a05:622a:1646:b0:4f1:96c5:b592 with SMTP id d75a77b69052e-4f4abdfa25amr414238771cf.10.1767182993598;
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f09149sm3924692966b.47.2025.12.31.04.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:09:53 -0800 (PST)
Message-ID: <ab7d6780-4328-4c77-9133-402dd1c4fcaa@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:09:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sdm845-db845c: specify power for
 WiFi CH1
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-8-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WGgTqZ4ML2890SQAxmGG3ain27sx9iJK
X-Proofpoint-ORIG-GUID: WGgTqZ4ML2890SQAxmGG3ain27sx9iJK
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=69551292 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=DbB6eazJVb8MnLPbLtEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfXyAWNlyxlDI3p
 MlvOk8yJ2dT2FJ+Zu/6alW4k/9oBuju+8xfmlPMcIsYZCuY5AOMcvt823FnTCnLurwskFV64SPq
 Ai8j64HdSquIt8M50Mi+AKoDIeWW9vKZTntWkojb/87qVIv9HRte0N2H/ZgKIqKzuDUYyi+eSy7
 Eor4q8Vsp/sWEMBKz0hKqRU3qKgX6CYY1h9SUrN+Bcl1NeQUG4F0V6PkG6v8SMUhLb8pGE/gfkR
 zwbcB0F1j3V3EePNvlzBn0T8wIjIW8V4zIqgWL0m6OoDe1W2RRvofjnF+fIjNn01RlAVW1NA0h6
 BsVfgdk4GbrMhN/h9ctlOieZwXGkjfwB1bhXn4U49gET9s61Lsgi0kTiYMV8MPYibf5W9e/j3TQ
 j/+qSa5cUQftVrlqTwSLxkJ1oN+liS9tLuZdac4iYd5K/PyzDPAETC68Btvte09GOxyDl2R6U90
 i5UcOaigUA9ONeQwnkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_040955_750772_778EB969 
X-CRM114-Status: GOOD (  15.85  )
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

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> Specify power supply for the second chain / antenna output of the
> onboard WiFi chip.
> 
> Fixes: 3f72e2d3e682 ("arm64: dts: qcom: Add Dragonboard 845c")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

I don't have schematics nearby, but jfyi downstream doesn't do that

>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index ad283a79bcdb..5118b776a9bb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -379,6 +379,12 @@ vreg_l21a_2p95: ldo21 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_l23a_3p3: ldo23 {
> +			regulator-min-microvolt = <3300000>;
> +			regulator-max-microvolt = <3312000>;

Do we benefit from the 0.012V spread?

(i.e. is there anything else on this rail?)

Konrad

