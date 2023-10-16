Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488B9CDB465
	for <ath10k@archiver.kernel.org>; Mon, 16 Oct 2023 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+nlX9dNKkcKM1YFuRD4OsJYEpt6I4WS6cJQUXIdtE0=; b=TZUBPZ7y7kUpf3
	Lx7QTLwLUJtR0ZdsKP/Bwaf/AEZIUCNA6LexEzaJ8AkDQ5MzTc8/g6ps087bsgtmEEbopAyz9FLuO
	NHxPVVAw+hCXtxO9jq4YPqARTdLmN2d7L7onhkSaUdhRUU9mEFkdao1INa4wlR817TVATUkYdPGTL
	GdZyUmQ4KGCZjfiJY8399jS1xAnz3edN/QvKC+LehN5TPsKemdmPPpRnjPciQnuUZrcEex+uIfQM1
	MR3s3sZKFXaEzmSoADP3HPBJ7sIvs9vE9o+lvcuNiYpOSL8QejIyFvBcQEKJ09UM8BGIkh25zWd7r
	Z25EH/MRjuGuQTLBLNcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQer-00A9sc-2r;
	Mon, 16 Oct 2023 16:41:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsQep-00A9s3-16
	for ath10k@lists.infradead.org;
	Mon, 16 Oct 2023 16:41:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39GGX4xj002792;
	Mon, 16 Oct 2023 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iUkNAEhmQcRALEI8TK0LzZjyN4+TVeYxiZy0KPk2Wh0=;
 b=H8xjBa8gHPauBSHWpWfvEIU01ujnLO3WL4xP5uAL6ijCyPDbcv2YOz4I/uC5q7b5uNEW
 /6Y7mWkblfrIDEolYQZWspyysgirYHx2kAncWwE/o41NcfLtCUhu0mxzdl9YbUMHPr4+
 ak9kOEdxyNKXyITjJPtLjvPFK5Kf5d0rNLu7d8zpRlPUsENIKyjgXT9LOYYOfxBh6JPq
 aLBjkuyfK3oCjUaKFhfTw72NHmlAtbN5CWV3GeTY2f1kMaEGz8021AFEAqycc/HVJ2tm
 oWPs5myX5ocj9VkpNJg+wlClOmrAa70KoWSTY1XwXNQP963bwoRTp7Y+gK2wW9fB9kZF uQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tqm9f4mmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 16:41:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39GGfJP2030527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 16:41:19 GMT
Received: from [10.48.240.22] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 16 Oct
 2023 09:41:18 -0700
Message-ID: <cabb874c-7518-4565-a007-f466f1b69165@quicinc.com>
Date: Mon, 16 Oct 2023 09:41:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ath10k: mac: enable
 WIPHY_FLAG_CHANNEL_CHANGE_ON_BEACON on ath10k
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Abhishek Kumar <kuabhs@chromium.org>
CC: <johannes.berg@intel.com>, <linux-kernel@vger.kernel.org>,
        <netdev@vger.kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230629035254.2.I23c5e51afcc6173299bb2806c8c38364ad15dd63@changeid>
 <169634426707.121370.9448850980134728319.kvalo@kernel.org>
 <87il793hmi.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87il793hmi.fsf@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j9hu2thAUudPAJfKw7Dq_SsN7Z2POx0C
X-Proofpoint-ORIG-GUID: j9hu2thAUudPAJfKw7Dq_SsN7Z2POx0C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_10,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1011 bulkscore=0 mlxlogscore=738
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310160145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_094131_391749_26341379 
X-CRM114-Status: GOOD (  19.36  )
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

On 10/13/2023 10:20 PM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
> 
>> Abhishek Kumar <kuabhs@chromium.org> wrote:
>>
>>> Enabling this flag, ensures that reg_call_notifier is called
>>> on beacon hints from handle_reg_beacon in cfg80211. This call
>>> propagates the channel property changes to ath10k driver, thus
>>> changing the channel property from passive scan to active scan
>>> based on beacon hints.
>>> Once the channels are rightly changed from passive to active,the
>>> connection to hidden SSID does not fail.
>>>
>>> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
>>
>> There's no Tested-on tag, on which hardware/firmware did you test this?
>>
>> This flag is now enabled on ALL ath10k supported hardware: SNOC, PCI, SDIO and
>> maybe soon USB. I'm just wondering can we trust that this doesn't break
>> anything.
> 
> Jeff, what are your thoughts on this? I'm worried how different ath10k
> firmwares can be and if this breaks something.
> 

Since the 1/2 patch is already in pull-request: wireless-next-2023-10-06 
I went through the logic of that again. It would have been nice if that 
actually described how it fixes the problem. What actually causes a 
channel to change from passive to active?

Note the existing logic prior to the 1/2 patch already updates the wiphy 
and userspace with the updated channel flags, so it seems reasonable to 
also update the driver

However, this led me down the rabbit hole of trying to figure out what 
happens if a beacon hint causes us to change a channel from passive to 
active, but then that AP goes away. What, if anything, causes the 
channel to revert back to passive? I'm not immediately seeing that logic 
anywhere.

My concern is that we have an AP with a hidden SSID on a DFS channel, 
and as a result of a beacon hint we switch that channel to active scan. 
But then later that AP detects radar and vacates the channel. Then we 
potentially have stations doing active scan on a DFS channel with an 
active radar.

Hopefully this is all handled, and it just isn't obvious in my 
admittedly very quick 10 minute scan of the code.

And as far as the 2/2 patch, note this logic is all dependent upon 
reg_is_world_roaming(wiphy) returning true, so ath10k impact would 
really depend upon the board regulatory settings, whether configured for 
a fixed regulatory domain/country code or configured for world roaming.

/jeff



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
