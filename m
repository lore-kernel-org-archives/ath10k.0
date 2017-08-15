Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dhfro-0006e7-Mt
 for ath10k@lists.infradead.org; Tue, 15 Aug 2017 17:43:02 +0000
Subject: Re: [PATCH 5/6] ath10k: add memory dump support for QCA6174/QCA9377
References: <150278532045.22482.14490702801292107536.stgit@potku.adurom.net>
 <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <8be660a1-fde8-ad87-b3ef-0d3e8590ed01@candelatech.com>
Date: Tue, 15 Aug 2017 10:42:38 -0700
MIME-Version: 1.0
In-Reply-To: <150278542590.22482.1613614809483892010.stgit@potku.adurom.net>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 08/15/2017 01:23 AM, Kalle Valo wrote:
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

>  #include "debug.h"
> +#include "hw.h"
> +
> +static const struct ath10k_mem_section qca6174_hw21_register_sections[] = {
> +	{0x800, 0x810},
> +	{0x820, 0x82C},
> +	{0x830, 0x8F4},
> +	{0x90C, 0x91C},
> +	{0xA14, 0xA18},

This looks pretty fragile.  Any chance this type of info could be packaged
into the firmware image and then the driver just pulls it out of there
instead of having all these hard coded magic values in the driver?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
