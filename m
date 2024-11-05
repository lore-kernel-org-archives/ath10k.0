Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D43CD31765
	for <ath10k@archiver.kernel.org>; Tue,  5 Nov 2024 17:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM5XAn49qqEcxbv18WcxzMxxWzjJEqXkvrMV5HImGEw=; b=AtyIPexi58LWNbLz179SFFmQO/
	M5xUIAQG6FodsCDysKnw/ZQsE0eEku8XKOxPOMLk5BQVQjGw7iIgaCJffhpzDSRZSVJrgKes4k/Th
	yL/avmDTpot+6/V8DxhUvHE+Fa/LRjwS7SYxYn/mTRQwbMk4XFZKK13WCHfz/EO0ZucfoJ8gIlQQs
	ylR6nPK9Ua1DgTprBF6d/glRxhB4d/i7HyBukGOW6wVAwsxemQgBgOvmJG9yrWa9q4AvLCfas0qVv
	MNUsaSnzhO8GeWpmaSEBn1WcyjbttgcuRMdTaopAnCzTFSsJEqAMU3V5/KLmr9ZMqlw0+1DVjDP8U
	pCXuJTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Mw8-000000008qI-2FTw;
	Tue, 05 Nov 2024 17:01:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8MJd-000000001cC-2YmO
	for ath10k@lists.infradead.org;
	Tue, 05 Nov 2024 16:22:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57uhZV003812;
	Tue, 5 Nov 2024 16:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lM5XAn49qqEcxbv18WcxzMxxWzjJEqXkvrMV5HImGEw=; b=WfCgrUbPbUaRn4/4
	11zsl8lj6C8jlMUsiqiVwn2mN3nkSbrOIAG7AY5GjmSKp6cDN+fGPlL++483SmLb
	fF5bJlexSbDVFcE14OFBtXnGS89dCn/jH/Lw0U4ciXcZHujca8p0MCbCqVjLlnSa
	pmUWwCwpqLA9UlE4rIEsj3esw0Um0u8/10qm1kRmxqWgYRmvGYwUQGPtZX0pbkly
	kPpXC9QcQrZnvAq3NKfvjipWded2A7pKaTyJWMbA0vaeT6tEu7vR5HACR6tbN0UW
	ZwirCC5dDPgJQC7+JGzit0t6+U8HiiN0Wm90uGbYKr+bqlQ4fnTK6C72r8Nl/f+N
	5UjH7Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx1env-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 16:21:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5GLhS6004749
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 16:21:43 GMT
Received: from [10.48.242.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 08:21:43 -0800
Message-ID: <06bf90a5-db29-46b4-b983-439c2b32b143@quicinc.com>
Date: Tue, 5 Nov 2024 08:21:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath10k: add support for QCA9379 hw1.0 SDIO
To: Felix Kaechele <felix@kaechele.ca>, <ath10k@lists.infradead.org>,
        Kalle
 Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240908013244.496382-1-felix@kaechele.ca>
 <20240908013244.496382-3-felix@kaechele.ca>
 <c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qBlgNPive5_8K0ijYrftMOa1xhRdKigy
X-Proofpoint-ORIG-GUID: qBlgNPive5_8K0ijYrftMOa1xhRdKigy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=690
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_082201_706535_541CD041 
X-CRM114-Status: GOOD (  12.83  )
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

On 11/5/2024 7:39 AM, Felix Kaechele wrote:
> Gentle ping on this one.
> 
> It still applies cleanly against the ath/master branch as of today.
> 
> If there's no chance of this going in please let me know and I'll stop 
> re-sending this patch.
> 
> I understand that bandwidth for ath10k related requests is minimal these 
> days and there may not be an interest in fixing what are possibly 
> firmware related issues for this rather obscure IoT/Automotive (SDIO, no 
> less!) chipset.
> I unfortunately don't have the information, documentation and latest 
> firmware images available on my side to help with this either.
> I am, however, always willing to work with someone on fixing any of the 
> outstanding issues.
> 
> Thanks!
> Felix

Kalle has this in his 'deferred' queue in patchwork which means it's still on
his radar, but low priority.

https://patchwork.kernel.org/project/linux-wireless/list/?series=888058&state=*

