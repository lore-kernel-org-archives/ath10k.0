Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173]
 helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
 id 1haje1-0008Nr-5P
 for ath10k@lists.infradead.org; Tue, 11 Jun 2019 16:29:11 +0000
Subject: Re: [PATCH] ath10k: fix max antenna gain unit
References: <20190611121910.27643-1-sven@narfation.org>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <ae8e2e5d-5a17-01bc-e3a2-5b326e1223b8@candelatech.com>
Date: Tue, 11 Jun 2019 09:29:03 -0700
MIME-Version: 1.0
In-Reply-To: <20190611121910.27643-1-sven@narfation.org>
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
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org
Cc: Michal Kazior <michal@plume.com>, linux-wireless@vger.kernel.org, Sven Eckelmann <seckelmann@datto.com>

On 6/11/19 5:19 AM, Sven Eckelmann wrote:
> From: Sven Eckelmann <seckelmann@datto.com>
> 
> Most of the txpower for the ath10k firmware is stored as twicepower (0.5 dB
> steps). This isn't the case for max_antenna_gain - which is still expected
> by the firmware as dB.
> 
> The firmware is converting it from dB to the internal (twicepower)
> representation when it calculates the limits of a channel. This can be seen
> in tpc_stats when configuring "12" as max_antenna_gain. Instead of the
> expected 12 (6 dB), the tpc_stats shows 24 (12 dB).
> 
> Tested on QCA9888 and IPQ4019 with firmware 10.4-3.5.3-00057.

I did a visual inspection of wave-1 firmware source and it appears this change would be correct
for it as well.

I would also suggest updating the comments in the wmi.h structure to document the
units.

Thanks,
Ben

> 
> Fixes: 02256930d9b8 ("ath10k: use proper tx power unit")
> Signed-off-by: Sven Eckelmann <seckelmann@datto.com>
> ---
> Cc: Michal Kazior <michal@plume.com>
> 
>   drivers/net/wireless/ath/ath10k/mac.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 9c703d287333..35d026a2772a 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -1008,7 +1008,7 @@ static int ath10k_monitor_vdev_start(struct ath10k *ar, int vdev_id)
>   	arg.channel.min_power = 0;
>   	arg.channel.max_power = channel->max_power * 2;
>   	arg.channel.max_reg_power = channel->max_reg_power * 2;
> -	arg.channel.max_antenna_gain = channel->max_antenna_gain * 2;
> +	arg.channel.max_antenna_gain = channel->max_antenna_gain;
>   
>   	reinit_completion(&ar->vdev_setup_done);
>   
> @@ -1450,7 +1450,7 @@ static int ath10k_vdev_start_restart(struct ath10k_vif *arvif,
>   	arg.channel.min_power = 0;
>   	arg.channel.max_power = chandef->chan->max_power * 2;
>   	arg.channel.max_reg_power = chandef->chan->max_reg_power * 2;
> -	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain * 2;
> +	arg.channel.max_antenna_gain = chandef->chan->max_antenna_gain;
>   
>   	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
>   		arg.ssid = arvif->u.ap.ssid;
> @@ -3105,7 +3105,7 @@ static int ath10k_update_channel_list(struct ath10k *ar)
>   			ch->min_power = 0;
>   			ch->max_power = channel->max_power * 2;
>   			ch->max_reg_power = channel->max_reg_power * 2;
> -			ch->max_antenna_gain = channel->max_antenna_gain * 2;
> +			ch->max_antenna_gain = channel->max_antenna_gain;
>   			ch->reg_class_id = 0; /* FIXME */
>   
>   			/* FIXME: why use only legacy modes, why not any
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
