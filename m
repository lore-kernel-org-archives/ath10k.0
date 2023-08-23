Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49237EE49A0
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 14:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qESEv/Egb5zy6av6jblNB790f+XUZsxy4k+mizge9Yo=; b=bUNdErX1pMbPIe
	ExJPwRk8Aiqswab61kL9QqMcgX1dAC4Tbu4tvC+8sCwHj5c4DUtrBE/cFfE6hEFe6Z/A+Y7Snta4C
	V2ZQtCOVOapYBNHZBVPUDGlA08njj+kbwvME7C65VWRIGKGpapzdK61YRQks3EGfEzkkxYSQxHTg/
	/nYCvE51Bqvwx0oz0qLu3JZkrax7d5a0s8/DHXqJxW32DSL3Q7J1qDnRpmXvyDqmZXmPbyzQsfIKl
	3nicbpyiT+9gVPFSaB+lZcdPLEcQsLJVGlt7Xf580Cwmjw+j0X2VVmzEPXLddDYbhhL55iWntycDy
	3Zt8Ljm6pqKTgmnQBbhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpH0-000tK6-08;
	Wed, 23 Aug 2023 14:55:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYpGx-000tJW-1w
	for ath10k@lists.infradead.org;
	Wed, 23 Aug 2023 14:55:53 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37NDcscW021557;
	Wed, 23 Aug 2023 14:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xj+9H0Pout0av8cr2td961SGpRjJwif2tqmpo3jlnsE=;
 b=ERDVu/baZCPfOy04lz4Yt17ilxcgOXrdc3q+Q/b8sLyx8gftqeHsmKGbSfECzh29vPya
 xNV2PcOBxYb741DIPp2qvzTtLqTpf9XaaxytgCFiCsRC4Kj3PfY3Uzpc3kD7XlBSJwWi
 XDcLfcgTYh05QlbDqQ1sOHVSJOlbW9AYg5XWjfvcqTF+ndaROQ0lWyq8MKuJGGphASjc
 lCWXhwpPMkV8OcSBWR3vulju6F20vA+aRkySVm0sc7gs/r/eX1JzSLdWNGniMdJJSdf7
 8D0ryF1SFeV8Fyv73XoqHlp56/+WwesjzTYxGs0aMpt7FuriTKgq/EVouIJZw6mARoqz bw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn26sjcp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:55:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37NEthm1021285
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 14:55:43 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 07:55:42 -0700
Message-ID: <4776171a-9356-4082-89b4-6f7543578484@quicinc.com>
Date: Wed, 23 Aug 2023 07:55:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] [v2] wifi: ath10k: simplify ath10k_peer_assoc_h_vht()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>,
        <lvc-project@linuxtesting.org>, <ath10k@lists.infradead.org>
References: <20230823095008.50515-1-dmantipov@yandex.ru>
 <20230823095008.50515-2-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230823095008.50515-2-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KwxhdDOBQVKOee3EVJfqk22BM3v1A-31
X-Proofpoint-GUID: KwxhdDOBQVKOee3EVJfqk22BM3v1A-31
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_09,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=484 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_075551_641290_B11E0991 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 8/23/2023 2:50 AM, Dmitry Antipov wrote:
> Commit 3db24065c2c8 ("ath10k: enable VHT160 and VHT80+80 modes")
> introduces 'get_160mhz_nss_from_maxrate()' which never returns 0,
> which means that 'ath10k_peer_assoc_h_vht()' may be simplified.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
