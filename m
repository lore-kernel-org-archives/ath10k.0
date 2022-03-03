Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FDAC433EF
	for <ath10k@archiver.kernel.org>; Thu,  3 Mar 2022 16:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0NnzpPvvEBG/TMGLmduukHLHxS5adHfHMVo2ObmAY8=; b=lO8pqjQlMyyDbK
	HwvXGVSMNcFqGCJTeQLbPcIn20vBYp16OpBzGpaDd6at1T4WIh+C/fO/QBUls/dg1mY1Pb3Nuf/1p
	k4lT/ys5Vvb5LBA7zs6v9Ime8elqIAaFOdhTKvxNWHx6wPCyupDEiiV0E5KtMi861tMuB09GBqedT
	tqFdX5cOtVMJjLsJcV/v6FSIrcUD0yhGzJweX8LLksqmYPPNAVJkuRK0ljNFNwEZDAvqAvE3vUC4O
	uvEyh1yUmSSPaN7BBBEexraB0Ie4EwnncVzBfqT1+XUS7JYVPK2fmQf+SVOVqd/GPgR2ae3ILhQB0
	kJe0bpvawwv7IzlZvlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPokP-007FYI-46; Thu, 03 Mar 2022 16:56:13 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPokM-007FXx-9T
 for ath10k@lists.infradead.org; Thu, 03 Mar 2022 16:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646326570; x=1677862570;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bpbupuvflW2mYTtFIn8/n9Er471Zt98fuB/GwJ5lR+g=;
 b=lz7SOS/z+vJVx8gjRJk+5ZdMyH6whgnX/OmTgPsbQObFjjfqA2DRrUte
 5sZzGnp8QWME9JboeTrakuAE14UFg5NcYSVF3RJAIjJO5hPEL1KIWbQ9C
 g8SWOdvguu9aYwwsnXBIrGzCTarqRGkMnEq8ocpCPKkA4yDEXNYRpHo2S k=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Mar 2022 08:56:07 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2022 08:56:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 3 Mar 2022 08:56:05 -0800
Received: from [10.111.177.132] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 3 Mar 2022
 08:56:04 -0800
Message-ID: <8dbfcb31-2ed0-77bd-eb3a-8d8edd141406@quicinc.com>
Date: Thu, 3 Mar 2022 08:56:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/2] ath10k:trigger sta disconnect on hardware restart
Content-Language: en-US
To: Youghandhar Chintala <youghand@codeaurora.org>,
 <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <pillair@codeaurora.org>, <dianders@chromium.org>, <kuabhs@chromium.org>,
 <briannorris@chromium.org>, <mpubbise@codeaurora.org>
References: <20220303115541.15892-1-youghand@codeaurora.org>
 <20220303115541.15892-3-youghand@codeaurora.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220303115541.15892-3-youghand@codeaurora.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_085610_501421_7D1AFA89 
X-CRM114-Status: GOOD (  19.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 3/3/2022 3:55 AM, Youghandhar Chintala wrote:

nit: in subject add space after ath10k:

> Currently after the hardware restart triggered from the driver,
> the station interface connection remains intact, since a disconnect
> trigger is not sent to userspace. This can lead to a problem in
> targets where the wifi mac sequence is added by the firmware.
> 
> After the target restart, during subsytem recovery, the target

nit: s/subsytem/subsystem/

> restarts its wifi mac sequence number. Hence AP to which our device
> is connected will receive frames with a  wifi mac sequence number jump
> to the past, thereby resulting in the AP dropping all these frames,
> until the frame arrives with a wifi mac sequence number which AP was
> expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
>             QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
>     	   QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00048

<https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#tested-on_tag>

there should be a Tested-on: tag for each line/target

> 
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> ---
>   drivers/net/wireless/ath/ath10k/core.c | 25 +++++++++++++++++++++++++
>   drivers/net/wireless/ath/ath10k/hw.h   |  2 ++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 9e1f483e1362..2092bfd02cd1 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -94,6 +94,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = true,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA988X_HW_2_0_VERSION,
> @@ -131,6 +132,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = true,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9887_HW_1_0_VERSION,
> @@ -169,6 +171,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_2_VERSION,
> @@ -202,6 +205,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.bmi_large_size_download = true,
>   		.supports_peer_stats_info = true,
>   		.dynamic_sar_support = true,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA6174_HW_2_1_VERSION,
> @@ -239,6 +243,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA6174_HW_2_1_VERSION,
> @@ -276,6 +281,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_0_VERSION,
> @@ -313,6 +319,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA6174_HW_3_2_VERSION,
> @@ -354,6 +361,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.tx_stats_over_pktlog = false,
>   		.supports_peer_stats_info = true,
>   		.dynamic_sar_support = true,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA99X0_HW_2_0_DEV_VERSION,
> @@ -397,6 +405,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9984_HW_1_0_DEV_VERSION,
> @@ -447,6 +456,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9888_HW_2_0_DEV_VERSION,
> @@ -494,6 +504,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_0_DEV_VERSION,
> @@ -531,6 +542,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> @@ -570,6 +582,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> @@ -600,6 +613,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.uart_pin_workaround = true,
>   		.credit_size_workaround = true,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = QCA4019_HW_1_0_DEV_VERSION,
> @@ -644,6 +658,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
>   	},
>   	{
>   		.id = WCN3990_HW_1_0_DEV_VERSION,
> @@ -674,6 +689,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   		.credit_size_workaround = false,
>   		.tx_stats_over_pktlog = false,
>   		.dynamic_sar_support = true,
> +		.hw_restart_disconnect = true,
>   	},
>   };
>   
> @@ -2442,6 +2458,7 @@ EXPORT_SYMBOL(ath10k_core_napi_sync_disable);
>   static void ath10k_core_restart(struct work_struct *work)
>   {
>   	struct ath10k *ar = container_of(work, struct ath10k, restart_work);
> +	struct ath10k_vif *arvif;
>   	int ret;
>   
>   	set_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
> @@ -2480,6 +2497,14 @@ static void ath10k_core_restart(struct work_struct *work)
>   		ar->state = ATH10K_STATE_RESTARTING;
>   		ath10k_halt(ar);
>   		ath10k_scan_finish(ar);
> +		if (ar->hw_params.hw_restart_disconnect) {
> +			list_for_each_entry(arvif, &ar->arvifs, list) {
> +				if (arvif->is_up &&
> +				    arvif->vdev_type == WMI_VDEV_TYPE_STA)
> +					ieee80211_hw_restart_disconnect(arvif->vif);
> +			}
> +		}
> +
>   		ieee80211_restart_hw(ar->hw);
>   		break;
>   	case ATH10K_STATE_OFF:
> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
> index 5215a6816d71..93acf0dd580a 100644
> --- a/drivers/net/wireless/ath/ath10k/hw.h
> +++ b/drivers/net/wireless/ath/ath10k/hw.h
> @@ -633,6 +633,8 @@ struct ath10k_hw_params {
>   	bool supports_peer_stats_info;
>   
>   	bool dynamic_sar_support;
> +
> +	bool hw_restart_disconnect;
>   };
>   
>   struct htt_resp;


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
