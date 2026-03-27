Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1BF10BA420
	for <ath10k@archiver.kernel.org>; Fri, 27 Mar 2026 02:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBu33MtmGdnbpd1MrIxjWk6xCAYbN7QbGKHAkXreDX4=; b=dkM5Mrph2wq4OF1dotApFvR2dy
	G6XBBeY0ZfYppAtzMnTyd7a6LDiRsDebJ+JczT0EAqp+jgeUdTxw65heONaBcqvMOK/Ka5Wt+e3Q1
	/Dy28yUZ6h9KNp2Idb+/sWRaLAawv0AADGw0KwHmnSlRT1qV4NkXZu0qv29wFTmvsZ+BhEZU7sn9+
	qBJGrsdY+pVt05vrBPHJCxk6sYAzB/3IKTm3+UpQBNykLTY8KLXggluGNWd12CyFCR+N/jvZpmqy7
	dV1pi3oTPUK35Ze76YTXCGmG46wXPiVm6xHdscdr0avPq9MWKfW7xb6R3rvsVVPhI/w2Nkd5hsCJN
	54mxXASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xL2-00000006a6e-299y;
	Fri, 27 Mar 2026 02:54:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xKy-00000006a61-08ZS
	for ath10k@lists.infradead.org;
	Fri, 27 Mar 2026 02:54:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R10gU1334263
	for <ath10k@lists.infradead.org>; Fri, 27 Mar 2026 02:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBu33MtmGdnbpd1MrIxjWk6xCAYbN7QbGKHAkXreDX4=; b=MB+ZRLJdbe1gERQh
	NpCJDU9U5VgacYBeIALXVNar0VTJJPbfPobJu9UzY5c5JRS0tf8sknWhiZa7sHff
	Ko/mXQ/zZxZhsgbSGa2RmZKmsqd3vxJwyIJt0bhFl6JFK750HmJm9EzNrf39aP+2
	pPzrEZhhRQWpkRkSp0IgaReroZxSFMYrnedAEay2LSBCJF+N4oHhW6lErCu1k3K6
	EtiFNEyItSIJkEwEq4j71QHfZKHaVKI/quLPfdIUHJB2gGwFWLCYPvEgyMAJ+h94
	+VCFNSjaFWS9S4Pdg9Nnm4aOSXyeVUnheA1/DYr2oCdcdhwSIdftlo5ajcw+G6j2
	SKEUqQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d527yu8dj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 27 Mar 2026 02:54:14 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-358f058973fso2310663a91.1
        for <ath10k@lists.infradead.org>; Thu, 26 Mar 2026 19:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774580054; x=1775184854; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBu33MtmGdnbpd1MrIxjWk6xCAYbN7QbGKHAkXreDX4=;
        b=e8xgC6idP3D62/1O+xDYjaifTQwmoeflU0taf5fNdFJdboirMdai3o76rkh/CrwmLJ
         aIkOaPW6BcAZgH1iXvSYrHimiAZpXWlQsjqGf0ufu/IZWiXFuwJtWxGmztzJFHHoVJyB
         K6Ezpa94FXjktV5K0RqPfCBJkrL2s94/nPs7l6pTnrv8vcRWlpeO84274cs41tVILs7W
         DgdQMP1kHxvo8SOPK1rn/MK00JD2fQrfb96pOKfrr71MNhfiybxTiruYU4upxBnQknsQ
         AuILhKCGFR08utbJ+EChSDecSZFxUu89ky3oE6tJ/ZEmagggJV0JtV0Uxu8c5KYIgqzJ
         u5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774580054; x=1775184854;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBu33MtmGdnbpd1MrIxjWk6xCAYbN7QbGKHAkXreDX4=;
        b=GiacXsRO8DrgeKixAr1WNhwp3DTuLoEai5AbQVHavDy2hHLCS3tp+p/CuGFKggktKM
         EEHBVOOHmI70LI4GHKENYnFYzrf/+QS0R1oq1Aic6PjojiMjE/lzc7QPKBwPw1o9Wzuv
         sI8aKB2JByf9ESF+BobkQy69Cq4zl7s/YUs9FHU8C8jS9sKARpdDZFVYw39+WGeOUbo5
         7qWtFEhMIf3pS7sIrFYQz0dcMchyACRLH4LSajg+9d0fuSMQ0qsySwE6tNIyGsFArbKP
         +vVabJOHbKaHBL7lBniQZxFhlx2uDtoIq7mNWC2xx55VViy/DxsQarMAKUQCgmDgpHoy
         Dg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXCBa0z0vytbfWxkCDJM7ESf9Lb8ZLhyjJH8zTEEBuP3WPBspOA6ciOoWW5jfGmYgPepPxAkKg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5AFZEriLeZs/fLU0LB1hIO0MiS8heKrW14q8HfWhSufaPWbSn
	yjBHBtpoeTxF7QWdNUNMjnvPdlPBCZga15g932CGWgqciJHZeaVrpDEuzZmxqVbLsw7ImzQItCO
	Li6ZNQEKVAEewmcLYSLgZBWwtmSB8I7ZMaS5vFV7DtcmDwE/YwKKH2SgRXw4090Pc
