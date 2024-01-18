Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D19C47DAF
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GJ43sxJEugFE+jhUQRT8P2K2kdj7Gi760KtJCGgVaM=; b=lt1TpoV0f0mvsRIR8bd2Kwolmu
	a0vwtwIi4XRIKJ7KYhguqBI12wshH3cGSDB4iQJLqo0SRGH9q+4GdqsIsmf/zJodbXtlRfwuZnm16
	TWq8Fwl0eVzoYUY+DDW/CuGlmqvjhMCJ7MSjCHp4qLQQYE3pmUIkD1v8V6KishyZ5L4bKSRPD7PC8
	ifD7cNfaTs9ExV57NonzMrj5eNPL7RnS0aRBgv7Wl//kNqFnIi3WrwYX/MVDldCAmOlCP2uJsDhgs
	dv27Uuf89aIfgjBd3ghe6C2KNDH/uU1eAkSmbvpvicwhR2+qoNoKIqb8SQqLtfMBYZEK8DAicL41M
	e/89JMjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW2S-003NK8-1J;
	Thu, 18 Jan 2024 17:18:48 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW2R-003NJm-1H;
	Thu, 18 Jan 2024 17:18:47 +0000
Message-ID: <fbcfe7ef-8308-4390-9cf5-67ee25604bed@infradead.org>
Date: Thu, 18 Jan 2024 09:18:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath10k: fix htt_q_state_conf & htt_q_state
 kernel-doc
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
 <20240118-ath10k-kerneldoc-v1-3-99c7e8d95aad@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-3-99c7e8d95aad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/18/24 08:12, Jeff Johnson wrote:
> Currently kernel-doc reports:
> drivers/net/wireless/ath/ath10k/htt.h:1488: warning: cannot understand function prototype: 'struct htt_q_state_conf '
> drivers/net/wireless/ath/ath10k/htt.h:1542: warning: cannot understand function prototype: 'struct htt_q_state '
> 
> Update the kernel-doc for these two structs to resolve the warnings.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/net/wireless/ath/ath10k/htt.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index 4a9270e2a4c8..eb0ce2f49315 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -3,7 +3,7 @@
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021, 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _HTT_H_
> @@ -1474,15 +1474,19 @@ enum htt_q_depth_type {
>  #define HTT_TX_Q_STATE_ENTRY_MULTIPLIER		0
>  
>  /**
> - * htt_q_state_conf - part of htt_frag_desc_bank_cfg for host q state config
> + * struct htt_q_state_conf - part of htt_frag_desc_bank_cfg for host q state config
>   *
>   * Defines host q state format and behavior. See htt_q_state.
>   *
> + * @paddr: Queue physical address
> + * @num_peers: Number of supported peers
> + * @num_tids: Number of supported TIDs
>   * @record_size: Defines the size of each host q entry in bytes. In practice
>   *	however firmware (at least 10.4.3-00191) ignores this host
>   *	configuration value and uses hardcoded value of 1.
>   * @record_multiplier: This is valid only when q depth type is MSDUs. It
>   *	defines the exponent for the power of 2 multiplication.
> + * @pad: struct padding for 32-bit alignment
>   */
>  struct htt_q_state_conf {
>  	__le32 paddr;
> @@ -1518,7 +1522,7 @@ struct htt_frag_desc_bank_cfg64 {
>  #define HTT_TX_Q_STATE_ENTRY_EXP_LSB		6
>  
>  /**
> - * htt_q_state - shared between host and firmware via DMA
> + * struct htt_q_state - shared between host and firmware via DMA
>   *
>   * This structure is used for the host to expose it's software queue state to

                                                    its
fwiw.

>   * firmware so that its rate control can schedule fetch requests for optimized
> 

-- 
#Randy

