Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B001AEE642E
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWPcobs6vfaZsrdB9wU8wUq6VCm4lbG0X06J5zTpzNA=; b=ILYWJdSwH7a6uW7IO2BBG7phfJ
	/GnsewLu+dUbnsNdB6o3m3ucUo2O1QAC1DT80GnVbyD0I6t2mGyGvYQ9hRn6V5QWMvTO2Xwk2axS3
	ALqUqkq5Dh00NoZoI3JT+tqPrrO2/78t7gYKu6ZBUtJbxzcZ5PbFn90eWcFUPF0orVLVr5xWHDIc1
	AwTbG4McDUwLzULZV6NPquLNd/KWpdAzBfi0t2pMVdSF77sEqtgzv2hlWVxVnxCVE2thaLod/vKOd
	OiLs7kjT+T3DpO7yAB1xJv34HH5nGz/6LbXw8MlY53lktpy6QcQho1vA8EmDrZJqsCTIrn7vwTEml
	RLT5nJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav9m-00000005xTu-0YdU;
	Wed, 31 Dec 2025 12:18:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav9j-00000005xTP-2Mbv
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:18:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78YiT2733371
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWPcobs6vfaZsrdB9wU8wUq6VCm4lbG0X06J5zTpzNA=; b=Cfge0or+FimIZ4ft
	ZoIjV+UUEVPWXYDwflBGfqx/ADLwjuqjmy/4pUXz3Z6OOVLH5Y1ruf1ePI+7x4iG
	pRctGSEw7CBbNBYDNtq6+6h57SIP7R3UWtOWY70q777FurXmKvMw4+Jrhf7pY1Pe
	WfKawEip+biCJpKDBF9/Lid9N8Lkp30j0fvUT/lJGTybiEyeHctmwrRryWyzAgg6
	O/Qr7FlRPitFUhNA9nyEzJ2FBAm0z/m0LUKHemdl6BEcyrpHgyLnF/jlfMkuC8D6
	C42F9WMkEVa9NqyScVZT7GLpeZFfpjkcVIyo0S56cECuPdPpYmtVReoLpDIU+Dht
	Ka8jBw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6aggjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:18:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890072346c2so16635226d6.3
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183502; x=1767788302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWPcobs6vfaZsrdB9wU8wUq6VCm4lbG0X06J5zTpzNA=;
        b=bnavcINWehEt4t579+xvknvyXC0PZiyd9VMihjDFd7xs5CO/73AoGe7IZxINfAWjsm
         MEXF7qCa/75Xc2f1YgSpIVFxB+75RWksYXyLoa6tSbVgoHJRJXCgGvbSqGHqM5uJnupt
         TZps1EqGWYCiHal/3Dvx6bNo9MbEHYKaFr8eaD7XOvTE4sx/SNqINJa3w0JEUFF8EwJV
         gZ8Z5iERf+1uyN0bWLJOryw6mNQyPgpKBNBcZqK+1EcG/PWg63XBpfnNaTHz7+sbp1be
         HzTnqqJA+LzGeMMhKJ32nujMh0VDmHRs0rk0LrFPnVpijwjmSBEPyucokm3F2iF+mPVc
         4xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183502; x=1767788302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWPcobs6vfaZsrdB9wU8wUq6VCm4lbG0X06J5zTpzNA=;
        b=KAmdCor4MmdPG9qf0NbuCD/I6EhgU0a42/0Y6Rt+WJcPVG5bjnvDlKHcOp4UK3lugm
         vZh2kOo+ffXomgzNX1kWU0BCMyHArJt5U8IOgd/i7ywhTkiyZuWiWhmlfPOdh2Ri8evC
         T65mEG6HdriusMKcweBpz8BoNqPbaK0O3sI3+Wl3ZIQ8e4SXs75WVZF87/XBTqNgFBj7
         YxteYIY4ANTQ1hxF3r0DxgRXT/DUl7UNjU/MWN6k+hzXVLqr/aUtAhNGAnQ/UHxb1IpB
         p0vPYevOZTYKXp//uPkcMH0XvKsicuQOQBewq8NfXSfWwc/ov1yFNDnnI7/yvcIjyj68
         DJdw==
