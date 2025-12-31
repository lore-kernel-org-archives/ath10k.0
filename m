Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED81EE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=; b=mp+vwjXjVqmmBZvtmg6BPK5Wtk
	usoOE9DtajBDSbo4tXNCRW6qSi3rdyWLIqFelmQxeVHy2W5oA1RREgHb/6E8E7Ow4MttJ7zAQChq1
	l1n+UGchNHgMn5aPNjbl7CLOQEsSoBNbj/b8fgYLWsY8a7+sp57Q48vIyspyGDjKUQQwk2byiy2IZ
	dQf5cwIT0jCTfm2TPZwW+3CiZMTtFYb40zpM5R4VibfSZ6TdB1DIUVcdtAUntvSDCyrYryPkHRvlo
	MroUk9F4VPLTn3UHZUw0f43W3hbrqaEyXJiSy+Oj5EsrkmXMwDgzhIMVpe3IT/Mts/kueCcOWP/MM
	L4Lm9rnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauzo-00000005wai-3Lvj;
	Wed, 31 Dec 2025 12:08:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vauzl-00000005wZm-469U
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:08:07 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV039Zq2723181
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=; b=JYYetMHsA9nLPALh
	XQ8f+wUf9nxQMuIwnd38JtG7hDZLzN4o4+TD/ckycxr+7gQaMLh50EIYQKZ6oATk
	qcll+ywSq6o0u/AHb9VB99ttFSGI3DUhoa8R31nuG4UeSmyecQ4+sHfamSDb2oh7
	LIjvbTcCuZTBVs6wArIevnxz2V03nrzDOuG8pddkbTUTiq7OfvnjZ6EAroF9TAMw
	XdYPvKFGP7jWjy8WS7i8AGO9p1sHEpzj14B6PcjsKtB0hXURCwzqKuXTcoJAOXXm
	psWe8wkK+kOx394c7HiWsu5MF1nkkvBcWBg1ArsyrKiYAAibjHW0/kZdckgMsM/Q
	TWuPbQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdm979-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:08:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so29259301cf.1
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767182884; x=1767787684; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=;
        b=h8ssd0vYQ13fYt9v9rie9TpfqUXt6XyxYGdkjg9c2k0jPbsSR6Q6c+1xiu+U7fk0gm
         f3O0EgrEV8VL+DDiJO1UcmKrPH4/27RtOS1UTEsUUQWFekYconalrg5yJwaMMFP99FID
         HvRP4ywu8ygTs56DUx11LjBYaCZoyqkYsBrpco10jr0ekq+uetM101Pr9KiR+sT1QgDm
         IJAmWzUVyf4/N+pMPGdjjABN4Nv/MAuBfOo4BiLMC57bz+xihMTJ7wuV78lEP5DZUDaS
         ey7aL/fovbMBJEw896Xo5zq25dmY9hgMnN7261IFDcl16KXSEwXDJFgc3Kd4R839/4UU
         cnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767182884; x=1767787684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiJtaHWpT52Ir4SAEeA1tuRYvR+ztp79Uz63Q9MOA7o=;
        b=U94wZgaQlbFPLm9okBZzdXQFZoy3E+4xFzr2RQJs8EiknnF/zTApeA4CMr8Z4Bad7f
         vc8UNOFfxOYZ6IAzm+Ooan7iSgAUTzy9mwjMUv4mQBfDtXWdTtxS2A7anXT8SBfqRJVR
         drm+tsJGZVTnh46SNx2leBPTnc6DSSd87CZIwTLSKvKGFu47MU+LXc+cJNyI4wIVuL8z
         KLecEBOYrHeZQigR2ScOFmrU8BtNYijokvsxq7Cmmm/2uG1BUt8pGiBeR0h+MB3k0e6D
         jClBu0lzUPASMOb76Tm3IyTsRxTtF1wm0y8liBxZCLz1OUm37lOZclSUsbFDecXhpy5o
         yk8g==
