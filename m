Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E541606A326
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=40/IoTN4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jrfsm567;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GQZdzjAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=; b=40/IoTN4Jg0OTT
	mfoYR3ekGtbh4jfutAjp9svvT37Vn+6C8vQ0GDHFUJ1so/JErX5jvk19JEqpDYI1jbfd7O4S+p021
	kOetozKfWI9t7QzXpLVq3MCVgMpcI48oQ0qzGalLDuZMOQoPhXk+XgXNThZX79hl22Mgxvn77s/uX
	EMZ/aXV1gbPZ3Cw6N4dHU6+RipzAlc/g7Y3Wj4MJ6w2pwrIImlffypAmttHbm3zMyC2j4otveRpQt
	L++y6irwGycOcl5G04YNZBhhsfRlTriAmeeT9DW6wlocjq85tsrbg0B4GfhsEfgrrvHkia3VSJQue
	3BynQXpiBp+FwEGkjYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTZo-0000000CFH5-2cAv;
	Thu, 26 Nov 2026 07:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWTZl-0000000CFGM-3uOn
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 07:07:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36IrU393974
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 07:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=; b=Jrfsm567H+fdNQx/
	lUrkwcVjzdUrijpNhqPBmsVygEcSaJbtAM8e17cIJ/6hbA5vxUDhBMOJicf71FKy
	rx/ordM1e4mpsCuEKID5GZfvz2yxTLeC5FdQC2TtqHRbRhzSiKBasS3OtKBLgPUa
	TC4wFCV32pawJDR4aUVKhhqZ9VvSbNY7glW4uUM3VL/ixMVVTFm9J3Hue+oyPcyL
	tzFkxd1yULQnEp8klV/v0ldTDhSlSOzkLSoEB9kZjR9YLXPjZ7wweSyA1G4vpeAI
	eODYU1JjGEhWpnHNYneeWogKZ3HPatKY0mpgm73BXznZw/z/0U8MLzoF/5vb+MQS
	oyVMDA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y1use-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 07:07:25 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8b97460a133so5129142b3a.3
        for <ath10k@lists.infradead.org>; Wed, 25 Nov 2026 23:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795676845; x=1796281645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=GQZdzjAN69zCg5489+YGS6dQqd4oBu+WyL7ThQ+2zDJkxxFO0DjKC2Ahl4nDz9+/LH
         f63uYmlRqRQbVs2/O7hmsEs+11HVwa7WybU3IdycabPFSa6dtK02rJXwwYPBEeLOx/hJ
         9q3Ws4UCyMFcGmMxRrW8pMYIFPsmwwxzthjDV2buVZf8ExLqImhzUCswQ+J1S6dDLUYW
         RndbhGOihyvo5g8HIrM/M/05zirbFg1VIgFhSSPXP/vIZDXhcTjLWuz/InYMVMvKPo6Y
         jLLT05klUWXMFCjPPGLGF3CyNfLBG8HAa46C4ljopjmEE4w7uA75seZLbyFSysz+E4z6
         JMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795676845; x=1796281645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWtJ7O/weMJzv9paex9qV3Mx7PBaOy4zcuYq1hMdYAs=;
        b=uuZYedZ79n6LeTsO+CmXqj45MaxB3SxG+1CA/rEp2JT6TVU0jkhjYPbR2IYOQfN+FJ
         hYfAH3xzxikoqw7sRV1cSGFZA9LtV7THYENNBGMNNUqE9mNQA3CIYhWXkAFqMX1PEbcA
         YpMdS2GLZCYNbjIab2Wi+JA8P9EhQSEXKsCE0NN3vpgprfrt+SoRhntxiqADHMC8btg+
         q0mcb94vVkdMLPnTUIm1RUm+17tA+Zo8g8aFCpgcDKo/2AJu5ZN45iEyxJhuFg5DjQI6
         8iVfM0MJ5mkyecF6mX6rHlgvE3uJlXMb3n4ApwkB6HrtoS/IBZ6HndZZRDO9Tj1xtLDQ
         YOxw==
X-Forwarded-Encrypted: i=1; AL+hErGltjyJw4ZTMsi7+IIwRZpgXJkJwKodf8Q1u6/2CsJ8FEVuTDv2qpp+2h1w9YRt6roWYLI50pQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/JtPs6N+UbVurp1tEVpCA2UWS4czI+peQmIG9+23TEsn6NCS59
	1o3qf5s21/dxkT+DKfbD2QA5WQ2s+7dOrvWIYO+7uyZxml9okVq2pURK6OovmDZu1y370j8MjEj
	PKS4+EjQP1VPmjuD2deSG1fwusuGgIzMnpJI3tx7d896/cU5VJqhiMoquj37HECfd
X-Gm-Gg: AZFdTZca1Cxd2ITAVVR2j+Vz+ca8hM8UyWT5VLBq8ELEADyNyF/P2JzMRJM4uNa6BZH
	2m41CHKoSfzOGxk9cJNRZI3cC9Cd/6VbwxzS+FDLt9vt+6fbGhdyrED1guTD1F3g46dwznGV5G0
	vjgRfiAwdoOoiQ34LRN/SThCeaqRH1sTC2JRCDbIovTElRkLqV/JnB/v7t/AS5DWAnK4wMQza4I
	MioxYpk9X80TNwQHpSWxBFGWr/FZ0CVURB0F0ln30AXZyvzAYq8XL/8iVeuW96R7kex5plPE+Bd
	wYbK5+Dsml6DvcX6jgfQ6YlE5tV4SNPGFu5gLHh6eizjYhbYTLPpT1+LxzDkDccTOmGDbZ/f+uy
	FCtRaK0DsBw/tKWlSH9drldBD7tvVpRGgG27PGvqn0Fp4pSJ3VlSTFEHuSmeniV6TunpCj+ZF8E
	fl0GOoy90nfVkg2+rp9UK7uxfecHWlSSE2lzjjpsxB
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440916b3a.29.1795676844682;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
X-Received: by 2002:a05:6a00:2d14:b0:8b6:400d:7cc9 with SMTP id d2e1a72fcca58-8c87c671eabmr19440878b3a.29.1795676844204;
        Wed, 25 Nov 2026 23:07:24 -0800 (PST)
