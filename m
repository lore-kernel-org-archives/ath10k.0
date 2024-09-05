Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF0ECE7A81
	for <ath10k@archiver.kernel.org>; Thu,  5 Sep 2024 18:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXlTRihCCSqgPxuwcgPJYJ5eZgx3zxOwIMa6hYSFGC4=; b=ihIRNLUp3sAExxUi+oPXTJgBSR
	hvhnSW4S3J9JdYi9J9EKOk02a6XeHWIQfliKpFOYfQ4ypX/rrydCrDnJKU76KQwLAkhVjk1tgdaHk
	FDUDvXkIIbanQHjwogfllP4OamlrtcKb/CHYWiGH9EYFo+FlEgFufAKIuN7yOCiFEPifyls/sdi9h
	2A4Bi/Jqx3coYoj7F1cBhDYkrd7jVfQdMNUyTeawIk308y2z5e+sKPAoFR3w7LYF1OAMBMuqtLMr4
	KUITlFMSG5+x/HtJfokiiY6Mi249n8v9zjwqvpOlgLCurnTBj7QXkUWmxq6A7yI7zgzWI/mscRpWS
	WAjr+ivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHSk-00000009U5I-0QGd;
	Thu, 05 Sep 2024 18:44:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHSB-00000009U08-0H1G
	for ath10k@lists.infradead.org;
	Thu, 05 Sep 2024 18:43:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ5Gb028369;
	Thu, 5 Sep 2024 18:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xXlTRihCCSqgPxuwcgPJYJ5eZgx3zxOwIMa6hYSFGC4=; b=LcDGCrHphfIVY2ma
	pgxA8R1tQI60+4XEEcGJOQlaYY1MEpO3/XXWMhErxAqgOVFsCX6/hyQhHWAVrw5t
	OFLLl3zN24sk8zKVfRBsOA0vvqtjEF4i0QOjNdA9SFyyi2cFOOEcGgDBsyOHWsIl
	uddaqXGe8V1+uNm+uNFSmBBIBmM2piPoWFz1+sX9ltejDGUNZ5mF4gVJgK9BGQvd
	r1dCFiZpba7izwKjPendYsT/9F/FYU+6FVDabSeayix4/oUr/BZx6eqduxt3+STG
	bnQ10Xtdc2Zz2pzOb5on0rCE0HYvSwtHMyDgtWO9OMOpz3fmDSeZi4JBSy2a1taK
	kUAQDw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhwu016e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 18:43:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485IhVgt017714
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 18:43:31 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Sep 2024
 11:43:30 -0700
Message-ID: <6a01ed79-0061-463b-a858-8b955c0a9370@quicinc.com>
Date: Thu, 5 Sep 2024 11:43:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aghexAE6FCd_MiZic4PLyJFxQ4FXCDIk
X-Proofpoint-GUID: aghexAE6FCd_MiZic4PLyJFxQ4FXCDIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_13,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=531 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_114335_245382_EF39E70C 
X-CRM114-Status: UNSURE (   6.49  )
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

On 9/5/2024 5:03 AM, Tomas Paukrt wrote:
> Add hw_params for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


