Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJlY4-0003EK-6T
 for ath10k@lists.infradead.org; Fri, 06 Feb 2015 16:14:29 +0000
Message-ID: <54D4E89A.7040602@candelatech.com>
Date: Fri, 06 Feb 2015 08:15:22 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFT] ath10k: restart fw on tx-credit timeout
References: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, malaakso@elisanet.fi

On 02/06/2015 04:05 AM, Michal Kazior wrote:
> It makes little sense to continue and let
> firmware-host state become inconsistent if a WMI
> command can't be submitted to firmware.
>
> This effectively prevents after-affects of
> tx-credit starvation bug which include spurious
> sta kickout events and inability to associate new
> stations after some time when acting as AP.
>
> This should also speed up recovery/teardown in
> some cases when firmware stops responding for some
> reason.

I have not seen a WMI timeout since I added keep-alive
and CE polling in my firmware, but the patch looks OK
to me.

You might add something about 'WMI' in that warning
message to make it more clear what is not being
responsive.  At least in my tests, I could continue
to receive network traffic while WMI was blocked.

Thanks,
Ben

>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index aeea1c7..776b257 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1045,9 +1045,15 @@ int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb, u32 cmd_id)
>   		(ret != -EAGAIN);
>   	}), 3*HZ);
>
> -	if (ret)
> +	if (ret) {
>   		dev_kfree_skb_any(skb);
>
> +		if (ret == -EAGAIN) {
> +			ath10k_warn(ar, "firmware unresponsive, restarting..\n");
> +			queue_work(ar->workqueue, &ar->restart_work);
> +		}
> +	}
> +
>   	return ret;
>   }
>
>


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
