Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B0110BA45B
	for <ath10k@archiver.kernel.org>; Fri, 27 Mar 2026 09:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzoqoXYuQZaBqV4FD+jiduVh3IufY7bkrQbuM50HkeE=; b=brDJBINeu+ynZnHneIIO7/UOdT
	N6VgwXgIXn052cX5o17grR6nSlOKu3Al6BCGsu42WR7cQZxB+mcZQMoM2IXvH0gMSdaCq3YMeXkIp
	80l6mrQm7I3rpyV0xkIcGSHsS8bNeYVttfuRJzqCVnf+JUAHtySVCGfaEN2xE+TxdioOqBKFTe+vN
	TIe/c2ccHpoiwmX0/jG44FPpURJrKDuQ+iPMggpjTWjitFXWQ51IavCw+mOuLMLdaeCpGbpI/WWjG
	t223OGlINgqVuKiLMgGM1SBshzmGM6uLm1QHq9NEEVMFJmHnJjKlK/b9bGpMSnIq1JfQEEhCJioim
	V5k57oSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63EE-000000072xs-3ykp;
	Fri, 27 Mar 2026 09:11:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63EA-000000072x0-3vXA
	for ath10k@lists.infradead.org;
	Fri, 27 Mar 2026 09:11:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vsLP1226312
	for <ath10k@lists.infradead.org>; Fri, 27 Mar 2026 09:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzoqoXYuQZaBqV4FD+jiduVh3IufY7bkrQbuM50HkeE=; b=DbO2qDvd7gwlYS/D
	St0Cwy5JmAxHk+BDotz4ZwZAEyiIZJZqQ803NItnERBl19mJvFh74ndAkoMgDqsb
	DzNQSY7Yz08crafp3EN50041qVg48RlrYDfXzR4vYjR3s5Vphg9EVtQhpZI3mptk
	ROduYZ+A8EENAe/uMPtNDvk2czv+lPerHlhjhq/JJG8uZsiQghOLCm66yklbcnay
	vDjYKEYfFHBxzcU1iK0CRtlPNxucZmTJpg113NR6X9REQ4RHnMyrrNNqcLU0HGUl
	B4k3AL9/5mxBf+R5875YGn3fWB1pnLkeLpFKQdUKZNAsUUEeXbIY9y4OaYJe7rhl
	vieJJw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59r1av0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 27 Mar 2026 09:11:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35ba4bf54beso234257a91.1
        for <ath10k@lists.infradead.org>; Fri, 27 Mar 2026 02:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774602697; x=1775207497; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzoqoXYuQZaBqV4FD+jiduVh3IufY7bkrQbuM50HkeE=;
        b=I1djlOz3vDTsAkCtIeo62UtSSfyi80kpxSd7thzLnHzdjc8HYIOBUrxHOcvSQoN1bN
         GOPgMTJdsrfBNDMNWj/UrMoYqaFFsarVxBufYVMePEfa5xUwk64bv+Gwdbs+hUeR7N2M
         AZiyUlij3aiInRAlq5NXfxK3nUbVzdaupa7IiHSh+QOijbSkjtuBPDLPDXKdv0Zrtwzt
         HLTRJT9fW0AVYSjx0IOFZGbW7audmbTlT4gWmM77nUZN/fBQ8KYKJwWm9bZeGUtmIxuZ
         1Pz/z81QU4MMfziGJ3AlI8m7ZD1qJzSN8X4MZNNFCCyV3QEJyUmKclMpiCob5nh35B9K
         Ogcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602697; x=1775207497;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzoqoXYuQZaBqV4FD+jiduVh3IufY7bkrQbuM50HkeE=;
        b=bzT8bN5JO/TbuCSDU/X2/7DeW4xH/Ie5+QA1vAZk9gJ4gZvTVmna/btrDtjCgV/7ea
         5n38nDWU+/URM97X/EmhLjPXe5J5yB2ZP0kUq03svD0vfpnFDJdxPuTeJtIV5SkQhCFv
         9fYiGQrHrmbTsCczNZ5QT+FtWvOR10K2ihIfz9DZMA9mXroXHVf971402nu565xGpz2c
         qKv9HMWX78nAcYxGtID2wY7iAvTbttTe0Zs4YVZQS6UHqkHARD32oVBY/6j5NBnmi2j8
         vpTKF19jtaNRsAkOWb+kn+Ok8GKXz2eBOgWPOIDGy2aaoKHGNJluphUHJ1AOTuq+9E20
         HPQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZAxy2BK6RUxL9nofMEQxq7JzFdmMwEF5azYachU/LK3ZtPBIHqwDE3b/YAVu4wfC6ewvCfNY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/gBUIZcjEl6BjuG24QphHHOg/m1EHNc95conJsOSoSGLHqtig
	XPjhpcoIP+1vCKY+ioJ0xWhiK5DP1eq4qK4ZgndAhQw3EC24CR2n7Pysbo6EDuFfkYFZqfU2Asg
	4nRcHu57yWhgu+SYGdPHS78d6195Yluk8fNXuCsGLAn4kT6f7odC+cCCDzZAol0stNgZDP917
