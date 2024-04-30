Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F884C4345F
	for <ath10k@archiver.kernel.org>; Tue, 30 Apr 2024 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMTMnZq0b39d3gHQNU9ilq9+qw22Sgk7JsiMtVCUndg=; b=URr8uCnIpKjPY6bafZK+CNNNrQ
	zcZ9Vj91kO4Ile4NpChs1iz0VU71H6/ZptJoss9AvJwCsi5nfBDurUNcO9Vai8ykMah9Aj8ok+jiq
	3rrUS8H6u+rpuYQoebaLQTIiY42Pp1uXMk4LnYcitT20i0RvjsFSMdACvfhWBuBwBqJp9zICcrygn
	L1MlILtRdQumQqeRLOxm4YPh4nfBbcUogDtdvfjv/QWKgG7siooftlI0wdJSUPkppmKtMeQM10UXH
	EJuKS5pyHBYET0bF+soFPyvm+dohmWFBWrrLQAF3DxSymTiyxsr8gNdcz882+yz2GzsjQH4oaiMD6
	vqjlfG6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oef-00000006smJ-3t2V;
	Tue, 30 Apr 2024 14:40:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1oed-00000006slN-0ix4
	for ath10k@lists.infradead.org;
	Tue, 30 Apr 2024 14:40:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U8Ju7j021323;
	Tue, 30 Apr 2024 14:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=aMTMnZq0b39d3gHQNU9ilq9+qw22Sgk7JsiMtVCUndg=; b=hH
	8xlK/GHpuY/qNLPNBL1ofS3fOkIF9Hp4D/Ar1SSAGcL0w+7BMCJwRsa2uNIorDMa
	duuE877UhjY9urDTME0oT4UwwH3g6H5MdQE1CFLrDSZaiLgvQVyyfPjH2WKEhlre
	x1OuDs0EzIZWsqsUnfaE8XEMfu8vKvqNh5oZdR5zMI/zXsJBlE0V1oZeZCMWUrfp
	xgpXoY8bIGR437qeeuPZTg45COeGehHOElaC3CDMtl+U3xp6O15lKghTk5Gwe9CJ
	W8/JxiK+xL2I9SevsF80u4iMqN0gny9SFC3gKtaYreq3UTDin9aZGjK9ZoyO6/Q/
	ZKwaucWO+j7OE0hP7O/A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtw1hgy4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 14:40:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UEeBeX007377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 14:40:17 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 07:40:16 -0700
Message-ID: <3a4171ee-997c-4ff6-a550-31f66c1882f3@quicinc.com>
Date: Tue, 30 Apr 2024 07:40:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8998: set
 qcom,no-msa-ready-indicator for wifi
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>, Kalle Valo <kvalo@kernel.org>,
        ath10k <ath10k@lists.infradead.org>
CC: wireless <linux-wireless@vger.kernel.org>,
        DT
	<devicetree@vger.kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        "Jeffrey
 Hugo" <quic_jhugo@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Alexey Minnekhanov
	<alexeymin@postmarketos.org>
References: <ebbda69c-63c1-4003-bf97-c3adf3ccb9e3@freebox.fr>
 <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <0914f96e-fcfd-4088-924a-fc1991bce75f@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y4WkY82h40eLCx6GFtdk9ZSIxG_--Frb
X-Proofpoint-ORIG-GUID: Y4WkY82h40eLCx6GFtdk9ZSIxG_--Frb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_08,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 mlxlogscore=893 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_074023_354282_D91E170F 
X-CRM114-Status: GOOD (  13.89  )
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

On 4/29/2024 7:07 AM, Marc Gonzalez wrote:
> The ath10k driver waits for an "MSA_READY" indicator
> to complete initialization. If the indicator is not
> received, then the device remains unusable.
> 
> cf. ath10k_qmi_driver_event_work()
> 
> Several msm8998-based devices are affected by this issue.
> Oddly, it seems safe to NOT wait for the indicator, and
> proceed immediately when QMI_EVENT_SERVER_ARRIVE.
> 
> Jeff Johnson wrote:
> 
>   The feedback I received was "it might be ok to change all ath10k qmi
>   to skip waiting for msa_ready", and it was pointed out that ath11k
>   (and ath12k) do not wait for it.
> 
>   However with so many deployed devices, "might be ok" isn't a strong
>   argument for changing the default behavior.
> 
> cf. also
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


