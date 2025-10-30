Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E4FCCF9F8
	for <ath10k@archiver.kernel.org>; Thu, 30 Oct 2025 18:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xWHiNaIEE+08+ile7793zP0fGrNugNlNBr/1sDtxkY=; b=1P/SHEVNKmiFTOzsCp2q763y6z
	IcyvNSnqlOqNkLLjWp4u4OCjtuDauzWJD/3hPssiThCTH1vj2zQ1mPAMaXhWL7lo+9oYaBhd9b30x
	BkrnVjCsf492d0fwQUSZ5WoYWQJ4JLxlvnat9QX+6vYMgLYwOHbTU3Q4QRAD0OpF0tCPqSJby4kvb
	XPtQFB6iHHvAzkfwC70qUSO7hYIjxaNLG6K3vZ37ZLnABVO5PH2laC05aGYKFlkhXVbYnwi+lVxl1
	RwkSoV120rHQBcAbb/4WkxhQViMr/Sm4tcccloRzYaWl6JvfqF6VH/3ZEyF4FNoN9iOw9vVY4ER76
	AzxxPC7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXLn-00000004bYE-1ooz;
	Thu, 30 Oct 2025 18:26:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXLk-00000004bXP-0lKK
	for ath10k@lists.infradead.org;
	Thu, 30 Oct 2025 18:26:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UAPL8F3281498;
	Thu, 30 Oct 2025 18:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xWHiNaIEE+08+ile7793zP0fGrNugNlNBr/1sDtxkY=; b=owKBOk/GBPnqK+lv
	1p6lFYmC4xOVcghd+zFADpnj6bznCXUjEkaaFpG6Nuchad/y3OS/zhhDc5XlX7r6
	9Dzxla+T7OR8EydrY0g3Tjsxn/zRXKdygxyG1UoTfb+pIcFXvlwTn1nBINmYJvJ9
	QGRILD2HR/8CF5gUXdxBOnci0Fl9AnPBtTX0W82zoGFqHc9Oj6JgfeXLrIUqynS5
	QRkE3eV6cnKBTJEr4SUYEImGtfsL2QzCeJ9Cq1Qdb6RwO9A50SMV41OR4OvH+QJH
	2RRObfVpqyTRB1RMwE7zBoaEHs5JwA+5DVxTKi8cS9dF8RqVX8PqR+RGVC7TYn5N
	VWVNUQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a468khbm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 18:26:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59UIQ9pB017010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 18:26:09 GMT
Received: from [10.216.41.35] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 30 Oct
 2025 11:26:06 -0700
Message-ID: <1c8af83c-ec93-94ef-e309-a911064507a9@quicinc.com>
Date: Thu, 30 Oct 2025 23:56:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/2] wifi: ath10k: clean up structure initialization
Content-Language: en-US
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, <jjohnson@kernel.org>
CC: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20251030130023.1836808-1-zhongqiu.han@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDE1MyBTYWx0ZWRfX61u1BOmVnHvo
 20iLOjiFIg7aLsN95sk88mgNpITimtaBfXNuN0l6yeVQjHQhPZd6NJzyGW/x7Iwt081KpieOC6z
 DOijUiBWy3Uuu48Tcn45pQ+7iUDfovr4G0AtkQWuX9MbfnFsHnRzw4zg8BJkFlcg6q+baQOcojT
 TE3MrRjfzr9Rr02gtjuDKUfv/sHJn/HIRdvzGx+QITJWKfFOxl1Kkri6tMxdaucbx4W2rwpe9qm
 6aEVhLmQluQq2j1k/yIiqg78FKdOmbY2CwGxLvn5ZrDUGC4U2Mwn6860wGSBLgzwH9D+DommssW
 lNDhq4OSo2+ZTQdYnvQFwDiH9MmfFzCqaIbEP1Gj87MUxW8wQ2IpeHgJ/+ms0TyE/HzDV6noyBO
 ZInSXvITk03QLv78DHsSUVgw93apRA==
X-Proofpoint-ORIG-GUID: XSSTaNJ7jtgbw70WtW1SYXw9ABuv9MOh
X-Authority-Analysis: v=2.4 cv=LoWfC3dc c=1 sm=1 tr=0 ts=6903adc2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=cMOJL1K5Z7ST7ju7w8YA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: XSSTaNJ7jtgbw70WtW1SYXw9ABuv9MOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_06,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_112616_354698_ACDDE408 
X-CRM114-Status: UNSURE (   9.66  )
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



On 10/30/2025 6:30 PM, Zhongqiu Han wrote:
> This patchset simplifies structure initialization in ath10k by replacing
> explicit memset() calls with zero initializers (`= {}`) for local
> variables.
> 
> Patch 1 updates the initialization of `pm_qos_request` in
> ath10k_download_fw().
> 
> Patch 2 updates the initialization of `bmi_target_info` in
> ath10k_core_probe_fw().
> 
> These changes improve code clarity and efficiency by avoiding unnecessary
> runtime memset calls.
> 
> Zhongqiu Han (2):
>    wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
>    wifi: ath10k: use = {} to initialize bmi_target_info instead of memset
> 
>   drivers/net/wireless/ath/ath10k/core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)

Branch name is missing, with that addressed

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

