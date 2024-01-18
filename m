Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBE0C47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 17:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZwnPUB1SZKfhgOedNF5DZLlFWvgucJS8NHyeCiQMdLc=; b=GFlyUuIftn7YMMk+ftg/+DtNcZ
	Teahttylx6evLWag9SLfAQXJ7gRWyCbOJlDyyWlxEm2//QD5T6rleVAWIG7QDgYdPrybqTZ/bDajP
	y0F6Hz210uFgOTBFKXuvXPmgk/eLbznpXjtfS7bqUBrpaS/w/pkSk5iqIXrtrbSgqQf1oJAMPBpig
	T5fdYPVY3UxA+bN5LGNydUFSTt+kwHj7ERVf5vys1NGVzFYQ+hIwsigIAGcCutt+hkzwGPi03ip62
	mSmYDS6lk9LY746LqfIV4mfd4WmSnxu3SK6Zlnv4CRpb8r4ki3hExbqAfp5c3QyndPGsX4vr6L2uV
	50+uRo7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW0m-003N7V-0V;
	Thu, 18 Jan 2024 17:17:04 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW0l-003N7E-0B;
	Thu, 18 Jan 2024 17:17:03 +0000
Message-ID: <a59d0fd8-1351-4fc0-a177-1c96cbff4675@infradead.org>
Date: Thu, 18 Jan 2024 09:17:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath10k: correctly document enum
 wmi_tlv_tx_pause_id
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
 <20240118-ath10k-kerneldoc-v1-2-99c7e8d95aad@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-2-99c7e8d95aad@quicinc.com>
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
> Currently kernel-doc reports the issue:
> drivers/net/wireless/ath/ath10k/wmi-tlv.h:2363: warning: cannot understand function prototype: 'enum wmi_tlv_tx_pause_id '
> 
> Update the enum wmi_tlv_tx_pause_id documentation to fix this issue.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi-tlv.h b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> index 83a8f07a687f..8a2f87d0a3a3 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi-tlv.h
> @@ -3,7 +3,7 @@
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
>   * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  #ifndef _WMI_TLV_H
>  #define _WMI_TLV_H
> @@ -2343,7 +2343,7 @@ struct wmi_tlv_adaptive_qcs {
>  } __packed;
>  
>  /**
> - * wmi_tlv_tx_pause_id - firmware tx queue pause reason types
> + * enum wmi_tlv_tx_pause_id - firmware tx queue pause reason types
>   *
>   * @WMI_TLV_TX_PAUSE_ID_MCC: used for by multi-channel firmware scheduler.
>   *		Only vdev_map is valid.
> 

-- 
#Randy

