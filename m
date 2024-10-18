Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998A4D3001B
	for <ath10k@archiver.kernel.org>; Fri, 18 Oct 2024 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X9yWHtce5E627XFATNma/BqkF4zKRZm72cz3DZRf6as=; b=YAEM2g0lxZ+UI9fvnr6kEDa+v/
	GyBoZvz0r/rPFpzSLqq5fb8UvKKxFiQ78LNU6mnpjBxqQ8f/p9PJX2Njb0Mb7qscPnH4Ql06NOwOS
	wY6bhq/IGUlP/haF5dmR3Y3LNBM+5jzD6r++jHscgVqx541ll59Psokk0NK1Hc/bx0cnSEguzoY0Q
	0HE1ssz+pOvv0rGdeEmHMWO3YwGGIo0iy+aKOeNDpXjZP0EosPnJ7evxe/OpJduhovnFdbpyE8NQC
	Il4VC+vTm3/HjgnBl+OxcPU9qffy3pbGJHlVvWycgw+NGgLTSm0zkM/e4brxlX6hA5yVCDmX3+SUP
	e/eG0APw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1pgw-00000001KUx-2gnj;
	Fri, 18 Oct 2024 16:19:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1pgu-00000001KU6-0IWy
	for ath10k@lists.infradead.org;
	Fri, 18 Oct 2024 16:19:05 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49IBapIE019324;
	Fri, 18 Oct 2024 16:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X9yWHtce5E627XFATNma/BqkF4zKRZm72cz3DZRf6as=; b=U3oTuCvqdP/zwIO9
	YkbF1eide7r77GED2LvFs9rC6Ab1LbgvvCGBX/j0N8Yz2Y3unJHbV3YlrkaO+I07
	ZfOW3gyi2uejK3pvxVSy0IKHLec9f2xfHy/NM8i4D+5c/RmCmYQshsAlaT3afpbc
	9viHPGbPpUF5f/D8jYdO+WAvyd1APU6ZNhTt71tvOK1fV49+c/bC4tuXivnUfixv
	wq26cM1IyH7cYaSJPDmz9Hz7S01qgJKcB1koTrXxK3WQv8Pni7RG/RjehSQgcOa1
	beBL/PPTEJrVs9st8SjKYOvgKWatqf3KTNHelEbSu2Q1hzJ5WDjuBvS1k0TY0iUE
	WVNuJQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42bexpa8jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 16:18:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49IGIwrs022059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 16:18:58 GMT
Received: from [10.216.12.9] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 18 Oct
 2024 09:18:55 -0700
Message-ID: <753a6661-9d52-93da-23a4-d33dab4a396b@quicinc.com>
Date: Fri, 18 Oct 2024 21:48:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Content-Language: en-US
To: Remi Pommarel <repk@triplefau.lt>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Cedric
 Veilleux <veilleux.cedric@gmail.com>
References: <cover.1728741827.git.repk@triplefau.lt>
 <3baf9565d72291a0b730d9a53fc1ee9610dcc91f.1728741827.git.repk@triplefau.lt>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <3baf9565d72291a0b730d9a53fc1ee9610dcc91f.1728741827.git.repk@triplefau.lt>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z1Zm4QQINbQxOO4v76qhrGdKTnXXEbSa
X-Proofpoint-ORIG-GUID: z1Zm4QQINbQxOO4v76qhrGdKTnXXEbSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_091904_153379_D6A9121D 
X-CRM114-Status: GOOD (  17.37  )
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



On 10/12/2024 7:43 PM, Remi Pommarel wrote:
> The ieee80211 flush callback can be called to flush only part of all hw
> queues. The ath10k's flush callback implementation (i.e. ath10k_flush())
> was waiting for all pending frames of all queues to be flushed ignoring
> the queue parameter. Because only the queues to be flushed are stopped
> by mac80211, skb can still be queued to other queues meanwhile. Thus
> ath10k_flush() could fail (and wait 5sec holding ar->conf lock) even if
> the requested queues are flushed correctly.
> 
> A way to reproduce the issue is to use two different APs because
> each vdev has its own hw queue in ath10k. Connect STA0 to AP0 and STA1
> to AP1. Then generate traffic from AP0 to STA0 and kill STA0 without
> clean disassociation frame (e.g. unplug power cable, reboot -f, ...).
> Now if we were to flush AP1's queue, ath10k_flush() would fail (and
> effectively block 5 seconds with ar->conf or even wiphy's lock held)
> with the following warning:
> 
>   ath10k_pci 0000:01:00.0: failed to flush transmit queue (skip 0 ar-state 2): 0
> 
> Wait only for pending frames of the requested queues to be flushed in
> ath10k_flush() to avoid that long blocking.
> 
> Reported-by: Cedric Veilleux <veilleux.cedric@gmail.com>
> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>   drivers/net/wireless/ath/ath10k/htt.h    |  7 +++--
>   drivers/net/wireless/ath/ath10k/htt_tx.c | 18 ++++++++++---
>   drivers/net/wireless/ath/ath10k/mac.c    | 33 +++++++++++++++++-------
>   drivers/net/wireless/ath/ath10k/txrx.c   |  2 +-
>   4 files changed, 44 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index d150f9330941..33054fc4d9fb 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -1870,6 +1870,7 @@ struct ath10k_htt {
>   	spinlock_t tx_lock;
>   	int max_num_pending_tx;
>   	int num_pending_tx;
> +	int pending_per_queue[IEEE80211_MAX_QUEUES];

Something like num_pending_per_queue[] to align with the existing
packet counter looks better?

Vasanth