X-Gm-Gg: ATEYQzx41Si3KiuRhi7w7jQ18XFI3cigr//0qEwl0kmYIqqphlHw5b2R5i3Z8IRMcYi
	crQbkwamhDHcV7h2fgLvmQ18ZVaSjJyScfEgJZeez7/O8z9Vk/d/X/tbBNGuC60PofOHTbs9tIZ
	rPp2/r/5VuCYLL86t3bL+aObmLxr+8BPaHU2rHUdW9dYGjMEGJvCBdfa/DoOZK5xe3huRaxjBzt
	z1HU6OI6IDbt1bY9ZbbBBYwg/xK4D+EK9qDehuq3SC5KlsKULIok+oCovj011VQ9/Iac9oxOjCV
	p/E03DgumNkiGkYIfwB5m9CujmRpFyd5PfkwgYbE3Yew2Wqo4RvcgjmY/hUsQ9MAmDtdY04Vxmf
	6aRcW2lnCZFmF3v4hFg9ttIlGqabby0gnQDWnsgoJBYgcsqVbnZu8oO4EOK1tU3zm8axsxe8kgr
	mSYLEV44sNBKnkkzQ9zCo=
X-Received: by 2002:a17:90b:38cf:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35c300b9806mr899227a91.17.1774580053604;
        Thu, 26 Mar 2026 19:54:13 -0700 (PDT)
X-Received: by 2002:a17:90b:38cf:b0:35b:e4f8:7cc7 with SMTP id 98e67ed59e1d1-35c300b9806mr899199a91.17.1774580052985;
        Thu, 26 Mar 2026 19:54:12 -0700 (PDT)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22a52afdsm2856268a91.1.2026.03.26.19.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 19:54:12 -0700 (PDT)
Message-ID: <5033b613-3514-4686-895f-75bb8f523303@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:54:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
 <7af13762-3e98-4d77-bde2-c14cdb3b1e3c@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7af13762-3e98-4d77-bde2-c14cdb3b1e3c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dLurWeZb c=1 sm=1 tr=0 ts=69c5f156 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=l6r93IW1dCNhaczwAn0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: eSLFjgRm295z04dvuVHL3BWR10QF-KCI
X-Proofpoint-GUID: eSLFjgRm295z04dvuVHL3BWR10QF-KCI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAyMCBTYWx0ZWRfX0BbACtysfRh3
 EH6E7NfCrjizyT1w+Q1xJpsUS8LT326KbwNcgQCqJKaiey9qe0oPbJIMV545dO6HIotpah8zxXi
 P0ycXrhtN35pkWXdWoB5WchW3io8ZmFg2r+rj+9EIFLLhWl1/QeEASYGKb2VttfW4Cg0Edym5lS
 eCcOL49+uyUlKXu33ZHpmQwSN2WXGKe52fDyRb2PlxZPo/DmXNAnpAvjtGx+pLZzOyE40mCLQ9f
 hnja08yaSqBw2N4FYbmp5Oyxt2LGAWs4s91kKMRr2QaUozOm9GbmjO4W5MGHBGaBqmn4pob2+V8
 uHRYCN7QdIC8Wf9p/dOFfUSmIdxnz6BtEgUdwZ9ZLWh9EfFA7Tz3KEYeJ2riwmU+4OgDczxqfbo
 ogXBUVRnZJ7j5qwcsmO94UiqAyAcZgz2t39wb/6uBp/xwxlrc6314w0K1qwy7YlbMD8HTgUTLeQ
 rwfxn6Fc1w8lkdyQhMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_195416_189576_5CD46680 
X-CRM114-Status: GOOD (  22.95  )
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