X-Gm-Gg: ATEYQzz2cv6b18ZtdcK/2Qu07hw9Fi4v5iocaEYS3qOJZ3arQZDrXYFeZT+lxgTUv6+
	DOLy9wXycfuwXEh51vjGh9mkiv9bFyiaMJyqR2zizBAamdz+lLnQGHS81yAZnGXaYO26/wrIhqz
	H3ZIuPVJe7I9R1/HEi4b5ijsZKNDo+x2H0yugZ/Wlkfjc/g0litETpix1Gz4B/YLK8NjAjqg84p
	dfv5fDRNeOm+RQdlhW+PrtEs65DsLY7g/DPaw85A9leACGcWBAYNGutB2wllMEs7DpdkjWclFzz
	lVWmu0rb5VVHPhAO75YcseJtUStwUEFEITlilAhcz8ZZAqcUC26d4iMx2QnJAc4tfl+DDilGIKr
	ESi/f431eAz/7r/ym4S2R4oYq06Cq7gI+WezroA1S8YyUBLvmJkrp7LT05L/RLSiLYt7brC63fg
	4cMAoKpNhQyo+j3586vF8=
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr1977211a91.0.1774602696713;
        Fri, 27 Mar 2026 02:11:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr1977188a91.0.1774602696171;
        Fri, 27 Mar 2026 02:11:36 -0700 (PDT)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2d9165b3sm675000a91.1.2026.03.27.02.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:11:35 -0700 (PDT)
Message-ID: <3faa1fbb-afd8-4631-b3d1-ca81aaac8817@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 17:11:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath10k: fix station lookup failure
 during disconnect
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <20260325-ath10k-station-lookup-failure-v1-1-2e0c970f25d5@oss.qualcomm.com>
 <7af13762-3e98-4d77-bde2-c14cdb3b1e3c@molgen.mpg.de>
 <5033b613-3514-4686-895f-75bb8f523303@oss.qualcomm.com>
 <4c8c17c1-424c-4a7b-af68-81c099497bd7@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4c8c17c1-424c-4a7b-af68-81c099497bd7@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2NiBTYWx0ZWRfXxBMpHh3REUEU
 VEHnCiQRiKz9eO0gR5EyugDdrpm57BkAop4tO7ZjJbxrTqYptxCotBImsSdD8UIbeQiqAuAfHjW
 e4qcYummX5BxpP0ttLsqCtjUvwSx2GcqIs/WONQTUvhaLxMRVGfo6ivgIMOrEaoiWt/iu91tfx+
 QRDc8BRcM1nBdLybyvrdd+5/PkcrNDk9CAz7qWFfkiNq5LSsSReTXGL9Zkm3BiA//A83CK0Che5
 P9yWeYes+GR0c/cjAe7IG9AsV4RXpMMVhcz33nvbZKm1Uing/w1KW9yWX8+wVptO1EGZh6IFvS1
 OfqkejZfh4LIOeX9ToIVxkZxy+zimMnvv0Yf5WXS7URBkqnA/tgsOgy1Klvqrh3JM5RKi2AiWZM
 D+YMh7HwXy8xOfUGP59pjtQlXHIADO+mGYPwttRUy4LaexH3DchB8jD5WpOrqqL/WufTh70v2oj
 GKP29i4fMqEb8IVb7Pw==
