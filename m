Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C25FF60C2
	for <ath10k@archiver.kernel.org>; Tue, 31 Mar 2026 04:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ts8RTHXqc/NqG7zXquFLtRv6EI5Px79CzR6ZkrGYM/o=; b=tiIdk3xodmicUR8kLDQ0P0mnlQ
	ttSOwu13Jzm6Oqve6gEgtWRVlntL8/AYdXDAYo3DOrAygkCSIQLic04Sd/6XS12AAXkma8CFwYJQ0
	MXXlNnB9fX0jIuRJTqR3ZFFqBhLr5/bI0iWGcCLxkeMNS/w/57eUMVF2ET3p5npr2O0cAYd1/NplT
	HYXODJfhTkfc0zTYFPwmOYtCS715L2lUreswupo+dHxO99eksEm19nFnRfzSQCe60Z+KHnT0h952E
	U1kv6f7xNDTXRR+ozviSIlYuk0Nsk7ybC2Z4H22d5owFiplP3TZ8nsZ1tuBpUBXHNDI4q1pSw1cWh
	v8As6I9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7R7S-0000000CHvY-0y5x;
	Tue, 31 Mar 2026 04:54:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7R7P-0000000CHvD-1mo7
	for ath10k@lists.infradead.org;
	Tue, 31 Mar 2026 04:54:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V1PdZ01402787
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 04:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts8RTHXqc/NqG7zXquFLtRv6EI5Px79CzR6ZkrGYM/o=; b=kkfUh/1jSxklFtXH
	HSSFjBvjFOIw0khumfSoot2buUq196Vb7JDTWV9GKqAaO5uAgbAsd3U9spgpNkaM
	pDjjhjUHUOkBXkDxkbKkRSxKA0hnjUZQ2lFW9CDJGnuefov9yvES4sDoLSRcmWCa
	i1lUzxncna8ts2bzBf9YHmzXxpl1/JM3nySInod9ysezbyXaydibvC4usRoOJciy
	TfgeV0pP9J2hvFHR09YCek2Ss/e+8f2+v/TsZ6I3h2D65i77oKTJ6/sJfX9eFBR8
	8HMZfBxkim4cNCDf0A2ys9UQey5gzCTC1uLIepfHEMtsF2N1AppXMMLtXDSgHeda
	AxsvDQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4hbnks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 31 Mar 2026 04:54:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso3921852b3a.0
        for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 21:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774932860; x=1775537660; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts8RTHXqc/NqG7zXquFLtRv6EI5Px79CzR6ZkrGYM/o=;
        b=WIhzHpTrkeNI5CPqgFJBj1migfVSsrsyy15uM/W5qH/dW6y3k4cUfQDYKF21lSlGrv
         xhZArked2wauh3F6bNzHBqtRP7dh/EUz0xvji6twBybWIt6vlhseg/7U5JS4810n2LiR
         z4cSAEtz6nsqg1pRIBCp8qTiKiXHHtWu3kN9t6nSQIBS0n3RqPRmmVl1fniChdSpNjKB
         z9jhKOQtDlM1vsoAiZsRU23ntnBZu9t/mYZmQ255zA9QHfExbZFA5v0lFseXgGdxlVDR
         ZnIn4Rpq2vwvXbZMmhbZCg/BD/TVIEbpxFVcsqLmK1NY9lR0iSMCxvY6Afrjr0uFMEah
         zP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774932860; x=1775537660;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ts8RTHXqc/NqG7zXquFLtRv6EI5Px79CzR6ZkrGYM/o=;
        b=RrluLcoqPJtFV6Ti4A85eJGu1sMyVFcfRle4z7lhKa8pd2bLc6Z0I5p37ptKfkcAgj
         Uwh/lFILiQbjl1gsL4IV7IUujJOc8o03wcnxyf8TYjWD0LOLmf+eW8iRyumdi0GF8u5P
         Y96d5+8jcSA0m1zcOd6Oq7FlfiujOjGeVtD10j1zjO4upHB+Z9clbHZ2Z0CwMkQniodu
         /5XyUIJdRxpdcs4A0SzmqOAfyhPZepuNmIF2jkHexohwPFoK1wFrXdrFpRPEA69AwiXS
         /D4ENZXabY5jNB6ZAzFSYgnKZoF3qsneMqss2AvJ/NEucsqmeWanXY2FXE1Kdkz8lFmJ
         hZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCV/F4NAojWO39eoe4oqGvGd7INWskqm1Yrhz1hf8gWSFDHkN9t/tAdRCEgifoYcj8+3bZqkmb0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFvkmVk2kED1Mvmr9Q7rqgacJ9oL8x+nXSBb/qtgV3YyKQ54Nc
	vY8o65m7MsND6EWwoYtOPO0oxoANUn9f9oLiDg6SALW4bi2hVvZdMHDShLbteymzIigrSxliFJ7
	xa4XFwDr2eVetwidquhnCKVvB4t7Yf1Nwqhh+z8RkCGDfHWHBLLvjJ3Yzw6yaqfayiGiCMLU3
