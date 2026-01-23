Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43177D77897
	for <ath10k@archiver.kernel.org>; Fri, 23 Jan 2026 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/E+2t1fdfEDSCOIA22/v+4jziQGVAuaEcc3NXgiKYQ=; b=QImZuh/vuANsX7VKSQkefq0BIB
	6Ev0DTQ/g7QgLS1FJ0SRPxq8csg6V6RwW+5vlqXJ0yBx84nVEJLLRVCqKNcejZ4C4Je6Md/hqcDf4
	TEmDnUjNm0Zab24nMsPoP9DKfqd88xWXqNbL4wTUG5yQqEX2qd8itXNeBs/SRltvcqCH0dHgnAbVH
	F5XMuYb0Eb+fVR3WMgHQZ/3IHvbeE3AYhb1B/1yw/eEFov0h66/XiA51Xd8Z0Dg+uQ/zoHn3yvMIR
	KNfw470ReW2I5m4zDQqGWwHVnbfhy2kPLwX+KtBfNpvpIgQisavWInfUSZ4Fx4U4MocNNaIEhPJbg
	SeJeRDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKvP-00000009Hr7-2guG;
	Fri, 23 Jan 2026 17:26:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKvN-00000009Hqc-1xA2
	for ath10k@lists.infradead.org;
	Fri, 23 Jan 2026 17:26:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NChOX83677919
	for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 17:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g/E+2t1fdfEDSCOIA22/v+4jziQGVAuaEcc3NXgiKYQ=; b=VqspBZsd+V9CJ2kI
	NdOpx/du69Oxk+ab38K9IkVYiftPD9JCp7uh/Bn00h8WxmYg93ucSTopA6H796xb
	QhsnJSfQDsPxu8QcAuoMnxsFDNSLzzrHmWhbPmNUJfBfSV3+01mx9bBEhmSRsLR9
	N5/YRBZoLNrnzBe07Vpkw61fVBVrIDzbuI00qE6rQGl9Ad8g2FWtnWyZwUZjJH+X
	vDC6W59GJEuhoXv++EkuSipXTViFbsGEuvaQpeCf3wJc/qMTx/kRtRA+NOwm9FHQ
	isAw91QpcXXhF9UttqqxDFw3pqBJpJw5gAOhfaDd/8HB9rDoQ7r7Rn+xgP9rtdZx
	L93txQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp4gvf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 17:26:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b704019c98so2459867eec.0
        for <ath10k@lists.infradead.org>; Fri, 23 Jan 2026 09:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769189178; x=1769793978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/E+2t1fdfEDSCOIA22/v+4jziQGVAuaEcc3NXgiKYQ=;
        b=bduPVQX486k5WFI/xYX5ZamKmzqZfcyU9EUZjGdeJnzTO97y8MRYS8XSCoCPybRgyg
         nmypre1COYKrfb3t4FHhoiRS//JTXQ5/uLQFxSXteH9v/HhgltvQ+PudYBnG3Qe19G/L
         1mDWarDTv36qnoOs85L9qKoOqz7B3gkk8+rFtwpHvjiaWRs8tFW0FoW/Z6vt956YRi0w
         sC0TyOP69UFoBw9HI9GGx6ZisMPvT5JNuTgYaHYZqDo6HiNu5THtL2orcEjAfC+zCbvL
         JdgWS8Le/sni1TBq+VL29HDWxFfWC99LW8+lEqeBcBsHIUNjBs27CoIrh2QFTKjQDAex
         q7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769189178; x=1769793978;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/E+2t1fdfEDSCOIA22/v+4jziQGVAuaEcc3NXgiKYQ=;
        b=bjCh/t0U0Gf0CqTlPG21pfa3x8gw+TvTKvyTXosX+wE8y/zeU33REIAHg6Q+Nkjw5c
         sdh7FOpdCbLJJ4VzDgds5+6Kd7AAYb9M4aFyR2Jn6YvdsUvupodfVOpdWII4xot6gZgR
         7IYyFOWXp3zia3mjdFLpUIPHHIqOsOqt5i3ARYZLA4ZPS213sweCFxvtqio+Lnes5e6y
         SNB39whTUjMdH+5iVZ5ntsY8y7cKM7uP5BDhhC6FZvAC8SHgQauUMyLeRtlO7OtxSnnl
         opPmbCtx3fQWV7O3MeZ3LQbjt1UC6G/zHfV0gEK3CfKINQprMYxaUausGD4+hW6TSmxj
         hXTA==
X-Forwarded-Encrypted: i=1; AJvYcCV9UAUwDQVJlhhA6n10en7RchWV1eBZxUYnGFjXk99qn5qY5o3f7IQMpHV30DIQRWsTp36B1R8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Kctbre4Ym/hsbDmKXfIKXiR0EFS0wfH5eCSQ7KAMKKzktTee
	si8McBMwiHq77gUpeVbDeRSvKqZGOKUTuxI+81Vhe9OsdLrQwLP9dX5NCrubVHDaTGR4NSLgpFr
	5xuuLJtPhRz6ZKioaUIUorS7cqj2JL/9AJRvAPcX4Lid1gX/ISqi4aRz6svNU4LUI
