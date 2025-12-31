Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A701EE6428
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhaBQ75Rf71lV8FkiGxgw61r/Y/XZi/ecHt0oI9jQCY=; b=vUiUkMkVGBFT1L5hGkTn7FXv54
	ZrY64PmQWXdt8Wn/DfgqfaQn7V6j7zoj4hooz/cKDSSgcWKznIlKQWhxHjU9rYrRSKnuSAxxCfuDB
	cm+mP0pK3qXprIsozmJfX4IQHgd77jybI7f7SVAzVjrAv/9sh45Iok9f3fhDggf8wMn53N5qN1+Ri
	WLFUFZoaS/Qr0HhaHBD09HcMDSp3GbHzeFyvYsD7UoeXc2iVvr0hD4J+54XMJ+1Mscq+a1frLn1Yl
	PnHQdam2Uy5oI5dX3+eOg+wYNhf1z8Nan8ndDxdUlaSeSf2rMve82amjHUhSqOryxOgT7EMzOejcD
	zxqKbuBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav2S-00000005ww4-48Zt;
	Wed, 31 Dec 2025 12:10:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vav2Q-00000005wvm-3921
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:10:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV1DcM33971202
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XhaBQ75Rf71lV8FkiGxgw61r/Y/XZi/ecHt0oI9jQCY=; b=mezau7Nzk3XUhMQV
	4EiIg/pK/tFORCyMGoQ/PLNKi4tMRaTvpOwC0hf/CJOAwOsS5nHynXeO0jPK2Lug
	+ctgHBC8aflVVXSofn8SmFDUW5efcuJmNwmuSPIQsKR9k/E/ztH8qFR4e4ygZUH6
	lnWbWyLOZG1JeLAWomz2chAgobMNfAA2BHSbm+k2aTAOiDm6xF0kpNe76juVtC2n
	ZnDJT1ez9iTgc/E6xnjuf66FbrEslT5jCwInbzye1qu+dCeskUyPWcfpuKBXv7hJ
	ZCVWEpV0v2AIeA5mKI34UHkQlCDc0pUkV0ZfJkBE0t/b1C0s7AN90fguASRIdazO
	Z+V8qA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcdky2me6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:10:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee409f1880so29264781cf.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183049; x=1767787849; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhaBQ75Rf71lV8FkiGxgw61r/Y/XZi/ecHt0oI9jQCY=;
        b=jM9Vv9rwGbEQhfAPn8ZRI6ShxdMtS5+e+bVo59F6asI8VGMLPuAqgTMzn090beo3wb
         foicMXs4jQnDVI2X66TbJ3OZvMwMemTTsnQMj+lv9jgTa7V5mzJNZwR2Ao+jdtbNCMeG
         IivSuiEmi1qSEH3mwLozp1+8Sd2Y1C95UY9NcB8pHw38dX3zdUqrRDkOBCG2SnbNQXeF
         ElT+E10yR1YxUcxXBgvHQrFUpOmMiAN2VA/rmoA/P+kpjrw5NeRPCZ4mVHSX/XEQ0SOE
         8LuNjz9qgHH+ALk10QLlV+ZSni5x4akjSzsgJMgz334sksivGmEtL1ojPP5L+r1G6kzl
         rzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183049; x=1767787849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhaBQ75Rf71lV8FkiGxgw61r/Y/XZi/ecHt0oI9jQCY=;
        b=qWTMVnnO6QgyO3+Z3sUTY178szAMmJ4oK+M2UCw3iLobN66EV1kCc97ZKt8+7u9k++
         hv5iHQZnFSMZRXrWWTPpuIJl+7A56egCpCy+zIuMt5ViZuYh7oN9JWfYMDXfCcTTkVjX
         GmQHdQx4vy418J6DjL9no3Uj+OnLEncJbsQJh1xEdlKKXWR7oA8Ll47emB6iEcMKIwNd
         u4q/Wv5VMWwaFT4HHinCsW5lSUZUDsEfjdMbidVGj1FgraRRNmeicnX/DnhGcx/7w6P7
         YH5ynHfyCvWTqsqX4zOQdohEr0HHFBYURmAyTUbKxCjE/F3+S3ULp7R+40D6//dYohf3
         PfEg==
