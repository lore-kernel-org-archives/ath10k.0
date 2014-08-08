Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFsmQ-0003hS-Na
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 22:36:59 +0000
Message-ID: <53E550F2.1040209@candelatech.com>
Date: Fri, 08 Aug 2014 15:36:34 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5 6/7] ath10k: save firmware RAM and ROM BSS sections
 on crash
References: <20140808201815.20713.85582.stgit@potku.adurom.net>
 <20140808202920.20713.58726.stgit@potku.adurom.net>
In-Reply-To: <20140808202920.20713.58726.stgit@potku.adurom.net>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 08/08/2014 01:29 PM, Kalle Valo wrote:
>  
> +/* estimated values, hopefully these are enough */
> +#define ATH10K_ROM_BSS_BUF_LEN 10000
> +#define ATH10K_RAM_BSS_BUF_LEN 30000
> +
>  /* used for crash-dump storage, protected by data-lock */
>  struct ath10k_fw_crash_data {
>  	bool crashed_since_read;
> @@ -301,6 +305,9 @@ struct ath10k_fw_crash_data {
>  	u32 reg_dump_values[REG_DUMP_COUNT_QCA988X];
>  	u8 stack_buf[ATH10K_FW_STACK_SIZE];
>  	u8 exc_stack_buf[ATH10K_FW_STACK_SIZE];
> +
> +	u8 rom_bss_buf[ATH10K_ROM_BSS_BUF_LEN];
> +	u8 ram_bss_buf[ATH10K_RAM_BSS_BUF_LEN];
>  };

That (using estimates instead of allocating memory when we know
the true value and/or when we need it)
is wasting quite a bit of RAM.  Doesn't matter on my systems,
but AP manufacturers might be more ticklish about RAM usage...


> +	/* These are written to only during first firmware boot so no need
> +	 * for locking. */

It's 'firmware load' instead of boot maybe?


Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