X-Forwarded-Encrypted: i=1; AJvYcCX7E2DBFn8oVRjMGfifVAUU/B/1yV2jJLUow8jozLUW3OS8RWusbRejaI2jzaM9YU4GY3K10xA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8NmkbvUyyA2wZs/WDQ0TXdkSc9W8qaAbjDuDoqjQVHLymHtDy
	s1UKSoqmllMTBAnSUaHWPGhBUjswKNzVd5fQbLw968xBIDwdcRIA1EiyyIpAPm+JBjazNcE/DAU
	GxmL9AEOXVdpDTKvemAb979WyvJ8fp7o2IucUkMOV0mM1u3tPej69SZNgxediobLj
X-Gm-Gg: AY/fxX5EggpXnGENPfn9IFPN/6Hued+AmSaL4WZKztG4dLI3VcW4Zcnmja1gxC6Bade
	XeHLf3EpXMGGLPBmfLFoAC828lHL4UC1iw9gB48eZtuOBwdTmc5ejixQqPhqbWKbiDtt1sVrFC0
	bw/QN8dEPwDhftCL97J1ts9Q+W9UuYAuEZxYfH7xeam+AYW2hbzGGNX33H3ocj43oSNQpC2PUGy
	41ukQdnbKTwogDrI0zIFuYHxo3s1Jdl+MXJoKdYb1oFUWDtVz2rmu6RjFSGF7wBhNxg5HmvYziN
	xSZ6/Wpd/044UgDO3zIgo8w7hZbco9pdqYIDxmkf2WzstDwjffIxQHU9UdwtRB1tAlHVImD16QP
	IN3X6xq8k0Pfc0dvpyQ8CK2APAoRid5TGRKX/+hoHlRxEsCp+pPpJkD3HBSSO+Xa13Q==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr419688931cf.3.1767183501915;
        Wed, 31 Dec 2025 04:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4xZ0NZV6OIB9S/tTaZX8Jwqb+5SJHZnAnR3CZjAFhy6aj42iDY49quAMU/SvRZ9mwZtROpg==
X-Received: by 2002:a05:622a:cc:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4f4abcf3ba4mr419688441cf.3.1767183501315;
        Wed, 31 Dec 2025 04:18:21 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494ce2sm37741474a12.17.2025.12.31.04.18.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:18:20 -0800 (PST)
Message-ID: <9c3cfc5b-a036-4f40-9121-5e00893f4301@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:18:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT
 properly
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
 <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-11-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eOwZm_daKPXsPyvKYU7cTxXW6djUaLz_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfX6MfcwLzzK7DI
 7wgfMlozCavUK89EV52eJOpJIuGbKMqzj9US1OddJOiKwZGe4HVTpJHPwHOJbdRF0nHDUcrHJoT
 TB2Up2LgjNheOpAPDYVDnjXVK8/w62KwzXiMZcUB0MbGD+c4rT3HMXgehd631VMftxxSlwJEZJK
 AksKomf2GaVafcgM+5HzeK7HPgTHN3VRZWyAeKN3b1t0jeD0jebgcPolsuj2LaG9h4QpZIwj2jq
 KuFRb58fbe+2343orYuI1LZQ0CoOwuIfdFSNrYx3Lu88xcokWgPSVX2Yyk8hfbZdvbT3zQ3oyWa
 OAtIsAxN9KfrcqUi+WilY8FuR5ylW92OdKhMGGkY/d1MEPTs1BBwpa3oDHNyevAsEsM9Hm+72FC
 l5qVbMvitUBWj8S4MKhVWPJ+w4rmw640+mjE17eaK9/J9mp3xfgHHvawM/AgXWd3/N1+Xvpsx9A
 1m9ROYOQIvVJve29a/Q==
X-Proofpoint-GUID: eOwZm_daKPXsPyvKYU7cTxXW6djUaLz_
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6955148e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041823_721382_2C279080 
X-CRM114-Status: UNSURE (   9.18  )
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

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> The onboard WiFi / BT device, WCN3988, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

