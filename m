Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7210CA9ED6
	for <ath10k@archiver.kernel.org>; Mon, 12 Oct 2026 05:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=; b=j7pUfjXmkqrcLCgQG7WoCTzwBL
	gqCw1FB/yIZ02/VwJN4xpqTaAKReVldfYKpQYZSXiiac+dboFKLEa5BQQV2dkdjLk5NZj6Jbi5rxh
	6ITXYNe0CCQ5XEUcHeVQH6bQom6qJh2CQx+OkAqGZklu/7hbTRp/MIgxljOP2POZg38NKQ2t91u4o
	Qt8IyrNiMsH30E//gSic8yZS+47kxPWtM61+1fNXk9+vy2TviNHIznk140fHWTHsAHiQtble3jlw9
	I1yjT9NDNibIvpRWtcUVr2s2mspsclMtwr10HmiSoAhgvP5eYzVnPKWItfyG2rVQV3/xbGuWugcvC
	s05GK6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8xO-00000009hMJ-2QV0;
	Mon, 12 Oct 2026 05:52:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG8xL-00000009hKy-2RyV
	for ath10k@lists.infradead.org;
	Mon, 12 Oct 2026 05:52:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PcnC1787075
	for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=; b=mv7YeUWDwdmTClRa
	/9xojwGT4f2gOUhaSAPS69WH4dnR1EEFMnDekZ2UdOjwwNvv776TwH7linE/GaqT
	ytQIpPQcPa1yASxM7oiIORIGAlYGgf12lPExmOmDugeAzKX9FBSf/ied0SMntFmZ
	tRr/VeZpiENXZ2cR0rfKSK7OJ3MWUHXBR9u4L0l2tuNxtt1QFhWmtzsGfu6KU5aC
	qtmlc6Os2mi5mU8GpKndWLRGEUa7XODy26uVmQxy0lq4czJTQDOuj5s4q4Le0W42
	7Ap8too1RT35+aQbU9DqaOGP1uF3XNCLzTd3MvHE/QQ1A13WrDoEBR+QRDs3az+w
	j0CLBw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1r2hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 12 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1525541a91.2
        for <ath10k@lists.infradead.org>; Sun, 11 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791784333; x=1792389133; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=QbgX42RF3D/4oAnGkLKFHQYeSg464rhAt7iJ3kROr+QxXmIavzzD9eT017qBqFBBV/
         Ugi72xgX4MKsiOuFrQJ3zi8wEe9qVI9lzsTkljgOVNevDPVeBWrejqD9/Cl604heg9g9
         3Ea/ypuBKhydDEOtSGt5Upuz9YTpk7/lOJzb7UGLjaf2ShEbMz96vWo7FyuwUuNfgMiS
         iR26nZ6Q5HkbdfcHw9Ii3wZy3q2Nx/GXvaaUzJKHgMzB/r/mnpNiC3eceuHOiJS5aRTg
         qq8xG2jSAEg2XQNQVCt8wLJsBMyPrv6dAQ2JKl7W2yE71X4mwZQwBU5M9GZG3EIxigX1
         DKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784333; x=1792389133;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JsaXdV0VoV/UKwVV6/MQKOiB7ownYDY6SlTuDUZ3IDE=;
        b=YIxA77eVvNvYxZFcx76XriTv1aQTn6Mhb/xtaJs39oSmyV9vifMedj2DBiS/GZIiFl
         VD02sEuzlAtvv43fFW7zFBzXVZ/iAxLU41TSyfWTnscIIm6P7FRAR9i1tMEj1nGFwr5J
         ehzSwt12blHA3bY/1UI3p00oCAorKetgr3QM/MPIecwuHi4kuiZBuELFO7P9/KhsuaOY
         WLzo6uVtJcBSuqydLT9jNVg61hi8NmE6NDV+qyObzCk/i/jby+N91WwD9BiRAFpjG4uI
         FJVPprdX1OTPtuQuTjfpotF/E4hWdmz90wLY7lQ9E6HDWqPLuS9kA8Fc9AqomucHj17q
         E7Kw==
