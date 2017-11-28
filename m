Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx3.wp.pl ([212.77.101.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eJWga-0006qO-Cs
 for ath10k@lists.infradead.org; Tue, 28 Nov 2017 03:35:54 +0000
Date: Mon, 27 Nov 2017 19:35:16 -0800
From: Jakub Kicinski <kubakici@wp.pl>
Subject: Re: [PATCH 1/3] ath9k: remove stray backslash in Makefile
Message-ID: <20171127193516.682827ea@cakuba.netronome.com>
In-Reply-To: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
References: <e60138924429ca428efc6e3154606887b3bc5201.1511804622.git.mschiffer@universe-factory.net>
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
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, kvalo@qca.qualcomm.com, nbd@nbd.name

On Mon, 27 Nov 2017 18:56:21 +0100, Matthias Schiffer wrote:
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
>  drivers/net/wireless/ath/ath9k/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/Makefile b/drivers/net/wireless/ath/ath9k/Makefile
> index 36a40ffdce15..90e4a341076c 100644
> --- a/drivers/net/wireless/ath/ath9k/Makefile
> +++ b/drivers/net/wireless/ath/ath9k/Makefile
> @@ -59,7 +59,7 @@ obj-$(CONFIG_ATH9K_HW) += ath9k_hw.o
>  obj-$(CONFIG_ATH9K_COMMON) += ath9k_common.o
>  ath9k_common-y:=	common.o \
>  			common-init.o \
> -			common-beacon.o \
> +			common-beacon.o
>  

It's not necessarily stray, there is nothing on the next line so it's
OK, and if you add \ at the end of all lines, you don't have to touch
the last line every time you add/remove something.  Sort of like
putting a , after last enum value.

Just my $.02, not that I mind either way :)

>  ath9k_common-$(CONFIG_ATH9K_COMMON_DEBUG) += common-debug.o \
>  					     common-spectral.o


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
