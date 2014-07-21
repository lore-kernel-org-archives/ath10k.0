Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from narfation.org ([79.140.41.39] helo=v3-1039.vlinux.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X9Irm-0006El-1w
 for ath10k@lists.infradead.org; Mon, 21 Jul 2014 19:03:18 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [PATCHv2 2/2] ath10k: add spectral scan feature
Date: Mon, 21 Jul 2014 21:02:47 +0200
Message-ID: <43945028.YYV8n3Af3F@sven-edge>
In-Reply-To: <1405945943-8303-3-git-send-email-sw@simonwunderlich.de>
References: <1405945943-8303-1-git-send-email-sw@simonwunderlich.de>
 <1405945943-8303-3-git-send-email-sw@simonwunderlich.de>
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
To: Simon Wunderlich <sw@simonwunderlich.de>
Cc: mathias.kretschmer@fokus.fraunhofer.de, kgiori@qca.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Monday 21 July 2014 14:32:23 Simon Wunderlich wrote:
> diff --git a/drivers/net/wireless/ath/ath10k/Makefile
> b/drivers/net/wireless/ath/ath10k/Makefile index 2110a5c..e1dcefd 100644
> --- a/drivers/net/wireless/ath/ath10k/Makefile
> +++ b/drivers/net/wireless/ath/ath10k/Makefile
> @@ -8,7 +8,8 @@ ath10k_core-y += mac.o \
>  		 htt_tx.o \
>  		 txrx.o \
>  		 wmi.o \
> -		 bmi.o
> +		 bmi.o \
> +		 spectral.o


ath9k doesn't compile the debugfs+spectral source files when 
CONFIG_ATH9K_DEBUGFS is not enabled. So this most likely has to be changed to 

ath10k_core-$(CONFIG_ATH10K_DEBUGFS) += spectral.o

Otherwise the static inline functions in the spectral.h may collide with the 
functions inside spectral.c when CONFIG_ATH10K_DEBUGFS is disabled.

Kind regards,
	Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
