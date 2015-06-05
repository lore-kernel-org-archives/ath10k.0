Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0vD6-0003y0-SR
 for ath10k@lists.infradead.org; Fri, 05 Jun 2015 17:15:15 +0000
Message-ID: <5571D903.7060203@candelatech.com>
Date: Fri, 05 Jun 2015 10:14:43 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix survey information reporting
References: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
In-Reply-To: <1430829048-22549-1-git-send-email-vthiagar@qti.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

I applied these and some other related patches to my hacked-upon 4.0.4, but
I am seeing some inconsistencies between how ath10k and ath9k
reports survey info.  I am using my CT firmware based on 10.1.

ath9k reports ever-increasing counters for the channel time
and busy time.

With ath10k, it reports the same values until I do a scan
again, and even then, it is not additive.

First, should the value only update when we do a scan?

And second, should ath10k report ever increasing totals
to match ath9k behaviour?

Thanks,
Ben

On 05/05/2015 05:30 AM, Vasanthakumar Thiagarajan wrote:
> Rx clear count reported in wmi_chan_info_event is actually channel_busy_count
> not rx_frame_count. Send rx_clear_count through time_busy of survey_info
> and set SURVEY_INFO_TIME_BUSY in filled.
> 
> iw wlan0 survey dump
> 
> urvey data from wlan0
>         frequency:                      5180 MHz [in use]
>         noise:                          -103 dBm
>         channel active time:            150 ms
>         channel busy time:              22 ms
> Survey data from wlan0
>         frequency:                      5200 MHz
>         noise:                          -102 dBm
>         channel active time:            146 ms
>         channel busy time:              0 ms
> 
> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index ebaa096..0fabe68 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1645,10 +1645,10 @@ void ath10k_wmi_event_chan_info(struct ath10k *ar, struct sk_buff *skb)
>  
>  		survey = &ar->survey[idx];
>  		survey->time = WMI_CHAN_INFO_MSEC(cycle_count);
> -		survey->time_rx = WMI_CHAN_INFO_MSEC(rx_clear_count);
> +		survey->time_busy = WMI_CHAN_INFO_MSEC(rx_clear_count);
>  		survey->noise = noise_floor;
>  		survey->filled = SURVEY_INFO_TIME |
> -				 SURVEY_INFO_TIME_RX |
> +				 SURVEY_INFO_TIME_BUSY |
>  				 SURVEY_INFO_NOISE_DBM;
>  	}
>  
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
