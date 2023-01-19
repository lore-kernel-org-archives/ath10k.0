Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87666C38159
	for <ath10k@archiver.kernel.org>; Thu, 19 Jan 2023 02:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K6siJ5L4qSkZK2tf8hTI+z1eD2KrZWQlCWJQ6rpYRPo=; b=qLRXaRINq/Zio3
	BOpahbJUgdL5iJcbkbtx+If+93rbOs2VWzCb5uWsYFvBGs7sqrntU7l0bpG6yw4I6mdKSVwZrN7ZP
	4MeHU9IzjEjqIcKJcscYFxIKjUR5CGWJTbQ3z5yRzBJ+2EmN7OWHuaDQJi6OsC0J1TrVDD/wQRV/c
	5RoMVwOwvAmWOw+i99Xs4W7ChhhqonoTvqh7stqf0T9vhySaRsLWU4UvkwhSSVu46k/7sSmzqYMxe
	4sROm1zrMGc+HM7ma02yljX0GeMzPVOIVHt9lYOe+v4qDn0gwfykttKBTLYOyhiLvJ7K1py2DzL1I
	tRfAV7wmns8nsxcoZQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIKda-003DA4-My; Thu, 19 Jan 2023 02:26:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIKdX-003D9S-Lp
	for ath10k@lists.infradead.org; Thu, 19 Jan 2023 02:26:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30J1XYNn030513;
	Thu, 19 Jan 2023 02:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VDBgZocVNIvdFGamlrSv0BYmZJ4ngYG+mkW6MKSc6ko=;
 b=Dfp3uLyL44ICmW7/lbNe7UieOTk3xkymZr/HMOiighaViLB234Y9F+VugF0/ggQaMOJr
 u1gAxnaOrJ96itOp3DzRMDUSPhW+8/w76wFlcV7EAWig1iumAoAyXLUS0JaedsKAZ+o7
 B/azYP3fkPS6+uS1ly4J8zn6AbPM1zS3wwx09YRu1f9eQYxsRVLezE0JCQ9eyHdw6G7R
 UQCL3Dr/R/KJUkpidTRGiQ4SYZiXBnyFAvZW/h2cXQEDkuAG28vcgx/O7X6NAmOYA42H
 LVXfnAV2olmyqfrki65OdRhiwFax7ZZM7z77kj3WYQNCIABymaRSTZgtLdTNdhPNZq8d aA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n69dpjcgj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 02:26:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30J2QeDu027072
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jan 2023 02:26:40 GMT
Received: from [10.253.35.168] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 18 Jan
 2023 18:26:38 -0800
Message-ID: <17047ffb-9c68-8339-a339-c51a2e721083@quicinc.com>
Date: Thu, 19 Jan 2023 10:26:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] wifi: ath10k: update the channel list if change in
 channel flags.
Content-Language: en-US
To: Youghandhar Chintala <quic_youghand@quicinc.com>,
        <ath10k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>
References: <20221222124221.30894-1-quic_youghand@quicinc.com>
 <20221222124221.30894-3-quic_youghand@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <20221222124221.30894-3-quic_youghand@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6si183OF6smCH7z2XMhkPHL7EJ2wpbXz
X-Proofpoint-ORIG-GUID: 6si183OF6smCH7z2XMhkPHL7EJ2wpbXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301190013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_182643_768380_47469398 
X-CRM114-Status: GOOD (  10.85  )
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

On 12/22/2022 8:42 PM, Youghandhar Chintala wrote:
...
>   
> +static void ath10k_mac_beacon_notifier(struct wiphy *wiphy)
> +{
> +	struct ieee80211_hw *hw = wiphy_to_ieee80211_hw(wiphy);
> +	struct ath10k *ar = hw->priv;
> +
> +	if (ath10k_update_channel_list(ar))
> +		ath10k_warn(ar, "failed to update channel list\n");
> +}
> +

Will this called while scan is running?
On ath11k, if send channel list to firmware, then the running scan will 
be cancel and removed.
I guess this is same for ath10k.

> ...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