X-Forwarded-Encrypted: i=1; AJvYcCV+kSXRJywWpASTbXTqlFmZrmK/hH4O11NvwKntEKd3pQRCKXlQHxR95+l9+cNrhq+aoyF18E8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3bJirjiwVN6sNIaJuuZhPI9T1uEEZ/nPBfwtpyg552fk6XdvA
	1Xq/PxAbQ0gu0l/UhkkYT80mGpcFVjeJFSLZf6cUmROfiNKC2jQ7pz4CbMO/ssJq/Vo+qqvkGLD
	oaTljzjkZ3KhwozDvXSo/VmQtT3dm5tW1qmV21Oqh8imng3+wm8XXh2wc3TyehnzF
X-Gm-Gg: AY/fxX5avtfeKGPeB7EugHU+8hK5RH0PLXAcml+6yZ7GX27t/a5TYa6c588de16jzRw
	tBZPdD8gdrAQpYlCpnnPdgNYlMs6a9REgsWs8xZFrYrepZkfzF+ZNBBFKVRK9ewso5CT39D7B7L
	bcTlYjK4x0Czrb3XFz9+kTNjc1mw19nwuMKlo1dMSGA8od1O+Gro6650mFYeoPOOZ5zFJrO6Mnv
	dZIxvdpZ6UMdURmsOh8aS/W0aL8U5GpgBbA3fOKoj5cNYibcEDvYihae6aVu3iAepFaigncoyKa
	rJB8bAlZwSjHollQ7pgoTFqctbUga8iIWL9q15vVYclpDCF9anbluRTeodV64lXoocjw5xnTqBD
	00okeMW6uBHODsbT06FHweHxeXqUevdkitZUOsDaewnaAI4AKKgEfVDDdRQV4mspEhg==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr412852221cf.1.1767183049231;
        Wed, 31 Dec 2025 04:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6cFEFkyE8VRxM0b+yrpQtlOmvHQM/Qqxgrd4xJLvYLI3HpIrI34F73/M4v3Vqo3svEu2ifw==
X-Received: by 2002:a05:622a:1983:b0:4ee:1924:c6fc with SMTP id d75a77b69052e-4f4abcb50acmr412851731cf.1.1767183048729;
        Wed, 31 Dec 2025 04:10:48 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90414649sm38031586a12.0.2025.12.31.04.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:10:47 -0800 (PST)
Message-ID: <d42f24f3-ce9c-4804-bad1-f83c832bdaed@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] arm64: dts: qcom: sm8150: add uart13
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
 <20251231-wcn3990-pwrctl-v1-9-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-9-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNyBTYWx0ZWRfX8cFEuQldQAC9
 uj8nJHEM5e9O1a6eyBI9+rSEGAiWxPWYhrrcYGCC0CznUP47LbbS3VktUgix8wmOMtdJZhSdKcD
 rXx+UksILMhi/DrLMjOhmBR5qYT1bjiDvQpg+kJnG6uWL0Wn2Z8htZ8nRRaNbGw1qGWr3X1Ujq/
 JS0YsCFL2bJrJtbLOFn3n8M0l0iJ26bRzGFyInAEc8uKNjgyk0snnWXfyqDM8lB9X2PnGiP5AUJ
 t2XHLnf0suE/PkbqeLyRHiDxpbXTBY1kgC0Mh35E4SLnO0zjW1uHejmvjtuC4JnRrfsfNnt8dTx
 NvPIbA+wCtNCiaiGFr+lbLIAlgs1w0VrgRaqoKozRf/iCB4e9m52KtL2zWgs+mjCMHldSQrM5q0
 NjLiHjUm4eSuCY+2N+WxRdkOrZyY3zPqN0EpFfDJiV0nduDObNXwRQeDNgof2V3nlEStgFwFJjb
 4eBT6vCywEMiatM4VLA==
X-Authority-Analysis: v=2.4 cv=Wskm8Nfv c=1 sm=1 tr=0 ts=695512ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ROe98goXJRv4GV1sSmoA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GV1MF-ved4_hDQemCZefoDhqWWezb9DM
X-Proofpoint-ORIG-GUID: GV1MF-ved4_hDQemCZefoDhqWWezb9DM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041050_818459_FFFB0DA2 
X-CRM114-Status: UNSURE (   7.86  )
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

On 12/31/25 12:35 AM, Dmitry Baryshkov wrote:
> Add UART13, typically used for Bluetooth connection on SM8150.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

