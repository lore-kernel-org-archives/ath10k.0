Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifsu6-0001gy-Fg
 for ath10k@lists.infradead.org; Fri, 13 Dec 2019 21:55:20 +0000
Subject: Re: [PATCH] ath10k: Fix setting txpower to zero.
References: <20191212171409.21041-1-greearb@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <a56bee1a-e3b9-2999-f643-d10ebe5d4726@candelatech.com>
Date: Fri, 13 Dec 2019 13:55:17 -0800
MIME-Version: 1.0
In-Reply-To: <20191212171409.21041-1-greearb@candelatech.com>
Content-Language: en-US
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
To: linux-wireless@vger.kernel.org, kvalo@qca.qualcomm.com, ath10k@lists.infradead.org

On 12/12/19 9:14 AM, greearb@candelatech.com wrote:
> From: Ben Greear <greearb@candelatech.com>
> 
> Do not ignore 0 txpower setting unless the vif is of type p2p.

My patch has problems I think:  secondary stations also have un-init
txpower when they are first built and start scanning.

So, I'm going to try setting txpower to -1 in mac80211 and use that
to mean 'unset'.

Thanks,
Ben

> 
> This should fix regression in:
> 
> commit 88407beb1b1462f706a1950a355fd086e1c450b6
> Author: Ryan Hsu <ryanhsu@qca.qualcomm.com>
> Date:   Tue Dec 13 14:55:19 2016 -0800
> 
>      ath10k: fix incorrect txpower set by P2P_DEVICE interface
> 
> Tested (without p2p in use) on 9984 with ath10k-ct firmware, but I don't think
> this is firmware specific.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 289d03da14b2..1c5e1b5570f8 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -5902,11 +5902,18 @@ static int ath10k_mac_txpower_recalc(struct ath10k *ar)
>   {
>   	struct ath10k_vif *arvif;
>   	int ret, txpower = -1;
> +	int p2p_st;
> +
> +	p2p_st = ath10k_wmi_get_vdev_subtype(ar, WMI_VDEV_SUBTYPE_P2P_DEVICE);
>   
>   	lockdep_assert_held(&ar->conf_mutex);
>   
>   	list_for_each_entry(arvif, &ar->arvifs, list) {
> -		if (arvif->txpower <= 0)
> +		/* p2p may not initialize txpower, and we should ignore it
> +		 * in that case.
> +		 */
> +		if ((arvif->txpower < 0) ||
> +		    ((arvif->txpower == 0) && (arvif->vdev_subtype == p2p_st)))
>   			continue;
>   
>   		if (txpower == -1)
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
