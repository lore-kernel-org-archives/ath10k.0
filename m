Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9qb8-0003iv-5Y
 for ath10k@lists.infradead.org; Wed, 01 Nov 2017 10:50:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/6] ath10k: add memory dump support for QCA6174/QCA9377
Date: Wed, 1 Nov 2017 10:49:46 +0000
Message-ID: <87wp3axohi.fsf@kamboji.qca.qualcomm.com>
References: <150278532045.22482.14490702801292107536.stgit@potku.adurom.net>
 <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
In-Reply-To: <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
 (Kalle Valo's message of "Tue, 15 Aug 2017 11:23:46 +0300")
Content-Language: en-US
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> From: Alan Liu <alanliu@qca.qualcomm.com>
>
> Add memory dump to the firmware crash data file which is provided to user space
> via devcoredump interface. This makes it easier for firmware engineers to debug
> firmware crashes.
>
> Due to increased memory consumption the memory dump is disabled by default. To
> enable it make sure that bit 3 is set in coredump_mask module parameter:
>
> modprobe ath10k_core coredump_mask=0xffffffff
>
> When RAMDUMP is enabled a buffer for the dump is allocated with vmalloc during
> device probe. The actual memory layout is different in hardware versions and
> the layouts are defined in coredump.c. The memory is split to regions and, to
> get even finegrained control of what to copy, the region can split to smaller
> sections as not all registers are readable (which could cause the whole system
> to stall).
>
> Signed-off-by: Alan Liu <alanliu@qca.qualcomm.com>
> [kvalo@qca.qualcomm.com: refactoring and cleanup]
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

> +		/* To get IRAM dump, the host driver needs to switch target
> +		 * ram config from DRAM to IRAM.
> +		 */
> +		if (current_region->type == ATH10K_MEM_REGION_TYPE_IRAM1 ||
> +		    current_region->type == ATH10K_MEM_REGION_TYPE_IRAM2) {
> +			shift = current_region->start >> 20;
> +
> +			ret = ath10k_pci_set_ram_config(ar, shift);
> +			if (!ret) {
> +				ath10k_warn(ar, "failed to switch ram config to IRAM for section %s: %d\n",
> +					    current_region->name, ret);

A colleague noticed that there's a bug here, it should be "if (ret)".
I'll fix that in the next version.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
