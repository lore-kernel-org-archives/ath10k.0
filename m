Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12DCC0219B
	for <ath10k@archiver.kernel.org>; Tue, 11 Feb 2025 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIEDIdgIfhT4K1gwlpf3dzud8jN9DGP5PpGiNr3++Lc=; b=r+ACeiX/HtOtEgk/oHh6epW/K8
	ipWnQ7PwEIGbH2oFLBtamXnEja87vakx6RozwHfQqrFI8kT2cxRZeRKkwCkkRXfx70bzTQBNOYYuh
	9p2Yw8iEp8s1Pi2Bs38qC1w39H802yyqAFZoQx8oRurXq3zjL12otb8V1YRSuRtmt0P7czxyHD5s6
	Lyvfhvpqw7ZJzf7119NTCMDeheTBfOA4JDn0NrtOb2q3bJmJ2R+26jHhUyXjLzSCHTQTVZ99kpDnc
	zE5n/IZvQap5I9hZZgdTiU+8yOn1PI1m4M+lreUdt+lv62L3PPziOHUK9MroshiZ+XG0XSqbmWKkG
	QIxJWkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thvTC-00000004w1Y-3YTf;
	Tue, 11 Feb 2025 18:58:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thvRy-00000004voJ-2uRj
	for ath10k@lists.infradead.org;
	Tue, 11 Feb 2025 18:57:40 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BDcnjL010521;
	Tue, 11 Feb 2025 18:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIEDIdgIfhT4K1gwlpf3dzud8jN9DGP5PpGiNr3++Lc=; b=eqZylgmfia04Vqgu
	wXmHElaCFavwl1dcSUH/55WXoLGDV6G/5+A3hLo/OMvKBfzPWmWrW9DeJxNp1r+X
	6gqAmxq25zD7i6USpbWviZ5Kb4Y78Q08pvCVZ2xjAXpikIBVZaFWLHuJPttRyA/9
	5BZ/QSCYA0m5QxdR4jf6UcR53rUsp6RvoeWBkq1KNesnlHAlB9Wh4OtvSEuNtHGo
	gasjUTQIxZAokb5wHZG5jqq+f3REnwsDFfEimciWPz/8DceK0gPcsspVQXSgjZis
	E+xbCAdYXISFJPSr+Jqk5Y7TqaNwAMetRvA14nxfI3BnJoATBfT6dkJ5tpILG7HA
	47O2bA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs5degs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 18:57:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BIvQVh010906
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 18:57:26 GMT
Received: from [10.111.176.46] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 10:57:25 -0800
Message-ID: <4ac25dfb-ab59-4909-a717-41a6e752295d@quicinc.com>
Date: Tue, 11 Feb 2025 10:57:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath10k: add support for QCA9379 hw1.0 SDIO
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Felix Kaechele <felix@kaechele.ca>, <ath10k@lists.infradead.org>,
        Kalle
 Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240908013244.496382-1-felix@kaechele.ca>
 <20240908013244.496382-3-felix@kaechele.ca>
 <c1385aa1-0d41-4ed7-a00c-e40c69bafeaa@kaechele.ca>
 <06bf90a5-db29-46b4-b983-439c2b32b143@quicinc.com>
Content-Language: en-US
In-Reply-To: <06bf90a5-db29-46b4-b983-439c2b32b143@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gzK_jaDptFkKWVuOMi1kJpgVSw2PYG4I
X-Proofpoint-GUID: gzK_jaDptFkKWVuOMi1kJpgVSw2PYG4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=907 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_105738_871132_BF7DF561 
X-CRM114-Status: GOOD (  12.05  )
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

On 11/5/2024 8:21 AM, Jeff Johnson wrote:
> On 11/5/2024 7:39 AM, Felix Kaechele wrote:
>> Gentle ping on this one.
>>
>> It still applies cleanly against the ath/master branch as of today.
>>
>> If there's no chance of this going in please let me know and I'll stop 
>> re-sending this patch.
>>
>> I understand that bandwidth for ath10k related requests is minimal these 
>> days and there may not be an interest in fixing what are possibly 
>> firmware related issues for this rather obscure IoT/Automotive (SDIO, no 
>> less!) chipset.
>> I unfortunately don't have the information, documentation and latest 
>> firmware images available on my side to help with this either.
>> I am, however, always willing to work with someone on fixing any of the 
>> outstanding issues.
>>
>> Thanks!
>> Felix
> 
> Kalle has this in his 'deferred' queue in patchwork which means it's still on
> his radar, but low priority.
> 
> https://patchwork.kernel.org/project/linux-wireless/list/?series=888058&state=*

Now that Kalle has stepped down, I've inherited this series.

I have one question: what firmware & board file does this use?

It seems strange to enable the driver unless there is also firmware and a
board file in linux-firmware.

/jeff