X-Proofpoint-GUID: aH7OMeQ09T1v0sPwfDcDqsmjuSuUel26
X-Proofpoint-ORIG-GUID: aH7OMeQ09T1v0sPwfDcDqsmjuSuUel26
X-Authority-Analysis: v=2.4 cv=JaCxbEKV c=1 sm=1 tr=0 ts=69c649c9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bp-t3GDuXYEVE0SjF1UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_021139_091183_AA60A7E4 
X-CRM114-Status: GOOD (  20.11  )
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



On 3/27/2026 4:43 PM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Am 27.03.26 um 03:54 schrieb Baochen Qiang:
> 
>> On 3/27/2026 7:31 AM, Paul Menzel wrote:
> 
> […]
> 
>>> Am 25.03.26 um 04:05 schrieb Baochen Qiang:
>>>> Recent commit [1] moved station statistics collection to an earlier stage
>>>> of the disconnect flow. With this change in place, ath10k fails to resolve
>>>> the station entry when handling a peer stats event triggered during
>>>> disconnect, resulting in log messages such as:
>>>>
>>>> wlp58s0: deauthenticating from 74:1a:e0:e7:b4:c8 by local choice (Reason:
>>>> 3=DEAUTH_LEAVING)
>>>> ath10k_pci 0000:3a:00.0: not found station for peer stats
>>>> ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
>>>>
>>>> The failure occurs because ath10k relies on ieee80211_find_sta_by_ifaddr()
>>>> for station lookup. That function uses local->sta_hash, but by the time
>>>> the peer stats request is triggered during disconnect, mac80211 has
>>>> already removed the station from that hash table, leading to lookup
>>>> failure.
>>>>
>>>> Before commit [1], this issue was not visible because the transition from
>>>> IEEE80211_STA_NONE to IEEE80211_STA_NOTEXIST prevented ath10k from sending
>>>> a peer stats request at all: ath10k_mac_sta_get_peer_stats_info() would
>>>> fail early to find the peer and skip requesting statistics.
>>>>
>>>> Fix this by switching the lookup path to ath10k_peer_find(), which queries
>>>> ath10k's internal peer table. At the point where the firmware emits the
>>>> peer stats event, the peer entry is still present in the driver's list,
>>>> ensuring lookup succeeds.
>>>
>>> Out of curiosity, how can the statistics be printed?
>>
>> not quite understand your question, can you be more detailed?
> 
> The commit message starts with:
> 
> “… moved station statistics collection to an earlier stage …”
> 
> I was wondering how to print/dump these statistics.

still not quite understand, but let me try to answer:

mac80211 collects stats and send it to userspace over nl80211, userpsace tools like iw can
print it out.


