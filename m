Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtwVJ-0007cd-Og
 for ath10k@lists.infradead.org; Thu, 27 Nov 2014 10:40:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH V2] ath10k: read calibration data from Device Tree
References: <1415823056-10876-1-git-send-email-toshik@chromium.org>
Date: Thu, 27 Nov 2014 12:40:26 +0200
In-Reply-To: <1415823056-10876-1-git-send-email-toshik@chromium.org> (Toshi
 Kikuchi's message of "Wed, 12 Nov 2014 12:10:56 -0800")
Message-ID: <878uixudt1.fsf@kamboji.qca.qualcomm.com>
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
To: Toshi Kikuchi <toshik@chromium.org>
Cc: ath10k@lists.infradead.org

Toshi Kikuchi <toshik@chromium.org> writes:

> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -27,6 +28,7 @@
>  #include "debug.h"
>  #include "htt.h"
>  #include "testmode.h"
> +#include "pci.h"
>  
>  unsigned int ath10k_debug_mask;
>  static bool uart_print;
> @@ -244,6 +246,66 @@ static int ath10k_download_cal_file(struct ath10k *ar)
>  	return 0;
>  }
>  
> +static int ath10k_download_cal_dt(struct ath10k *ar)
> +{
> +	struct device_node *node;
> +	int data_len;
> +	void *data;
> +	int ret;
> +
> +	node = pci_device_to_OF_node(ath10k_pci_priv(ar)->pdev);

The problem here is that core.c cannot include pci.h, but we can get the
same node like this:

	node = ar->dev->of_node;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
