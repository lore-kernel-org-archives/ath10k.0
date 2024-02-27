Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FC0C54798
	for <ath10k@archiver.kernel.org>; Tue, 27 Feb 2024 03:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFRCUoDiSjcwAOVG1YaWHUWRrAIfaro3M2rEHC4hU5c=; b=DA0TlkOO31UhU1CoePvpekJrKm
	jz50Xz+QY3ziDDA0oVnqqkbscLxEl1oCYL8zhinezOaZ1nEr0BKa0ow1KQ9HsAmdNsFNZwRK8Vqha
	LAr/En2t8H4t7J1C/S7nBSfPHytlrCfqL/NUPUjtDdzXy+VkZM0joUZgmxETgBL5MkMuC14nfkAWm
	l3n9pOXHtuXYUqin/XaHL21nub8j2lRAYi1DVcQXJ65bd/se10KU+PYmPdRiJVBGv0fEoTBolDDuC
	eYhRM70vF8ejexaEZbKmQcxb9m9on4h/04IYXkXU9nz5hslYAxF0A3jiRy1+rgMMSaO1QZa3KAXeJ
	mpFH6Pew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reoQ9-00000003dVN-0YhV;
	Tue, 27 Feb 2024 03:46:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reoQ6-00000003dT5-1HRi
	for ath10k@lists.infradead.org;
	Tue, 27 Feb 2024 03:46:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R3CCtX013851;
	Tue, 27 Feb 2024 03:46:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=iFRCUoDiSjcwAOVG1YaWHUWRrAIfaro3M2rEHC4hU5c=; b=pT
	dbxWmAmkUPsQJTsIofK3zOOWWUurC016Op7BbTZQmYQbf7bJUoyoTckpmQhZdeix
	7hh2MD4VSYxyGhrHyfUv+T/jxP5NmQqyxaTUOQHLrPbt7+f270vlJCjwE6gAhlYI
	WfJFLpcaOPzouwA3P3W3krCRPmBt1kjwrtQvzkzWDXgDLcCVIO7I5aGeNsamCqDQ
	Iu8e5Dr+HrMkIptXFWkiM23aNVctgpnqyXFv9vQ0rxLICOcB7PAO7/CY4b6tmpYY
	RILy+e50qNZp8+wap4qSdZRvqIfldTGMvn8wfpR8h7FtgmQ3HvgECpgwjkH3nGuy
	ZHQsbBZN3jIRDbkSu+HQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh6ws84m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 03:46:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R3kGYt001055
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 03:46:16 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 19:46:16 -0800
Message-ID: <e2b7a7d3-c318-41a3-81d0-c6a30ac5941d@quicinc.com>
Date: Mon, 26 Feb 2024 19:46:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: poll service ready message before
 failing
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240227030409.89702-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240227030409.89702-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YMVGaPuGpksqaJcBC84SpsKMv_F7LsEf
X-Proofpoint-GUID: YMVGaPuGpksqaJcBC84SpsKMv_F7LsEf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=739 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_194618_395050_CC87B50C 
X-CRM114-Status: UNSURE (   8.45  )
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

On 2/26/2024 7:04 PM, Baochen Qiang wrote:
> Currently host relies on CE interrupts to get notified that
> the service ready message is ready. This results in timeout
> issue if the interrupt is not fired, due to some unknown
> reasons. See below logs:
> 
> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not received
> ...
> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
> 
> And finally it causes WLAN interface bring up failure.
> 
> Change to give it one more chance here by polling CE rings,
> before failing directly.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> 
> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros 802.11ac CQA98xx devices")
> Reported-by: James Prestwood <prestwoj@gmail.com>
> Link: https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