On 3/27/2026 7:31 AM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Thank you for sending the patch out.
> 
> Am 25.03.26 um 04:05 schrieb Baochen Qiang:
>> Recent commit [1] moved station statistics collection to an earlier stage
>> of the disconnect flow. With this change in place, ath10k fails to resolve
>> the station entry when handling a peer stats event triggered during
>> disconnect, resulting in log messages such as:
>>
>> wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
>> ath10k_pci 0000:3a:00.0: not found station for peer stats
>> ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>
>> The failure occurs because ath10k relies on ieee80211_find_sta_by_ifaddr()
>> for station lookup. That function uses local->sta_hash, but by the time
>> the peer stats request is triggered during disconnect, mac80211 has
>> already removed the station from that hash table, leading to lookup
>> failure.
>>
>> Before commit [1], this issue was not visible because the transition from
>> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST prevented ath10k from sending
>> a peer stats request at all: ath10k_mac_sta_get_peer_stats_info() would
>> fail early to find the peer and skip requesting statistics.
>>
>> Fix this by switching the lookup path to ath10k_peer_find(), which queries
>> ath10k's internal peer table. At the point where the firmware emits the
>> peer stats event, the peer entry is still present in the driver's list,
>> ensuring lookup succeeds.
> 
> Out of curiosity, how can the statistics be printed?

not quite understand your question, can you be more detailed ?

> 
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
>>
>> Fixes: a203dbeeca15 ("wifi: mac80211: collect station statistics earlier when
>> disconnect") # [1]
>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>> Closes: https://lore.kernel.org/ath10k/57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de
>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++++++++-----------
>>   1 file changed, 15 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/
>> ath10k/wmi-tlv.c
>> index ec8e91707f84..01f2d1fa9d7d 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> @@ -3,7 +3,7 @@
>>    * Copyright (c) 2005-2011 Atheros Communications Inc.
>>    * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>    * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>    */
>>   #include "core.h"
>>   #include "debug.h"
>> @@ -14,6 +14,7 @@
>>   #include "wmi-tlv.h"
>>   #include "p2p.h"
>>   #include "testmode.h"
>> +#include "txrx.h"
>>   #include <linux/bitfield.h>
>>     /***************/
>> @@ -224,8 +225,9 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar,
>> u16 tag, u16
>>                           const void *ptr, void *data)
>>   {
>>       const struct wmi_tlv_peer_stats_info *stat = ptr;
>> -    struct ieee80211_sta *sta;
>> +    u32 vdev_id = *(u32 *)data;
>>       struct ath10k_sta *arsta;
>> +    struct ath10k_peer *peer;
>>         if (tag != WMI_TLV_TAG_STRUCT_PEER_STATS_INFO)
>>           return -EPROTO;
>> @@ -241,20 +243,20 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar,
>> u16 tag, u16
>>              __le32_to_cpu(stat->last_tx_rate_code),
>>              __le32_to_cpu(stat->last_tx_bitrate_kbps));
>>   -    rcu_read_lock();
>> -    sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
>> -    if (!sta) {
>> -        rcu_read_unlock();
>> -        ath10k_warn(ar, "not found station for peer stats\n");
>> +    guard(spinlock_bh)(&ar->data_lock);
>> +
>> +    peer = ath10k_peer_find(ar, vdev_id, stat->peer_macaddr.addr);
>> +    if (!peer || !peer->sta) {
>> +        ath10k_warn(ar, "not found %s with vdev id %u mac addr %pM for peer stats\n",
>> +                peer ? "sta" : "peer", vdev_id, stat->peer_macaddr.addr);
>>           return -EINVAL;
>>       }
>>   -    arsta = (struct ath10k_sta *)sta->drv_priv;
>> +    arsta = (struct ath10k_sta *)peer->sta->drv_priv;
>>       arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
>>       arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
>>       arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
>>       arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
>> -    rcu_read_unlock();
>>         return 0;
>>   }
>> @@ -266,6 +268,7 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>>       const struct wmi_tlv_peer_stats_info_ev *ev;
>>       const void *data;
>>       u32 num_peer_stats;
>> +    u32 vdev_id;
>>       int ret;
>>         tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
>> @@ -284,15 +287,16 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>>       }
>>         num_peer_stats = __le32_to_cpu(ev->num_peers);
>> +    vdev_id = __le32_to_cpu(ev->vdev_id);
>>         ath10k_dbg(ar, ATH10K_DBG_WMI,
>>              "wmi tlv peer stats info update peer vdev id %d peers %i more data %d\n",
>> -           __le32_to_cpu(ev->vdev_id),
>> +           vdev_id,
>>              num_peer_stats,
>>              __le32_to_cpu(ev->more_data));
>>         ret = ath10k_wmi_tlv_iter(ar, data, ath10k_wmi_tlv_len(data),
>> -                  ath10k_wmi_tlv_parse_peer_stats_info, NULL);
>> +                  ath10k_wmi_tlv_parse_peer_stats_info, &vdev_id);
>>       if (ret)
>>           ath10k_warn(ar, "failed to parse stats info tlv: %d\n", ret);
> 
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> 
> 
> Kind regards,
> 
> Paul


