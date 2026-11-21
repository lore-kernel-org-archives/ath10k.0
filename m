Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10E2606A320
	for <ath10k@archiver.kernel.org>; Sat, 21 Nov 2026 20:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xTUo4LEA;
	dkim=pass (2048-bit key) header.d=yoxcu.de header.i=@yoxcu.de header.a=rsa-sha256 header.s=dkim header.b=Nk92eyFQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0SVAiswdUUbQNr6TyhlS9ojLJqDb4Un397GIk/b4cLo=; b=xTUo4LEAwyf4Ke
	YGEoMXPTKLEJ03qaFWUri9q24K/fqmqp8oPIktWA4Kaxm0d8N8yH/+pzN2Czk45Qyf20m1oPZEQTt
	KMTuvN/3RFbqXYLgr7O1mubkFnK7DITEgfQnZig4yoyxH3nVPPV9m1Qc6q2EFaQpiooeJVyoPv+If
	1xg3z7s9rJcehaLwgJ4U3/5HCG9Msiy7wfUSFY6LVjcgFOlb+cuHfg0ckEkjW5xsIlFKWHFFT0A9f
	NOAE72r7rbz+mTnV5+BSJ6xB/nHNUi1D0jqzu/w3GqzcRootHoBDiAMkwyBX8r+/2T2le75Gzxfnr
	Y39b96Wqz0VcwFvGV13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrXU-00000000AlG-2jjk;
	Sat, 21 Nov 2026 20:18:24 +0000
