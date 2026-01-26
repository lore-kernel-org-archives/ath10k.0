Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96C0C88E42
	for <ath10k@archiver.kernel.org>; Mon, 26 Jan 2026 02:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwtxPTrPGzWPOqfN7gVyzUfj/+vOMn7+smpYP5omEwk=; b=Bnqieq/zT1BeeZ5rSUlvYXtZBA
	TtZpFLDuix4CDD/QrrrYtyOL1yyCKeoo6Q5DF4+f5Z02OZLzi+hfxQ0zND6Uxbml9Ypep7wawml/E
	dL5dViR/hOgj5fzUwv4LGwMhzd0kSDt955RPNH663dZNNmmKk7LbbpSeEmAVVKDVUkAE02jfPXJrl
	18+yBdRA2Qkw71ILqzN2WX+St91B1UVkAQdBGbl9Ysx6/OApTpM3Up/DCM8cT8EB8bmZqGE2LPe4A
	S8BsWmgIXaztAG3Ae2yt7RKF98W/1NkPDDiakP9NKVsJLG7cUE5m6z6rRJtsUaz7r+o7CCaxnU6Yg
	Rk71JFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC8T-0000000BmKz-43Gh;
	Mon, 26 Jan 2026 02:15:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkC8Q-0000000BmKc-2Vfv
	for ath10k@lists.infradead.org;
	Mon, 26 Jan 2026 02:15:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKoWIo4087969
	for <ath10k@lists.infradead.org>; Mon, 26 Jan 2026 02:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zwtxPTrPGzWPOqfN7gVyzUfj/+vOMn7+smpYP5omEwk=; b=lq1g+vHHhH3UUkxI
	DXt6YiKzlnEE5G6NZdVZvGt0pSt44uoshy5CUi8upSvODrNGu3a6CM+SNvcXhmNs
	7LLdYf3mOvv+OTI1+G5JLuS+m2/HZW1H/rabifuJ3pPBPAsT/QS0iwu6HSxSC1nl
	PeloIFcPL12D2gpNO2NR8BDPKLsQFMhOGZk7GsI2uF4dgG56tNdwYfBfmrRI5MJ4
	7ti2wIUlRhFRFqk+LeBzYTjasFnAi010wI1qfNsJYHP1jYw7LcoPVNgUFCMz0CJ9
	AkIJ/clL8+VO131fY6OawF2mo1qVoniLG1sFBhH7447o8/9LMHIWFBCI/F/ZRq3T
	+ja++w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6xu339-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 26 Jan 2026 02:15:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7a98ba326so42847105ad.1
        for <ath10k@lists.infradead.org>; Sun, 25 Jan 2026 18:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769393719; x=1769998519; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zwtxPTrPGzWPOqfN7gVyzUfj/+vOMn7+smpYP5omEwk=;
        b=Fasqpc8M4A/xGKCsXxX0M34rd09dopK9WUhf2nNhKOxH9tIKRSAdHaI+qkMheXZcyE
         mz7QMgOgoGfkWDNWQKzWCkJ5VCW2K8TmbAE1M3TmB8Vsf8l2m7f1+awY6hv+WBIhnB0A
         RuWh2bU0mjLFMZ/RKwX8wPqDkYqzWJA016e6U1xFTgiUq/4fJy4XTNER6pAHezMJcfVR
         2eO3+SttvXAbR5cRxt6vNbVebulGIfHzw2y+jBYQ4gKhRSYjBma7v4+6QFpkdHHV9nwO
         0IikCexNbsIv/QJhgaiGZIpGwgPh8XbTg78hQrvAFrcWvYJFQCTqWbS26q1fY5vqiW0u
         MbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769393719; x=1769998519;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwtxPTrPGzWPOqfN7gVyzUfj/+vOMn7+smpYP5omEwk=;
        b=Jengk7rGfmOXUL/iJgUz8PjdFgqQ59l0XUyk82VveV+0KJvdIQjP1LavBe121dX9I0
         AQm7XzcuIJDr0fleAi7ao4csmh5Bpz0Dun/5pDTy/7wYYtv0KuwOKs/VR50RkXW1VM6Y
         In7sUOTO4+QHwR26Vpx11K/loXeQmoT/xFUNXNAJGgEme6Y9/i9/V0m75oo+yRfLS8XI
         HX8KWGCyg6ZDhD7qel3kmUBInof2NJ3UXhvN1Ne8fmxjrdZM5l0A7B7xtsG8GGQPgs7u
         +p8V7pF8pDZwsIQnThTkZXgOmaYcKDu1/BHbvhOLtij0lS38RGPCESd8XM4jDZakv1Vp
         pzkg==
