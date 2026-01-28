Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68A1D3F08E
	for <ath10k@archiver.kernel.org>; Wed, 28 Jan 2026 16:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=726DQBzhA/EmumloQR+FME9Z+eEVaDFRgktcZxX0gsE=; b=T3C7jZ0/fwnPeULYHDMrQsF+/C
	c4FNPfC2tXor0N0hlzGO4cfDNU2FJTRGtiCtL40fu4wVXkYqI7fSuC1rxGhVu0OCfQSUCfcCsrcq1
	1SO5R6IySI/LuLe77Gbujxhcpj+SZo7GvvosDlL21Nc4QvGf1WqcBOBukjP0eV+eZl0TB+Ufqb7Tg
	vjYkrHp3P/HRtx3pKpLu8he7DtydsI77c5acicZLKmlNSJ8R47/8ODE1Qd4fa+qWt5jjffuH0ufjm
	1qAMyWZNF5Q0UqvA1vzwXPZVyBuN05nhS2SpjUFOlf0vpoq+A8lgZEpusAm5R/QxpPFhSFZUW2etf
	pViquRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8Wi-0000000GPKr-3Lbb;
	Wed, 28 Jan 2026 16:36:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl8Wd-0000000GPK2-3WVC
	for ath10k@lists.infradead.org;
	Wed, 28 Jan 2026 16:36:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SFW1ct4008411
	for <ath10k@lists.infradead.org>; Wed, 28 Jan 2026 16:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	726DQBzhA/EmumloQR+FME9Z+eEVaDFRgktcZxX0gsE=; b=nR4MLXs8PnRpPmqU
	nbYVgBIRd5rdwk47xM2Ln2D8SeCoWZIwIcQdDJ5vWtu06cB/OMNSeqO3u8GCjNsq
	g2WreKlURxjauc97Sqy5/DeSXo7Ie7+b32uQyhNuVCXmp4BwCkw1JbSvRe246nnP
	K20gpQoHHn4/OjZ6rWY472q6ajBuyMP9lDpNhhOphsE0o2+XRUUlbHn8TmHud6Y8
	Kt/81YatcCvS7Ars82nvbYGoLCH5QM0yNBpi7l6+NQqHXYGmUef/FG0NX/wg2fjy
	AYpHlGAJlkgXtUpcX3H1nyv5VHP01ZRoceaj8TEBHTdTvoBQaNSLNit9VaWPeDuc
	F6jZeQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1jx4dre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 28 Jan 2026 16:36:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1247bb4db53so9505769c88.1
        for <ath10k@lists.infradead.org>; Wed, 28 Jan 2026 08:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769618174; x=1770222974; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=726DQBzhA/EmumloQR+FME9Z+eEVaDFRgktcZxX0gsE=;
        b=ZpSjlpfjFr9Xt/irqVmWcD2qOMf9OYlVzUNbe1jV+0tjSzO6bkJufQVpWAm1PyIGfe
         Fon8QSSO5xUvIW2awGSsk10ICmiyWR6d3XV99Ql0dQq6q0GgQvJJ/9uip19ALEuL3osL
         mbu0+CKFVLnqQCG/t81UOmic6VRmAopz3hbUHoluZTqe3ZinY4Jq0Tfs6jajxQRueBLC
         pq5vGYFllZbn658GuIUFDVKvKW7312VCPQM7DiQwURzuRVwu5Uy+LNdOaT+Ypf5x/ttl
         BYifoK2enQh1HJBUoafjyWCKP80/WqXa6hKhY7DjJMi3o8ZHNTN+RGg50cMAELN03VBo
         C9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769618174; x=1770222974;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=726DQBzhA/EmumloQR+FME9Z+eEVaDFRgktcZxX0gsE=;
        b=i4jnpgTbdslZ8u64E0EcFXW3F91bhu6EbIOKk93h6Q9lu/cPNsJATsDHWJKvLpwRBw
         5yrHyRyKOnGSjRdBT3K1muyCwP4GUkoZfyErfnKkTeWQiPE/8563DuZVZGOG2KTBEbNH
         0lHqAsSGAVI6IXeVdIUe3bO+mLvfZzBEOuwbxNX+7tM6+d8mGiju6SSvpG6TEnuA54yd
         cKoO1lZyRFPxHUDNeOyYrQ2uhCUy5aMk1/kAW4MNv7IaJSz3oCs1aGI7FKHd5XOTiemn
         q27ut3KlvFdgS//fp/h1a2cW4KiUFc58UuracD1KRO60mGVn/kYqupaAC4BOzsLMTRL7
         gB4A==
X-Forwarded-Encrypted: i=1; AJvYcCVO8s1AYluV486mdpTjEh4VZIKjWm5xdpG6RrllCU+e2O0QVjwM7UMjMBUVEtn0W0FqE9T10dQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Te/NYT+58ODvVVop9LIB9rjeco78jOZIinSYaO8EYf9aQEEP
	c9hxa/8x14bQM114bRQgWyjcpAVM766IVZwEngThZUCtCfX/0YpbQv/DtpGxgkEB7zzB5L5HDYl
	vVEuCxc1EH92ZNPpnW23+vVviZc6QS21vBST2fdS9JzPDPefj5WiwAkhNj0mR3c5kvxpAJvCi