X-Gm-Gg: ATEYQzy1IocPQMFIBQ6cqZYX6EUUphxmbSAFwRgl7ytLg28a0Nv9CIb+6f9Wo8vr8FZ
	9UtbTgOv2fnoKAASetDnDPXoJqU25SAFdTPG1oUZ50kZHIIQhyZPPlwPqr9nodYSUhY+tk0f9y0
	joX9i2HMLnSMbB4aybXrb3KvP3UpKkzTLtwJWqZGyg4YJxiFNRcmiv87Na2JZgV/6V7bQ8mHl4z
	XqLHqJ0AuUNP2RQJ/LS9HvvBuROcyymtQFGobFDTHdnXkwQUC1aOrF1K6HkWCKYhwAGpcuOCvfS
	pFFoLLYFcKM7g6gwJeUL00ZJ1ckQXTaN6GwOVZ5lms407jI+Cjd2w7F3wCqswF678xy+pRHl/7r
	m5oWWll2lGuEaV8s6b4L/5e9Ms5JQheTzGhvNCx+jr0JYbmBLgp1uA3iMazcDTA==
X-Received: by 2002:a05:6a00:b4d:b0:829:793f:da78 with SMTP id d2e1a72fcca58-82c960728c4mr14890415b3a.48.1774932860082;
        Mon, 30 Mar 2026 21:54:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4d:b0:829:793f:da78 with SMTP id d2e1a72fcca58-82c960728c4mr14890387b3a.48.1774932859553;
        Mon, 30 Mar 2026 21:54:19 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca847ff4dsm8959928b3a.23.2026.03.30.21.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 21:54:19 -0700 (PDT)
Message-ID: <1c4bbf63-0464-48a5-aade-81b0f7b412b4@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 10:24:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        pmenzel@molgen.mpg.de
References: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA0NCBTYWx0ZWRfX5RxWiDB0u51I
 QzUMXd/7dfMZtkR458SPlJcvHv6rPe1wXlREVJFyxRN88Wubcf5S/S9VJhQOTlYY3IGxiRGx+kL
 ZSKs5fUBfg2rvIidrOaIJY44rOn0i1w7f78cYcxBsEAQnNJce1uIIhKBTtWweaAhvHIbD1HAklo
 mTiMFVDa1U4wPoSbBJkc0LGk5ov7i8s8JQOucPT1A88vHLSZp960ZFwVCssVUBjwGd5PYy+0j7h
 ZNe6rGrO3UqWfka3jPC0J2OHBBhAqJa68RsGMTmo67Up6fzmcXuKI4k9maoSyxYfXuBp3lTdQOp
 Y+G/49y652IkVae3C1ZNTHe+faY8talDvXtQrorHqG1O9rCRaEhXnSkzbxDzpohYHGv9ellot6Y
 TaFSFFy7VjuOH/GtdowC//4YaX9jHMbGRh2776yR7zkJvSOK8cXIEk6fmyzO00utGkzkWfcXlUu
 w3PTbL/V2ZblIJseHeA==
X-Proofpoint-ORIG-GUID: FOEEWiCWBc2mkSHvkht5ewS9I1T-qdXD
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cb537d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5JJ4Ai1OY_Bm05l3Z7AA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: FOEEWiCWBc2mkSHvkht5ewS9I1T-qdXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_215423_595076_621C5507 
X-CRM114-Status: GOOD (  26.06  )
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



