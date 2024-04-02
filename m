Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02528CD1284
	for <ath10k@archiver.kernel.org>; Tue,  2 Apr 2024 23:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8wssuiiGnXanF5AzvVhsyzrPiXUkHy55h9qyAcQd5k=; b=tMf4CBPxFlKr519fWx64lKKqxl
	f54+1lbRARSkoB9Bkuk7BlMvzdI7H39Xdh4d5RrQ8eWug4LB6qiREFPoQesRsyBFuqoihF85hbuYT
	i8oLGqBaqAzQRp7HtX3IzDwXwvMRcWrrS1XaVaOmzR/sRBE3rRSN5KgujrfUgbK4kMSmhi8Qa9BTv
	3ii4MFI0KxNm5qPivFGK32R8MlCS2U1g1hBi7lL7S20E3xdXie4nyZphdqgu/QEZJ01ksC+Z49uWw
	/WJ959SY5ee4Rrnp0Vw9kKr/7PiLnpVTAs9DrbWhpehHvoxMGAzbyMlgdb+e5S6Vp2Pwj13kAIxaN
	8Oe7eRTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnkc-0000000DDhp-2vj4;
	Tue, 02 Apr 2024 23:41:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrnkZ-0000000DDgu-2RVd
	for ath10k@lists.infradead.org;
	Tue, 02 Apr 2024 23:41:09 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 432Ne2hV031840;
	Tue, 2 Apr 2024 23:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N8wssuiiGnXanF5AzvVhsyzrPiXUkHy55h9qyAcQd5k=; b=kM
	XRHgOgOaDds6cpFMjE7XTvLRyN3CitIhjYJhICCpRhsfbelCWckRk0cFmoNkAxWr
	mUoALWnTF6DpWJZjJhf9Z11ZGa+ALSEKucpvFXpSUIfsvQ55c+zAcp8b9io2qILg
	n2P5bUCgIZeT85A/VtuCasUZTRGkqps0s6u53hl8gp6K2CsLtf5eDeS7Hb1/cNEk
	n2rtswBXwOos2uExprcedpA2mLSSFgLiYdUuHt7oQZTKbfx0lXFK3kjRMJRr977l
	8GeC3I64W92s60UfXJsqEFxexjnIePKB/Oven7y6Wvz670BoguyIOmMJjWymAfX0
	5cgCYjYQQigB94yD+lgw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ex7t7pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Apr 2024 23:41:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 432Nexlh021242
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Apr 2024 23:40:59 GMT
Received: from [10.110.49.129] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 2 Apr 2024
 16:40:58 -0700
Message-ID: <c2bd01d1-8ddf-44b8-b5bc-860cc9754b76@quicinc.com>
Date: Tue, 2 Apr 2024 16:40:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 0/4] wifi: ath10k: support board-specific firmware
 overrides
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20240306-wcn3990-firmware-path-v2-0-f89e98e71a57@linaro.org>
 <CAA8EJprpmC6+ePxw_G6y9YEszndq1VonS1HP=aP9OVHNm42LLw@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAA8EJprpmC6+ePxw_G6y9YEszndq1VonS1HP=aP9OVHNm42LLw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: h5QIcBeX7EQGg7FWckzMY_0T6_xTejy_
X-Proofpoint-ORIG-GUID: h5QIcBeX7EQGg7FWckzMY_0T6_xTejy_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=983 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_164107_785353_1DDACFA5 
X-CRM114-Status: GOOD (  16.67  )
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

On 3/29/2024 9:47 PM, Dmitry Baryshkov wrote:
> On Wed, 6 Mar 2024 at 10:16, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On WCN3990 platforms actual firmware, wlanmdsp.mbn, is sideloaded to the
>> modem DSP via the TQFTPserv. These MBN files are signed by the device
>> vendor, can only be used with the particular SoC or device.
>>
>> Unfortunately different firmware versions come with different features.
>> For example firmware for SDM845 doesn't use single-chan-info-per-channel
>> feature, while firmware for QRB2210 / QRB4210 requires that feature.
>>
>> Allow board DT files to override the subdir of the fw dir used to lookup
>> the firmware-N.bin file decribing corresponding WiFi firmware.
>> For example, adding firmware-name = "qrb4210" property will make the
>> driver look for the firmware-N.bin first in ath10k/WCN3990/hw1.0/qrb4210
>> directory and then fallback to the default ath10k/WCN3990/hw1.0 dir.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Changes in v2:
>> - Fixed the comment about the default board name being NULL (Kalle)
>> - Expanded commit message to provide examples for firmware paths (Kalle)
>> - Added a note regarding board-2.bin to the commit message (Kalle)
>> - Link to v1: https://lore.kernel.org/r/20240130-wcn3990-firmware-path-v1-0-826b93202964@linaro.org
>>
>> ---
>> Dmitry Baryshkov (4):
>>       dt-bindings: net: wireless: ath10k: describe firmware-name property
>>       wifi: ath10k: support board-specific firmware overrides
>>       arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
>>       arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node
> 
> Kalle, Jeff, is there anything pending on me on this series?
> 
Nothing from me -- this is outside my area of expertise so I'm deferring to Kalle.

Kalle?


