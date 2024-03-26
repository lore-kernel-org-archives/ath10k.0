Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C59C54E67
	for <ath10k@archiver.kernel.org>; Tue, 26 Mar 2024 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arEoGTCZUWCWxutFceAE4m0rRT/rHcBdAsYFinq5huc=; b=nUUt+OkK8eAJxHGr5ve770tO+H
	6dEneWil2i6KuuoLJqURU0vvWbEs1mnhSjiEeofKukhc+Q1lEhQ1cfT8/HSwszFtuw0+2XrJ40wyY
	AdBhXiRPCL9e6FW8Bo+7Zb89YZ5PxSeoExWVW3wiLikvUHALwzoVd053z1kHiJaLB6PDXB/9bwCp7
	t2j/poK1N4i9KO5ko5yumJIPGuGQ0aeFFhAXGKPf6yw54lmzz3bzD2IR4kDOTpfDn1+sQHSSgcDE/
	Y3MedR+7+gqi0pHj3bHC2iNerxKrrsz+Z3HmWCRL3We56qHmo3fNPqjLJDwAgBiCYMlzcvL8eftQG
	+FJziNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDIh-00000006JQe-1NAI;
	Tue, 26 Mar 2024 20:21:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpDId-00000006JN4-3iV6
	for ath10k@lists.infradead.org;
	Tue, 26 Mar 2024 20:21:37 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QJk031030462;
	Tue, 26 Mar 2024 20:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=arEoGTCZUWCWxutFceAE4m0rRT/rHcBdAsYFinq5huc=; b=iL
	cGReCm1lly3g04MpHOt5KRGF4FYqket/bQKauEHCn38nZGrmbHRmsfffw+xzsq//
	IdwmrUQopEO8WUKYE6bAviAuQwLlSLi5U4qKnMTwFjLGfqXvHxZ7KUwopEWWH2oa
	TLJ4sic+WGlf5GrVzyJIdhLqCyM29x+NmBGyjIdi6jE1/YwUla3KBdgHzKYibmFD
	mt7zbY7xUBs0bQMnVqOmlVTNK1ySGb8Lh0M53iSlBikOg+7r4i1aUGF+ke6636p6
	ZPZflfkOY1dZWNYTMdsd8YfyYfLBbcIeFD/4DlHHm3LLDC2SVP2OB3Zw6y1kbG0J
	J+dHcZ6hiEsqHB02OWcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x3q0n2ngn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 20:21:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QKLMrt011298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 20:21:22 GMT
Received: from [10.110.28.48] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 13:21:21 -0700
Message-ID: <4b7bf7cc-ede6-4c2a-983c-da4c8c09c5d1@quicinc.com>
Date: Tue, 26 Mar 2024 13:21:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marc Gonzalez
	<mgonzalez@freebox.fr>
CC: Kalle Valo <kvalo@kernel.org>, ath10k <ath10k@lists.infradead.org>,
        wireless <linux-wireless@vger.kernel.org>,
        DT <devicetree@vger.kernel.org>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Arnaud Vrac <avrac@freebox.fr>,
        Jami Kettunen <jamipkettunen@gmail.com>,
        Jeffrey Hugo
	<quic_jhugo@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
 <243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr>
 <9293793d-00e8-42ce-87b2-05abc3b49387@freebox.fr>
 <CAA8EJppn6M9dpzyu9d283AUtaeN-i-L=-aM5P9BEELXPLFS8YQ@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAA8EJppn6M9dpzyu9d283AUtaeN-i-L=-aM5P9BEELXPLFS8YQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _qISA-bD4TD7kdEs3Ay_IX7kYusR7aIm
X-Proofpoint-ORIG-GUID: _qISA-bD4TD7kdEs3Ay_IX7kYusR7aIm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_08,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403260146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_132136_097033_1438ED67 
X-CRM114-Status: GOOD (  13.20  )
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

On 3/26/2024 10:51 AM, Dmitry Baryshkov wrote:
> On Tue, 26 Mar 2024 at 19:45, Marc Gonzalez <mgonzalez@freebox.fr> wrote:
>>
>> [ It has been pointed out to me that the previous message was unclear. ]
>> [ Below is my 2nd attempt at a clearer message. ]
>>
>> Problem: firmware-5.bin has not been parsed yet when we have to handle
>> the ATH10K_QMI_EVENT_SERVER_ARRIVE case, so we can't rely on feature bits
>> to work around the lack of MSA_READY indicator.
> 
> Then, I'd say, we have to resort to the DT property, unless Kalle or
> Jeff have other proposals.

Another option is to follow the downstream driver model and only expect this
based upon static configuration within the driver.

Downstream driver has:
	if (priv->device_id == ADRASTEA_DEVICE_ID) {
		ret = wlfw_msa_mem_info_send_sync_msg(priv);
		ret = wlfw_msa_ready_send_sync_msg(priv);
	}

https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/platform/-/blob/wlan-platform.lnx.1.0.r4-rel/icnss2/main.c?ref_type=heads#L968

The downstream MSA logic (including some other code that populates MSA-related
fields in the QMI messages) is only invoked for ADRASTEA_DEVICE_ID.

We could introduce a new hw_params parameter to have the same semantics.

But I'm OK with the DT option as well.

Kalle?

/jeff