X-Forwarded-Encrypted: i=1; AKwUvBx5eKbbe5YUS2/U51todsn18+jQsUGM6xPiJyPiOKKhtxjRmza8NTo5blPHJ+QzeNzOSbuNX4k=@lists.infradead.org
X-Gm-Message-State: AFq9FYL8bGSPA1SmXMPVcQUrv1DgLHR8OrZtJc/5zJ/ST5Dve6U6WH8a
	Zgp56BD3ofrI9xlG6e3rHBujmgFLKoFZknoSqDp7SqNDlRltgZW606ZZ8AZqaihAe3cykYUJQG8
	JuAphIGi3/AFgxNpENQ2KXo5uwxuikc+5JHgILV+XZs73vVkwDK4uyyCjwLZ1JHhq
X-Gm-Gg: AYBFou28+LKs3+o0HdNsvPuagAbNfUyCcvPc6q32olCLoHWMigMSl4tCWkovdYXVLIl
	1ObZewRPotD3JrzyQvDDFetGaUbMmTs/2t7L6B8zD15LAWWSUi10oTn8A/s0o5fnXFpMiyCL2ws
	Al1uO2EnKgIA/ycoma+PYK8AEtHFPtFZbjoeHre2jHHx3UV2rqG2f2Hrqvxa3zvUGQ1upEG1KqM
	tCZJZqY507/GZLFlHL8asF8IQQcsZiBvzjZ8Oiq/fZTpVaWZ3TfY/s2u9AJX5Iseb9Jr/BDxFWg
	1YuP3+ymmNczCo7RVzE0CmKCB4ecWAjDniBLlLYqRqkzr9++MP9nMC0Ws4QspbNy/7H6NV4wIAI
	RsxWe9xi63x40L31/MV8juRu2EvEWYVw=
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686402a91.6.1791784333420;
        Sun, 11 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a17:90a:d006:b0:3a8:6a04:80ef with SMTP id 98e67ed59e1d1-3ab3a2901c2mr5686375a91.6.1791784332909;
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e41126sm3869528a12.23.2026.10.11.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 22:52:12 -0700 (PDT)
Message-ID: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 13:52:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ri15RySSyk2UMqeIgqSu_HewAdIYw7pz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX0MvAX9EbV3ZO
 l40EAkiGY3468tqeIvXxCjtTZrr6uQG5Bjlm4SS04Tk49Naugaas5NhlrO993vVIwPe98o7spjo
 oMahQbCKRDAzit8AQmoaNVoqPLNQX1U=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc758e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ri15RySSyk2UMqeIgqSu_HewAdIYw7pz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyMyBTYWx0ZWRfX/7lHzyzXZrOj
 cNjbd/Gah2pQ0RrOGg2U45/zlZcr1NloXS1UuTA/e5QPfr/W99yzAfndJ4js2LBtghmxDfYbav4
 qEbB5CHw6PL6j672ZGTP0UiBJvn2VZ6PeB+LahFfph8zkETZORjJ1Y/bmKll6XgQBaNnvrII7FD
 nneAgd259yeXDlx8feQfNGFab+0ZIqpEXRvf7mtso4fHrwptAHUsVVkEs7E/608bdeF2FcFZ6a8
 9LByNWwkb0/Zx0gxrRB8nm57VJOVhI4nDF9W4avH+cV/hYn1BvPFIqi50czXG98bDs9NLKE0U9z
 mNPihdHJQhP6nqKNmYMM/rkLPimaBjUGTm8N3X6iDkIwVVLoSucLYcOyDHAi+Ow1uOwFToyBtrc
 IfCDqNHcOlybgUmhGRhSE4YdI8k7PyWD+izMTRcUaaOu64np8IKcqoqowT8+8PpQlrcy9pnAMpy
 pnX9MCa/LYeZy0QywtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_225215_766540_EE20822F 
X-CRM114-Status: GOOD (  14.21  )
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



On 10/3/2026 5:20 PM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
separate future fix:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


