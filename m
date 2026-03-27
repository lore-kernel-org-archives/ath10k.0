Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60DD10BA45F
	for <ath10k@archiver.kernel.org>; Fri, 27 Mar 2026 09:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0hJfYv1/GuKAl+MB6vp1FW4DQsJZHdgRapfjChOAro=; b=SaZYsslYzN/uOk6s8+hriGirAf
	JOEniAnBJP4kxl3VX+F/r0RLE3vkp14yFh/Z422BF27qVPyeQYDW/YppbUqMjXW4adC2D9fFelUfv
	UUXDyqDW4JrKLZXBZnVmI+u6F6F5XNZ8Gq8sxk4wQ1UMZHs+0vIkdiebR30bK8/fGpkADx63yFTwT
	BChb0/l2O41mkxLfU1MOdudYN3pVV5oqYRtGj3+7o+n4azCSLlEEJMk9iiy4GweIpU7nsY2RfnQGh
	dGdyL458x/nQFNKh9WUdFusmmGQgRUdxojSwGhWEI89es5hwYn4yNNm/Om2UWhzN33Dyoo8j+weRT
	XS6N/Shg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Tk-000000074OF-1tcn;
	Fri, 27 Mar 2026 09:27:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Tj-000000074O9-1LLL
	for ath10k@bombadil.infradead.org;
	Fri, 27 Mar 2026 09:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W0hJfYv1/GuKAl+MB6vp1FW4DQsJZHdgRapfjChOAro=; b=Nw0W2fKbp9Tly0tePJircg20s/
	UwMO9/LheXrATDKypelGVzv2fvYUjB9xRukcv60IZ+IM+q81nXLDXh3+/6a3cy8IdDqwkBMxPtvwz
	KuuMHGGlZsP2Hu3HtlVt9nqhQs8rcGg18W1t6jzbt/tPleUhn3Ch5pQVx362jhQaX9LDmojebgUmy
	OUrioe5sEqHniDEqc6ISGxzqPvoUqqtRREq+xOtIz+l+nD8Y3zJ4gyJNWg1exQ+xvUVMEnhr/bGfg
	U8HJYjhmDr5A8+ho+8O9qGBKviejn5eYGZOKZfiHG+ErzULK+TLHY4jPMJVnKb+LlbjzU9ck+ThtX
	lHOnBt3g==;
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Tf-0000000A4LQ-2MqQ
	for ath10k@lists.infradead.org;
	Fri, 27 Mar 2026 09:27:41 +0000