X-Forwarded-Encrypted: i=1; AJvYcCWYmHrWeGync2Cpx18r3GT1mDHxxrrXGV+VebKjaLaqc1DkqUWxoqt48QxSn6N0SCx1rAhs9e8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRI/O3tHNqS/N0rAUOUclnOh8ULmTb6GIuGDDKEs18xv7yV6iW
	rhPugcGEG1TUTIUSu81O5eD+9ihALA+q0KNdF0RLztmBPHgn09KyKl6TachYEg/xHcM4JhSjr9n
	zIQ9ZjsgBlHC6PBS3EQDtSaAD8AOSwRxCi7FVOxC1LLFuYhSWNCnelFswDJeIkh6q
X-Gm-Gg: AY/fxX6H5GQnXO+aoEq0ZbYkIOFaEFn8BRvfzECmR9l8BrMgCwTO+MBPQ1RxeqFeUCP
	lWiKSWk+ETTCNVN1tieiom0YlBvTCwneb9kwQTs8qytEImrtDLMX+4ZXpotOWqVYzkRxzkc7bSo
	K3YxEMW9VQ9FNQ3HUS+4mRUA2qkfmSlrTIYj5N1ikR4v+zqQnmiFzvP/gvdhgtrVIhHk11NMwcL
	OfE/KNYbcaEPsV6slGU26BPXRCXr/d0BCUGPXzqCf4XvrsCbhgmvQ03pQTEZReHsbnUMym7swS7
	KywS2KCoPQ22w1/rL5u2OlgkiTeSwkb/g9m+N84TguhwfCu2LrPS/DpeJOsqASMoyLjfcIkzSil
	4LB+6NUrSghjWvWbIg2UWCSmkGfZ1gEyj4452tkGAaB/jdXZTfHE=
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr410146741cf.8.1767182884071;
        Wed, 31 Dec 2025 04:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiPNC0oH8EFPcBv3otDppGjXcWFCcR/VT+vF4VQNNWa4RvyRS8nRSCSTA96lyQ4NSKnYSHFw==
X-Received: by 2002:ac8:7c49:0:b0:4ee:1a3:2e79 with SMTP id d75a77b69052e-4f4abddcae9mr410146421cf.8.1767182883666;
        Wed, 31 Dec 2025 04:08:03 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm37604637a12.27.2025.12.31.04.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:08:03 -0800 (PST)
Message-ID: <83bae671-3174-48e3-b9f8-412d21f8f18c@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:07:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/14] arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
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
 <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-7-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69551224 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=wl_8aIJEU-qjyxFuvXQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwNiBTYWx0ZWRfX8pGsyMohtfnc
 0VdKWR9eNbUQ8Up+rncA3mmFjzzcqp/zQ8RnBvMB353ZYh5t2VFdNWi7WW3RbG+quNsRgY18qDV
 8VSg175FCQ3rkcLIZA33+GsT5jLTlKQQVhiC0rMwERtN4U7uvQ5aXoA0Ro6/ai/OyW6a8PrYdve
 mTFnJ0OarzLbsN3msKAFzAz6F07R6eAu/OVTpSSEAc4lVB59m7KuyCnUGf18ML1sMp/BmOBnx3Z
 f9sKWFwV5br6EqB6Uxx73N30lNtC0mlnIH5FU+osoxpgwTme3Hxfe4jDyyJbl7i+FFTNY6WhTjj
 fXb59WaTtFmUMlxAXcW8PZOfTF15UX6pFrD0d89OifUgv4Iu9cG9eLJEKA0h7YzE/6lCg7BPeqO
 q6PGo6uo/82Kqu1SFuMMbAkgYWhPyHu8OgLoI5cV0ULm3XAUpYFQpAkoLK+wm3WAlzUGa/Cgqq5
 0BxVnCxFzyVgb19g3PQ==
X-Proofpoint-GUID: hJpvdWdiobX6Vu67F9kH5ofyqWEvhc_Y
X-Proofpoint-ORIG-GUID: hJpvdWdiobX6Vu67F9kH5ofyqWEvhc_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_040806_139167_56836CF0 
X-CRM114-Status: UNSURE (   9.93  )
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
> On SDM845 SPI uses hardware-provided chip select, while specifying
> cs-gpio makes the driver request GPIO pin, which on DB845c conflicts
> with the normal host controllers pinctrl entry.
> 
> Drop the cs-gpios property to restore SPI functionality.
> 
> Fixes: cb29e7106d4e ("arm64: dts: qcom: db845c: Add support for MCP2517FD")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