On 3/25/2026 8:35 AM, Baochen Qiang wrote:
> Recent commit [1] moved station statistics collection to an earlier stage
> of the disconnect flow. With this change in place, ath10k fails to resolve
> the station entry when handling a peer stats event triggered during
> disconnect, resulting in log messages such as:
> 
> wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
> ath10k_pci 0000:3a:00.0: not found station for peer stats
> ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
> 
> The failure occurs because ath10k relies on ieee80211_find_sta_by_ifaddr()
> for station lookup. That function uses local->sta_hash, but by the time
> the peer stats request is triggered during disconnect, mac80211 has
> already removed the station from that hash table, leading to lookup
> failure.
> 
> Before commit [1], this issue was not visible because the transition from
> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST prevented ath10k from sending
> a peer stats request at all: ath10k_mac_sta_get_peer_stats_info() would
> fail early to find the peer and skip requesting statistics.
> 
> Fix this by switching the lookup path to ath10k_peer_find(), which queries
> ath10k's internal peer table. At the point where the firmware emits the
> peer stats event, the peer entry is still present in the driver's list,
> ensuring lookup succeeds.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
> 
> Fixes: a203dbeeca15 ("wifi: mac80211: collect station statistics earlier when disconnect") # [1]
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/ath10k/57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> index ec8e91707f84..01f2d1fa9d7d 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
> @@ -3,7 +3,7 @@
>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>    */
>   #include "core.h"
>   #include "debug.h"
> @@ -14,6 +14,7 @@
>   #include "wmi-tlv.h"
>   #include "p2p.h"
>   #include "testmode.h"
> +#include "txrx.h"
>   #include <linux/bitfield.h>
>   
>   /***************/
> @@ -224,8 +225,9 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
>   						const void *ptr, void *data)
>   {
>   	const struct wmi_tlv_peer_stats_info *stat = ptr;
> -	struct ieee80211_sta *sta;
> +	u32 vdev_id = *(u32 *)data;
>   	struct ath10k_sta *arsta;
> +	struct ath10k_peer *peer;
>   
>   	if (tag != WMI_TLV_TAG_STRUCT_PEER_STATS_INFO)
>   		return -EPROTO;
> @@ -241,20 +243,20 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar, u16 tag, u16
>   		   __le32_to_cpu(stat->last_tx_rate_code),
>   		   __le32_to_cpu(stat->last_tx_bitrate_kbps));
>   
> -	rcu_read_lock();
> -	sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
> -	if (!sta) {
> -		rcu_read_unlock();
> -		ath10k_warn(ar, "not found station for peer stats\n");
> +	guard(spinlock_bh)(&ar->data_lock);
> +
> +	peer = ath10k_peer_find(ar, vdev_id, stat->peer_macaddr.addr);
> +	if (!peer || !peer->sta) {
> +		ath10k_warn(ar, "not found %s with vdev id %u mac addr %pM for peer stats\n",
> +			    peer ? "sta" : "peer", vdev_id, stat->peer_macaddr.addr);
>   		return -EINVAL;
>   	}
>   
> -	arsta = (struct ath10k_sta *)sta->drv_priv;
> +	arsta = (struct ath10k_sta *)peer->sta->drv_priv;
>   	arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
>   	arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
>   	arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
>   	arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
> -	rcu_read_unlock();
>   
>   	return 0;
>   }
> @@ -266,6 +268,7 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>   	const struct wmi_tlv_peer_stats_info_ev *ev;
>   	const void *data;
>   	u32 num_peer_stats;
> +	u32 vdev_id;
>   	int ret;
>   
>   	tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
> @@ -284,15 +287,16 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>   	}
>   
>   	num_peer_stats = __le32_to_cpu(ev->num_peers);
> +	vdev_id = __le32_to_cpu(ev->vdev_id);
>   
>   	ath10k_dbg(ar, ATH10K_DBG_WMI,
>   		   "wmi tlv peer stats info update peer vdev id %d peers %i more data %d\n",
> -		   __le32_to_cpu(ev->vdev_id),
> +		   vdev_id,
>   		   num_peer_stats,
>   		   __le32_to_cpu(ev->more_data));
>   
>   	ret = ath10k_wmi_tlv_iter(ar, data, ath10k_wmi_tlv_len(data),
> -				  ath10k_wmi_tlv_parse_peer_stats_info, NULL);
> +				  ath10k_wmi_tlv_parse_peer_stats_info, &vdev_id);
>   	if (ret)
>   		ath10k_warn(ar, "failed to parse stats info tlv: %d\n", ret);
>   
> 
> ---
> base-commit: 4242625f272974dd1947f73b10d884eab3b277cd
> change-id: 20260325-ath10k-station-lookup-failure-be4dd6e81100
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