Received: from [141.14.14.115] (v115.vpnx.molgen.mpg.de [141.14.14.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 436854C2C37F03;
	Fri, 27 Mar 2026 10:27:21 +0100 (CET)
Message-ID: <95be98bf-59df-4e32-a6b2-7f873152045e@molgen.mpg.de>
Date: Fri, 27 Mar 2026 10:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
 <7af13762-3e98-4d77-bde2-c14cdb3b1e3c@molgen.mpg.de>
 <5033b613-3514-4686-895f-75bb8f523303@oss.qualcomm.com>
 <4c8c17c1-424c-4a7b-af68-81c099497bd7@molgen.mpg.de>
 <3faa1fbb-afd8-4631-b3d1-ca81aaac8817@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <3faa1fbb-afd8-4631-b3d1-ca81aaac8817@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_092739_789237_9796EE57 
X-CRM114-Status: GOOD (  16.38  )
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

Dear Baochen,


Thank you for your reply.

Am 27.03.26 um 10:11 schrieb Baochen Qiang:

> On 3/27/2026 4:43 PM, Paul Menzel wrote:

>> Am 27.03.26 um 03:54 schrieb Baochen Qiang:
>>
>>> On 3/27/2026 7:31 AM, Paul Menzel wrote:
>>
>> […]
>>
>>>> Am 25.03.26 um 04:05 schrieb Baochen Qiang:
>>>>> Recent commit [1] moved station statistics collection to an earlier stage
>>>>> of the disconnect flow. With this change in place, ath10k fails to resolve
>>>>> the station entry when handling a peer stats event triggered during
>>>>> disconnect, resulting in log messages such as:
>>>>>
>>>>> wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason: 3=DEAUTH_LEAVING)
>>>>> ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>>> ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>>>>
>>>>> The failure occurs because ath10k relies on ieee80211_find_sta_by_ifaddr()
>>>>> for station lookup. That function uses local->sta_hash, but by the time
>>>>> the peer stats request is triggered during disconnect, mac80211 has
>>>>> already removed the station from that hash table, leading to lookup
>>>>> failure.
>>>>>
>>>>> Before commit [1], this issue was not visible because the transition from
>>>>> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST prevented ath10k from sending
>>>>> a peer stats request at all: ath10k_mac_sta_get_peer_stats_info() would
>>>>> fail early to find the peer and skip requesting statistics.
>>>>>
>>>>> Fix this by switching the lookup path to ath10k_peer_find(), which queries
>>>>> ath10k's internal peer table. At the point where the firmware emits the
>>>>> peer stats event, the peer entry is still present in the driver's list,
>>>>> ensuring lookup succeeds.
>>>>
>>>> Out of curiosity, how can the statistics be printed?
>>>
>>> not quite understand your question, can you be more detailed?
>>
>> The commit message starts with:
>>
>> “… moved station statistics collection to an earlier stage …”
>>
>> I was wondering how to print/dump these statistics.
> 
> still not quite understand, but let me try to answer:
> 
> mac80211 collects stats and send it to userspace over nl80211,
> userpsace tools like iw can print it out.

Thank you. It looks like, one way is `sudo iw dev wlp58s0 station dump`.

>>>>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
>>>>>
>>>>> Fixes: a203dbeeca15 ("wifi: mac80211: collect station statistics earlier when disconnect") # [1]
>>>>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>> Closes: https://lore.kernel.org/ath10k/57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de
>>>>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>>>> ---
>>>>>     drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++++++++-----------
>>>>>     1 file changed, 15 insertions(+), 11 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/
>>>>> ath10k/wmi-tlv.c
>>>>> index ec8e91707f84..01f2d1fa9d7d 100644
>>>>> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>>>>> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>>>>> @@ -3,7 +3,7 @@
>>>>>      * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>>>      * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>>>      * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>>>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>>      */
>>>>>     #include "core.h"
>>>>>     #include "debug.h"
>>>>> @@ -14,6 +14,7 @@
>>>>>     #include "wmi-tlv.h"
>>>>>     #include "p2p.h"
>>>>>     #include "testmode.h"
>>>>> +#include "txrx.h"
>>>>>     #include <linux/bitfield.h>
>>>>>       /***************/
>>>>> @@ -224,8 +225,9 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar,
>>>>> u16 tag, u16
>>>>>                             const void *ptr, void *data)
>>>>>     {
>>>>>         const struct wmi_tlv_peer_stats_info *stat = ptr;
>>>>> -    struct ieee80211_sta *sta;
>>>>> +    u32 vdev_id = *(u32 *)data;
>>>>>         struct ath10k_sta *arsta;
>>>>> +    struct ath10k_peer *peer;
>>>>>           if (tag != WMI_TLV_TAG_STRUCT_PEER_STATS_INFO)
>>>>>             return -EPROTO;
>>>>> @@ -241,20 +243,20 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k
>>>>> *ar, u16 tag, u16
>>>>>                __le32_to_cpu(stat->last_tx_rate_code),
>>>>>                __le32_to_cpu(stat->last_tx_bitrate_kbps));
>>>>> -    rcu_read_lock();
>>>>> -    sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
>>>>> -    if (!sta) {
>>>>> -        rcu_read_unlock();
>>>>> -        ath10k_warn(ar, "not found station for peer stats\n");
>>>>> +    guard(spinlock_bh)(&ar->data_lock);
>>>>> +
>>>>> +    peer = ath10k_peer_find(ar, vdev_id, stat->peer_macaddr.addr);
>>>>> +    if (!peer || !peer->sta) {
>>>>> +        ath10k_warn(ar, "not found %s with vdev id %u mac addr %pM for peer stats\n",
>>>>> +                peer ? "sta" : "peer", vdev_id, stat->peer_macaddr.addr);
>>>>>             return -EINVAL;
>>>>>         }
>>>>> -    arsta = (struct ath10k_sta *)sta->drv_priv;
>>>>> +    arsta = (struct ath10k_sta *)peer->sta->drv_priv;
>>>>>         arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
>>>>>         arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
>>>>>         arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
>>>>>         arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
>>>>> -      rcu_read_unlock();
>>>>>           return 0;
>>>>>     }
>>>>> @@ -266,6 +268,7 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>>>>>         const struct wmi_tlv_peer_stats_info_ev *ev;
>>>>>         const void *data;
>>>>>         u32 num_peer_stats;
>>>>> +      u32 vdev_id;
>>>>>         int ret;
>>>>>           tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
>>>>> @@ -284,15 +287,16 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>>>>>         }
>>>>>           num_peer_stats = __le32_to_cpu(ev->num_peers);
>>>>> +        vdev_id = __le32_to_cpu(ev->vdev_id);
>>>>>           ath10k_dbg(ar, ATH10K_DBG_WMI,
>>>>>                "wmi tlv peer stats info update peer vdev id %d peers %i more data %d\n",
>>>>> -           __le32_to_cpu(ev->vdev_id),
>>>>> +           vdev_id,
>>>>>                num_peer_stats,
>>>>>                __le32_to_cpu(ev->more_data));
>>>>>           ret = ath10k_wmi_tlv_iter(ar, data, ath10k_wmi_tlv_len(data),
>>>>> -                  ath10k_wmi_tlv_parse_peer_stats_info, NULL);
>>>>> +                  ath10k_wmi_tlv_parse_peer_stats_info, &vdev_id);
>>>>>         if (ret)
>>>>>             ath10k_warn(ar, "failed to parse stats info tlv: %d\n", ret);
>>>>
>>>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul


PS: For the record:

```
$ sudo iw dev wlp58s0 station dump
Station 8c:6a:8d:xx:xx:xx (on wlp58s0)
	authorized:	yes
	authenticated:	yes
	associated:	yes
	preamble:	long
	WMM/WME:	yes
	MFP:		no
	TDLS peer:	no
	inactive time:	136 ms
	rx bytes:	42923460
	rx packets:	30379
	tx bytes:	527970
	tx packets:	4543
	tx retries:	0
	tx failed:	0
	beacon loss:	0
		beacon rx:	254
	rx drop misc:	104
	signal:  	-35 [-43, -39] dBm
	signal avg:	-35 [-44, -37] dBm
	beacon signal avg:	-35 dBm
	tx bitrate:	144.4 MBit/s MCS 15 short GI
	tx duration:	1386481 us
	rx bitrate:	144.4 MBit/s MCS 15 short GI
	rx duration:	0 us
	airtime weight: 256
	DTIM period:	1
	beacon interval:100
	short slot time:yes
	connected time:	61 seconds
	associated at [boottime]:	6663.920s
	associated at:	1774603392069 ms
	current time:	1774603452468 ms
```