Received: from morty.yoxcu.de ([2a03:4000:4d:ce0:247a:4aff:fec8:b5a6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrXQ-00000000Ajf-2tMh
	for ath10k@lists.infradead.org;
	Sat, 21 Nov 2026 20:18:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22C621D827A6;
	Sat, 21 Nov 2026 21:18:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoxcu.de; s=dkim;
	t=1795292284; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=0SVAiswdUUbQNr6TyhlS9ojLJqDb4Un397GIk/b4cLo=;
	b=Nk92eyFQwF/V09AsHWzAW47cnpTY78nq7cWZIREo3pS+m1Y0KXv1e+RCIafVxha6a56fWN
	ViG1sFwFJvvT6LntwGASRyolbPuOC/BfAZr9HQ7MST3UWLpDSMoyK+1zi9vXulju8pAfUI
	FQ91mkoSKAugBOiB7NVAx546P/xDO80kyyBl4M+umvW1otLpd0uvF2Yauie9ct9oPtUlTi
	qURZQ+M8M/wMTJNybaamm59wL0gwyInpDNALL1RPjQkJL5ZhqdmpfjWnj7oDqsoja3N8Qb
	UIcDEosic34IA+W2Ftxe3jlwtL8dAK4O56MINMQX5iUhxaRcHTTCmKY9axs5Kg==
Message-ID: <b50cc31e-f61d-4685-9b43-7c41bd775527@yoxcu.de>
Date: Sat, 21 Nov 2026 21:17:58 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath10k: configure the WoW action frame wakeup
 filter
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261120202652.344435-1-mick@yoxcu.de>
 <20261120202652.344435-2-mick@yoxcu.de>
 <CAFEp6-39PaCm5JoFVwpYQEuM7Eg0xDKwWKnripuDwh8fVXS24A@mail.gmail.com>
From: Michael Auer <mick@yoxcu.de>
Content-Language: en-US
Autocrypt: addr=mick@yoxcu.de; keydata=
 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
 ShbHn51QMVl4y3nkTQ==
In-Reply-To: <CAFEp6-39PaCm5JoFVwpYQEuM7Eg0xDKwWKnripuDwh8fVXS24A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_121821_060099_8007A247 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: -2.1 (--)
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

Hi Loic,

Thanks for the review! I had already sent a v2 before your mail, for a
fix in patch 2, with patch 1 unchanged, so all three points go into v3:

- build the category map and the spectrum management ignore bitmap from
   the WLAN_CATEGORY_* and WLAN_ACTION_SPCT_* values in
   include/linux/ieee80211.h instead of the hex constants
- move the new wake reasons and the debug message change into their own
   patch

Michael

On 11/21/26 16:41, Loic Poulain wrote:
> Hi Michael,
>
> On Fri, Nov 20, 2026 at 9:27 PM Michael Auer <mick@yoxcu.de> wrote:
>> On WCN3990 almost every system suspend with WoWLAN enabled ends within
>> a second. The firmware wakes the host with wake reason 38, which is
>> WOW_REASON_ACTION_FRAME_RECV in Qualcomm's fw-api. ath10k's wake reason
>> enum stops at 27, so the debug log shows "wow wakeup host reason (null)".
>>
>> Qualcomm's own host drivers (qcacld-2.0 and qcacld-3.0) send
>> WMI_WOW_SET_ACTION_WAKE_UP_CMDID, which sets the action frame
>> categories that may wake the host. ath10k never sends it, so the
>> firmware default applies.
>>
>> Send it for station vdevs in ath10k_vif_wow_set_wakeups() with the
>> values of qcacld-3.0: allow spectrum management, QoS, public, SA query,
>> protected dual of public, WNM, WME, FST and VHT action frames, and
>> ignore spectrum management Measurement and TPC Requests. A failure is
>> logged and does not abort the suspend.
>>
>> Also add wake reasons 28 to 38 and print the reason number, so unknown
>> reasons are visible.
>>
>> On a OnePlus 6, 3 of 3 WoW suspends were woken within 1 s with reason
>> 38 before this change. With it, suspends last until a real wakeup
>> (magic packet, pattern match or RTC). In a one hour idle test with a
>> push connection the phone was suspended 87.6 % of the time.
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0.c8-00050-QCAHLSWMTPLZ-1
>>
>> Signed-off-by: Michael Auer <mick@yoxcu.de>
>> ---
>> The per-category array has 32 words, like the 2018 qcacld-3.0 for
>> sdm845. qcacld-2.0 and newer qcacld-3.0 send 256. The fw-api defines
>> it as a variable length array, and all allowed categories are below
>> 32. I only tested 32.
>>
>>   drivers/net/wireless/ath/ath10k/wmi-ops.h | 19 +++++++++
>>   drivers/net/wireless/ath/ath10k/wmi-tlv.c | 47 +++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath10k/wmi-tlv.h | 32 +++++++++++++++
>>   drivers/net/wireless/ath/ath10k/wmi.c     |  4 +-
>>   drivers/net/wireless/ath/ath10k/wmi.h     | 23 +++++++++++
>>   drivers/net/wireless/ath/ath10k/wow.c     | 10 +++++
>>   6 files changed, 133 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-ops.h b/drivers/net/wireless/ath/ath10k/wmi-ops.h
>> index f3f6b5954b27..780c2947cc5f 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi-ops.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi-ops.h
>> @@ -179,6 +179,8 @@ struct wmi_ops {
>>                                                      enum wmi_wow_wakeup_event event,
>>                                                      u32 enable);
>>          struct sk_buff *(*gen_wow_host_wakeup_ind)(struct ath10k *ar);
>> +       struct sk_buff *(*gen_wow_set_action_wake_up)(struct ath10k *ar,
>> +                                                     u32 vdev_id);
>>          struct sk_buff *(*gen_wow_add_pattern)(struct ath10k *ar, u32 vdev_id,
>>                                                 u32 pattern_id,
>>                                                 const u8 *pattern,
>> @@ -1422,6 +1424,23 @@ ath10k_wmi_wow_host_wakeup_ind(struct ath10k *ar)
>>          return ath10k_wmi_cmd_send(ar, skb, cmd_id);
>>   }
>>
>> +static inline int
>> +ath10k_wmi_wow_set_action_wake_up(struct ath10k *ar, u32 vdev_id)
>> +{
>> +       struct sk_buff *skb;
>> +       u32 cmd_id;
>> +
>> +       if (!ar->wmi.ops->gen_wow_set_action_wake_up)
>> +               return -EOPNOTSUPP;
>> +
>> +       skb = ar->wmi.ops->gen_wow_set_action_wake_up(ar, vdev_id);
>> +       if (IS_ERR(skb))
>> +               return PTR_ERR(skb);
>> +
>> +       cmd_id = ar->wmi.cmd->wow_set_action_wake_up_cmdid;
>> +       return ath10k_wmi_cmd_send(ar, skb, cmd_id);
>> +}
>> +
>>   static inline int
>>   ath10k_wmi_wow_add_pattern(struct ath10k *ar, u32 vdev_id, u32 pattern_id,
>>                             const u8 *pattern, const u8 *mask,
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.c b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> index 01f2d1fa9d7d..2a3b2bc2a478 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.c
>> @@ -3713,6 +3713,51 @@ ath10k_wmi_tlv_op_gen_wow_add_wakeup_event(struct ath10k *ar,
>>          return skb;
>>   }
>>
>> +static struct sk_buff *
>> +ath10k_wmi_tlv_op_gen_wow_set_action_wake_up(struct ath10k *ar, u32 vdev_id)
>> +{
>> +       struct wmi_tlv_wow_set_action_wake_up_cmd *cmd;
>> +       struct wmi_tlv *tlv;
>> +       struct sk_buff *skb;
>> +       __le32 *bitmaps;
>> +       void *ptr;
>> +       size_t len;
>> +
>> +       len = sizeof(*tlv) + sizeof(*cmd) +
>> +             sizeof(*tlv) +
>> +             WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES * sizeof(__le32);
>> +       skb = ath10k_wmi_alloc_skb(ar, len);
>> +       if (!skb)
>> +               return ERR_PTR(-ENOMEM);
>> +
>> +       ptr = (void *)skb->data;
>> +       tlv = ptr;
>> +       tlv->tag = __cpu_to_le16(WMI_TLV_TAG_STRUCT_WOW_SET_ACTION_WAKE_UP_CMD);
>> +       tlv->len = __cpu_to_le16(sizeof(*cmd));
>> +       cmd = (void *)tlv->value;
>> +
>> +       cmd->vdev_id = __cpu_to_le32(vdev_id);
>> +       cmd->operation = __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_OP_SET);
>> +       cmd->action_category_map[0] =
>> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
>> +
>> +       ptr += sizeof(*tlv);
>> +       ptr += sizeof(*cmd);
>> +
>> +       tlv = ptr;
>> +       tlv->tag = __cpu_to_le16(WMI_TLV_TAG_ARRAY_UINT32);
>> +       tlv->len = __cpu_to_le16(WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES *
>> +                                sizeof(__le32));
>> +       bitmaps = (void *)tlv->value;
>> +       bitmaps[WLAN_CATEGORY_SPECTRUM_MGMT] =
>> +               __cpu_to_le32(WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IGNORE);
>> +
>> +       ath10k_dbg(ar, ATH10K_DBG_WMI,
>> +                  "wmi tlv wow set action wake up vdev_id %d category map 0x%08x\n",
>> +                  vdev_id, WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0);
>> +       return skb;
>> +}
>> +
>>   static struct sk_buff *
>>   ath10k_wmi_tlv_gen_wow_host_wakeup_ind(struct ath10k *ar)
>>   {
>> @@ -4272,6 +4317,7 @@ static struct wmi_cmd_map wmi_tlv_cmd_map = {
>>          .wow_enable_cmdid = WMI_TLV_WOW_ENABLE_CMDID,
>>          .wow_hostwakeup_from_sleep_cmdid =
>>                                  WMI_TLV_WOW_HOSTWAKEUP_FROM_SLEEP_CMDID,
>> +       .wow_set_action_wake_up_cmdid = WMI_TLV_WOW_SET_ACTION_WAKE_UP_CMDID,
>>          .rtt_measreq_cmdid = WMI_TLV_RTT_MEASREQ_CMDID,
>>          .rtt_tsf_cmdid = WMI_TLV_RTT_TSF_CMDID,
>>          .vdev_spectral_scan_configure_cmdid = WMI_TLV_SPECTRAL_SCAN_CONF_CMDID,
>> @@ -4604,6 +4650,7 @@ static const struct wmi_ops wmi_tlv_ops = {
>>          .gen_wow_enable = ath10k_wmi_tlv_op_gen_wow_enable,
>>          .gen_wow_add_wakeup_event = ath10k_wmi_tlv_op_gen_wow_add_wakeup_event,
>>          .gen_wow_host_wakeup_ind = ath10k_wmi_tlv_gen_wow_host_wakeup_ind,
>> +       .gen_wow_set_action_wake_up = ath10k_wmi_tlv_op_gen_wow_set_action_wake_up,
>>          .gen_wow_add_pattern = ath10k_wmi_tlv_op_gen_wow_add_pattern,
>>          .gen_wow_del_pattern = ath10k_wmi_tlv_op_gen_wow_del_pattern,
>>          .gen_wow_config_pno = ath10k_wmi_tlv_op_gen_config_pno,
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
>> index ea18ed8939db..2af7c9df4260 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
>> @@ -189,6 +189,10 @@ enum wmi_tlv_cmd_id {
>>          WMI_TLV_EXTWOW_ENABLE_CMDID,
>>          WMI_TLV_EXTWOW_SET_APP_TYPE1_PARAMS_CMDID,
>>          WMI_TLV_EXTWOW_SET_APP_TYPE2_PARAMS_CMDID,
>> +       WMI_TLV_WOW_ENABLE_ICMPV6_NA_FLT_CMDID,
>> +       WMI_TLV_WOW_UDP_SVC_OFLD_CMDID,
>> +       WMI_TLV_WOW_HOSTWAKEUP_GPIO_PIN_PATTERN_CONFIG_CMDID,
>> +       WMI_TLV_WOW_SET_ACTION_WAKE_UP_CMDID,
>>          WMI_TLV_RTT_MEASREQ_CMDID = WMI_TLV_CMD(WMI_TLV_GRP_RTT),
>>          WMI_TLV_RTT_TSF_CMDID,
>>          WMI_TLV_SPECTRAL_SCAN_CONF_CMDID = WMI_TLV_CMD(WMI_TLV_GRP_SPECTRAL),
>> @@ -2202,6 +2206,34 @@ struct wmi_tlv_wow_add_del_event_cmd {
>>          __le32 event_bitmap;
>>   } __packed;
>>
>> +/* Action frame categories that may wake the host from WoW, as in
>> + * qcacld-3.0: spectrum management (0), QoS (1), public (4), SA query (8),
>> + * protected dual of public (9), WNM (10), WME (17), FST (18), VHT (21).
>> + */
>> +#define WMI_TLV_WOW_ACTION_WAKE_UP_CATEGORY_MAP0       0x00260713
> You describe the bitfield above, so please add defines for the categories.
>
>> +
>> +/* Per-category bitmaps of action codes to ignore (1 = ignore). Like
>> + * qcacld-3.0, ignore Measurement Request (0) and TPC Request (2).
>> + */
>> +#define WMI_TLV_WOW_ACTION_WAKE_UP_NUM_CATEGORIES      32
>> +#define WMI_TLV_WOW_ACTION_WAKE_UP_SPECTRUM_MGMT_IGNORE        (BIT(0) | BIT(2))
> Same as above.
>
>> +
>> +enum wmi_tlv_wow_action_wake_up_op {
>> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_RESET = 0,
>> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_SET = 1,
>> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_ADD_SET = 2,
>> +       WMI_TLV_WOW_ACTION_WAKE_UP_OP_DELETE_SET = 3,
>> +};
>> +
>> +/* WMI_WOW_SET_ACTION_WAKE_UP_CMD_fixed_param, followed by a
>> + * WMI_TLV_TAG_ARRAY_UINT32 of per-category action code bitmaps.
>> + */
>> +struct wmi_tlv_wow_set_action_wake_up_cmd {
>> +       __le32 vdev_id;
>> +       __le32 operation;
>> +       __le32 action_category_map[8];
>> +} __packed;
>> +
>>   struct wmi_tlv_request_peer_stats_info {
>>          __le32 request_type;
>>          __le32 vdev_id;
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
>> index e57588c19c80..eca6bb189577 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
>> @@ -4673,8 +4673,8 @@ void ath10k_wmi_event_wow_wakeup_host(struct ath10k *ar, struct sk_buff *skb)
>>                  return;
>>          }
>>
>> -       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %s\n",
>> -                  wow_reason(ev.wake_reason));
>> +       ath10k_dbg(ar, ATH10K_DBG_WMI, "wow wakeup host reason %d %s\n",
>> +                  ev.wake_reason, wow_reason(ev.wake_reason));
>>   }
>>
>>   void ath10k_wmi_event_dcs_interference(struct ath10k *ar, struct sk_buff *skb)
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
>> index 7f50a1de6b97..f1a560fb3447 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -944,6 +944,7 @@ struct wmi_cmd_map {
>>          u32 wow_enable_disable_wake_event_cmdid;
>>          u32 wow_enable_cmdid;
>>          u32 wow_hostwakeup_from_sleep_cmdid;
>> +       u32 wow_set_action_wake_up_cmdid;
>>          u32 rtt_measreq_cmdid;
>>          u32 rtt_tsf_cmdid;
>>          u32 vdev_spectral_scan_configure_cmdid;
>> @@ -7060,6 +7061,17 @@ enum wmi_wow_wake_reason {
>>          WOW_REASON_DFS_PHYERR_RADADR_EVENT,
>>          WOW_REASON_BEACON_RECV,
>>          WOW_REASON_CLIENT_KICKOUT_EVENT,
>> +       WOW_REASON_NAN_EVENT,
>> +       WOW_REASON_EXTSCAN,
>> +       WOW_REASON_RSSI_BREACH_EVENT,
>> +       WOW_REASON_IOAC_REV_KA_FAIL_EVENT,
>> +       WOW_REASON_IOAC_SOCK_EVENT,
>> +       WOW_REASON_NLO_SCAN_COMPLETE,
>> +       WOW_REASON_PACKET_FILTER_MATCH,
>> +       WOW_REASON_ASSOC_RES_RECV,
>> +       WOW_REASON_REASSOC_REQ_RECV,
>> +       WOW_REASON_REASSOC_RES_RECV,
>> +       WOW_REASON_ACTION_FRAME_RECV,
> I think addition of the new reason and above debug message change
> should be split in another patch/commit.
>
>>          WOW_REASON_DEBUG_TEST = 0xFF,
>>   };
>>
>> @@ -7095,6 +7107,17 @@ static inline const char *wow_reason(enum wmi_wow_wake_reason reason)
>>          C2S(WOW_REASON_DFS_PHYERR_RADADR_EVENT);
>>          C2S(WOW_REASON_BEACON_RECV);
>>          C2S(WOW_REASON_CLIENT_KICKOUT_EVENT);
>> +       C2S(WOW_REASON_NAN_EVENT);
>> +       C2S(WOW_REASON_EXTSCAN);
>> +       C2S(WOW_REASON_RSSI_BREACH_EVENT);
>> +       C2S(WOW_REASON_IOAC_REV_KA_FAIL_EVENT);
>> +       C2S(WOW_REASON_IOAC_SOCK_EVENT);
>> +       C2S(WOW_REASON_NLO_SCAN_COMPLETE);
>> +       C2S(WOW_REASON_PACKET_FILTER_MATCH);
>> +       C2S(WOW_REASON_ASSOC_RES_RECV);
>> +       C2S(WOW_REASON_REASSOC_REQ_RECV);
>> +       C2S(WOW_REASON_REASSOC_RES_RECV);
>> +       C2S(WOW_REASON_ACTION_FRAME_RECV);
>>          C2S(WOW_REASON_DEBUG_TEST);
>>          default:
>>                  return NULL;
>> diff --git a/drivers/net/wireless/ath/ath10k/wow.c b/drivers/net/wireless/ath/ath10k/wow.c
>> index 92af8bc63362..5fc68e6cdeb6 100644
>> --- a/drivers/net/wireless/ath/ath10k/wow.c
>> +++ b/drivers/net/wireless/ath/ath10k/wow.c
>> @@ -380,6 +380,16 @@ static int ath10k_vif_wow_set_wakeups(struct ath10k_vif *arvif,
>>                  }
>>          }
>>
>> +       if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
>> +               /* Without this filter WCN3990 wakes the host on action
>> +                * frames right after WoW is enabled.
>> +                */
>> +               ret = ath10k_wmi_wow_set_action_wake_up(ar, arvif->vdev_id);
>> +               if (ret && ret != -EOPNOTSUPP)
>> +                       ath10k_warn(ar, "failed to set action frame wakeup filter on vdev %i: %d\n",
>> +                                   arvif->vdev_id, ret);
>> +       }
>> +
>>          return 0;
>>   }
>>
>> --
>> 2.43.0
>>

