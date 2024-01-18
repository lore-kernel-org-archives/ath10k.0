Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22384C47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utuWuDjXoRldKpL3sc8RaeRaG0cDdvSyns5k11OdnWo=; b=4P7IwxjJqko4mMDygH+m4T4zba
	xhsETPPhxTs1BU/MhnkZcL4SThm3zslnnMB/cPcFPhWIooerWUzq4cexo9nZt7txnq8I9RD/aYQqZ
	r93wV3aJ7QlyXD0COw4jxeeKcpzC3xUVOVYDkMhSrLTPH7KMhYsI+qupUTUxFjxfmMigf2kxry2ev
	INYP017uQnfa0vSyzuy+eaVjpuwYZSYXOikjEkYxR8ay/lgvhD1mBqsvGiT1BW1E5LuSvtwjz4APy
	jajMT6n6OXb9/CM4ZIrbzZjbA9Ygc+QTm8ens8LohtqHfrZWGOuJFYAYdJTgYVL26nJwfx+oWw7dX
	wyxEwrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW42-003Ndk-0M;
	Thu, 18 Jan 2024 17:20:26 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW40-003NJm-0m;
	Thu, 18 Jan 2024 17:20:24 +0000
Message-ID: <663ad3f4-f877-4817-8f31-dce1ff12ff40@infradead.org>
Date: Thu, 18 Jan 2024 09:20:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] wifi: ath10k: Fix enum ath10k_fw_crash_dump_type
 kernel-doc
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
 <20240118-ath10k-kerneldoc-v1-5-99c7e8d95aad@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-5-99c7e8d95aad@quicinc.com>
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
> The kernel-doc script currently reports:
> drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_REGISTERS' not described in enum 'ath10k_fw_crash_dump_type'
> drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_CE_DATA' not described in enum 'ath10k_fw_crash_dump_type'
> drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_RAM_DATA' not described in enum 'ath10k_fw_crash_dump_type'
> drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Enum value 'ATH10K_FW_CRASH_DUMP_MAX' not described in enum 'ath10k_fw_crash_dump_type'
> drivers/net/wireless/ath/ath10k/coredump.h:27: warning: Excess enum value 'ATH10K_FW_CRASH_DUMP_REGDUMP' description in 'ath10k_fw_crash_dump_type'
> 
> Fix these issues with the enum ath10k_fw_crash_dump_type kernel-doc.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/net/wireless/ath/ath10k/coredump.h | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/coredump.h b/drivers/net/wireless/ath/ath10k/coredump.h
> index e5ef0352e319..8d274e0f374b 100644
> --- a/drivers/net/wireless/ath/ath10k/coredump.h
> +++ b/drivers/net/wireless/ath/ath10k/coredump.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: ISC */
>  /*
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
> - * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
>  #ifndef _COREDUMP_H_
> @@ -13,7 +13,11 @@
>  
>  /**
>   * enum ath10k_fw_crash_dump_type - types of data in the dump file
> - * @ATH10K_FW_CRASH_DUMP_REGDUMP: Register crash dump in binary format
> + * @ATH10K_FW_CRASH_DUMP_REGISTERS: Register crash dump in binary format
> + * @ATH10K_FW_CRASH_DUMP_CE_DATA: Copy Engine crash dump data
> + * @ATH10K_FW_CRASH_DUMP_RAM_DATA: RAM crash dump data, contains multiple
> + *				   struct ath10k_dump_ram_data_hdr
> + * @ATH10K_FW_CRASH_DUMP_MAX: Maximum enumeration
>   */
>  enum ath10k_fw_crash_dump_type {
>  	ATH10K_FW_CRASH_DUMP_REGISTERS = 0,
> 

-- 
#Randy

