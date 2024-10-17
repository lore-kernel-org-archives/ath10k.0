Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A272D3C536
	for <ath10k@archiver.kernel.org>; Thu, 17 Oct 2024 21:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgzWX3lAJO0pVbrTuiSnbfV5gKwhO6QNNnkK08goo8M=; b=uD91oaMqmNc3qxbuXsNFdIBPpo
	S55hAyXEX9Yi27NKre2VtMnt9QXgS4FSqWa/mvciNP16ocxkpNf0lJV3QGzymUn818aiy8NWUWnsa
	RuQC4gAOrgDcuyp8aXWH3MjBLP/S8GxK7lSKDUa3Gtz4TdrFQ0y/z6H3GymR89OJph63pq/J8sqV7
	C5L0tQpNuevYqDsQ2CH2rQMrK3fxAzBDZ7OIyrj7/5byLcteErj4vr8wJxOjlCC6Uz6+HlNP1zzWl
	gdZgu0dWBbq9mAJHRSNUx0REmBSlsOW7fVYvCU+mMd5CXr6hCV4djXJd9ImT0e/zF3EC0RcpEYSVm
	MqK3l6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Y5O-0000000GF2t-2aSO;
	Thu, 17 Oct 2024 21:31:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Xuc-0000000GDf6-3H2y
	for ath10k@lists.infradead.org;
	Thu, 17 Oct 2024 21:20:07 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HHTlRT007469;
	Thu, 17 Oct 2024 21:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgzWX3lAJO0pVbrTuiSnbfV5gKwhO6QNNnkK08goo8M=; b=YFZB84d2v1qH1Htw
	UfF+QgMeupdYNanXSchPKN/+jYPWEv9j5xX0Om5xL5cGvYEE8FvBviMKaOf/+krD
	hACPydno1tVAb4IDeV0mrKRTgLb/TdLiN1On5vfPg4ZDPvWU1s5cuf+ojkRuayZU
	XDOLZ3h3K5KZ5sLXRIaO+DadMLk+/UWMeN7T4dSXlxGeDY+2x9fsKpqlIJl+lMsP
	dPNBxoDaHDNVVxyJrOGN6vOzWUp1adR+eU382w/zLPlnkl+laVZVfN0xEidK8tfa
	Xo8Icx1r3mw62vk9n/yDLq0WtJxtVr/RwGdVSCblRgdiXViC4YmMEB8PwecV0dmN
	tqWd3A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy9m4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 21:19:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HLJr4u032130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 21:19:53 GMT
Received: from [10.48.241.64] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 14:19:53 -0700
Message-ID: <f9422f76-4a9f-4b37-8a4e-271b1344668d@quicinc.com>
Date: Thu, 17 Oct 2024 14:19:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath10k: Implement ieee80211 flush_sta callback
To: Remi Pommarel <repk@triplefau.lt>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Cedric
 Veilleux <veilleux.cedric@gmail.com>
References: <cover.1728741827.git.repk@triplefau.lt>
 <481540132c62b16f6d823b7556c11a0ce68f5c58.1728741827.git.repk@triplefau.lt>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <481540132c62b16f6d823b7556c11a0ce68f5c58.1728741827.git.repk@triplefau.lt>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uD8FZ6wu9gkNiwA243Mig7dqLpYywc32
X-Proofpoint-ORIG-GUID: uD8FZ6wu9gkNiwA243Mig7dqLpYywc32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_142002_981782_21B68233 
X-CRM114-Status: GOOD (  20.42  )
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

On 10/12/2024 7:13 AM, Remi Pommarel wrote:
> When a STA reassociates, mac80211's _sta_info_move_state() waits for all
> pending frame to be flushed before removing the key (so that no frame
> get sent unencrypted after key removable [0]). When a driver does not
> implement the flush_sta callback, ieee80211_flush_queues() is called
> instead which effectively stops the whole queue until it is completely
> drained.
> 
> The ath10k driver configure all STAs of one vdev to share the same
> queue. So when flushing one STA this is the whole vdev queue that is
> blocked until completely drained causing Tx to other STA to also stall
> this whole time.
> 
> One easy way to reproduce the issue is to connect two STAs (STA0 and
> STA1) to an ath10k AP. While Generating a bunch of traffic from AP to
> STA0 (e.g. fping -l -p 20 <STA0-IP>) disconnect STA0 from AP without
> clean disassociation (e.g. remove power, reboot -f). Then as soon as
> STA0 is effectively disconnected from AP (either after inactivity
> timeout or forced with iw dev AP station del STA0), its queues get
> flushed using ieee80211_flush_queues(). This causes STA1 to suffer a
> connectivity stall for about 5 seconds (see ATH10K_FLUSH_TIMEOUT_HZ).
> 
> Implement a flush_sta callback in ath10k to wait only for a specific
> STA pending frames to be drained (without stopping the whole HW queue)
> to fix that.
> 
> [0]: commit 0b75a1b1e42e ("wifi: mac80211: flush queues on STA removal")
> 
> Reported-by: Cedric Veilleux <veilleux.cedric@gmail.com>

checkpatch.pl reports:
WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report

> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
>  drivers/net/wireless/ath/ath10k/core.h   |  4 +++
>  drivers/net/wireless/ath/ath10k/htt.h    |  4 +++
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 32 ++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/mac.c    | 43 +++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath10k/txrx.c   |  3 ++
>  5 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 446dca74f06a..4709e4887efc 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -558,6 +558,10 @@ struct ath10k_sta {
>  	u8 rate_ctrl[ATH10K_TID_MAX];
>  	u32 rate_code[ATH10K_TID_MAX];
>  	int rtscts[ATH10K_TID_MAX];
> +	/* protects num_fw_queued */
> +	spinlock_t sta_tx_lock;
> +	wait_queue_head_t empty_tx_wq;
> +	unsigned int num_fw_queued;

is there a reason to prefer a spinlocked value instead of using an atomic without additional locking?