X-Forwarded-Encrypted: i=1; AJvYcCWvJ+81+I5FW+i2F9CFV+QgefdnaT5HvjKI0yFo/T+sT2SfOOWq7AP2aNNjIo1p7o/KYEDWscM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2kmXE6wD0QMqf94JAysjoBN1IYMwDO9q98dgQz6nM8YgRJKD6
	XKsgPdx00/QQ48zWl8Lo7WeoBMLTZR+RISPxuM9lrOUJLswPw+WaRG2FlXkUVkESgmDnnEe7MFP
	Gpzxfbd+0ffMmw5h0CdIBMFm53lwvMHdRGzMnu6xSb7tlmazLjKG4xcE5NDXf6+ck
X-Gm-Gg: AZuq6aKtpeT4flGxvuwi9+1wyrrsdiO5b37g3m877bf37PS9xPx1ddzdFMnkpYeiM3j
	UfX9t/FwAuHej0lumB4cHv7my2mpjdxMXbTZiYtFB+H0UdV5lOH5i4J20ZpLQepvlmx85HWvVCP
	St+hj19bCjAT6y8tIkqr8Or11YVj+JdXaNGHQK7wd2Y+uDiSTBCLTVLkC8Mcpdl/1oED3w42B9i
	hAiaT/T1Lze5xSFZWyJNh4keb78whRiQivk6OlMW361xeMuIxY1vM0huJAXnh6fhjY8+0448kMs
	d8DHdKZO2X6Q+9ALjcC2KYfDZ0a+IezwD53bszR7FFsxxvGvc9OelJrApsnKt2EpHbkIGzHanyD
	S9zmo18xw0RJkYQehBCislGrkjrTzwY/DLMdE4+YRt4kQobWAvgoeKbSXijpcG5+7gBtXfhGfs5
	dsxsNqIf0=
X-Received: by 2002:a17:902:c94d:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a845502f26mr29584605ad.13.1769393719328;
        Sun, 25 Jan 2026 18:15:19 -0800 (PST)
X-Received: by 2002:a17:902:c94d:b0:294:f6e5:b91a with SMTP id d9443c01a7336-2a845502f26mr29584355ad.13.1769393718834;
        Sun, 25 Jan 2026 18:15:18 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97ba6sm76776135ad.50.2026.01.25.18.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 18:15:18 -0800 (PST)
Message-ID: <86af03f9-3823-4561-95ec-8b15ed88249c@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 10:15:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: fix lock protection in
 ath10k_wmi_event_peer_sta_ps_state_chg()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123175611.767731-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BzrmiWMAScy8xqA_s5cbKlLCPXfU6iW2
X-Proofpoint-ORIG-GUID: BzrmiWMAScy8xqA_s5cbKlLCPXfU6iW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDAxNyBTYWx0ZWRfX7IoE4HVdjs4t
 AKT1KxuENIYQRyhJY2ttZdRahwNiGBesUV6Iv8afxmUMvneBeireFAOQ5Gbm+zuQY3MSeKbfy0U
 VkvPMiOQ5g68QMqVEFs4B3qnPRNi07yhrKPJeoxj5T7gUrK3NVtgORwSDboCXzZLTNE+GfMM6Zs
 3soy+pPq6BN+zgLQYbT0OEhoCJYBdSr6IimRXEBHdIgY3qeAB43kicl47uNqdoJ61aU/jl+evVG
 UqBMwDMkS2AeIq1Ykacl/xtFfVp4iIyvQO1qZGb4fEsaTnZBxuYOiIUPQnEYCArSJmkdHLC44jm
 LO4eTd1UCevYMimGF/Nxtw+Vpw3ssiL6ZM1pi+JDeNQVWwad2pqc5nH0zVauHmMVP7OVyRvl7vu
 80lgHmQHWtQU6IUDe9xnJ1DaE3A2QyhA9s2Q9/BYUDfAAqQjcxdq37MP2DreQ05TBcGrL7ugTlk
 VC9jCZZz0QRUlSmbzbA==
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=6976ce38 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=27jATeYspuGomxVIXMEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_181522_788683_36E52F9A 
X-CRM114-Status: GOOD (  20.60  )
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



On 1/24/2026 1:56 AM, Ziyi Guo wrote:
> ath10k_wmi_event_peer_sta_ps_state_chg() uses lockdep_assert_held() to
> assert that ar->data_lock should be held by the caller, but neither
> ath10k_wmi_10_2_op_rx() nor ath10k_wmi_10_4_op_rx() acquire this lock
> before calling this function.
> 
> The field arsta->peer_ps_state is documented as protected by
> ar->data_lock in core.h, and other accessors (ath10k_peer_ps_state_disable,
> ath10k_dbg_sta_read_peer_ps_state) properly acquire this lock.

there is another instance in ath10k_sta_state() where the lock is not acquired, but I
guess that is OK since during the NOTEXIST -> NONE transition no race is expected.

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

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


