Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erL1d-0002xr-Jx
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 10:02:15 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Enable IOMMU support for WCN3990 target
References: <1518685448-15317-1-git-send-email-govinds@codeaurora.org>
Date: Thu, 01 Mar 2018 12:01:06 +0200
In-Reply-To: <1518685448-15317-1-git-send-email-govinds@codeaurora.org>
 (Govind Singh's message of "Thu, 15 Feb 2018 14:34:08 +0530")
Message-ID: <877eqwqfml.fsf@kamboji.qca.qualcomm.com>
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
To: Govind Singh <govinds@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, ath10k@lists.infradead.org

Govind Singh <govinds@codeaurora.org> writes:

> When an IOMMU device is available on the platform bus, allocate
> an IOMMU domain and attach the wlan target to it.
> WCN3990 target can then attach an DMA I/O virtual address
> space to scan out of bound transactions.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 100 ++++++++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath10k/snoc.h |   3 +
>  2 files changed, 101 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index cd21b25..502263d 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -26,6 +26,10 @@
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/clk.h>
> +#include <asm/dma-iommu.h>
> +#include <linux/iommu.h>
> +#include <linux/dma-mapping.h>

Kbuild bot reported a problem with arm64 but strangely I cannot find the
full report. Anyway, this was the warning:

drivers/net/wireless/ath/ath10k/snoc.c:29:10: fatal error:
asm/dma-iommu.h: No such file or directory

Any ideas? Adding also Arnd, the grand master of compilation problems :)

Full patch here:

https://patchwork.kernel.org/patch/10220719/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
