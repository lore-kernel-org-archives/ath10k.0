Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgKd9-0004Dl-AR
 for ath10k@lists.infradead.org; Mon, 20 Oct 2014 21:36:44 +0000
Message-ID: <54458055.50706@candelatech.com>
Date: Mon, 20 Oct 2014 14:36:21 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] ath10k: implement wmi-tlv backend
References: <1413809925-4352-1-git-send-email-michal.kazior@tieto.com>
 <1413809925-4352-8-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1413809925-4352-8-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 10/20/2014 05:58 AM, Michal Kazior wrote:
> Latest firmware revision introduced a new WMI ABI
> called wmi-tlv. It is not a tlv strictly speaking
> but something that resembles it because it is
> ordered and may have duplicate id entries.
> 
> This will be used by new hardware eventually.
> 

> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 00cff91..3fea38c 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -364,6 +364,9 @@ enum ath10k_fw_features {
>  	 */
>  	ATH10K_FW_FEATURE_WMI_10_2 = 4,
>  
> +	/* Firmware uses WMI TLV */
> +	ATH10K_FW_FEATURE_WMI_TLV = 5,
> +
>  	/* keep last */
>  	ATH10K_FW_FEATURE_COUNT,
>  };

It sucks for me that I cannot get a feature-flag for my firmware upstream,
so my kernels and firmware keep loosing compatibility each time you
add a new flag.

I guess I will just have to pick a much larger value and just hope it
won't collide for a while.

But, if you are at liberty to change this, please skip 5 and 6,
and make yours be 7 (my kernel/firmware currently uses the two below):

	/* Firmware from Candela Technologies, enables more VIFs, etc */
	ATH10K_FW_FEATURE_WMI_10X_CT = 5,

	/* Firmware from Candela Technologies with rx-software-crypt.
	 * Required for multiple stations connected to same AP when using
	 * encryption (ie, commercial version of CT firmware) */
	ATH10K_FW_FEATURE_CT_RXSWCRYPT = 6,


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