X-Gm-Gg: AZuq6aJj68bRQesKwnhgfHANEx4UB8VOEmxU4YqA9LQnPeT5hoPtKQQuSaZzQNzyDK8
	Y6IXYs/Itz5+mhI7mqBlu31EWANc5TllUuNa5vN05QGI3n1+B7m4JPhVm8vXUkjk9OKPxpKhik0
	xtfQ24uBKvtB87P3kEmnqBDcffQUcCjMSzdY7hpR17itYIA1S2d7lEvi1saChMfsObDLZFRS1Kz
	4ywbz+GL4wxZzRqA00/AagpBz4EROrE5mMMNfzLvUzGr1syQxID30sqePiJyWpMJ9nfPv1KzyBE
	UUcI75xuPqx0ziIM3VzkxKVQPeMqf9UymwyuW302DopcE6sedS4V4Uk+LAOehNEBMpc2Oym6wmB
	fVjWIGl6qdFxWzxwN3dyF3jtVHE2h8p/bzt0W2BBWnCT+ULrP/5MTq8QnYA0f2AtkMEm7Ng==
X-Received: by 2002:a05:7022:128c:b0:123:361e:e87c with SMTP id a92af1059eb24-124a0098f90mr3452505c88.11.1769618174046;
        Wed, 28 Jan 2026 08:36:14 -0800 (PST)
X-Received: by 2002:a05:7022:128c:b0:123:361e:e87c with SMTP id a92af1059eb24-124a0098f90mr3452478c88.11.1769618173391;
        Wed, 28 Jan 2026 08:36:13 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16eab72sm3166931eec.8.2026.01.28.08.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 08:36:12 -0800 (PST)
Message-ID: <2bb1ebcf-1874-4b65-b4c6-30489747c594@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 08:36:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: fix lock protection in
 ath10k_wmi_event_peer_sta_ps_state_chg()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zzEtpm0Zt5pZtPgoygps686X37OJXLma
X-Authority-Analysis: v=2.4 cv=duPWylg4 c=1 sm=1 tr=0 ts=697a3afe cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=27jATeYspuGomxVIXMEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzNiBTYWx0ZWRfX4mR9zadIvSUj
 ngeaX+kMVN3Pb25NFKOMwNqkMepFxOOnwI5F5Fsew21DUGZZ7Xmv44I9AyEYihyMHzrBEJ8tXkV
 AbpmbsNVT1KBH3kyZ6hc2aT+Nx3+O2mDWJDS6rjBj2P9Tx84sXnsbKO7ZPaq4Gw/zg77v0QvEbw
 ahllJRKk3/QPiQ6okYFpVcgfGYOlUDyyNpFFWAlpHD4tYwpwC4dUww0xOPzQ860YU/qgJDH673L
 9u1+E8060YjtHjw48FIv6q+/l3ESdoE/0BSonXqxPOwlB57GJ+hFsZ0SUL082siMcEDvZM1G8Or
 VYgexqtseS5kQjNa+bA2G8AKOzGg7LWB90xUVQ6ucQLdp+aiZfm0MAxN3cA4wAfS8lM/o9AJEYH
 fm80SCZ0H2//GtVF22IJ+W6LhQdzOuMqTl+u68O8b30R9XyYTl24bWY5YzVZ8b8btvVhovgAVPX
 JdTdgQiakV1IKM4NZZg==
X-Proofpoint-GUID: zzEtpm0Zt5pZtPgoygps686X37OJXLma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_083617_992678_9482DAD6 
X-CRM114-Status: GOOD (  20.33  )
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

On 1/23/2026 9:56 AM, Ziyi Guo wrote:
> ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
> assert that ar->data_lock should be held by the caller, but neither
> ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
> before calling this function.
> 
> The field arsta->peer_ps_state is documented as protected by
> ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
> ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.
> 
> Add spin_lock_bh()/spin_unlock_bh() around the peer_ps_state update,
> and remove the lockdep_assert_held() to be aligned with new locking,
> following the pattern used by other WMI event handlers in the driver.
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
> v2:
>  - Remove lockdep_assert_held() as suggested, since
>    we are now taking the lock internally.
> 
>  drivers/net/wireless/ath/ath10k/wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index b4aad6604d6d..061a2fa8f00f 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5289,7 +5289,6 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
>  	struct ath10k_sta *arsta;
>  	u8 peer_addr[ETH_ALEN];
>  
> -	lockdep_assert_held(&ar->data_lock);

note that removing just this line results in an ath10k-check warning:
drivers/net/wireless/ath/ath10k/wmi.c:5292: Please don't use multiple blank lines

I'll also remove one of the blank lines when I apply this patch

>  
>  	ev = (struct wmi_peer_sta_ps_state_chg_event *)skb->data;
>  	ether_addr_copy(peer_addr, ev->peer_macaddr.addr);
> @@ -5305,7 +5304,9 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
>  	}
>  
>  	arsta = (struct ath10k_sta *)sta->drv_priv;
> +	spin_lock_bh(&ar->data_lock);
>  	arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state);
> +	spin_unlock_bh(&ar->data_lock);
>  
>  exit:
>  	rcu_read_unlock();