Received: from [10.133.33.167] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm10329081b3a.17.2026.11.25.23.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 23:07:23 -0800 (PST)
Message-ID: <0bf83f69-f069-444b-a45f-b4582b544405@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:07:20 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 04/10] wifi: ath10k: also wake remaining
 blocked waiters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-4-53d6a04490e0@oss.qualcomm.com>
 <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3zK1=Fsrkmtmuq7Q3xnNMuCE1R0J8Pe-rAJun9igCcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX6/6VJCX34yIk
 DwX4roGMO4B5M/1frrXwxeJ8or6SPrek/+POViNBjUbi3u9t5dvTApqWJtYkTbGiQhLHAY4cQdZ
 X5g6BihwEYIR8yxc3sP/imhNddmKERgmC0m1DSzqZhtfyNwERUfA2J9SdgekG2RaL2c5l8zIw7s
 /rDAtEKP3L3sqTnDbuktStI640yMGhHRHqYK/Ph1r1HsA2tGJJOTDK7Ez/xOJOD45Qb+W6tI35F
 LdXHKfhCjRFMs1rRjha5qPGrPWpI+4xXpPwmVHZCvIouSf/dZZNrx3jMBRqri7TWh7PQh13R0o5
 6WqKkhZJZBIadkwvIxnkmHowE76WQJLeTrQE7ZlBY5QDzPry5/EMnce0gr7viaYUYPtEHn8QjR8
 sNLYDyBPfQb4PGn1dsFxsr8vK9lwdiA1+7VM4aBnE2NWE7CAcw4JCG0mnLNVOsYjIZ77K2x2eh5
 CwjwC3zGio4o86bNIaA==
X-Proofpoint-GUID: 8HvuEDbFulwXIecyp-Wra3JbUyFPmwmd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfX9iQFqeAVqbg8
 yclNZcmFs4NmOvWxlsX1JMRdAn133jp31h+Zb6G8PJHQww+EwV0HOcFKDetHyE9kgaGXjpasQkt
 H2Ou10cZhSHFhxNzMgb8hCI/Y6YcZQ4=
X-Proofpoint-ORIG-GUID: 8HvuEDbFulwXIecyp-Wra3JbUyFPmwmd
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07daad cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=468j3veBC24j7YoULXoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_230726_126508_1B0DEAF0 
X-CRM114-Status: GOOD (  17.29  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/25/2026 6:35 PM, Loic Poulain wrote:
> On Fri, Nov 20, 2026 at 9:42 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>
>> ath10k_core_wake_all_waiters() still misses several completions,
>> leaving their callers blocked after the driver has given up on the
>> device.
>>
>> In particular, callers waiting on peer_delete_done, target_suspend,
>> wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
>> continue sleeping until their individual timeouts expire even though
>> no further progress is possible. The WoW and suspend waits are on the
>> suspend and resume paths, where these delays consume watchdog budget.
>>
>> Add the missing completions to ath10k_core_wake_all_waiters() so the
>> callers are released immediately.
>>
>> peer_delete_done is not otherwise reinitialized before every wait.
>> A completion left signaled by recovery would therefore make a later
>> peer-delete wait return immediately. Reinitialize it before sending
>> each peer-delete command.
>>
>> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>>
>> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 5 +++++
>>   drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index 3bb4d2742c30..99960f12dc66 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -2542,7 +2542,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
>>          complete(&ar->install_key_done);
>>          complete(&ar->vdev_setup_done);
>>          complete(&ar->vdev_delete_done);
>> +       complete(&ar->peer_delete_done);
>> +       complete(&ar->target_suspend);
>> +       complete(&ar->wow.wakeup_completed);
>> +       complete(&ar->peer_stats_info_complete);
>>          complete(&ar->thermal.wmi_sync);
>> +       complete(&ar->wmi.radar_confirm);
>>          complete(&ar->bss_survey_done);
>>          wake_up(&ar->htt.empty_tx_wq);
>>          wake_up(&ar->wmi.tx_credits_wq);
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 74aca0af11c8..695df1821e5c 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
>>
>>          lockdep_assert_held(&ar->conf_mutex);
>>
>> +       reinit_completion(&ar->peer_delete_done);
>>          ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
>>          if (ret)
>>                  return ret;
>> @@ -5897,6 +5898,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>>   err_peer_delete:
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
>>                  ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
>>                                                   vif->addr);
>> @@ -5959,6 +5961,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
>>
>>          if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
>>              arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
>> +               reinit_completion(&ar->peer_delete_done);
>>                  ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
>>                                               vif->addr);
> 
> So it would probably be cleaner to have a helper such as
> __ath10k_peer_delete() that performs both the reinit_completion() and
> the ath10k_wmi_peer_delete() call. Avoiding duplication.


Will change in next serion


> 
>>                  if (ret)
>>
>> --
>> 2.34.1
>>


