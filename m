Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f4TCD-0003WM-Pn
 for ath10k@lists.infradead.org; Fri, 06 Apr 2018 15:22:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v13] ath10k: add LED and GPIO controlling support for
 various chipsets
References: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org>
Date: Fri, 06 Apr 2018 18:22:19 +0300
In-Reply-To: <1523027875-5143-1-git-send-email-kvalo@codeaurora.org> (Kalle
 Valo's message of "Fri, 6 Apr 2018 18:17:55 +0300")
Message-ID: <87o9iwcqc4.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, linux-wireless@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>

Kalle Valo <kvalo@codeaurora.org> writes:

> From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
>
> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984 based
> chipsets with on chipset connected led's using WMI Firmware API.  The LED
> device will get available named as "ath10k-phyX" at sysfs and can be controlled
> with various triggers.  adds also debugfs interface for gpio control.
>
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>

From and Signed-off-by fields do not match. Sebastian, which domain
should it be?

> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
> [kvalo: major reorg and cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> ---
>
> v13:
>
> * only compile tested!

So testing is very welcome.

> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -52,6 +52,16 @@ config ATH10K_DEBUGFS
>  
>  	  If unsure, say Y to make it easier to debug problems.
>  
> +config ATH10K_LEDS
> +	bool "Atheros ath10k LED support"
> +	depends on ATH10K
> +	select MAC80211_LEDS
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	default y
> +	help
> +	  This option is necessary, if you want LED support for chipset connected led pins. If unsure, say N.
> +

I started to wonder is this Kconfig option even needed, feels pretty
pointless. Why not just make config ATH10K depend on LED stuff, just
like ath9k already does?

> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -25,6 +25,7 @@
>  #include <linux/pci.h>
>  #include <linux/uuid.h>
>  #include <linux/time.h>
> +#include <linux/leds.h>
>  
>  #include "htt.h"
>  #include "htc.h"
> @@ -883,7 +884,6 @@ struct ath10k {
>  	u32 low_5ghz_chan;
>  	u32 high_5ghz_chan;
>  	bool ani_enabled;
> -
>  	bool p2p;
>  
>  	struct {

Unrelated change, I'll fix that in v14.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
