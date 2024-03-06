Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A202EC5475B
	for <ath10k@archiver.kernel.org>; Wed,  6 Mar 2024 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8tNCPbzCWi+B6Z5twqI6NjUPM2+8unGp6l5/zPPxh0=; b=kg0EoItOPGWDbBOZ58i4NWY5cF
	hBhwWOtCzeP4UIr+PUi6Sl5zFVc73jR0F1i1jnYrZt5AwyRVIh6Bzh7Xjr03nzOWSlz/uYousz9lf
	WFIRNnPMmZaBJ4B/SCn1UtPxV5/poSWjfF8s6kVR9TdxHZna6I1N8qODRLCoxAk0RMgCx6BPlfI5E
	+IUTmBRGfDDkps5X/k0SLExBsAIQdUht+Y9JiQhnXbpmnMWroyxuXLtJYdNBLzEHARinkXH3oxqy6
	KDtlf38z89rXP4LnTPTBf0T4J4vW0+9/Fkrg7gtOwk4OQ0WA5X4g877/KxQsrUPmiDovT+0HU3k/Q
	32oM++kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhzhU-000000024oN-2Jep;
	Wed, 06 Mar 2024 22:25:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhzhR-000000024nA-2oT1
	for ath10k@lists.infradead.org;
	Wed, 06 Mar 2024 22:25:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426LxtHT031815;
	Wed, 6 Mar 2024 22:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=q8tNCPbzCWi+B6Z5twqI6NjUPM2+8unGp6l5/zPPxh0=; b=ja
	y5a9RfeRivotbNGX9yUq3AbZW/pYWZ8UI8enkQif/FyCT5SBP2zNwTAV/i4bp1zF
	CjxUnjnB8Je5LiGqgK1DvpmB+XBrjan0ZNy7EMQeHaYu/WN/zARW9+ih2iHdko8L
	yC07eVFAa++UIdxt5fcBKpo+/IJ7VpJCxhgEsv3FBaI4lZvbMkU6bj8av6gZxPQW
	KUZYLE61TpL5sx58vbkXtAxIrI5DtDR1KIeHLV9pNkKmLjb2kOaQe1wDe3DUHDrZ
	o3bgHfX6t7s/bF6Zmsv0FsieeimcCqpsFGqYxormZ3HeFdY+aYP4IRgUVwYIiOxH
	wX5Wam2RehUM4hwoBbcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpjqf23vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 22:25:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 426MPDaU021468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 22:25:13 GMT
Received: from [10.110.86.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 14:25:11 -0800
Message-ID: <baa7a017-ee4b-4e8f-9bb8-1e3857e18855@quicinc.com>
Date: Wed, 6 Mar 2024 14:25:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware
 overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <87plw7hgt4.fsf@kernel.org>
 <CAA8EJpr6fRfY5pNz6cXVTaNashqffy5_qLv9c35nkgjaDuSgyQ@mail.gmail.com>
 <87cys7hard.fsf@kernel.org>
 <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAA8EJpowyEEbXQ4YK-GQ63wZSkJDy04qJsC2uuYCXt+aJ1HSOQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _QXoaAqIf_VKqQDKLy0jgYj5bG4nTmdp
X-Proofpoint-ORIG-GUID: _QXoaAqIf_VKqQDKLy0jgYj5bG4nTmdp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_142522_017438_BC1FB865 
X-CRM114-Status: UNSURE (   9.74  )
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

On 3/6/2024 6:23 AM, Dmitry Baryshkov wrote:
> After some thought, I'd suggest to follow approach taken by the rest
> of qcom firmware:
> put a default (accepted by non-secured hardware) firmware to SoC dir
> and then put a vendor-specific firmware into subdir. If any of such
> vendors appear, we might even implement structural fallback: first
> look into sdm845/Google/blueline, then in sdm845/Google, sdm845/ and
> finally just under hw1.0.

are there existing examples in linux-firmware?

or is the whole point being only the default firmware is in
linux-firmware and vendors would follow this pattern if they add their
own firmware?