> 
> 
> Kind regards,
> 
> Paul
> 
> 
>>>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
>>>>
>>>> Fixes: a203dbeeca15 ("wifi: mac80211: collect station statistics earlier when
>>>> disconnect") # [1]
>>>> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>> Closes: https://lore.kernel.org/ath10k/57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de
>>>> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
>>>> ---
>>>>    drivers/net/wireless/ath/ath10k/wmi-tlv.c | 26 +++++++++++++++-----------
>>>>    1 file changed, 15 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/
>>>> ath10k/wmi-tlv.c
>>>> index ec8e91707f84..01f2d1fa9d7d 100644
>>>> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>>>> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>>>> @@ -3,7 +3,7 @@
>>>>     * Copyright (c) 2005-2011 Atheros Communications Inc.
>>>>     * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>>>>     * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>>>> - * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>>>>     */
>>>>    #include "core.h"
>>>>    #include "debug.h"
>>>> @@ -14,6 +14,7 @@
>>>>    #include "wmi-tlv.h"
>>>>    #include "p2p.h"
>>>>    #include "testmode.h"
>>>> +#include "txrx.h"
>>>>    #include <linux/bitfield.h>
>>>>      /***************/
>>>> @@ -224,8 +225,9 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k *ar,
>>>> u16 tag, u16
>>>>                            const void *ptr, void *data)
>>>>    {
>>>>        const struct wmi_tlv_peer_stats_info *stat = ptr;
>>>> -    struct ieee80211_sta *sta;
>>>> +    u32 vdev_id = *(u32 *)data;
>>>>        struct ath10k_sta *arsta;
>>>> +    struct ath10k_peer *peer;
>>>>          if (tag != WMI_TLV_TAG_STRUCT_PEER_STATS_INFO)
>>>>            return -EPROTO;
>>>> @@ -241,20 +243,20 @@ static int ath10k_wmi_tlv_parse_peer_stats_info(struct ath10k
>>>> *ar, u16 tag, u16
>>>>               __le32_to_cpu(stat->last_tx_rate_code),
>>>>               __le32_to_cpu(stat->last_tx_bitrate_kbps));
>>>> -    rcu_read_lock();
>>>> -    sta = ieee80211_find_sta_by_ifaddr(ar->hw, stat->peer_macaddr.addr, NULL);
>>>> -    if (!sta) {
>>>> -        rcu_read_unlock();
>>>> -        ath10k_warn(ar, "not found station for peer stats\n");
>>>> +    guard(spinlock_bh)(&ar->data_lock);
>>>> +
>>>> +    peer = ath10k_peer_find(ar, vdev_id, stat->peer_macaddr.addr);
>>>> +    if (!peer || !peer->sta) {
>>>> +        ath10k_warn(ar, "not found %s with vdev id %u mac addr %pM for peer stats\n",
>>>> +                peer ? "sta" : "peer", vdev_id, stat->peer_macaddr.addr);
>>>>            return -EINVAL;
>>>>        }
>>>> -    arsta = (struct ath10k_sta *)sta->drv_priv;
>>>> +    arsta = (struct ath10k_sta *)peer->sta->drv_priv;
>>>>        arsta->rx_rate_code = __le32_to_cpu(stat->last_rx_rate_code);
>>>>        arsta->rx_bitrate_kbps = __le32_to_cpu(stat->last_rx_bitrate_kbps);
>>>>        arsta->tx_rate_code = __le32_to_cpu(stat->last_tx_rate_code);
>>>>        arsta->tx_bitrate_kbps = __le32_to_cpu(stat->last_tx_bitrate_kbps);
>>>> -      rcu_read_unlock();
>>>>          return 0;
>>>>    }
>>>> @@ -266,6 +268,7 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k *ar,
>>>>        const struct wmi_tlv_peer_stats_info_ev *ev;
>>>>        const void *data;
>>>>        u32 num_peer_stats;
>>>> +      u32 vdev_id;
>>>>        int ret;
>>>>          tb = ath10k_wmi_tlv_parse_alloc(ar, skb->data, skb->len, GFP_ATOMIC);
>>>> @@ -284,15 +287,16 @@ static int ath10k_wmi_tlv_op_pull_peer_stats_info(struct ath10k
>>>> *ar,
>>>>        }
>>>>          num_peer_stats = __le32_to_cpu(ev->num_peers);
>>>> +        vdev_id = __le32_to_cpu(ev->vdev_id);
>>>>          ath10k_dbg(ar, ATH10K_DBG_WMI,
>>>>               "wmi tlv peer stats info update peer vdev id %d peers %i more data %d\n",
>>>> -           __le32_to_cpu(ev->vdev_id),
>>>> +           vdev_id,
>>>>               num_peer_stats,
>>>>               __le32_to_cpu(ev->more_data));
>>>>          ret = ath10k_wmi_tlv_iter(ar, data, ath10k_wmi_tlv_len(data),
>>>> -                  ath10k_wmi_tlv_parse_peer_stats_info, NULL);
>>>> +                  ath10k_wmi_tlv_parse_peer_stats_info, &vdev_id);
>>>>        if (ret)
>>>>            ath10k_warn(ar, "failed to parse stats info tlv: %d\n", ret);
>>>
>>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>>
>>>
>>> Kind regards,
>>>
>>> Paul


