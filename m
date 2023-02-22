Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E99FC636D7
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 00:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZqSq5kK3+2ivi1k0By0M7ijlsNtIt40RzAl6DHXDt2k=; b=nbeTZ9wAwqOlr6
	EYb0MjMcOQ6zZcbSSLvZ1CWael88T8pcROznUqJItwdlwNWDuaJij/DbZSmNQgUKLWz8yrb6r6spm
	0vI3HFwRZGxEqNTMyJay2YvI4BpA4zogtcdRe6WdvncwFK+5qx1hum42FrH6pn/pT3HpN8oC9t9Ox
	B+LkX+sySE+/MNnDCSXuspNpykh5GsKZWsR0+TLGwi8bsPlGrZo5Dq0pgs11szQ+BdpPZnNI88OKE
	beSUNeMBBK5dYoE07ysRm03JpKEm/sy2li8SJQ+YOOpc8PlzoQYn5W1OjrbHaXYv9T9jUPyfJds/O
	61nrddswVSWClx7m/jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUcuS-00ADp4-F5; Wed, 22 Feb 2023 00:23:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUcuN-00ADnr-55
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 00:22:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LNkrE9023676;
	Wed, 22 Feb 2023 00:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GSqS92vIwQB799pi53rSrb1ngxfts/lxtA22QEfZ/Rk=;
 b=JLsEKJGAh/bi28x0DMUuK19FWhmJSNgj06XHZZm1i9Vyl4BY4eHXvq3RpgkFuf0EdYhn
 sDkN3FuokqzEsvtHnXiM3bbnl5rbUhOSLkghTmeUwy3OBkZT629FZkYYqMQNyaZARDGF
 Si/yy1sQZyMMyKtFqwvNQaIdC9C6gQKiXXhYf/4nNxaaxIi0j2RwBXibMufAcq+gqN6+
 4cvLLkGGUCKqKnflJ/yS5tmSyuL0q5gGiFFuuhm9s99H7UVKyMwLX43670SXu5VxOZGM
 wS2Aj6pb9pAflGKnj7qMjfMrx9kuyP2noxbTMVC0T9lfov8mWmkWkXguhq5qnx9VFmkG fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvtbxa4we-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 00:22:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31M0Ml52023334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 00:22:47 GMT
Received: from [10.253.74.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 21 Feb
 2023 16:22:45 -0800
Message-ID: <9ae693f2-b19e-ff1f-851c-c3d09db4d9d1@quicinc.com>
Date: Wed, 22 Feb 2023 08:22:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 1/2] wifi: cfg80211: Add beacon hint notifier support
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        "Youghandhar Chintala (Temp)"
	<quic_youghand@quicinc.com>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
 <20221222124221.30894-2-quic_youghand@quicinc.com>
 <1df59863e78e8ddbe7eb3a74e6dd4c8f0bd7f098.camel@sipsolutions.net>
 <96cab5d9-9090-4cb2-ff17-eadc9da12f50@quicinc.com>
 <0d4b99ab0a5bedc82f35bc1e548a611564b010e5.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <0d4b99ab0a5bedc82f35bc1e548a611564b010e5.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dvi9KBhRlHTNhdqvYm6bry6T-3irrzVO
X-Proofpoint-ORIG-GUID: Dvi9KBhRlHTNhdqvYm6bry6T-3irrzVO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_13,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1011 mlxscore=0 spamscore=0
 phishscore=0 mlxlogscore=764 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_162255_421427_0BCF1C8E 
X-CRM114-Status: GOOD (  10.74  )
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


On 2/15/2023 11:10 PM, Johannes Berg wrote:
>>> Why is this even needed? You should always get reg_notifier after this
>>> anyway?
>> Currently when channel flag changed through the beacon hints are not
>> informed to driver.
>>
>> reg_notifier will be triggered for regdomain changes but not for channel flag changes due to beacon hints.
>>
> So maybe triggering reg notifier once would be sufficient, a la Wen's
> patch that I recently merged?

My patch only take effect for this flag, not for all wiphy.

if (wiphy->flags & WIPHY_FLAG_NOTIFY_REGDOM_BY_DRIVER)

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit?id=d99975c4953eb79e389d4630e848435c700e2dfc

>
> johannes
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