X-Gm-Gg: AZuq6aJlbG0r9kv4qBe48M/MU+fdJY+RLRybbNwOTKrtgckARiQPHPZEUETOb9T9Vu/
	Oq+xoksm7ZsZGdjcjsVtJ9G2g//WLi4uvUgLNgdA44qgN3f87IbfrWSmRPrCnJCXsIv8oJmqWTF
	Ppxhhj02gYqNi6eoNHbRie+fhPqSNRUxrap7alFPMGrIIwpWYwsW9tkhaQLroNqvwp8XswvktmH
	SxJdaT5NWcdGl9SB0WghUuvJ/RWrPmcW3GuuZu0icouNd1a3W7IwHnRDs1veyyhpmHvC396B6Ak
	f0Vm4SHIpFwwIghV6w5qrONAcPzvcbwYA7WTUCdCnFkPtD1kx6ZzIH40B4NQxTb/R8BtQFXSRrg
	grG5WDWFMyUlIjQ4zMBrHHFFjMz05R8uvQvHtmRoCkxw6ToQ4OzB07LcDrFMTbI1+pHx3WxJ4ZP
	YO
X-Received: by 2002:a05:7301:4e0b:b0:2a4:3593:c7c5 with SMTP id 5a478bee46e88-2b73995a3abmr1580051eec.5.1769189177607;
        Fri, 23 Jan 2026 09:26:17 -0800 (PST)
X-Received: by 2002:a05:7301:4e0b:b0:2a4:3593:c7c5 with SMTP id 5a478bee46e88-2b73995a3abmr1580039eec.5.1769189177089;
        Fri, 23 Jan 2026 09:26:17 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6f5d2asm3809805eec.14.2026.01.23.09.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 09:26:16 -0800 (PST)
Message-ID: <d42a139e-7e8c-4516-ae4f-5da419a3191e@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 09:26:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: fix lock protection in
 ath10k_wmi_event_peer_sta_ps_state_chg()
To: Ziyi Guo <n7l8m4@u.northwestern.edu>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260123160244.262225-1-n7l8m4@u.northwestern.edu>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123160244.262225-1-n7l8m4@u.northwestern.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6973af3a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sZ0xnW9vVDrYtnK7kcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: yv-qQnN0Wo-l7HghAKy_UjXIbqKNzNTK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzMSBTYWx0ZWRfX6rV3g/EZObHs
 ap4X7Oqh6PuPk0IqcrnOZGKE3EoMeNmbkcGdZ0H0VQ8QjQsVI98YsE8QISdaXJJVIAumR2SsSBa
 KvKZaW4g5Qo8FhmbYtxQY3q2Lqq+ViqO83nnF6Og5raLGmIYbt4OUxRYgblEuFlY4qoDGljCf80
 RWyt4iVnu/KiLhTBgKEDeeQMysqo3r4TCaNUi9AFPFMX0cJEPnAh6cu7lzc6LpbulZGljSmll/K
 loIpxDnn2DkSIx4R2bWZXxA8dV6JS0LolVcPJNdeuogB41snDDZrg6VfrNnMT6an6R2r+BQZGow
 MAD3qbjQktDhxyLYvxyFM5cfOND5lfpV0a2ZnfJkLNEEO25tvHH6Jx9sHGW0FdVIxVL/ziHdz8n
 0D8wOLt6degGPh8ovcp5d0V290TDs17XTFEnRSGAzELs1eEP/jZ1n98XWItB7iBoquH4JzHt0Yh
 WhYpuMaSn/C2OMb+QgA==
X-Proofpoint-GUID: yv-qQnN0Wo-l7HghAKy_UjXIbqKNzNTK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_092621_627583_BBCEA4D0 
X-CRM114-Status: GOOD (  16.60  )
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

On 1/23/2026 8:02 AM, Ziyi Guo wrote:
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
> following the pattern used by other WMI event handlers in the driver.
> 
> Signed-off-by: Ziyi Guo <n7l8m4@u.northwestern.edu>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index b4aad6604d6d..40259504927c 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5305,7 +5305,9 @@ ath10k_wmi_event_peer_sta_ps_state_chg(struct ath10k *ar, struct sk_buff *skb)
>  	}
>  
>  	arsta = (struct ath10k_sta *)sta->drv_priv;
> +	spin_lock_bh(&ar->data_lock);
>  	arsta->peer_ps_state = __le32_to_cpu(ev->peer_ps_state);
> +	spin_unlock_bh(&ar->data_lock);
>  
>  exit:
>  	rcu_read_unlock();

this solution is inconsistent with the lockdep_assert_held().

either the locking should be done by the callers or the lockdep_assert_held()
should be removed in conjunction with the new locking you are adding.

/jeff

