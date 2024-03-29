Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A059CD1283
	for <ath10k@archiver.kernel.org>; Fri, 29 Mar 2024 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQOOo/+YLRBywV7F/YvrAHC9R4G5lFaFMPiUXR1ZsKY=; b=cDENiI7zt6nWFG/9VCbRRIF1hP
	34iDvWq3fx9bZcnXI5yx4g+qGq4iYxyUQss1uhrjuLfXbbYfy/HIXT+6KUr2vNyl03OVs/b5RQc67
	D3O06hd43HXlvH67whI7iMmxz1KgZRmrQ7088m2NZEaUcTwLvw7CLccI7VpvlSec1Sz6ztQmETQZV
	F0wg7jmHeEAuD5uoCD2BLc9PfDOlQF3F/xeWG6GuOfartGa5pLpExXI9ON0NFJlEbHqSy3Zt1Lhmu
	O4AfxwH7tL1yQJEys5SiOcBM1retpnRcIXHJq9qT8tBogGGEPj+CFzvVAmC5nB6c62pfa8XJA1MV9
	pDZQI/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFvj-00000001SD5-0HH5;
	Fri, 29 Mar 2024 17:22:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFve-00000001SBX-3V5H
	for ath10k@lists.infradead.org;
	Fri, 29 Mar 2024 17:22:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TFrICQ000705;
	Fri, 29 Mar 2024 17:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=eQOOo/+YLRBywV7F/YvrAHC9R4G5lFaFMPiUXR1ZsKY=; b=Wv
	Xz9p6zzDJY/xv8pazhvO41On3Y2LxnfoXkTIreNHfPH1TBZt8UsP24EeMdemc+CJ
	iSFEkyI+RCUVrrpCBDO4fVF2m0scMQ75le5Eg3xguikcRd5vC7gw1vLH9xal4DEP
	vML4qmq5FYEGz12bFqEfW8vYF4slv/s1CN8zTHTU/A0Mf0H1CexRbA0gS4w/jLiT
	fwJvqF0EOqQDPdJJ/XZs4HVvXwvSsRCrGiV7uVdAbusWmM60aXYGge6e3LpA2B49
	Vo9QemFTTyIqXA73Jkt0olNbypz3A7xEngyFgVtWhSRNKolhHkkrKZuo9ifjwh8/
	1bhlplv/oBnB4P5dK2ag==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5dkyk0wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:22:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THM1FZ031602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:22:01 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 10:22:01 -0700
Message-ID: <f78fa061-3b34-47d2-a40c-bbec744f0f97@quicinc.com>
Date: Fri, 29 Mar 2024 10:22:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath10k: sdio: simplify module initialization
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kalle Valo
	<kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Brian Norris
	<briannorris@chromium.org>,
        Ajay Singh <ajay.kathat@microchip.com>,
        Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,
        <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240329171019.63836-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NFnr0VM_OTwUVD74iUN7sN2Gp4I1WXUj
X-Proofpoint-GUID: NFnr0VM_OTwUVD74iUN7sN2Gp4I1WXUj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=806 mlxscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102211_313106_3902205B 
X-CRM114-Status: GOOD (  11.91  )
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

On 3/29/2024 10:10 AM, Krzysztof Kozlowski wrote:
> This driver's initialization functions do not perform any custom code,
> except printing messages.  Printing messages on modules
> loading/unloading is discouraged because it pollutes the dmesg
> regardless whether user actually has this device.  Core kernel code
> already gives tools to investigate whether module was loaded or not.
> 
> Drop the printing messages which allows to replace open-coded
> module_sdio_driver().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> 
> ---
> 
> FYI:
> I have ongoing patchset touching few lines above this patch chunk
> (sdio_driver) which might go via different tree. If that patchset is
> applied via different tree, it might result in a trivial conflict, but
> there is no dependency. They can go via separate trees (except that
> trivial conflict).

I'll let Kalle respond if he'll take this through the ath tree vs letting you
take it through your tree

