Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUeJW-0006bX-4l
 for ath10k@lists.infradead.org; Thu, 18 Sep 2014 16:12:10 +0000
Message-ID: <541B0445.7040707@candelatech.com>
Date: Thu, 18 Sep 2014 09:11:49 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/9] ath10k: fix tx/rx chainmask init
References: <1411046487-19544-1-git-send-email-michal.kazior@tieto.com>
 <1411046487-19544-2-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1411046487-19544-2-git-send-email-michal.kazior@tieto.com>
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

On 09/18/2014 06:21 AM, Michal Kazior wrote:
> Firmware reports the number of RF chains so use
> that for initialization of supp_{tx,rx}_chainmask
> instead of using a macro for 3x3 chips.
> 
> This should make tx/rx chainmask reports correct
> for chips other than 3x3.

> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 2c42bd5..772cca5 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -2198,6 +2198,9 @@ static void ath10k_wmi_service_ready_event_rx(struct ath10k *ar,
>  		ar->num_rf_chains = WMI_MAX_SPATIAL_STREAM;
>  	}
>  
> +	ar->supp_tx_chainmask = (1 << ar->num_rf_chains) - 1;
> +	ar->supp_rx_chainmask = (1 << ar->num_rf_chains) - 1;

Are there are no chips that support a different number
of tx and rx chains?


Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
